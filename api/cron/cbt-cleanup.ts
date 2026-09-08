// ============================================================
// KELAAS — Cron Vercel: finalisasi sesi CBT kadaluarsa.
// Dijalankan tiap 5 menit via vercel.json crons → GET /api/cron/cbt-cleanup
// (request dari Vercel Cron memakai header x-vercel-cron).
// ============================================================
import { app } from '../../src/app';
import { vercelEnv } from '../../src/lib/env';

export default async function handler(req: Request): Promise<Response> {
  try {
    const req2 = new Request('https://internal/api?action=cbt-cleanup-expired', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
    });
    const fetchFn = app.fetch as (r: Request, env: unknown, ctx: unknown) => Promise<Response>;
    const res = await fetchFn(req2, vercelEnv(), undefined);
    const body = await res.text();
    return new Response(body, {
      status: res.ok ? 200 : 500,
      headers: { 'Content-Type': 'application/json; charset=utf-8' },
    });
  } catch (e) {
    console.error('[cron cbt-cleanup-expired]', e instanceof Error ? e.message : e);
    return new Response(JSON.stringify({ success: false, message: 'Cron error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json; charset=utf-8' },
    });
  }
}

export const config = { runtime: 'nodejs' };
