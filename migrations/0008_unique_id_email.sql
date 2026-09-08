-- ============================================================
-- KELAAS — Migrasi D1 0008: unique_id + email untuk user.
--   unique_id → format GRU-<YYMM>-<4char> (contoh: GRU-2608-8A9F)
--               dibuat saat registrasi (trial).
--   email     → kolom opsional, dipakai untuk login & pencarian.
-- Waktu trial: register sekarang 30 hari (lihat register.ts).
-- ============================================================

ALTER TABLE users ADD COLUMN unique_id TEXT;
ALTER TABLE users ADD COLUMN email TEXT;

CREATE INDEX IF NOT EXISTS idx_users_unique_id ON users(unique_id);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
