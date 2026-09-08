-- ============================================================
-- KELAAS — Set langganan premium untuk guru/walikelas lama
-- (didata sekolah, punya NIP). Setelah fitur SaaS aktif, akun
-- yang sudah terdata di sistem (punya NIP) tidak boleh terkunci
-- oleh gate subscription.
--
-- Catatan: `planStatus()` di src/lib/subscription.ts sudah exempt
-- guru ber-NIP dari gate. Update ini menjaga kolom plan tetap
-- konsisten (UI/stats), dan menghindari guru lama dilihat sebagai
-- "free/expired".
-- ============================================================

UPDATE users
SET plan_type = 'premium',
    subscription_expires_at = '2099-12-31 23:59:59'
WHERE role IN ('Walikelas', 'Guru')
  AND nip IS NOT NULL
  AND nip != ''
  AND (plan_type IS NULL OR plan_type = 'free' OR plan_type = 'trial');
