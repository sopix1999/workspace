// ============================================================
// KELAAS — Vercel entry (Node runtime). Hono app diekspor
// sebagai serverless handler. App inti tetap di src/app.ts.
//
// Catatan:
//  • Static assets: dilayani Vercel otomatis dari folder public/
//    (vercel.json → routes `/api/*` + `/__gas` + `/cron/*` ke
//    serverless, sisanya static files).
//  • Env: DATABASE_URL (Supabase pooler), JWT_SECRET, GEMINI_KEY,
//    dst. — di-set di Vercel Project Settings → Environment
//    Variables, atau .env.local untuk `vercel dev`.
// ============================================================
import { app } from '../src/app';
import { getPool } from '../src/lib/db';
import { vercelEnv } from '../src/lib/env';

let bootstrapped = false;
const dummyCtx = {
  waitUntil: () => {},
  passThroughOnException: () => {},
  props: {},
};

export default async function handler(req: Request): Promise<Response> {
  if (!bootstrapped) {
    try {
      await getPool().query('SELECT 1');
      bootstrapped = true;
    } catch (e) {
      console.error('[db-ping-failed]', e instanceof Error ? e.message : e);
    }
  }
  return app.fetch(req, vercelEnv(), dummyCtx);
}

export const config = { runtime: 'nodejs' };
