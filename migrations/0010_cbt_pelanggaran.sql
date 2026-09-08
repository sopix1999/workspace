-- ============================================================
-- KELAAS — Migrasi D1 0010: Anti-mencontek CBT.
--   cbt_sesi: kolom pelanggaran + kunci sesi.
--     violations      → jumlah pelanggaran (buka tab lain, dll)
--     locked          → 1 = sesi dikunci (menunggu approve guru)
--     locked_at       → waktu terakhir dikunci
--     approved_at     → waktu guru mengizinkan lanjut
--   cbt_pelanggaran: log tiap pelanggaran (untuk monitor guru).
-- ============================================================

ALTER TABLE cbt_sesi ADD COLUMN violations INTEGER DEFAULT 0;
ALTER TABLE cbt_sesi ADD COLUMN locked INTEGER DEFAULT 0;
ALTER TABLE cbt_sesi ADD COLUMN locked_at TEXT;
ALTER TABLE cbt_sesi ADD COLUMN approved_at TEXT;

CREATE TABLE IF NOT EXISTS cbt_pelanggaran (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sesi_id INTEGER,
  ujian_id INTEGER,
  nis TEXT,
  nama TEXT,
  jenis TEXT DEFAULT 'tab',     -- tab | window | blur
  detail TEXT,
  waktu TEXT,
  status TEXT DEFAULT 'pending'  -- pending / approved
);
CREATE INDEX IF NOT EXISTS idx_cbtpel_ujian ON cbt_pelanggaran(ujian_id);
CREATE INDEX IF NOT EXISTS idx_cbtpel_sesi ON cbt_pelanggaran(sesi_id);
