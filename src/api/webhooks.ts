// ============================================================
// KELAAS — Webhook Payment Gateway (mock Midtrans/Tripay).
// POST /api/webhooks/payment
//
// Body: { username?, user_id?, order_id?, status?, duration_days? }
//   • Cari user by username (unik) — order_id mapping di-skip
//     karena belum ada tabel orders.
//   • status 'settlement'/'paid'/'success' → aktifkan premium.
//   • status lain → 200 {ignored:true} (idempotent, gateway
//     mengirim notifikasi juga untuk pending/failure).
//   • duration_days: hanya 30 atau 180; default 30.
//
// Keamanan: default tanpa verifikasi (mock). Jika env
// `PAYMENT_WEBHOOK_SECRET` di-set, header `x-webhook-secret`
// wajib cocok. Integrasi gateway asli → ganti dengan verifikasi
// signature masing-masing provider.
// ============================================================
import { one, run, s, num } from '../lib/db';
import { wibEpoch, fmtWIB } from '../lib/crypto';

const ACTIVE_STATUSES = new Set(['settlement', 'paid', 'success']);
const ALLOWED_DURATIONS = [30, 180];

export function registerWebhooks(app: any) {
  app.post('/api/webhooks/payment', async (c: any) => {
    const env = c.env as Record<string, any>;
    if (env.PAYMENT_WEBHOOK_SECRET && c.req.header('x-webhook-secret') !== env.PAYMENT_WEBHOOK_SECRET) {
      return c.json({ success: false, message: 'Unauthorized', code: 'UNAUTHORIZED' }, 401);
    }
    const body = (await c.req.json().catch(() => ({}))) as Record<string, any>;
    const status = s(body.status).toLowerCase();
    if (!ACTIVE_STATUSES.has(status)) {
      return c.json({ success: true, message: 'Pending/ignored', data: { ignored: true } });
    }

    // cari user
    const username = s(body.username || body.user_id || body.order_id).trim();
    if (!username) return c.json({ success: false, message: 'username/user_id wajib', code: 'BAD_REQUEST' }, 400);
    const user = await one(env.DB, 'SELECT id, username, subscription_expires_at FROM users WHERE username=?', [username]);
    if (!user) return c.json({ success: false, message: 'User tidak ditemukan', code: 'USER_NOT_FOUND' }, 404);

    const dur = ALLOWED_DURATIONS.includes(num(body.duration_days)) ? num(body.duration_days) : 30;
    const now = Date.now();
    const cur = user.subscription_expires_at ? wibEpoch(s(user.subscription_expires_at)) : NaN;
    // extend dari expiry lama kalau masih di masa depan; kalau sudah lewat, mulai dari sekarang.
    const base = Number.isFinite(cur) && cur > now ? cur : now;
    const expiresAt = fmtWIB(base + dur * 86400000);

    await run(env.DB, "UPDATE users SET plan_type='premium', subscription_expires_at=?, trial_ends_at=NULL WHERE id=?", [expiresAt, user.id]);
    return c.json({
      success: true,
      message: 'Langganan diperbarui',
      data: { username: user.username, planType: 'premium', subscriptionExpiresAt: expiresAt, durationDays: dur },
    });
  });
}
