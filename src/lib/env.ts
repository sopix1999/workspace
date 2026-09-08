// ============================================================
// KELAAS — Env adapter: Workers memberikan `env` dari binding,
// di Vercel (Node) env ada di process.env. Handler Vercel
// memanggil app.fetch(req, vercelEnv(), ctx) supaya seluruh
// kode lama (c.env.GEMINI_KEY, getJwtSecret(c.env), dst.) tetap
// bekerja tanpa diubah.
// ============================================================
export function vercelEnv(): Record<string, any> {
  return {
    // Binding DB versi D1 — tidak dipakai lagi (helper db.ts
    // memakai DATABASE_URL), disertakan agar kode lama aman.
    DB: null,
    ASSETS: null,
    GEMINI_KEY: process.env.GEMINI_KEY,
    GEMINI_MODEL: process.env.GEMINI_MODEL || 'gemini-3.5-flash',
    JWT_SECRET: process.env.JWT_SECRET,
    PAYMENT_WEBHOOK_SECRET: process.env.PAYMENT_WEBHOOK_SECRET,
    ADMIN_WA: process.env.ADMIN_WA,
    DEBUG: process.env.DEBUG,
  };
}
