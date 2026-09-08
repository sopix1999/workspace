// ============================================================
// KELAAS — Dashboard Super Admin: kelola user & persetujuan
// pembayaran manual (QRIS). Semua route dilindungi
// `requireSuperAdmin` (mount di sub-app /api/admin).
//
// Route:
//   GET  /api/admin/users?filter=trial|premium|expired|pending
//   GET  /api/admin/payments?status=pending
//   POST /api/admin/payments/:id/approve  {duration_days?}
//   POST /api/admin/payments/:id/reject
//   PUT  /api/admin/users/:id/upgrade      {plan_type?, duration_days?}
// ============================================================
import { all, one, run, num, s } from '../lib/db';
import { fmtWIB, nowWIB, wibEpoch } from '../lib/crypto';

const ALLOWED_DURATIONS = [30, 180];

// Hitung expiry baru: extend dari expiry lama kalau masih depan,
// kalau sudah lewat mulai dari sekarang.
function nextExpiry(user: Record<string, any> | null, dur: number): string {
  const now = Date.now();
  const cur = user && s(user.subscription_expires_at) ? wibEpoch(s(user.subscription_expires_at)) : NaN;
  const base = Number.isFinite(cur) && cur > now ? cur : now;
  return fmtWIB(base + dur * 86400000);
}

// SELECT user dengan status langganan dihitung live.
const USER_FIELDS =
  'id, username, role, kelas, nama_lengkap AS namaLengkap, nip, email, unique_id AS uniqueId, plan_type AS planType, trial_ends_at AS trialEndsAt, subscription_expires_at AS subscriptionExpiresAt';

function planState(u: Record<string, any>): { plan: string; expired: boolean } {
  const plan = s(u.planType || 'free');
  const now = Date.now();
  if (plan === 'premium') {
    const exp = u.subscriptionExpiresAt ? wibEpoch(s(u.subscriptionExpiresAt)) : NaN;
    return { plan, expired: !u.subscriptionExpiresAt || now > exp };
  }
  if (plan === 'trial') {
    const exp = u.trialEndsAt ? wibEpoch(s(u.trialEndsAt)) : NaN;
    return { plan, expired: !u.trialEndsAt || now > exp };
  }
  return { plan, expired: false };
}

function json(v: unknown, status = 200) {
  return new Response(JSON.stringify(v), {
    status,
    headers: { 'Content-Type': 'application/json; charset=utf-8' },
  });
}
function fail(message: string, status = 400) {
  return json({ success: false, message }, status);
}

export function registerAdmin(app: any) {
  // ---- GET /api/admin/users ---- (default semua; filter & search optional)
  // Route relatif — sub-app di-mount di '/api/admin' (lihat app.ts).
  app.get('/users', async (c: any) => {
    const db = c.env.DB;
    const filter = s(c.req.query('filter'));
    const search = s(c.req.query('search'));
    let rows;
    if (search) {
      // Cari berdasarkan nama, email, atau unique_id.
      const like = '%' + search.replace(/%/g, '\\%').replace(/_/g, '\\_') + '%';
      rows = await all(
        db,
        "SELECT " + USER_FIELDS + " FROM users WHERE (nama_lengkap LIKE ? ESCAPE '\\' OR email LIKE ? ESCAPE '\\' OR unique_id LIKE ? ESCAPE '\\') ORDER BY id DESC LIMIT 500",
        [like, like, like],
      );
    } else {
      rows = await all(db, 'SELECT ' + USER_FIELDS + ' FROM users ORDER BY id DESC LIMIT 500');
    }
    if (filter) {
      const match = (u: Record<string, any>) => {
        const st = planState(u);
        if (filter === 'trial') return st.plan === 'trial';
        if (filter === 'premium') return st.plan === 'premium' && !st.expired;
        if (filter === 'expired') return st.expired || st.plan === 'free';
        if (filter === 'free') return st.plan === 'free';
        return true;
      };
      rows = rows.filter(match);
    }
    const data = rows.map((u) => {
      const st = planState(u);
      return { ...u, planState: st.plan, expired: st.expired };
    });
    return json({ success: true, data });
  });

  // ---- GET /api/admin/stats ---- (kartu statistik dashboard)
  app.get('/stats', async (c: any) => {
    const db = c.env.DB;
    const [totalUser, activeUser, pendingPay, monthRevenue] = await Promise.all([
      one(db, 'SELECT COUNT(*) AS c FROM users'),
      one(db, "SELECT COUNT(*) AS c FROM users WHERE plan_type='premium' AND subscription_expires_at > ?", [nowWIB()]),
      one(db, "SELECT COUNT(*) AS c FROM payments WHERE status='pending'"),
      one(db, "SELECT COALESCE(SUM(amount),0) AS s FROM payments WHERE status='approved' AND substr(created_at,1,7)=?", [String(nowWIB()).slice(0, 7)]),
    ]);
    return json({
      success: true,
      data: {
        totalUsers: num(totalUser?.c),
        activeUsers: num(activeUser?.c),
        pendingPayments: num(pendingPay?.c),
        monthRevenue: num(monthRevenue?.s),
      },
    });
  });

  // ---- DELETE /api/admin/users/:id ---- (hapus akses)
  app.delete('/users/:id', async (c: any) => {
    const db = c.env.DB;
    const id = num(c.req.param('id'));
    const user = await one(db, 'SELECT id, username FROM users WHERE id=?', [id]);
    if (!user) return fail('User tidak ditemukan', 404);
    if (String(user.username) === String(c.get('user')?.username)) return fail('Tidak bisa menghapus diri sendiri', 400);
    await run(db, 'DELETE FROM payments WHERE user_id=?', [id]);
    await run(db, 'DELETE FROM users WHERE id=?', [id]);
    return json({ success: true, message: 'User ' + user.username + ' dihapus', data: { id } });
  });

  // ---- GET /api/admin/payments ---- (default pending)
  app.get('/payments', async (c: any) => {
    const db = c.env.DB;
    const status = s(c.req.query('status') || 'pending');
    const rows = await all(
      db,
      `SELECT p.id, p.user_id AS userId, p.amount, p.proof_image_url AS proofImageUrl, p.status,
              p.role_plan AS rolePlan, p.duration_days AS durationDays, p.created_at AS createdAt,
              u.username, u.nama_lengkap AS namaLengkap, u.kelas, u.plan_type AS planType
       FROM payments p JOIN users u ON u.id = p.user_id
       WHERE p.status = ? ORDER BY p.id DESC LIMIT 200`,
      [status],
    );
    return json({ success: true, data: rows });
  });

  // ---- POST /api/admin/payments/:id/approve ----
  app.post('/payments/:id/approve', async (c: any) => {
    const db = c.env.DB;
    const id = num(c.req.param('id'));
    const pay = await one(db, 'SELECT * FROM payments WHERE id=?', [id]);
    if (!pay) return fail('Payment tidak ditemukan', 404);
    if (pay.status === 'approved') return fail('Payment sudah di-approve sebelumnya', 409);
    const user = await one(db, 'SELECT id, username, subscription_expires_at FROM users WHERE id=?', [pay.user_id]);
    if (!user) return fail('User terkait tidak ditemukan', 404);

    const dur = ALLOWED_DURATIONS.includes(num(c.req.query('duration_days') || (pay.duration_days as number))) ? num(c.req.query('duration_days') || (pay.duration_days as number)) : 30;
    const expiresAt = nextExpiry(user, dur);
    await run(db, "UPDATE users SET plan_type='premium', subscription_expires_at=?, trial_ends_at=NULL WHERE id=?", [expiresAt, user.id]);
    await run(db, "UPDATE payments SET status='approved' WHERE id=?", [id]);
    return json({
      success: true,
      message: 'Pembayaran disetujui. ' + user.username + ' → premium s/d ' + expiresAt,
      data: { paymentId: id, username: user.username, expiresAt, durationDays: dur },
    });
  });

  // ---- POST /api/admin/payments/:id/reject ----
  app.post('/payments/:id/reject', async (c: any) => {
    const db = c.env.DB;
    const id = num(c.req.param('id'));
    const pay = await one(db, 'SELECT id, status FROM payments WHERE id=?', [id]);
    if (!pay) return fail('Payment tidak ditemukan', 404);
    await run(db, "UPDATE payments SET status='rejected' WHERE id=?", [id]);
    return json({ success: true, message: 'Pembayaran ditolak', data: { paymentId: id } });
  });

  // ---- PUT /api/admin/users/:id/upgrade ---- (bypass/bonus manual)
  app.put('/users/:id/upgrade', async (c: any) => {
    const db = c.env.DB;
    const id = num(c.req.param('id'));
    const user = await one(db, 'SELECT id, username, subscription_expires_at FROM users WHERE id=?', [id]);
    if (!user) return fail('User tidak ditemukan', 404);
    let body: Record<string, any> = {};
    try {
      body = await c.req.json();
    } catch { /* kosong → default */ }
    const plan = s(body.plan_type) || 'premium';
    const dur = ALLOWED_DURATIONS.includes(num(body.duration_days)) ? num(body.duration_days) : 30;
    if (plan === 'premium') {
      const expiresAt = nextExpiry(user, dur);
      await run(db, "UPDATE users SET plan_type='premium', subscription_expires_at=?, trial_ends_at=NULL WHERE id=?", [expiresAt, user.id]);
      return json({ success: true, message: user.username + ' → premium s/d ' + expiresAt, data: { expiresAt, durationDays: dur } });
    }
    if (plan === 'trial') {
      const trialDays = num(body.trial_days) || 7;
      const trialEndsAt = fmtWIB(Date.now() + trialDays * 86400000);
      await run(db, "UPDATE users SET plan_type='trial', trial_ends_at=?, subscription_expires_at=NULL WHERE id=?", [trialEndsAt, user.id]);
      return json({ success: true, message: user.username + ' → trial s/d ' + trialEndsAt, data: { trialEndsAt } });
    }
    await run(db, "UPDATE users SET plan_type='free', trial_ends_at=NULL, subscription_expires_at=NULL WHERE id=?", [id]);
    return json({ success: true, message: user.username + ' → free', data: {} });
  });
}
