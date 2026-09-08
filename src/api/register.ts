// ============================================================
// KELAAS — Registrasi Berlangganan (konfirmasi manual via WA).
//
// POST /api/register-and-pay  (application/json)
//
// Body:
//   nama      → nama lengkap
//   username  → username unik
//   password  → password
//   email     → opsional
//   kelas     → opsional (kelas wali kelas)
//
// SATU PAKET saja (tanpa tier). Akun baru diberi role 'Walikelas'
// sehingga bisa masuk sebagai Guru Mapel ATAU Wali Kelas.
//
// Alur:
//   1. Validasi field & cek username duplikat.
//   2. Hitung harga dari konstan SERVER-SIDE — jangan percaya
//      amount dari client.
//   3. Buat user baru → role Walikelas → plan 'trial'
//      (30 hari, supaya admin punya waktu konfirmasi).
//   4. Catat payments → status 'pending' (TANPA bukti gambar —
//      pembayaran diverifikasi admin lewat WhatsApp).
//   5. Return { status:'success', payment_id, whatsapp_url }.
//
// Nomor WA admin dibaca dari env `ADMIN_WA` (prod:
// `wrangler secret put ADMIN_WA` atau `vars`), fallback placeholder.
// ============================================================
import { one, insertId } from '../lib/db';
import { hashPassword } from '../lib/passwords';
import { nowWIB, fmtWIB } from '../lib/crypto';

// Generate unique_id format GRU-<YYMM>-<4char alfanumerik>.
// Contoh: GRU-2608-8A9F. Cukup acak untuk user internal (~1.6M).
function genUniqueId(): string {
  const now = new Date();
  const ym = String(now.getFullYear()).slice(2) + String(now.getMonth() + 1).padStart(2, '0');
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'; // tanpa O/0, I/1 (mudah dibaca)
  let r = '';
  const rnd = new Uint8Array(4);
  crypto.getRandomValues(rnd);
  for (let i = 0; i < 4; i++) r += chars[rnd[i] % chars.length];
  return `GRU-${ym}-${r}`;
}

// SATU paket saja. Role = Walikelas sehingga bisa masuk sebagai
// Guru Mapel ATAU Wali Kelas (lihat login). Harga semester.
export const PLAN_PRICES: Record<string, number> = {
  kelaas: 149000,
};
export const PLAN_ROLE: Record<string, string> = {
  kelaas: 'Walikelas',
};
// Biarkan paket lama tetap dikenali untuk kompatibilitas data lama.
const LEGACY_PLAN_ROLE: Record<string, string> = {
  wali_kelas: 'Walikelas',
  guru_mapel: 'Guru',
  walikelas_guru: 'Walikelas',
};
const ALLOWED_PLANS = new Set([...Object.keys(PLAN_PRICES), ...Object.keys(LEGACY_PLAN_ROLE)]);
const ALLOWED_DURATIONS = [30, 180];

function json(v: unknown, status = 200) {
  return new Response(JSON.stringify(v), {
    status,
    headers: { 'Content-Type': 'application/json; charset=utf-8' },
  });
}
function fail(message: string, status = 400) {
  return json({ success: false, message }, status);
}

export function registerRegisterAndPay(app: any) {
  app.post('/api/register-and-pay', async (c: any) => {
    const env = c.env as Record<string, any>;
    const db = env.DB;
    const body = (await c.req.json().catch(() => ({}))) as Record<string, any>;

    const nama = String(body.nama || '').trim();
    const username = String(body.username || '').trim();
    const password = String(body.password || '');
    const email = String(body.email || '').trim().toLowerCase();
    const plan = String(body.plan || '').trim() || 'kelaas';
    const kelas = String(body.kelas || '').trim();

    if (!nama || !username || !password) return fail('nama, username, password wajib diisi');
    if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return fail('Email tidak valid');
    if (!ALLOWED_PLANS.has(plan)) return fail('plan tidak valid');

    // cek username duplikat (0004 drop UNIQUE constraint)
    const dup = await one(db, 'SELECT id FROM users WHERE username=?', [username]);
    if (dup) return fail('Username sudah dipakai');

    const role = PLAN_ROLE[plan] || LEGACY_PLAN_ROLE[plan];
    const amount = PLAN_PRICES[plan] || PLAN_PRICES.kelaas;
    const durationDays = ALLOWED_DURATIONS.includes(Number(body.duration_days)) ? Number(body.duration_days) : 180;
    // Trial 30 hari — cukup waktu utk coba fitur & konfirmasi admin.
    const trialEndsAt = fmtWIB(Date.now() + 30 * 24 * 3600 * 1000);
    const uniqueId = genUniqueId();

    // 1) buat user — trial dulu, premium setelah di-approve
    const hash = await hashPassword(password);
    const userId = await insertId(
      db,
      "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip,email,unique_id,plan_type,trial_ends_at) VALUES (?,?,?,?,?,?,?,?,?,?)",
      [username, hash, role, kelas, nama, '', email || null, uniqueId, 'trial', trialEndsAt],
    );
    if (!userId) return fail('Gagal membuat user. Coba lagi.');

    // 2) catat pembayaran pending (tanpa bukti gambar)
    const paymentId = await insertId(
      db,
      "INSERT INTO payments (user_id, amount, proof_image_url, status, role_plan, duration_days, created_at) VALUES (?,?,?,?,?,?,?)",
      [userId, amount, null, 'pending', plan, durationDays, nowWIB()],
    );

    // 3) URL WhatsApp utk konfirmasi admin
    // ADMIN_WA harus 62xxxxxxxxxx (≥10 digit). Placeholder default
    // diset di .dev.vars — ganti ke nomor asli sebelum deploy.
    let adminWa = String(env.ADMIN_WA || '').replace(/\D/g, '');
    if (adminWa.length < 10) adminWa = '628XXXXXXXXXX';
    const msg =
      'Halo Admin, saya ' + nama + ' (' + username + ') baru saja mendaftar langganan ' +
      planLabel(plan) + (kelas ? ' sebagai Wali Kelas ' + kelas : '') +
      '. Ini ID Pembayaran saya: ' + paymentId + '. Mohon segera dicek dan diaktifkan ya.';
    const whatsappUrl = 'https://wa.me/' + adminWa + '?text=' + encodeURIComponent(msg);

    return json({
      status: 'success',
      message: 'Pendaftaran berhasil. Silakan konfirmasi via WhatsApp.',
      payment_id: paymentId,
      whatsapp_url: whatsappUrl,
      plan,
      amount,
      unique_id: uniqueId,
      trial_ends_at: trialEndsAt,
    });
  });

  // info paket & harga (public, buat UI render form)
  app.get('/api/plans', (c: any) =>
    json({
      success: true,
      data: {
        plans: Object.entries(PLAN_PRICES).map(([id, price]) => ({ id, price, role: PLAN_ROLE[id], label: planLabel(id) })),
        currency: 'IDR',
      },
    }),
  );
}

export function planLabel(plan: string): string {
  const labels: Record<string, string> = {
    kelaas: 'KELAAS Premium',
    wali_kelas: 'Wali Kelas',
    guru_mapel: 'Guru Mapel',
    walikelas_guru: 'Wali Kelas + Guru Mapel',
  };
  return labels[plan] || plan;
}
