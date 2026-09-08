# KELAAS — Sistem Wali Kelas

Versi: Vercel + Supabase (Postgres). Migrasi dari Cloudflare Workers + D1.

## Struktur

- `api/` — Vercel serverless entry points (`[[...path]].ts`, cron)
- `src/` — Aplikasi Hono (sama dengan versi Workers)
- `public/` — Static assets (index.html, admin-dashboard.html, langganan.html)
- `scripts/` — Konversi schema SQLite → Postgres

## Deploy

Lihat [DEPLOY.md](./DEPLOY.md)

## Development

```bash
npm install
cp .env.example .env.local
# isi DATABASE_URL, JWT_SECRET, dll.
npm run dev  # butuh vercel dev
```

## Endpoint utama

- `POST /__gas` — bridge untuk frontend lama (Google Apps Script style)
- `POST /api?action=...` — action-based API
- `GET /api/cron/cbt-cleanup` — cron (dipanggil Vercel)

## Database

- Semua query memakai helper di `src/lib/db.ts` (Postgres).
- Konversi otomatis `?` → `$1`, `INSERT OR IGNORE` → `ON CONFLICT DO NOTHING`, `AUTOINCREMENT` → `IDENTITY`.
- Schema dan data tersedia dalam `schema.pg.sql` dan `data.pg.sql`.

## Lisensi

Private — untuk keperluan internal.