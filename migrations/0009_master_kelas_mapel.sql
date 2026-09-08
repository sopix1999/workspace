-- ============================================================
-- KELAAS — Migrasi D1 0009: master data kelas & mapel.
--   Guru tidak perlu mengetik manual nama kelas/mapel; memilih
--   dari daftar master yang dikelola via menu guru.
--   master_kelas / master_mapel diisi lewat API
--   (guru-add-kelas, guru-add-mapel) dan bisa dilihat siapa saja.
-- ============================================================

CREATE TABLE IF NOT EXISTS master_kelas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kelas TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS master_mapel (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mapel TEXT NOT NULL UNIQUE
);
