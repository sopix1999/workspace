// ============================================================
// KELAAS — Hono app (terpusat). Diekspor untuk dipakai entry
// `src/index.ts` DAN untuk pemanggilan internal in-memory dari
// bridge (`c.env.__app.fetch`) — Workers tidak bisa fetch origin
// sendiri via HTTP.
// ============================================================
import { Hono } from 'hono';
import { registerRoutes } from './api/routes';
import { handleBridge } from './api-bridge';
import { registerWebhooks } from './api/webhooks';
import { registerRegisterAndPay } from './api/register';
import { registerAdmin } from './api/admin';
import { requireActiveSubscription, requireSuperAdmin, AppVariables } from './lib/subscription';

export type Bindings = {
  DB: any;
  GEMINI_KEY?: string;
  GEMINI_MODEL?: string;
  JWT_SECRET?: string;
  PAYMENT_WEBHOOK_SECRET?: string;
  ADMIN_WA?: string;
  ASSETS: any;
  self?: { fetch: (input: RequestInfo | URL, init?: RequestInit) => Promise<Response> };
  __app?: any;
};

const app = new Hono<{ Bindings: Bindings }>();

app.onError((err, c) => {
  console.error('[hono-error]', err && err.stack ? err.stack : String(err));
  return new Response(JSON.stringify({ success: false, message: 'Error: ' + (err instanceof Error ? err.message : String(err)) }), {
    status: 500,
    headers: { 'Content-Type': 'application/json; charset=utf-8' },
  });
});

// Simpan referensi app agar bridge bisa memanggil in-memory.
app.use('*', async (c, next) => {
  const env = c.env as Record<string, any>;
  env.__app = app;
  if (!env.self) {
    env.self = {
      fetch: async (input: RequestInfo | URL, init?: RequestInit) => {
        const url = typeof input === 'string' ? new URL(input) : input instanceof URL ? input : new URL(input.url);
        const base = new URL(c.req.url);
        const target = new URL(url.pathname + url.search, base.origin);
        const fetchFn = app.fetch as (req: Request, env: unknown, executionCtx: unknown) => Promise<Response>;
        return fetchFn(new Request(target.toString(), init), c.env, c.executionCtx);
      },
    };
  }
  await next();
});

// ---- Registrasi + pembayaran manual (QRIS) ----
// Daftar SEBELUM registerRoutes — route literal /api/register-and-pay
// & /api/plans harus menang atas `app.all('/api/:action')` di routes.
registerRegisterAndPay(app);

// ---- Test endpoint ----
app.get('/api', async (c) => {
  const action = c.req.query('action');
  if (action === 'test') {
    try {
      const { getPool } = await import('./lib/db');
      await getPool().query('SELECT 1');
      return c.json({ success: true, data: { db: 'ok' } });
    } catch (e) {
      return c.json({ success: false, error: String(e instanceof Error ? e.message : e) }, 500);
    }
  }
  return c.json({ error: 'Not found' }, 404);
});

// ---- API REST ----
await registerRoutes(app);

// ---- Sub-app protected: /api/app/* (wajib subscription aktif) ----
const protectedApp = new Hono<{ Bindings: Bindings; Variables: AppVariables }>();
protectedApp.use('*', requireActiveSubscription);
protectedApp.get('/me', async (c) => {
  const u = c.get('user') as Record<string, any>;
  return c.json({ success: true, data: u, message: 'OK' });
});
app.route('/api/app', protectedApp);

// ---- Admin sub-app: /api/admin/* (wajib Super Admin) ----
const adminApp = new Hono<{ Bindings: Bindings; Variables: AppVariables }>();
adminApp.use('*', requireSuperAdmin);
registerAdmin(adminApp);
app.route('/api/admin', adminApp);

// ---- Webhook payment gateway ----
registerWebhooks(app);

// ---- Bridge GAS (emulasi google.script.run) ----
app.post('/__gas', async (c) => handleBridge(c));

// ---- Static assets / SPA fallback ----
app.all('*', async (c) => {
  const env = c.env as Record<string, any>;
  if (env.ASSETS && typeof env.ASSETS.fetch === 'function') {
    const url = new URL(c.req.url);
    if (url.pathname === '/' || url.pathname === '/index.html') {
      url.pathname = '/index.html';
      const r = await env.ASSETS.fetch(url.toString(), c.req.raw);
      if (r.ok) return new Response(r.body, r);
    }
    // Landing page langganan — serve langganan.html langsung.
    if (url.pathname === '/langganan' || url.pathname === '/langganan.html') {
      url.pathname = '/langganan.html';
      const r = await env.ASSETS.fetch(url.toString(), c.req.raw);
      if (r.ok) return new Response(r.body, r);
    }
    const r = await env.ASSETS.fetch(c.req.url, c.req.raw);
    if (r.ok) return r;
    const idx = new URL('/index.html', c.req.url);
    const r2 = await env.ASSETS.fetch(idx.toString(), c.req.raw);
    if (r2.ok) return new Response(r2.body, r2);
  }
  return new Response('Not Found', { status: 404 });
});

export { app };
