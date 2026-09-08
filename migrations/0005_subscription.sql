-- ============================================================
-- KELAAS — Migrasi D1 0005: SaaS Subscription & Free Trial
-- Tambahkan kolom plan ke tabel users.
-- Kolom waktu memakai format WIB: 'YYYY-MM-DD HH:MM:SS'.
-- ============================================================

ALTER TABLE users ADD COLUMN plan_type TEXT DEFAULT 'free';
ALTER TABLE users ADD COLUMN trial_ends_at TEXT;
ALTER TABLE users ADD COLUMN subscription_expires_at TEXT;
