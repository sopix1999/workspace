# Deploy KELAAS ke Vercel + Supabase

## 1. Setup Supabase

1. Buat project di Supabase (Postgres).
2. Dapatkan **Pooled Connection URL** (port 6543):
   - Dashboard → Settings → Database → Connection string → Pooled (port 6543)
   - Format: `postgres://postgres.xxxx:password@aws-0-ap-southeast-1.pooler.supabase.com:6543/postgres`
3. Jalankan migrasi:
   ```bash
   # Jalankan schema dulu
   psql $DATABASE_URL < schema.pg.sql
   # Lalu data
   psql $DATABASE_URL < data.pg.sql
   ```
   Alternatif pakai `psql` di Termux:
   ```bash
   pkg install postgresql
   psql "$DATABASE_URL" -f schema.pg.sql
   psql "$DATABASE_URL" -f data.pg.sql
   ```

## 2. Environment Variables di Vercel

Set di Vercel Project → Settings → Environment Variables:

- `DATABASE_URL` = Pooled Supabase URL
- `JWT_SECRET` = random string (min 32 chars)
- `GEMINI_KEY` = (opsional) API key Gemini
- `PAYMENT_WEBHOOK_SECRET` = (opsional)
- `ADMIN_WA` = (opsional) nomor WA admin

## 3. Deploy ke Vercel

```bash
# Install Vercel CLI (jika belum)
npm i -g vercel

# Deploy
cd /sdcard/workers
vercel --prod
```

Atau link project dulu:
```bash
vercel link
vercel --prod
```

## 4. Verifikasi

- Cek log di Vercel Dashboard.
- Akses `/api/test` (lewat route `api?action=test`) untuk test DB.
- Cron akan berjalan otomatis setiap 5 menit via Vercel Cron Jobs.

## Catatan

- `public/` dilayani otomatis oleh Vercel.
- Semua API di bawah `/api/*`, termasuk `/__gas` untuk kompatibilitas frontend.
- `src/` tetap sama dengan versi Cloudflare Workers, hanya `lib/db.ts` yang diganti.