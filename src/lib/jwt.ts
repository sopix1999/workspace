// ============================================================
// KELAAS — JWT sederhana HMAC-SHA256 (tanpa library tambahan).
// Pakai WebCrypto `crypto.subtle` yang tersedia di runtime
// Cloudflare Workers. Token TTL 7 hari.
// ============================================================
const enc = new TextEncoder();

function b64url(buf: Uint8Array): string {
  let bin = '';
  for (let i = 0; i < buf.length; i++) bin += String.fromCharCode(buf[i]);
  return btoa(bin).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

function b64urlDecode(s: string): Uint8Array {
  const pad = s.replace(/-/g, '+').replace(/_/g, '/');
  const bin = atob(pad + '==='.slice((pad.length + 3) % 4));
  const b = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) b[i] = bin.charCodeAt(i);
  return b;
}

// Secret dari env `JWT_SECRET`. Fallback dev HANYA saat DEBUG=1
// (ter-set di .dev.vars). Tanpa secret → string kosong (fail-closed).
export function getJwtSecret(env: Record<string, any>): string {
  if (env.JWT_SECRET) return env.JWT_SECRET;
  if (env.DEBUG) return 'kelaas-dev-secret';
  return '';
}

export async function signJwt(payload: Record<string, unknown>, secret: string): Promise<string> {
  const header = b64url(enc.encode(JSON.stringify({ alg: 'HS256', typ: 'JWT' })));
  const now = Math.floor(Date.now() / 1000);
  const body = b64url(enc.encode(JSON.stringify({ ...payload, iat: now, exp: now + 7 * 24 * 3600 })));
  const data = header + '.' + body;
  const key = await crypto.subtle.importKey('raw', enc.encode(secret), { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']);
  const sig = new Uint8Array(await crypto.subtle.sign('HMAC', key, enc.encode(data)));
  return data + '.' + b64url(sig);
}

export async function verifyJwt(token: string, secret: string): Promise<Record<string, any> | null> {
  try {
    const [h, b, s] = token.split('.');
    if (!h || !b || !s) return null;
    const key = await crypto.subtle.importKey('raw', enc.encode(secret), { name: 'HMAC', hash: 'SHA-256' }, false, ['verify']);
    const ok = await crypto.subtle.verify('HMAC', key, b64urlDecode(s).buffer as ArrayBuffer, enc.encode(h + '.' + b));
    if (!ok) return null;
    const payload = JSON.parse(new TextDecoder().decode(b64urlDecode(b)));
    if (payload.exp && payload.exp * 1000 <= Date.now()) return null;
    return payload;
  } catch {
    return null;
  }
}
