// ============================================================
// KELAAS — Gate subscription (free trial / premium).
// Dipakai bersama oleh middleware Hono `requireActiveSubscription`
// (untuk sub-app /api/app/*) DAN oleh bridge /__gas via
// `checkUserAccess`. Frontend lama nyaris hanya memanggil /__gas,
// jadi gate di bridge adalah proteksi nyata.
// ============================================================
import type { Context } from 'hono';
import type { D1Database } from '@cloudflare/workers-types';
import { one } from './db';
import { getJwtSecret, verifyJwt } from './jwt';
import { wibEpoch } from './crypto';

export type AppVariables = { user: Record<string, any> };

// Hanya role guru yang diwajibkan punya langganan aktif.
const GATED_ROLES = new Set(['Walikelas', 'Guru']);

export type PlanStatus =
  | 'ALLOWED'        // bukan role guru → bebas
  | 'TRIAL_ACTIVE'   // trial aktif
  | 'ACTIVE'         // premium aktif
  | 'TRIAL_EXPIRED'
  | 'SUBSCRIPTION_EXPIRED'
  | 'NO_SUBSCRIPTION';

export function planStatus(user: Record<string, any>): { ok: boolean; code: PlanStatus } {
  const role = String(user.role || '');
  if (!GATED_ROLES.has(role)) return { ok: true, code: 'ALLOWED' };
  // Guru/Walikelas lama (didata sekolah, punya NIP) bebas dari gate
  // subscription — jangan tampilkan "Aktifkan langganan untuk melanjutkan".
  // Hanya user yang self-register (tanpa NIP) yang wajib berlangganan.
  if (s(user.nip ?? user.NIP ?? '')) return { ok: true, code: 'ALLOWED' };
  // Terima baik snake_case (DB mentah) maupun alias camelCase (USER_SELECT / login)
  const plan = String(user.plan_type ?? user.planType ?? 'free');
  const trialEnds = user.trial_ends_at ?? user.trialEndsAt;
  const subExpires = user.subscription_expires_at ?? user.subscriptionExpiresAt;
  const now = Date.now();
  if (plan === 'premium') {
    const exp = subExpires ? wibEpoch(s(subExpires)) : NaN;
    if (!subExpires || now > exp) return { ok: false, code: 'SUBSCRIPTION_EXPIRED' };
    return { ok: true, code: 'ACTIVE' };
  }
  if (plan === 'trial') {
    const exp = trialEnds ? wibEpoch(s(trialEnds)) : NaN;
    if (!trialEnds || now > exp) return { ok: false, code: 'TRIAL_EXPIRED' };
    return { ok: true, code: 'TRIAL_ACTIVE' };
  }
  return { ok: false, code: 'NO_SUBSCRIPTION' };
}

const USER_SELECT =
  'SELECT id, username, role, kelas, nama_lengkap AS namaLengkap, nip, plan_type AS planType, trial_ends_at AS trialEndsAt, subscription_expires_at AS subscriptionExpiresAt FROM users';

function s(v: unknown): string {
  return v === null || v === undefined ? '' : String(v);
}

const STATUS_MESSAGES: Record<string, string> = {
  TRIAL_EXPIRED: 'Masa trial berakhir. Silakan berlangganan.',
  SUBSCRIPTION_EXPIRED: 'Langganan berakhir. Perbarui langganan Anda.',
  NO_SUBSCRIPTION: 'Aktifkan langganan untuk melanjutkan.',
};

export type AccessResult =
  | { ok: true; user: Record<string, any> }
  | { ok: false; status: number; body: Record<string, any> };

// Verifikasi JWT → load user fresh dari DB (jangan percaya claim
// token untuk status plan) → cek role & plan. Selalu baca DB agar
// perubahan plan langsung terlihat, tidak butuh token baru.
export async function checkUserAccess(c: { env: Record<string, any>; req: { header: (k: string) => string | undefined } }, db: D1Database): Promise<AccessResult> {
  const env = c.env;
  const secret = getJwtSecret(env);
  if (!secret) {
    return { ok: false, status: 500, body: { success: false, message: 'JWT_SECRET belum dikonfigurasi', code: 'SERVER_ERROR' } };
  }
  const token = (c.req.header('authorization') || '').replace(/^Bearer /i, '');
  const payload = token ? await verifyJwt(token, secret) : null;
  if (!payload) {
    return { ok: false, status: 401, body: { success: false, message: 'Token tidak valid atau kedaluwarsa', code: 'UNAUTHORIZED' } };
  }
  const user = await one(db, USER_SELECT + ' WHERE id=?', [payload.sub]);
  if (!user) {
    return { ok: false, status: 401, body: { success: false, message: 'User tidak ditemukan', code: 'UNAUTHORIZED' } };
  }
  const st = planStatus(user);
  if (!st.ok) {
    return {
      ok: false,
      status: 403,
      body: { success: false, message: STATUS_MESSAGES[st.code] || 'Langganan tidak aktif', code: st.code },
    };
  }
  return { ok: true, user };
}

// Hono middleware — mount di sub-app protected.
export async function requireActiveSubscription(c: Context<{ Bindings: Record<string, any>; Variables: AppVariables }>, next: () => Promise<void>) {
  const r = await checkUserAccess(c, c.env.DB);
  if (!r.ok) return c.json(r.body, r.status as 401 | 403 | 500);
  c.set('user', r.user);
  await next();
}

// Middleware admin — hanya role Super Admin (role='SuperAdmin' sistem
// lama ATAU 'super_admin' baru) yang boleh lewat. Cek JWT + load user
// fresh dari DB (sama seperti requireActiveSubscription), lalu cek role.
const ADMIN_ROLES = new Set(['SuperAdmin', 'super_admin']);
export async function requireSuperAdmin(c: Context<{ Bindings: Record<string, any>; Variables: AppVariables }>, next: () => Promise<void>) {
  const r = await checkUserAccess(c, c.env.DB);
  if (!r.ok) return c.json(r.body, r.status as 401 | 403 | 500);
  if (!ADMIN_ROLES.has(String(r.user.role || ''))) {
    return c.json({ success: false, message: 'Akses ditolak. Hanya Super Admin.', code: 'FORBIDDEN' }, 403);
  }
  c.set('user', r.user);
  await next();
}
