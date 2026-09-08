-- KELAAS — Bukti pembayaran manual (QRIS) + alur persetujuan admin.
-- Tabel `payments` melacak transaksi registrasi berbayar.
--   user_id        → users.id
--   amount         → nominal yang dibayar (rupiah)
--   proof_image_url→ key objek R2 (public URL dibentuk saat serve)
--   status         → pending / approved / rejected
--   role_plan      → paket yang dipilih saat registrasi:
--                    'wali_kelas' | 'guru_mapel' | 'walikelas_guru'
--   duration_days  → durasi premium setelah di-approve (30 / 180)
--   created_at     → WIB 'YYYY-MM-DD HH:MM:SS'
CREATE TABLE IF NOT EXISTS payments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  amount INTEGER DEFAULT 0,
  proof_image_url TEXT,
  status TEXT NOT NULL DEFAULT 'pending',
  role_plan TEXT,
  duration_days INTEGER DEFAULT 30,
  created_at TEXT
);
CREATE INDEX IF NOT EXISTS idx_payments_status ON payments(status);
CREATE INDEX IF NOT EXISTS idx_payments_user ON payments(user_id);
