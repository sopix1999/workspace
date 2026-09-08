-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql303.infinityfree.com
-- Waktu pembuatan: 18 Agu 2026 pada 10.46
-- Versi server: 11.4.12-MariaDB
-- Versi PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_42494838_siwalas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agenda_mengajar`
--

CREATE TABLE `agenda_mengajar` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `target` text DEFAULT NULL,
  `materi` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_praktik`
--

CREATE TABLE `bahan_praktik` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `nama_bahan` varchar(150) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `stok` decimal(10,2) DEFAULT NULL,
  `stok_min` decimal(10,2) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `bahan_praktik`
--

INSERT INTO `bahan_praktik` (`id`, `kode`, `nama_bahan`, `satuan`, `stok`, `stok_min`, `kategori`) VALUES
(1, 'BHN001', 'Kabel UTP Cat6', 'Meter', '50.00', '20.00', 'Kabel'),
(2, 'BHN002', 'Konektor RJ45', 'Pcs', '15.00', '30.00', 'Konektor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_soal`
--

CREATE TABLE `bank_soal` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT '',
  `jenis` int(11) DEFAULT 1,
  `soal` text DEFAULT NULL,
  `opsi` text DEFAULT NULL,
  `kunci` text DEFAULT NULL,
  `pembahasan` text DEFAULT NULL,
  `bobot` int(11) DEFAULT 1,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `bank_soal`
--

INSERT INTO `bank_soal` (`id`, `nip`, `mapel`, `kelas`, `jenis`, `soal`, `opsi`, `kunci`, `pembahasan`, `bobot`, `tanggal`) VALUES
(62, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Hasil dari 25 + 37 adalah ...', '[\"A. 52\",\"B. 62\",\"C. 72\",\"D. 82\",\"E. 92\"]', 'B', '25 + 37 = 62.', 1, '2026-08-08'),
(63, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Hasil dari 84 - 29 adalah ...', '[\"A. 45\",\"B. 55\",\"C. 65\",\"D. 75\",\"E. 85\"]', 'B', '84 - 29 = 55.', 1, '2026-08-08'),
(64, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Hasil dari 12 x 8 adalah ...', '[\"A. 86\",\"B. 96\",\"C. 106\",\"D. 116\",\"E. 126\"]', 'B', '12 x 8 = 96.', 1, '2026-08-08'),
(65, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Hasil dari 144 : 12 adalah ...', '[\"A. 10\",\"B. 11\",\"C. 12\",\"D. 13\",\"E. 14\"]', 'C', '144 : 12 = 12.', 1, '2026-08-08'),
(66, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Hasil dari 15 + 6 x 2 adalah ...', '[\"A. 27\",\"B. 42\",\"C. 36\",\"D. 21\",\"E. 18\"]', 'A', 'Kerjakan operasi perkalian terlebih dahulu: 6 x 2 = 12. Kemudian tambahkan: 15 + 12 = 27.', 1, '2026-08-08'),
(67, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Pecahan 3/4 jika diubah menjadi desimal adalah ...', '[\"A. 0,25\",\"B. 0,50\",\"C. 0,75\",\"D. 0,80\",\"E. 0,90\"]', 'C', '3/4 sama dengan 3 : 4 = 0,75.', 1, '2026-08-08'),
(68, 'rofiq', 'SKIL', 'X DKV 2', 1, '25% dari 200 adalah ...', '[\"A. 25\",\"B. 40\",\"C. 50\",\"D. 75\",\"E. 100\"]', 'C', '25% x 200 = (25 / 100) x 200 = 50.', 1, '2026-08-08'),
(69, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Sebuah pensil seharga Rp3.000. Jika membeli 5 pensil, jumlah uang yang harus dibayar adalah ...', '[\"A. Rp10.000\",\"B. Rp12.000\",\"C. Rp15.000\",\"D. Rp18.000\",\"E. Rp20.000\"]', 'C', 'Harga total = 5 x Rp3.000 = Rp15.000.', 1, '2026-08-08'),
(70, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Keliling sebuah persegi dengan panjang sisi 8 cm adalah ...', '[\"A. 16 cm\",\"B. 24 cm\",\"C. 32 cm\",\"D. 64 cm\",\"E. 80 cm\"]', 'C', 'Keliling persegi = 4 x sisi = 4 x 8 cm = 32 cm.', 1, '2026-08-08'),
(71, 'rofiq', 'SKIL', 'X DKV 2', 1, 'Jika x + 15 = 30, maka nilai x adalah ...', '[\"A. 10\",\"B. 15\",\"C. 20\",\"D. 25\",\"E. 30\"]', 'B', 'x = 30 - 15 = 15.', 1, '2026-08-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_perilaku`
--

CREATE TABLE `catatan_perilaku` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `jenis` varchar(40) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_sikap`
--

CREATE TABLE `catatan_sikap` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `jenis` varchar(30) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `pencatat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_exam`
--

CREATE TABLE `cbt_exam` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `token` varchar(20) DEFAULT NULL,
  `acak_soal` tinyint(4) DEFAULT 0,
  `status` varchar(20) DEFAULT 'Aktif',
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_exam`
--

INSERT INTO `cbt_exam` (`id`, `nip`, `kelas`, `mapel`, `judul`, `durasi`, `token`, `acak_soal`, `status`, `tanggal`) VALUES
(7, 'rofiq', 'X DKV 2', 'KKA(KODING)', 'uH', 3, 'AD7F06', 1, 'Aktif', '2026-08-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_hasil`
--

CREATE TABLE `cbt_hasil` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `mulai` datetime DEFAULT NULL,
  `selesai` datetime DEFAULT NULL,
  `nilai_pg` decimal(6,2) DEFAULT NULL,
  `nilai_essay` decimal(6,2) DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Berlangsung'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_hasil`
--

INSERT INTO `cbt_hasil` (`id`, `exam_id`, `nis`, `nama`, `mulai`, `selesai`, `nilai_pg`, `nilai_essay`, `total`, `status`) VALUES
(6, 7, '111', 'ABIGAIL NATASHA SETIA WAYORI', '2026-07-31 10:59:15', '2026-07-31 10:59:18', NULL, NULL, NULL, 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_jawaban`
--

CREATE TABLE `cbt_jawaban` (
  `id` int(11) NOT NULL,
  `sesi_id` int(11) DEFAULT NULL,
  `soal_id` int(11) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `benar` tinyint(4) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `sumber` varchar(10) NOT NULL DEFAULT 'manual'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_jawaban`
--

INSERT INTO `cbt_jawaban` (`id`, `sesi_id`, `soal_id`, `jawaban`, `benar`, `feedback`, `sumber`) VALUES
(95, 15, 111, 'D', 0, NULL, 'manual'),
(96, 15, 112, 'C', 0, NULL, 'manual'),
(97, 15, 110, 'A', 0, NULL, 'manual'),
(98, 15, 113, 'E', 0, NULL, 'manual'),
(99, 15, 114, 'D', 0, NULL, 'manual'),
(100, 15, 115, 'E', 0, NULL, 'manual'),
(101, 15, 116, 'C', 1, NULL, 'manual'),
(102, 15, 117, 'C', 1, NULL, 'manual'),
(103, 15, 118, 'D', 0, NULL, 'manual'),
(104, 15, 119, 'C', 0, NULL, 'manual');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_sesi`
--

CREATE TABLE `cbt_sesi` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `mulai` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `selesai` tinyint(4) DEFAULT 0,
  `skor` decimal(5,2) DEFAULT NULL,
  `total_benar` int(11) DEFAULT 0,
  `total_soal` int(11) DEFAULT 0,
  `uraian_menunggu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_sesi`
--

INSERT INTO `cbt_sesi` (`id`, `ujian_id`, `nis`, `nama`, `mulai`, `deadline`, `selesai`, `skor`, `total_benar`, `total_soal`, `uraian_menunggu`) VALUES
(15, 17, '111', 'ABIGAIL NATASHA SETIA WAYORI', '2026-08-08 01:14:01', '2026-08-08 01:44:01', 1, '20.00', 2, 10, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_soal`
--

CREATE TABLE `cbt_soal` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `jenis` int(11) DEFAULT NULL,
  `soal` text DEFAULT NULL,
  `opsi` text DEFAULT NULL,
  `kunci` text DEFAULT NULL,
  `pembahasan` text DEFAULT NULL,
  `bobot` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_soal`
--

INSERT INTO `cbt_soal` (`id`, `ujian_id`, `no_urut`, `jenis`, `soal`, `opsi`, `kunci`, `pembahasan`, `bobot`) VALUES
(110, 17, 1, 1, 'Hasil dari 25 + 37 adalah ...', '[\"A. 52\",\"B. 62\",\"C. 72\",\"D. 82\",\"E. 92\"]', 'B', '25 + 37 = 62.', 1),
(111, 17, 2, 1, 'Hasil dari 84 - 29 adalah ...', '[\"A. 45\",\"B. 55\",\"C. 65\",\"D. 75\",\"E. 85\"]', 'B', '84 - 29 = 55.', 1),
(112, 17, 3, 1, 'Hasil dari 12 x 8 adalah ...', '[\"A. 86\",\"B. 96\",\"C. 106\",\"D. 116\",\"E. 126\"]', 'B', '12 x 8 = 96.', 1),
(113, 17, 4, 1, 'Hasil dari 144 : 12 adalah ...', '[\"A. 10\",\"B. 11\",\"C. 12\",\"D. 13\",\"E. 14\"]', 'C', '144 : 12 = 12.', 1),
(114, 17, 5, 1, 'Hasil dari 15 + 6 x 2 adalah ...', '[\"A. 27\",\"B. 42\",\"C. 36\",\"D. 21\",\"E. 18\"]', 'A', 'Kerjakan operasi perkalian terlebih dahulu: 6 x 2 = 12. Kemudian tambahkan: 15 + 12 = 27.', 1),
(115, 17, 6, 1, 'Pecahan 3/4 jika diubah menjadi desimal adalah ...', '[\"A. 0,25\",\"B. 0,50\",\"C. 0,75\",\"D. 0,80\",\"E. 0,90\"]', 'C', '3/4 sama dengan 3 : 4 = 0,75.', 1),
(116, 17, 7, 1, '25% dari 200 adalah ...', '[\"A. 25\",\"B. 40\",\"C. 50\",\"D. 75\",\"E. 100\"]', 'C', '25% x 200 = (25 / 100) x 200 = 50.', 1),
(117, 17, 8, 1, 'Sebuah pensil seharga Rp3.000. Jika membeli 5 pensil, jumlah uang yang harus dibayar adalah ...', '[\"A. Rp10.000\",\"B. Rp12.000\",\"C. Rp15.000\",\"D. Rp18.000\",\"E. Rp20.000\"]', 'C', 'Harga total = 5 x Rp3.000 = Rp15.000.', 1),
(118, 17, 9, 1, 'Keliling sebuah persegi dengan panjang sisi 8 cm adalah ...', '[\"A. 16 cm\",\"B. 24 cm\",\"C. 32 cm\",\"D. 64 cm\",\"E. 80 cm\"]', 'C', 'Keliling persegi = 4 x sisi = 4 x 8 cm = 32 cm.', 1),
(119, 17, 10, 1, 'Jika x + 15 = 30, maka nilai x adalah ...', '[\"A. 10\",\"B. 15\",\"C. 20\",\"D. 25\",\"E. 30\"]', 'B', 'x = 30 - 15 = 15.', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_ujian`
--

CREATE TABLE `cbt_ujian` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `durasi_menit` int(11) DEFAULT 60,
  `token` varchar(20) DEFAULT NULL,
  `aktif` tinyint(4) DEFAULT 1,
  `ai_aktif` tinyint(4) NOT NULL DEFAULT 0,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_ujian`
--

INSERT INTO `cbt_ujian` (`id`, `nip`, `judul`, `kelas`, `mapel`, `durasi_menit`, `token`, `aktif`, `ai_aktif`, `tanggal`) VALUES
(17, 'rofiq', 'Uh', 'X DKV 2', 'SKIL', 30, '1CE1DE', 1, 0, '2026-08-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `jenis` varchar(40) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `nama_guru` varchar(150) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `kelas_diampu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nip`, `nama_guru`, `mapel`, `kelas_diampu`) VALUES
(1, 'rofiq', '', 'X DKV 1,X DKV 2,XI PSPT 1,X PSPT,X TKR 4,X TKJ 4,XII DKV 2,XII DKV 1,X TKJ 5', NULL),
(2, 'adam', '', '', NULL),
(3, 'isna', '', '', 'XII DKV 1'),
(4, 'umy', '', '', 'XII DKV 1,X PSPT,XI PSPT 2,XII PSPT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_profil`
--

CREATE TABLE `guru_profil` (
  `nip` varchar(100) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `nip2` varchar(50) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `beban` int(11) DEFAULT 0,
  `foto` text DEFAULT NULL,
  `ttd` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `guru_profil`
--

INSERT INTO `guru_profil` (`nip`, `nama`, `nip2`, `mapel`, `beban`, `foto`, `ttd`) VALUES
('rofiq', 'Mohamad Ainur Rofiq, S.Pd', 'rofiq', 'SKIL', 40, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris`
--

CREATE TABLE `inventaris` (
  `id` int(11) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(150) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `kondisi` varchar(50) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `inventaris`
--

INSERT INTO `inventaris` (`id`, `kelas`, `nama_barang`, `jumlah`, `kondisi`, `keterangan`, `tanggal`) VALUES
(1, 'X DKV 2', 'Kipas', 2, 'Baik', '', '2026-07-23'),
(2, 'X DKV 2', 'sapu', 3, 'Baik', '', '2026-07-24'),
(3, 'X DKV 2', 'wadah penghapus', 1, 'Baik', '', '2026-07-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_pelajaran`
--

CREATE TABLE `jadwal_pelajaran` (
  `id` int(11) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam_ke` int(11) DEFAULT NULL,
  `mata_pelajaran` varchar(150) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal_pelajaran`
--

INSERT INTO `jadwal_pelajaran` (`id`, `kelas`, `hari`, `jam_ke`, `mata_pelajaran`, `nip`) VALUES
(5, 'X DKV 1', 'Selasa', 1, 'KKA (KODING)', 'rofiq'),
(6, 'X TKJ 4', 'Selasa', 3, 'B. JAWA', 'rofiq'),
(7, 'X DKV 1', 'Selasa', 5, 'SKIL', 'rofiq'),
(8, 'XII DKV 2', 'Selasa', 10, 'KOMTYPE', 'rofiq'),
(9, 'X DKV 2', 'Rabu', 1, 'KKA(KODING)', 'rofiq'),
(10, 'XII DKV 1', 'Rabu', 7, 'KOMTYPE', 'rofiq'),
(11, 'XII DKV 1', 'Kamis', 1, 'KOMTYPE', 'rofiq'),
(12, 'X DKV 2', 'Kamis', 5, 'SKIL', 'rofiq'),
(20, 'XI PSPT 2', 'Senin', 2, 'EAV', 'umy');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_piket`
--

CREATE TABLE `jadwal_piket` (
  `id` int(11) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nama_siswa` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal_piket`
--

INSERT INTO `jadwal_piket` (`id`, `kelas`, `hari`, `nis`, `nama_siswa`) VALUES
(1, 'X DKV 2', 'Senin', '111', 'ABIGAIL NATASHA SETIA WAYORI'),
(2, 'X DKV 2', 'Senin', '112', 'AENA AZQIYAH'),
(3, 'X DKV 2', 'Senin', '113', 'AJI SETIAJI'),
(4, 'X DKV 2', 'Senin', '114', 'AKBAR KHALIF JAHBANA'),
(5, 'X DKV 2', 'Senin', '115', 'ALFAN ALFIAN SALIM'),
(6, 'X DKV 2', 'Senin', '116', 'ALFATIR NAZRIEL ILHAM'),
(7, 'X DKV 2', 'Senin', '117', 'AMANDA SAFIRA'),
(8, 'X DKV 2', 'Selasa', '118', 'ANDREA DIANONE'),
(9, 'X DKV 2', 'Selasa', '119', 'CHESTA DAFFA WIDIYANTO'),
(10, 'X DKV 2', 'Selasa', '120', 'DEVON RAJA BANAZAR'),
(11, 'X DKV 2', 'Selasa', '121', 'DITYO NUGROHO'),
(12, 'X DKV 2', 'Selasa', '122', 'FARDINA ASHAFIYYAH RAMADHANI'),
(13, 'X DKV 2', 'Selasa', '123', 'FAUZI AHMAD IBNU MAJAH'),
(14, 'X DKV 2', 'Selasa', '124', 'FITRI TAHTA ALFIANA'),
(15, 'X DKV 2', 'Rabu', '125', 'HAMDAN HANIFAN AKBAR'),
(16, 'X DKV 2', 'Rabu', '126', 'IBNI AQIL AL MALIKI'),
(17, 'X DKV 2', 'Rabu', '127', 'ISNAN FEZA MUSTAFID'),
(18, 'X DKV 2', 'Rabu', '128', 'KAYLA NUR SYAFA\'ATI'),
(19, 'X DKV 2', 'Rabu', '129', 'KIARA MELINDA'),
(20, 'X DKV 2', 'Rabu', '130', 'MOH. TASSYAHRUL RAMADHANI'),
(21, 'X DKV 2', 'Rabu', '131', 'MUHAMAD AJI ALFARIS'),
(22, 'X DKV 2', 'Kamis', '132', 'MUHAMMAD AFFIFUDIN'),
(23, 'X DKV 2', 'Kamis', '133', 'MUHAMMAD PANJI'),
(24, 'X DKV 2', 'Kamis', '134', 'NIYARA FHALASIFA'),
(25, 'X DKV 2', 'Kamis', '135', 'NOERIEN MU\'IDZ BACHTIAR'),
(26, 'X DKV 2', 'Kamis', '136', 'OVI NURAINI'),
(27, 'X DKV 2', 'Kamis', '137', 'RAYNOR TERTIA DARMAWAN'),
(28, 'X DKV 2', 'Jumat', '138', 'RINI AMALIA PUTRI'),
(29, 'X DKV 2', 'Jumat', '139', 'RIZQI ANDHIKA PRATAMA'),
(30, 'X DKV 2', 'Jumat', '140', 'SEPTIANI NANDINI'),
(31, 'X DKV 2', 'Jumat', '141', 'SITI AZMI FITRIANI'),
(32, 'X DKV 2', 'Jumat', '142', 'TRI ULFIYA FATKHUL JANAH'),
(33, 'X DKV 2', 'Jumat', '143', 'ZAINI PUTRA PRATAMA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_bimbingan`
--

CREATE TABLE `jurnal_bimbingan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tindak_lanjut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jurnal_bimbingan`
--

INSERT INTO `jurnal_bimbingan` (`id`, `tanggal`, `kelas`, `kategori`, `isi`, `tindak_lanjut`) VALUES
(1, '2026-07-26', '7A', 'Akademik', 'bagus', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_mengajar`
--

CREATE TABLE `jurnal_mengajar` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `jam_ke` int(11) DEFAULT NULL,
  `materi` text DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `tujuan` text DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `metode` varchar(100) DEFAULT NULL,
  `media` varchar(100) DEFAULT NULL,
  `asesmen` varchar(100) DEFAULT NULL,
  `refleksi` text DEFAULT NULL,
  `hambatan` text DEFAULT NULL,
  `solusi` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Selesai'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jurnal_mengajar`
--

INSERT INTO `jurnal_mengajar` (`id`, `tanggal`, `kelas`, `nip`, `mapel`, `jam_ke`, `materi`, `kegiatan`, `tujuan`, `model`, `metode`, `media`, `asesmen`, `refleksi`, `hambatan`, `solusi`, `status`) VALUES
(2, '2026-07-27', 'XII DKV 1', 'umy', '', 1, '', '', '', '', '', '', '', '', '', '', 'Selesai'),
(3, '2026-07-27', 'XI PSPT 1', 'rofiq', 'KOMTYPE', 2, 'DRIL PKL', '', 'PEMBEKALAN PKL', '', '', '', '', '', '', '', 'Selesai'),
(4, '2026-07-27', 'X DKV 1', 'rofiq', 'SKIL', 5, 'KELOMPOK TECHNOPRENEUR', '', '', '', '', '', '', '', '', '', 'Selesai'),
(5, '2026-07-27', 'X PSPT', 'rofiq', 'KKA (KODING)', 8, 'KECERDASAN BUATAN', '', '', '', '', '', '', '', '', '', 'Selesai'),
(6, '2026-07-27', 'X TKR 4', 'rofiq', 'PAIBP', 10, 'BERLOMBA LOMBA DALAM KEBAIKAN', '', '', '', '', '', '', '', '', '', 'Selesai'),
(7, '2026-07-28', 'X DKV 1', 'rofiq', 'KKA(KODING)', 1, 'teknopreneur', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(9, '2026-07-29', 'X DKV 2', 'rofiq', 'KKA(KODING)', 1, 'Artifisial intelejen', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(10, '2026-07-29', 'XI PSPT 1', 'rofiq', 'Sesi Kelas', 1, 'SKIL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(13, '2026-07-30', 'XII DKV 1', 'rofiq', 'KOMTYPE', 1, 'KOMPOSISI TYPOGRAFI', 'Tugas praktek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(14, '2026-07-30', 'X DKV 2', 'rofiq', 'SKIL', 5, 'Tecnopreneur', 'Quizz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(15, '2026-07-30', 'XII DKV 2', 'rofiq', 'KOMTYPE', 8, 'Typografi of me', 'Praktek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(16, '2026-07-31', 'X DKV 2', 'rofiq', 'SKIL', 2, 'Tecnopreneur', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(18, '2026-07-31', 'X TKJ 5', 'rofiq', 'B. JAWA', 5, 'Unggah ungguh basa', 'Cari kata dalam bahasa ngoko, kromo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(19, '2026-08-03', 'X TKJ 5', 'rofiq', 'B. JAWA', 1, 'Unggah ungguh', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(20, '2026-08-05', 'XII DKV 1', 'rofiq', 'KOMTYPE', 1, 'Presentasi hasil karya', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai'),
(21, '2026-08-05', 'XII DKV 2', 'rofiq', 'KOMTYPE', 5, 'Presentasi typografi', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kalender_akademik`
--

CREATE TABLE `kalender_akademik` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `jenis` varchar(40) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kaskelas`
--

CREATE TABLE `kaskelas` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `jumlah` decimal(15,2) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kaskelas`
--

INSERT INTO `kaskelas` (`id`, `tanggal`, `kelas`, `jenis`, `jumlah`, `keterangan`) VALUES
(1, '2026-07-24', 'X DKV 2', 'Masuk', '660000.00', 'kas kelas'),
(2, '2026-07-24', 'X DKV 2', 'Keluar', '332000.00', 'beli kipas dan sapu'),
(9, '2026-07-27', 'X DKV 2', 'Keluar', '20000.00', 'fotokopi'),
(10, '2026-07-28', 'X DKV 2', 'Keluar', '16000.00', 'beli buku kas'),
(11, '2026-07-29', 'X DKV 2', 'Keluar', '39500.00', 'manila, gabus,lem,spidol'),
(12, '2026-08-03', 'X DKV 2', 'Keluar', '22500.00', 'daubeltip,lem,sepidol putih'),
(13, '2026-08-03', 'X DKV 2', 'Keluar', '40000.00', 'sapu ,pelpelan, serok'),
(14, '2026-08-04', 'X DKV 2', 'Keluar', '45000.00', 'kaca'),
(15, '2026-08-01', 'X PSPT', 'Masuk', '90.00', 'sisa beli kipas'),
(16, '2026-08-12', 'X PSPT', 'Keluar', '63.00', 'buat hias kelas'),
(17, '2026-08-12', 'X PSPT', 'Keluar', '9.00', 'beli dabel tip'),
(19, '2026-08-13', 'X PSPT', 'Masuk', '155.00', 'iuran 10rb'),
(21, '2026-08-13', 'X PSPT', 'Keluar', '55.00', 'gantiin ais sm gusti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `katalog_alat`
--

CREATE TABLE `katalog_alat` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(150) DEFAULT NULL,
  `spesifikasi` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `kondisi` varchar(50) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `katalog_alat`
--

INSERT INTO `katalog_alat` (`id`, `kode`, `nama_barang`, `spesifikasi`, `jumlah`, `kondisi`, `lokasi`) VALUES
(1, 'ALT001', 'Router MikroTik RB941', 'Routerboard 941-2nD', 5, 'Baik', 'Lemari A1'),
(2, 'ALT002', 'Switch TP-Link 24 Port', 'Managed Switch 24p', 3, 'Baik', 'Rak B2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `terlambat` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kehadiran`
--

INSERT INTO `kehadiran` (`id`, `tanggal`, `nis`, `kelas`, `status`, `keterangan`, `terlambat`) VALUES
(202, '2026-07-21', '111', 'X DKV 2', 'Hadir', '', 0),
(203, '2026-07-21', '112', 'X DKV 2', 'Hadir', '', 0),
(204, '2026-07-21', '113', 'X DKV 2', 'Hadir', '', 0),
(205, '2026-07-21', '114', 'X DKV 2', 'Hadir', '', 0),
(206, '2026-07-21', '115', 'X DKV 2', 'Hadir', '', 0),
(207, '2026-07-21', '116', 'X DKV 2', 'Hadir', '', 0),
(208, '2026-07-21', '117', 'X DKV 2', 'Hadir', '', 0),
(209, '2026-07-21', '118', 'X DKV 2', 'Hadir', '', 0),
(210, '2026-07-21', '119', 'X DKV 2', 'Hadir', '', 0),
(211, '2026-07-21', '120', 'X DKV 2', 'Hadir', '', 0),
(212, '2026-07-21', '121', 'X DKV 2', 'Hadir', '', 0),
(213, '2026-07-21', '122', 'X DKV 2', 'Hadir', '', 0),
(214, '2026-07-21', '123', 'X DKV 2', 'Hadir', '', 0),
(215, '2026-07-21', '124', 'X DKV 2', 'Hadir', '', 0),
(216, '2026-07-21', '125', 'X DKV 2', 'Hadir', '', 0),
(217, '2026-07-21', '126', 'X DKV 2', 'Hadir', '', 0),
(218, '2026-07-21', '127', 'X DKV 2', 'Hadir', '', 0),
(219, '2026-07-21', '128', 'X DKV 2', 'Hadir', '', 0),
(220, '2026-07-21', '129', 'X DKV 2', 'Sakit', '', 0),
(221, '2026-07-21', '130', 'X DKV 2', 'Hadir', '', 0),
(222, '2026-07-21', '131', 'X DKV 2', 'Hadir', '', 0),
(223, '2026-07-21', '132', 'X DKV 2', 'Hadir', '', 0),
(224, '2026-07-21', '133', 'X DKV 2', 'Hadir', '', 0),
(225, '2026-07-21', '134', 'X DKV 2', 'Hadir', '', 0),
(226, '2026-07-21', '135', 'X DKV 2', 'Hadir', '', 0),
(227, '2026-07-21', '136', 'X DKV 2', 'Hadir', '', 0),
(228, '2026-07-21', '137', 'X DKV 2', 'Hadir', '', 0),
(229, '2026-07-21', '138', 'X DKV 2', 'Hadir', '', 0),
(230, '2026-07-21', '139', 'X DKV 2', 'Hadir', '', 0),
(231, '2026-07-21', '140', 'X DKV 2', 'Hadir', '', 0),
(232, '2026-07-21', '141', 'X DKV 2', 'Hadir', '', 0),
(233, '2026-07-21', '142', 'X DKV 2', 'Hadir', '', 0),
(234, '2026-07-21', '143', 'X DKV 2', 'Hadir', '', 0),
(235, '2026-07-20', '111', 'X DKV 2', 'Hadir', '', 0),
(236, '2026-07-20', '112', 'X DKV 2', 'Hadir', '', 0),
(237, '2026-07-20', '113', 'X DKV 2', 'Hadir', '', 0),
(238, '2026-07-20', '114', 'X DKV 2', 'Hadir', '', 0),
(239, '2026-07-20', '115', 'X DKV 2', 'Hadir', '', 0),
(240, '2026-07-20', '116', 'X DKV 2', 'Hadir', '', 0),
(241, '2026-07-20', '117', 'X DKV 2', 'Hadir', '', 0),
(242, '2026-07-20', '118', 'X DKV 2', 'Hadir', '', 0),
(243, '2026-07-20', '119', 'X DKV 2', 'Hadir', '', 0),
(244, '2026-07-20', '120', 'X DKV 2', 'Hadir', '', 0),
(245, '2026-07-20', '121', 'X DKV 2', 'Hadir', '', 0),
(246, '2026-07-20', '122', 'X DKV 2', 'Hadir', '', 0),
(247, '2026-07-20', '123', 'X DKV 2', 'Hadir', '', 0),
(248, '2026-07-20', '124', 'X DKV 2', 'Hadir', '', 0),
(249, '2026-07-20', '125', 'X DKV 2', 'Hadir', '', 0),
(250, '2026-07-20', '126', 'X DKV 2', 'Hadir', '', 0),
(251, '2026-07-20', '127', 'X DKV 2', 'Hadir', '', 0),
(252, '2026-07-20', '128', 'X DKV 2', 'Hadir', '', 0),
(253, '2026-07-20', '129', 'X DKV 2', 'Hadir', '', 0),
(254, '2026-07-20', '130', 'X DKV 2', 'Hadir', '', 0),
(255, '2026-07-20', '131', 'X DKV 2', 'Izin', '', 0),
(256, '2026-07-20', '132', 'X DKV 2', 'Hadir', '', 0),
(257, '2026-07-20', '133', 'X DKV 2', 'Hadir', '', 0),
(258, '2026-07-20', '134', 'X DKV 2', 'Hadir', '', 0),
(259, '2026-07-20', '135', 'X DKV 2', 'Hadir', '', 0),
(260, '2026-07-20', '136', 'X DKV 2', 'Hadir', '', 0),
(261, '2026-07-20', '137', 'X DKV 2', 'Sakit', '', 0),
(262, '2026-07-20', '138', 'X DKV 2', 'Hadir', '', 0),
(263, '2026-07-20', '139', 'X DKV 2', 'Hadir', '', 0),
(264, '2026-07-20', '140', 'X DKV 2', 'Hadir', '', 0),
(265, '2026-07-20', '141', 'X DKV 2', 'Hadir', '', 0),
(266, '2026-07-20', '142', 'X DKV 2', 'Hadir', '', 0),
(267, '2026-07-20', '143', 'X DKV 2', 'Sakit', '', 0),
(268, '2026-07-22', '111', 'X DKV 2', 'Hadir', '', 0),
(269, '2026-07-22', '112', 'X DKV 2', 'Hadir', '', 0),
(270, '2026-07-22', '113', 'X DKV 2', 'Hadir', '', 0),
(271, '2026-07-22', '114', 'X DKV 2', 'Hadir', '', 0),
(272, '2026-07-22', '115', 'X DKV 2', 'Hadir', '', 0),
(273, '2026-07-22', '116', 'X DKV 2', 'Hadir', '', 0),
(274, '2026-07-22', '117', 'X DKV 2', 'Hadir', '', 0),
(275, '2026-07-22', '118', 'X DKV 2', 'Hadir', '', 0),
(276, '2026-07-22', '119', 'X DKV 2', 'Hadir', '', 0),
(277, '2026-07-22', '120', 'X DKV 2', 'Hadir', '', 0),
(278, '2026-07-22', '121', 'X DKV 2', 'Hadir', '', 0),
(279, '2026-07-22', '122', 'X DKV 2', 'Hadir', '', 0),
(280, '2026-07-22', '123', 'X DKV 2', 'Hadir', '', 0),
(281, '2026-07-22', '124', 'X DKV 2', 'Hadir', '', 0),
(282, '2026-07-22', '125', 'X DKV 2', 'Hadir', '', 0),
(283, '2026-07-22', '126', 'X DKV 2', 'Hadir', '', 0),
(284, '2026-07-22', '127', 'X DKV 2', 'Hadir', '', 0),
(285, '2026-07-22', '128', 'X DKV 2', 'Hadir', '', 0),
(286, '2026-07-22', '129', 'X DKV 2', 'Hadir', '', 0),
(287, '2026-07-22', '130', 'X DKV 2', 'Hadir', '', 0),
(288, '2026-07-22', '131', 'X DKV 2', 'Hadir', '', 0),
(289, '2026-07-22', '132', 'X DKV 2', 'Hadir', '', 0),
(290, '2026-07-22', '133', 'X DKV 2', 'Hadir', '', 0),
(291, '2026-07-22', '134', 'X DKV 2', 'Hadir', '', 0),
(292, '2026-07-22', '135', 'X DKV 2', 'Hadir', '', 0),
(293, '2026-07-22', '136', 'X DKV 2', 'Hadir', '', 0),
(294, '2026-07-22', '137', 'X DKV 2', 'Hadir', '', 0),
(295, '2026-07-22', '138', 'X DKV 2', 'Hadir', '', 0),
(296, '2026-07-22', '139', 'X DKV 2', 'Hadir', '', 0),
(297, '2026-07-22', '140', 'X DKV 2', 'Hadir', '', 0),
(298, '2026-07-22', '141', 'X DKV 2', 'Hadir', '', 0),
(299, '2026-07-22', '142', 'X DKV 2', 'Hadir', '', 0),
(300, '2026-07-22', '143', 'X DKV 2', 'Hadir', '', 0),
(302, '2026-07-23', '111', 'X DKV 2', 'Hadir', '', 0),
(303, '2026-07-23', '112', 'X DKV 2', 'Hadir', '', 0),
(304, '2026-07-23', '113', 'X DKV 2', 'Hadir', '', 0),
(305, '2026-07-23', '114', 'X DKV 2', 'Hadir', '', 0),
(306, '2026-07-23', '115', 'X DKV 2', 'Hadir', '', 0),
(307, '2026-07-23', '116', 'X DKV 2', 'Hadir', '', 0),
(308, '2026-07-23', '117', 'X DKV 2', 'Hadir', '', 0),
(309, '2026-07-23', '118', 'X DKV 2', 'Hadir', '', 0),
(310, '2026-07-23', '119', 'X DKV 2', 'Hadir', '', 0),
(311, '2026-07-23', '120', 'X DKV 2', 'Hadir', '', 0),
(312, '2026-07-23', '121', 'X DKV 2', 'Hadir', '', 0),
(313, '2026-07-23', '122', 'X DKV 2', 'Hadir', '', 0),
(314, '2026-07-23', '123', 'X DKV 2', 'Hadir', '', 0),
(315, '2026-07-23', '124', 'X DKV 2', 'Hadir', '', 0),
(316, '2026-07-23', '125', 'X DKV 2', 'Hadir', '', 0),
(317, '2026-07-23', '126', 'X DKV 2', 'Hadir', '', 0),
(318, '2026-07-23', '127', 'X DKV 2', 'Hadir', '', 0),
(319, '2026-07-23', '128', 'X DKV 2', 'Hadir', '', 0),
(320, '2026-07-23', '129', 'X DKV 2', 'Hadir', '', 0),
(321, '2026-07-23', '130', 'X DKV 2', 'Hadir', '', 0),
(322, '2026-07-23', '131', 'X DKV 2', 'Hadir', '', 0),
(323, '2026-07-23', '132', 'X DKV 2', 'Hadir', '', 0),
(324, '2026-07-23', '133', 'X DKV 2', 'Sakit', '', 0),
(325, '2026-07-23', '134', 'X DKV 2', 'Hadir', '', 0),
(326, '2026-07-23', '135', 'X DKV 2', 'Hadir', '', 0),
(327, '2026-07-23', '136', 'X DKV 2', 'Hadir', '', 0),
(328, '2026-07-23', '137', 'X DKV 2', 'Hadir', '', 0),
(329, '2026-07-23', '138', 'X DKV 2', 'Hadir', '', 0),
(330, '2026-07-23', '139', 'X DKV 2', 'Hadir', '', 0),
(331, '2026-07-23', '140', 'X DKV 2', 'Hadir', '', 0),
(332, '2026-07-23', '141', 'X DKV 2', 'Hadir', '', 0),
(333, '2026-07-23', '142', 'X DKV 2', 'Hadir', '', 0),
(334, '2026-07-23', '143', 'X DKV 2', 'Hadir', '', 0),
(335, '2026-07-23', '256107257', 'XI PSPT 1', 'Hadir', '', 0),
(336, '2026-07-23', '256107258', 'XI PSPT 1', 'Hadir', '', 0),
(337, '2026-07-23', '256107260', 'XI PSPT 1', 'Hadir', '', 0),
(338, '2026-07-23', '256107261', 'XI PSPT 1', 'Hadir', '', 0),
(339, '2026-07-23', '256107262', 'XI PSPT 1', 'Hadir', '', 0),
(340, '2026-07-24', '111', 'X DKV 2', 'Hadir', '', 0),
(341, '2026-07-24', '112', 'X DKV 2', 'Hadir', '', 0),
(342, '2026-07-24', '113', 'X DKV 2', 'Hadir', '', 0),
(343, '2026-07-24', '114', 'X DKV 2', 'Hadir', '', 0),
(344, '2026-07-24', '115', 'X DKV 2', 'Hadir', '', 0),
(345, '2026-07-24', '116', 'X DKV 2', 'Hadir', '', 0),
(346, '2026-07-24', '117', 'X DKV 2', 'Hadir', '', 0),
(347, '2026-07-24', '118', 'X DKV 2', 'Hadir', '', 0),
(348, '2026-07-24', '119', 'X DKV 2', 'Hadir', '', 0),
(349, '2026-07-24', '120', 'X DKV 2', 'Hadir', '', 0),
(350, '2026-07-24', '121', 'X DKV 2', 'Hadir', '', 0),
(351, '2026-07-24', '122', 'X DKV 2', 'Hadir', '', 0),
(352, '2026-07-24', '123', 'X DKV 2', 'Hadir', '', 0),
(353, '2026-07-24', '124', 'X DKV 2', 'Hadir', '', 0),
(354, '2026-07-24', '125', 'X DKV 2', 'Hadir', '', 0),
(355, '2026-07-24', '126', 'X DKV 2', 'Hadir', '', 0),
(356, '2026-07-24', '127', 'X DKV 2', 'Hadir', '', 0),
(357, '2026-07-24', '128', 'X DKV 2', 'Hadir', '', 0),
(358, '2026-07-24', '129', 'X DKV 2', 'Hadir', '', 0),
(359, '2026-07-24', '130', 'X DKV 2', 'Hadir', '', 0),
(360, '2026-07-24', '131', 'X DKV 2', 'Hadir', '', 0),
(361, '2026-07-24', '132', 'X DKV 2', 'Hadir', '', 0),
(362, '2026-07-24', '133', 'X DKV 2', 'Hadir', '', 0),
(363, '2026-07-24', '134', 'X DKV 2', 'Hadir', '', 0),
(364, '2026-07-24', '135', 'X DKV 2', 'Hadir', '', 0),
(365, '2026-07-24', '136', 'X DKV 2', 'Hadir', '', 0),
(366, '2026-07-24', '137', 'X DKV 2', 'Hadir', '', 0),
(367, '2026-07-24', '138', 'X DKV 2', 'Hadir', '', 0),
(368, '2026-07-24', '139', 'X DKV 2', 'Hadir', '', 0),
(369, '2026-07-24', '140', 'X DKV 2', 'Hadir', '', 0),
(370, '2026-07-24', '141', 'X DKV 2', 'Hadir', '', 0),
(371, '2026-07-24', '142', 'X DKV 2', 'Hadir', '', 0),
(372, '2026-07-24', '143', 'X DKV 2', 'Hadir', '', 0),
(373, '2026-07-27', '111', 'X DKV 2', 'Hadir', '', 0),
(374, '2026-07-27', '112', 'X DKV 2', 'Hadir', '', 0),
(375, '2026-07-27', '113', 'X DKV 2', 'Hadir', '', 0),
(376, '2026-07-27', '114', 'X DKV 2', 'Hadir', '', 0),
(377, '2026-07-27', '115', 'X DKV 2', 'Hadir', '', 0),
(378, '2026-07-27', '116', 'X DKV 2', 'Hadir', '', 0),
(379, '2026-07-27', '117', 'X DKV 2', 'Hadir', '', 0),
(380, '2026-07-27', '118', 'X DKV 2', 'Hadir', '', 0),
(381, '2026-07-27', '119', 'X DKV 2', 'Hadir', '', 0),
(382, '2026-07-27', '120', 'X DKV 2', 'Hadir', '', 0),
(383, '2026-07-27', '121', 'X DKV 2', 'Hadir', '', 0),
(384, '2026-07-27', '122', 'X DKV 2', 'Hadir', '', 0),
(385, '2026-07-27', '123', 'X DKV 2', 'Hadir', '', 0),
(386, '2026-07-27', '124', 'X DKV 2', 'Hadir', '', 0),
(387, '2026-07-27', '125', 'X DKV 2', 'Hadir', '', 0),
(388, '2026-07-27', '126', 'X DKV 2', 'Hadir', '', 0),
(389, '2026-07-27', '127', 'X DKV 2', 'Hadir', '', 0),
(390, '2026-07-27', '128', 'X DKV 2', 'Hadir', '', 0),
(391, '2026-07-27', '129', 'X DKV 2', 'Hadir', '', 0),
(392, '2026-07-27', '130', 'X DKV 2', 'Hadir', '', 0),
(393, '2026-07-27', '131', 'X DKV 2', 'Hadir', '', 0),
(394, '2026-07-27', '132', 'X DKV 2', 'Hadir', '', 0),
(395, '2026-07-27', '133', 'X DKV 2', 'Hadir', '', 0),
(396, '2026-07-27', '134', 'X DKV 2', 'Hadir', '', 0),
(397, '2026-07-27', '135', 'X DKV 2', 'Hadir', '', 0),
(398, '2026-07-27', '136', 'X DKV 2', 'Hadir', '', 0),
(399, '2026-07-27', '137', 'X DKV 2', 'Hadir', '', 0),
(400, '2026-07-27', '138', 'X DKV 2', 'Hadir', '', 0),
(401, '2026-07-27', '139', 'X DKV 2', 'Hadir', '', 0),
(402, '2026-07-27', '140', 'X DKV 2', 'Hadir', '', 0),
(403, '2026-07-27', '141', 'X DKV 2', 'Hadir', '', 0),
(404, '2026-07-27', '142', 'X DKV 2', 'Hadir', '', 0),
(405, '2026-07-27', '143', 'X DKV 2', 'Hadir', '', 0),
(472, '2026-07-28', '111', 'X DKV 2', 'Hadir', '', 0),
(473, '2026-07-28', '112', 'X DKV 2', 'Hadir', '', 0),
(474, '2026-07-28', '113', 'X DKV 2', 'Hadir', '', 0),
(475, '2026-07-28', '114', 'X DKV 2', 'Hadir', '', 0),
(476, '2026-07-28', '115', 'X DKV 2', 'Hadir', '', 0),
(477, '2026-07-28', '116', 'X DKV 2', 'Hadir', '', 0),
(478, '2026-07-28', '117', 'X DKV 2', 'Hadir', '', 0),
(479, '2026-07-28', '118', 'X DKV 2', 'Hadir', '', 0),
(480, '2026-07-28', '119', 'X DKV 2', 'Hadir', '', 0),
(481, '2026-07-28', '120', 'X DKV 2', 'Hadir', '', 0),
(482, '2026-07-28', '121', 'X DKV 2', 'Hadir', '', 0),
(483, '2026-07-28', '122', 'X DKV 2', 'Hadir', '', 0),
(484, '2026-07-28', '123', 'X DKV 2', 'Hadir', '', 0),
(485, '2026-07-28', '124', 'X DKV 2', 'Hadir', '', 0),
(486, '2026-07-28', '125', 'X DKV 2', 'Hadir', '', 0),
(487, '2026-07-28', '126', 'X DKV 2', 'Sakit', '', 0),
(488, '2026-07-28', '127', 'X DKV 2', 'Hadir', '', 0),
(489, '2026-07-28', '128', 'X DKV 2', 'Hadir', '', 0),
(490, '2026-07-28', '129', 'X DKV 2', 'Hadir', '', 0),
(491, '2026-07-28', '130', 'X DKV 2', 'Hadir', '', 0),
(492, '2026-07-28', '131', 'X DKV 2', 'Hadir', '', 0),
(493, '2026-07-28', '132', 'X DKV 2', 'Hadir', '', 0),
(494, '2026-07-28', '133', 'X DKV 2', 'Hadir', '', 0),
(495, '2026-07-28', '134', 'X DKV 2', 'Hadir', '', 0),
(496, '2026-07-28', '135', 'X DKV 2', 'Hadir', '', 0),
(497, '2026-07-28', '136', 'X DKV 2', 'Hadir', '', 0),
(498, '2026-07-28', '137', 'X DKV 2', 'Hadir', '', 0),
(499, '2026-07-28', '138', 'X DKV 2', 'Hadir', '', 0),
(500, '2026-07-28', '139', 'X DKV 2', 'Hadir', '', 0),
(501, '2026-07-28', '140', 'X DKV 2', 'Hadir', '', 0),
(502, '2026-07-28', '141', 'X DKV 2', 'Hadir', '', 0),
(503, '2026-07-28', '142', 'X DKV 2', 'Hadir', '', 0),
(504, '2026-07-28', '143', 'X DKV 2', 'Hadir', '', 0),
(505, '2026-07-29', '111', 'X DKV 2', 'Hadir', '', 0),
(506, '2026-07-29', '112', 'X DKV 2', 'Hadir', '', 0),
(507, '2026-07-29', '113', 'X DKV 2', 'Hadir', '', 0),
(508, '2026-07-29', '114', 'X DKV 2', 'Hadir', '', 0),
(509, '2026-07-29', '115', 'X DKV 2', 'Hadir', '', 0),
(510, '2026-07-29', '116', 'X DKV 2', 'Hadir', '', 0),
(511, '2026-07-29', '117', 'X DKV 2', 'Hadir', '', 0),
(512, '2026-07-29', '118', 'X DKV 2', 'Hadir', '', 0),
(513, '2026-07-29', '119', 'X DKV 2', 'Hadir', '', 0),
(514, '2026-07-29', '120', 'X DKV 2', 'Sakit', '', 0),
(515, '2026-07-29', '121', 'X DKV 2', 'Hadir', '', 0),
(516, '2026-07-29', '122', 'X DKV 2', 'Hadir', '', 0),
(517, '2026-07-29', '123', 'X DKV 2', 'Hadir', '', 0),
(518, '2026-07-29', '124', 'X DKV 2', 'Hadir', '', 0),
(519, '2026-07-29', '125', 'X DKV 2', 'Hadir', '', 0),
(520, '2026-07-29', '126', 'X DKV 2', 'Hadir', '', 0),
(521, '2026-07-29', '127', 'X DKV 2', 'Hadir', '', 0),
(522, '2026-07-29', '128', 'X DKV 2', 'Hadir', '', 0),
(523, '2026-07-29', '129', 'X DKV 2', 'Hadir', '', 0),
(524, '2026-07-29', '130', 'X DKV 2', 'Hadir', '', 0),
(525, '2026-07-29', '131', 'X DKV 2', 'Hadir', '', 0),
(526, '2026-07-29', '132', 'X DKV 2', 'Hadir', '', 0),
(527, '2026-07-29', '133', 'X DKV 2', 'Hadir', '', 0),
(528, '2026-07-29', '134', 'X DKV 2', 'Hadir', '', 0),
(529, '2026-07-29', '135', 'X DKV 2', 'Hadir', '', 0),
(530, '2026-07-29', '136', 'X DKV 2', 'Hadir', '', 0),
(531, '2026-07-29', '137', 'X DKV 2', 'Hadir', '', 0),
(532, '2026-07-29', '138', 'X DKV 2', 'Hadir', '', 0),
(533, '2026-07-29', '139', 'X DKV 2', 'Hadir', '', 0),
(534, '2026-07-29', '140', 'X DKV 2', 'Hadir', '', 0),
(535, '2026-07-29', '141', 'X DKV 2', 'Hadir', '', 0),
(536, '2026-07-29', '142', 'X DKV 2', 'Hadir', '', 0),
(537, '2026-07-29', '143', 'X DKV 2', 'Hadir', '', 0),
(538, '2026-07-22', '2627108130', 'X PSPT', 'Hadir', '', 0),
(539, '2026-07-22', '2627108131', 'X PSPT', 'Hadir', '', 0),
(540, '2026-07-22', '2627108132', 'X PSPT', 'Hadir', '', 0),
(541, '2026-07-22', '2627108133', 'X PSPT', 'Hadir', '', 0),
(542, '2026-07-22', '2627108134', 'X PSPT', 'Hadir', '', 0),
(543, '2026-07-22', '2627108135', 'X PSPT', 'Hadir', '', 0),
(544, '2026-07-22', '2627108136', 'X PSPT', 'Hadir', '', 0),
(545, '2026-07-22', '2627108137', 'X PSPT', 'Hadir', '', 0),
(546, '2026-07-22', '2627108138', 'X PSPT', 'Hadir', '', 0),
(547, '2026-07-22', '2627108139', 'X PSPT', 'Hadir', '', 0),
(548, '2026-07-22', '2627108140', 'X PSPT', 'Hadir', '', 0),
(549, '2026-07-22', '2627108141', 'X PSPT', 'Hadir', '', 0),
(550, '2026-07-22', '2627108142', 'X PSPT', 'Hadir', '', 0),
(551, '2026-07-22', '2627108143', 'X PSPT', 'Hadir', '', 0),
(552, '2026-07-22', '2627108144', 'X PSPT', 'Hadir', '', 0),
(553, '2026-07-22', '2627108145', 'X PSPT', 'Hadir', '', 0),
(554, '2026-07-22', '2627108146', 'X PSPT', 'Hadir', '', 0),
(555, '2026-07-22', '2627108147', 'X PSPT', 'Hadir', '', 0),
(556, '2026-07-22', '2627108148', 'X PSPT', 'Hadir', '', 0),
(557, '2026-07-22', '2627108149', 'X PSPT', 'Hadir', '', 0),
(558, '2026-07-22', '2627108150', 'X PSPT', 'Hadir', '', 0),
(559, '2026-07-22', '2627108151', 'X PSPT', 'Hadir', '', 0),
(560, '2026-07-22', '2627108152', 'X PSPT', 'Hadir', '', 0),
(561, '2026-07-22', '2627108153', 'X PSPT', 'Hadir', '', 0),
(562, '2026-07-22', '2627108154', 'X PSPT', 'Hadir', '', 0),
(563, '2026-07-22', '2627108155', 'X PSPT', 'Hadir', '', 0),
(564, '2026-07-22', '2627108156', 'X PSPT', 'Hadir', '', 0),
(565, '2026-07-22', '2627108157', 'X PSPT', 'Hadir', '', 0),
(566, '2026-07-22', '2627108158', 'X PSPT', 'Hadir', '', 0),
(567, '2026-07-22', '2627108159', 'X PSPT', 'Hadir', '', 0),
(568, '2026-07-22', '2627108160', 'X PSPT', 'Hadir', '', 0),
(569, '2026-07-22', '2627108161', 'X PSPT', 'Hadir', '', 0),
(570, '2026-07-22', '2627108162', 'X PSPT', 'Hadir', '', 0),
(571, '2026-07-22', '2627108163', 'X PSPT', 'Hadir', '', 0),
(572, '2026-07-22', '2627108164', 'X PSPT', 'Hadir', '', 0),
(573, '2026-07-22', '2627108165', 'X PSPT', 'Hadir', '', 0),
(574, '2026-07-22', '2627108166', 'X PSPT', 'Hadir', '', 0),
(575, '2026-07-30', '111', 'X DKV 2', 'Hadir', '', 0),
(576, '2026-07-30', '112', 'X DKV 2', 'Hadir', '', 0),
(577, '2026-07-30', '113', 'X DKV 2', 'Hadir', '', 0),
(578, '2026-07-30', '114', 'X DKV 2', 'Hadir', '', 0),
(579, '2026-07-30', '115', 'X DKV 2', 'Hadir', '', 0),
(580, '2026-07-30', '116', 'X DKV 2', 'Hadir', '', 0),
(581, '2026-07-30', '117', 'X DKV 2', 'Sakit', '', 0),
(582, '2026-07-30', '118', 'X DKV 2', 'Hadir', '', 0),
(583, '2026-07-30', '119', 'X DKV 2', 'Hadir', '', 0),
(584, '2026-07-30', '120', 'X DKV 2', 'Hadir', '', 0),
(585, '2026-07-30', '121', 'X DKV 2', 'Hadir', '', 0),
(586, '2026-07-30', '122', 'X DKV 2', 'Hadir', '', 0),
(587, '2026-07-30', '123', 'X DKV 2', 'Sakit', '', 0),
(588, '2026-07-30', '124', 'X DKV 2', 'Hadir', '', 0),
(589, '2026-07-30', '125', 'X DKV 2', 'Hadir', '', 0),
(590, '2026-07-30', '126', 'X DKV 2', 'Hadir', '', 0),
(591, '2026-07-30', '127', 'X DKV 2', 'Hadir', '', 0),
(592, '2026-07-30', '128', 'X DKV 2', 'Hadir', '', 0),
(593, '2026-07-30', '129', 'X DKV 2', 'Hadir', '', 0),
(594, '2026-07-30', '130', 'X DKV 2', 'Hadir', '', 0),
(595, '2026-07-30', '131', 'X DKV 2', 'Hadir', '', 0),
(596, '2026-07-30', '132', 'X DKV 2', 'Hadir', '', 0),
(597, '2026-07-30', '133', 'X DKV 2', 'Sakit', '', 0),
(598, '2026-07-30', '134', 'X DKV 2', 'Hadir', '', 0),
(599, '2026-07-30', '135', 'X DKV 2', 'Hadir', '', 0),
(600, '2026-07-30', '136', 'X DKV 2', 'Hadir', '', 0),
(601, '2026-07-30', '137', 'X DKV 2', 'Hadir', '', 0),
(602, '2026-07-30', '138', 'X DKV 2', 'Hadir', '', 0),
(603, '2026-07-30', '139', 'X DKV 2', 'Hadir', '', 0),
(604, '2026-07-30', '140', 'X DKV 2', 'Hadir', '', 0),
(605, '2026-07-30', '141', 'X DKV 2', 'Hadir', '', 0),
(606, '2026-07-30', '142', 'X DKV 2', 'Hadir', '', 0),
(607, '2026-07-30', '143', 'X DKV 2', 'Hadir', '', 0),
(641, '2026-07-31', '111', 'X DKV 2', 'Hadir', '', 0),
(642, '2026-07-31', '112', 'X DKV 2', 'Hadir', '', 0),
(643, '2026-07-31', '113', 'X DKV 2', 'Sakit', '', 0),
(644, '2026-07-31', '114', 'X DKV 2', 'Hadir', '', 0),
(645, '2026-07-31', '115', 'X DKV 2', 'Hadir', '', 0),
(646, '2026-07-31', '116', 'X DKV 2', 'Hadir', '', 0),
(647, '2026-07-31', '117', 'X DKV 2', 'Hadir', '', 0),
(648, '2026-07-31', '118', 'X DKV 2', 'Hadir', '', 0),
(649, '2026-07-31', '119', 'X DKV 2', 'Hadir', '', 0),
(650, '2026-07-31', '120', 'X DKV 2', 'Hadir', '', 0),
(651, '2026-07-31', '121', 'X DKV 2', 'Hadir', '', 0),
(652, '2026-07-31', '122', 'X DKV 2', 'Hadir', '', 0),
(653, '2026-07-31', '123', 'X DKV 2', 'Hadir', '', 0),
(654, '2026-07-31', '124', 'X DKV 2', 'Hadir', '', 0),
(655, '2026-07-31', '125', 'X DKV 2', 'Hadir', '', 0),
(656, '2026-07-31', '126', 'X DKV 2', 'Hadir', '', 0),
(657, '2026-07-31', '127', 'X DKV 2', 'Hadir', '', 0),
(658, '2026-07-31', '128', 'X DKV 2', 'Hadir', '', 0),
(659, '2026-07-31', '129', 'X DKV 2', 'Hadir', '', 0),
(660, '2026-07-31', '130', 'X DKV 2', 'Hadir', '', 0),
(661, '2026-07-31', '131', 'X DKV 2', 'Hadir', '', 0),
(662, '2026-07-31', '132', 'X DKV 2', 'Hadir', '', 0),
(663, '2026-07-31', '133', 'X DKV 2', 'Hadir', '', 0),
(664, '2026-07-31', '134', 'X DKV 2', 'Hadir', '', 0),
(665, '2026-07-31', '135', 'X DKV 2', 'Hadir', '', 0),
(666, '2026-07-31', '136', 'X DKV 2', 'Hadir', '', 0),
(667, '2026-07-31', '137', 'X DKV 2', 'Izin', '', 0),
(668, '2026-07-31', '138', 'X DKV 2', 'Hadir', '', 0),
(669, '2026-07-31', '139', 'X DKV 2', 'Hadir', '', 0),
(670, '2026-07-31', '140', 'X DKV 2', 'Hadir', '', 0),
(671, '2026-07-31', '141', 'X DKV 2', 'Hadir', '', 0);
INSERT INTO `kehadiran` (`id`, `tanggal`, `nis`, `kelas`, `status`, `keterangan`, `terlambat`) VALUES
(672, '2026-07-31', '142', 'X DKV 2', 'Hadir', '', 0),
(673, '2026-07-31', '143', 'X DKV 2', 'Hadir', '', 0),
(674, '2026-08-03', '111', 'X DKV 2', 'Hadir', '', 0),
(675, '2026-08-03', '112', 'X DKV 2', 'Hadir', '', 0),
(676, '2026-08-03', '113', 'X DKV 2', 'Hadir', '', 0),
(677, '2026-08-03', '114', 'X DKV 2', 'Hadir', '', 0),
(678, '2026-08-03', '115', 'X DKV 2', 'Hadir', '', 0),
(679, '2026-08-03', '116', 'X DKV 2', 'Hadir', '', 0),
(680, '2026-08-03', '117', 'X DKV 2', 'Hadir', '', 0),
(681, '2026-08-03', '118', 'X DKV 2', 'Hadir', '', 0),
(682, '2026-08-03', '119', 'X DKV 2', 'Hadir', '', 0),
(683, '2026-08-03', '120', 'X DKV 2', 'Hadir', '', 0),
(684, '2026-08-03', '121', 'X DKV 2', 'Hadir', '', 0),
(685, '2026-08-03', '122', 'X DKV 2', 'Hadir', '', 0),
(686, '2026-08-03', '123', 'X DKV 2', 'Hadir', '', 0),
(687, '2026-08-03', '124', 'X DKV 2', 'Hadir', '', 0),
(688, '2026-08-03', '125', 'X DKV 2', 'Hadir', '', 0),
(689, '2026-08-03', '126', 'X DKV 2', 'Hadir', '', 0),
(690, '2026-08-03', '127', 'X DKV 2', 'Hadir', '', 0),
(691, '2026-08-03', '128', 'X DKV 2', 'Hadir', '', 0),
(692, '2026-08-03', '129', 'X DKV 2', 'Hadir', '', 0),
(693, '2026-08-03', '130', 'X DKV 2', 'Hadir', '', 0),
(694, '2026-08-03', '131', 'X DKV 2', 'Hadir', '', 0),
(695, '2026-08-03', '132', 'X DKV 2', 'Hadir', '', 0),
(696, '2026-08-03', '133', 'X DKV 2', 'Hadir', '', 0),
(697, '2026-08-03', '134', 'X DKV 2', 'Hadir', '', 0),
(698, '2026-08-03', '135', 'X DKV 2', 'Hadir', '', 0),
(699, '2026-08-03', '136', 'X DKV 2', 'Hadir', '', 0),
(700, '2026-08-03', '137', 'X DKV 2', 'Hadir', '', 0),
(701, '2026-08-03', '138', 'X DKV 2', 'Hadir', '', 0),
(702, '2026-08-03', '139', 'X DKV 2', 'Hadir', '', 0),
(703, '2026-08-03', '140', 'X DKV 2', 'Hadir', '', 0),
(704, '2026-08-03', '141', 'X DKV 2', 'Hadir', '', 0),
(705, '2026-08-03', '142', 'X DKV 2', 'Hadir', '', 0),
(706, '2026-08-03', '143', 'X DKV 2', 'Hadir', '', 0),
(707, '2026-08-04', '111', 'X DKV 2', 'Hadir', '', 0),
(708, '2026-08-04', '112', 'X DKV 2', 'Hadir', '', 0),
(709, '2026-08-04', '113', 'X DKV 2', 'Hadir', '', 0),
(710, '2026-08-04', '114', 'X DKV 2', 'Hadir', '', 0),
(711, '2026-08-04', '115', 'X DKV 2', 'Hadir', '', 0),
(712, '2026-08-04', '116', 'X DKV 2', 'Hadir', '', 0),
(713, '2026-08-04', '117', 'X DKV 2', 'Hadir', '', 0),
(714, '2026-08-04', '118', 'X DKV 2', 'Hadir', '', 0),
(715, '2026-08-04', '119', 'X DKV 2', 'Hadir', '', 0),
(716, '2026-08-04', '120', 'X DKV 2', 'Hadir', '', 0),
(717, '2026-08-04', '121', 'X DKV 2', 'Hadir', '', 0),
(718, '2026-08-04', '122', 'X DKV 2', 'Hadir', '', 0),
(719, '2026-08-04', '123', 'X DKV 2', 'Hadir', '', 0),
(720, '2026-08-04', '124', 'X DKV 2', 'Hadir', '', 0),
(721, '2026-08-04', '125', 'X DKV 2', 'Hadir', '', 0),
(722, '2026-08-04', '126', 'X DKV 2', 'Hadir', '', 0),
(723, '2026-08-04', '127', 'X DKV 2', 'Hadir', '', 0),
(724, '2026-08-04', '128', 'X DKV 2', 'Hadir', '', 0),
(725, '2026-08-04', '129', 'X DKV 2', 'Hadir', '', 0),
(726, '2026-08-04', '130', 'X DKV 2', 'Hadir', '', 0),
(727, '2026-08-04', '131', 'X DKV 2', 'Hadir', '', 0),
(728, '2026-08-04', '132', 'X DKV 2', 'Hadir', '', 0),
(729, '2026-08-04', '133', 'X DKV 2', 'Hadir', '', 0),
(730, '2026-08-04', '134', 'X DKV 2', 'Hadir', '', 0),
(731, '2026-08-04', '135', 'X DKV 2', 'Hadir', '', 0),
(732, '2026-08-04', '136', 'X DKV 2', 'Hadir', '', 0),
(733, '2026-08-04', '137', 'X DKV 2', 'Hadir', '', 0),
(734, '2026-08-04', '138', 'X DKV 2', 'Hadir', '', 0),
(735, '2026-08-04', '139', 'X DKV 2', 'Hadir', '', 0),
(736, '2026-08-04', '140', 'X DKV 2', 'Hadir', '', 0),
(737, '2026-08-04', '141', 'X DKV 2', 'Hadir', '', 0),
(738, '2026-08-04', '142', 'X DKV 2', 'Hadir', '', 0),
(739, '2026-08-04', '143', 'X DKV 2', 'Hadir', '', 0),
(740, '2026-08-04', '2425106281', 'XII PSPT', 'Hadir', '', 0),
(741, '2026-08-04', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(742, '2026-08-04', '2425106283', 'XII PSPT', 'Hadir', '', 0),
(743, '2026-08-04', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(744, '2026-08-04', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(745, '2026-08-04', '2425106286', 'XII PSPT', 'Hadir', '', 0),
(746, '2026-08-04', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(747, '2026-08-04', '2425106288', 'XII PSPT', 'Hadir', '', 0),
(748, '2026-08-04', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(749, '2026-08-04', '2425106291', 'XII PSPT', 'Hadir', '', 0),
(750, '2026-08-04', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(751, '2026-08-04', '2425106293', 'XII PSPT', 'Hadir', 'keluar', 0),
(752, '2026-08-04', '2425106294', 'XII PSPT', 'Hadir', '', 0),
(753, '2026-08-04', '2425106295', 'XII PSPT', 'Hadir', 'keluar', 0),
(754, '2026-08-04', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(755, '2026-08-04', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(756, '2026-08-04', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(757, '2026-08-04', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(758, '2026-08-04', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(759, '2026-08-04', '2425106303', 'XII PSPT', 'Izin', '', 0),
(760, '2026-08-04', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(761, '2026-08-04', '2425106305', 'XII PSPT', 'Hadir', '', 0),
(762, '2026-08-04', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(763, '2026-08-04', '2425106306', 'XII PSPT', 'Hadir', '', 0),
(764, '2026-08-04', '2425106307', 'XII PSPT', 'Hadir', '', 0),
(765, '2026-08-04', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(766, '2026-08-04', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(767, '2026-08-04', '2425106309', 'XII PSPT', 'Hadir', '', 0),
(768, '2026-08-04', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(769, '2026-08-04', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(770, '2026-08-04', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(771, '2026-08-04', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(772, '2026-08-04', '2425106314', 'XII PSPT', 'Hadir', '', 0),
(773, '2026-08-04', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(774, '2026-08-04', '2425106316', 'XII PSPT', 'Hadir', 'keluar', 0),
(775, '2026-08-04', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(776, '2026-08-04', '2425106318', 'XII PSPT', 'Hadir', '', 0),
(777, '2026-08-04', '2425106319', 'XII PSPT', 'Hadir', '', 0),
(778, '2026-08-04', '2425106320', 'XII PSPT', 'Hadir', '', 0),
(779, '2026-08-04', '2425106321', 'XII PSPT', 'Hadir', '', 0),
(780, '2026-08-04', '2425106322', 'XII PSPT', 'Hadir', '', 0),
(781, '2026-08-05', '111', 'X DKV 2', 'Hadir', '', 0),
(782, '2026-08-05', '112', 'X DKV 2', 'Hadir', '', 0),
(783, '2026-08-05', '113', 'X DKV 2', 'Hadir', '', 0),
(784, '2026-08-05', '114', 'X DKV 2', 'Hadir', '', 0),
(785, '2026-08-05', '115', 'X DKV 2', 'Hadir', '', 0),
(786, '2026-08-05', '116', 'X DKV 2', 'Hadir', '', 0),
(787, '2026-08-05', '117', 'X DKV 2', 'Hadir', '', 0),
(788, '2026-08-05', '118', 'X DKV 2', 'Hadir', '', 0),
(789, '2026-08-05', '119', 'X DKV 2', 'Hadir', '', 0),
(790, '2026-08-05', '120', 'X DKV 2', 'Hadir', '', 0),
(791, '2026-08-05', '121', 'X DKV 2', 'Hadir', '', 0),
(792, '2026-08-05', '122', 'X DKV 2', 'Hadir', '', 0),
(793, '2026-08-05', '123', 'X DKV 2', 'Hadir', '', 0),
(794, '2026-08-05', '124', 'X DKV 2', 'Hadir', '', 0),
(795, '2026-08-05', '125', 'X DKV 2', 'Hadir', '', 0),
(796, '2026-08-05', '126', 'X DKV 2', 'Hadir', '', 0),
(797, '2026-08-05', '127', 'X DKV 2', 'Hadir', '', 0),
(798, '2026-08-05', '128', 'X DKV 2', 'Hadir', '', 0),
(799, '2026-08-05', '129', 'X DKV 2', 'Hadir', '', 0),
(800, '2026-08-05', '130', 'X DKV 2', 'Hadir', '', 0),
(801, '2026-08-05', '131', 'X DKV 2', 'Hadir', '', 0),
(802, '2026-08-05', '132', 'X DKV 2', 'Hadir', '', 0),
(803, '2026-08-05', '133', 'X DKV 2', 'Hadir', '', 0),
(804, '2026-08-05', '134', 'X DKV 2', 'Hadir', '', 0),
(805, '2026-08-05', '135', 'X DKV 2', 'Hadir', '', 0),
(806, '2026-08-05', '136', 'X DKV 2', 'Hadir', '', 0),
(807, '2026-08-05', '137', 'X DKV 2', 'Hadir', '', 0),
(808, '2026-08-05', '138', 'X DKV 2', 'Hadir', '', 0),
(809, '2026-08-05', '139', 'X DKV 2', 'Hadir', '', 0),
(810, '2026-08-05', '140', 'X DKV 2', 'Hadir', '', 0),
(811, '2026-08-05', '141', 'X DKV 2', 'Hadir', '', 0),
(812, '2026-08-05', '142', 'X DKV 2', 'Hadir', '', 0),
(813, '2026-08-05', '143', 'X DKV 2', 'Hadir', '', 0),
(814, '2026-08-05', '2425106281', 'XII PSPT', 'Hadir', '', 0),
(815, '2026-08-05', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(816, '2026-08-05', '2425106283', 'XII PSPT', 'Hadir', '', 0),
(817, '2026-08-05', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(818, '2026-08-05', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(819, '2026-08-05', '2425106286', 'XII PSPT', 'Hadir', '', 0),
(820, '2026-08-05', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(821, '2026-08-05', '2425106288', 'XII PSPT', 'Hadir', '', 0),
(822, '2026-08-05', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(823, '2026-08-05', '2425106291', 'XII PSPT', 'Hadir', '', 0),
(824, '2026-08-05', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(825, '2026-08-05', '2425106293', 'XII PSPT', 'Hadir', 'keluar', 0),
(826, '2026-08-05', '2425106294', 'XII PSPT', 'Sakit', '', 0),
(827, '2026-08-05', '2425106295', 'XII PSPT', 'Hadir', 'keluar', 0),
(828, '2026-08-05', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(829, '2026-08-05', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(830, '2026-08-05', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(831, '2026-08-05', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(832, '2026-08-05', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(833, '2026-08-05', '2425106303', 'XII PSPT', 'Alfa', '', 0),
(834, '2026-08-05', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(835, '2026-08-05', '2425106305', 'XII PSPT', 'Hadir', '', 0),
(836, '2026-08-05', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(837, '2026-08-05', '2425106306', 'XII PSPT', 'Hadir', '', 0),
(838, '2026-08-05', '2425106307', 'XII PSPT', 'Hadir', '', 0),
(839, '2026-08-05', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(840, '2026-08-05', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(841, '2026-08-05', '2425106309', 'XII PSPT', 'Hadir', '', 0),
(842, '2026-08-05', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(843, '2026-08-05', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(844, '2026-08-05', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(845, '2026-08-05', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(846, '2026-08-05', '2425106314', 'XII PSPT', 'Hadir', '', 0),
(847, '2026-08-05', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(848, '2026-08-05', '2425106316', 'XII PSPT', 'Hadir', 'keluar', 0),
(849, '2026-08-05', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(850, '2026-08-05', '2425106318', 'XII PSPT', 'Hadir', '', 0),
(851, '2026-08-05', '2425106319', 'XII PSPT', 'Hadir', '', 0),
(852, '2026-08-05', '2425106320', 'XII PSPT', 'Hadir', '', 0),
(853, '2026-08-05', '2425106321', 'XII PSPT', 'Hadir', '', 0),
(854, '2026-08-05', '2425106322', 'XII PSPT', 'Sakit', '', 0),
(855, '2026-08-06', '111', 'X DKV 2', 'Hadir', '', 0),
(856, '2026-08-06', '112', 'X DKV 2', 'Hadir', '', 0),
(857, '2026-08-06', '113', 'X DKV 2', 'Hadir', '', 0),
(858, '2026-08-06', '114', 'X DKV 2', 'Hadir', '', 0),
(859, '2026-08-06', '115', 'X DKV 2', 'Hadir', '', 0),
(860, '2026-08-06', '116', 'X DKV 2', 'Hadir', '', 0),
(861, '2026-08-06', '117', 'X DKV 2', 'Hadir', '', 0),
(862, '2026-08-06', '118', 'X DKV 2', 'Hadir', '', 0),
(863, '2026-08-06', '119', 'X DKV 2', 'Hadir', '', 0),
(864, '2026-08-06', '120', 'X DKV 2', 'Hadir', '', 0),
(865, '2026-08-06', '121', 'X DKV 2', 'Hadir', '', 0),
(866, '2026-08-06', '122', 'X DKV 2', 'Hadir', '', 0),
(867, '2026-08-06', '123', 'X DKV 2', 'Hadir', '', 0),
(868, '2026-08-06', '124', 'X DKV 2', 'Hadir', '', 0),
(869, '2026-08-06', '125', 'X DKV 2', 'Hadir', '', 0),
(870, '2026-08-06', '126', 'X DKV 2', 'Hadir', '', 0),
(871, '2026-08-06', '127', 'X DKV 2', 'Hadir', '', 0),
(872, '2026-08-06', '128', 'X DKV 2', 'Hadir', '', 0),
(873, '2026-08-06', '129', 'X DKV 2', 'Hadir', '', 0),
(874, '2026-08-06', '130', 'X DKV 2', 'Hadir', '', 0),
(875, '2026-08-06', '131', 'X DKV 2', 'Hadir', '', 0),
(876, '2026-08-06', '132', 'X DKV 2', 'Hadir', '', 0),
(877, '2026-08-06', '133', 'X DKV 2', 'Hadir', '', 0),
(878, '2026-08-06', '134', 'X DKV 2', 'Hadir', '', 0),
(879, '2026-08-06', '135', 'X DKV 2', 'Hadir', '', 0),
(880, '2026-08-06', '136', 'X DKV 2', 'Hadir', '', 0),
(881, '2026-08-06', '137', 'X DKV 2', 'Hadir', '', 0),
(882, '2026-08-06', '138', 'X DKV 2', 'Hadir', '', 0),
(883, '2026-08-06', '139', 'X DKV 2', 'Hadir', '', 0),
(884, '2026-08-06', '140', 'X DKV 2', 'Hadir', '', 0),
(885, '2026-08-06', '141', 'X DKV 2', 'Hadir', '', 0),
(886, '2026-08-06', '142', 'X DKV 2', 'Hadir', '', 0),
(887, '2026-08-06', '143', 'X DKV 2', 'Hadir', '', 0),
(888, '2026-08-07', '111', 'X DKV 2', 'Hadir', '', 0),
(889, '2026-08-07', '112', 'X DKV 2', 'Sakit', '', 0),
(890, '2026-08-07', '113', 'X DKV 2', 'Hadir', '', 0),
(891, '2026-08-07', '114', 'X DKV 2', 'Hadir', '', 0),
(892, '2026-08-07', '115', 'X DKV 2', 'Hadir', '', 0),
(893, '2026-08-07', '116', 'X DKV 2', 'Hadir', '', 0),
(894, '2026-08-07', '117', 'X DKV 2', 'Hadir', '', 0),
(895, '2026-08-07', '118', 'X DKV 2', 'Hadir', '', 0),
(896, '2026-08-07', '119', 'X DKV 2', 'Hadir', '', 0),
(897, '2026-08-07', '120', 'X DKV 2', 'Hadir', '', 0),
(898, '2026-08-07', '121', 'X DKV 2', 'Hadir', '', 0),
(899, '2026-08-07', '122', 'X DKV 2', 'Hadir', '', 0),
(900, '2026-08-07', '123', 'X DKV 2', 'Hadir', '', 0),
(901, '2026-08-07', '124', 'X DKV 2', 'Hadir', '', 0),
(902, '2026-08-07', '125', 'X DKV 2', 'Hadir', '', 0),
(903, '2026-08-07', '126', 'X DKV 2', 'Hadir', '', 0),
(904, '2026-08-07', '127', 'X DKV 2', 'Hadir', '', 0),
(905, '2026-08-07', '128', 'X DKV 2', 'Hadir', '', 0),
(906, '2026-08-07', '129', 'X DKV 2', 'Hadir', '', 0),
(907, '2026-08-07', '130', 'X DKV 2', 'Hadir', '', 0),
(908, '2026-08-07', '131', 'X DKV 2', 'Hadir', '', 0),
(909, '2026-08-07', '132', 'X DKV 2', 'Hadir', '', 0),
(910, '2026-08-07', '133', 'X DKV 2', 'Hadir', '', 0),
(911, '2026-08-07', '134', 'X DKV 2', 'Hadir', '', 0),
(912, '2026-08-07', '135', 'X DKV 2', 'Hadir', '', 0),
(913, '2026-08-07', '136', 'X DKV 2', 'Hadir', '', 0),
(914, '2026-08-07', '137', 'X DKV 2', 'Hadir', '', 0),
(915, '2026-08-07', '138', 'X DKV 2', 'Hadir', '', 0),
(916, '2026-08-07', '139', 'X DKV 2', 'Hadir', '', 0),
(917, '2026-08-07', '140', 'X DKV 2', 'Hadir', '', 0),
(918, '2026-08-07', '141', 'X DKV 2', 'Hadir', '', 0),
(919, '2026-08-07', '142', 'X DKV 2', 'Hadir', '', 0),
(920, '2026-08-07', '143', 'X DKV 2', 'Sakit', '', 0),
(921, '2026-08-03', '2627108130', 'X PSPT', 'Hadir', '', 0),
(922, '2026-08-03', '2627108131', 'X PSPT', 'Hadir', '', 0),
(923, '2026-08-03', '2627108132', 'X PSPT', 'Hadir', '', 0),
(924, '2026-08-03', '2627108133', 'X PSPT', 'Hadir', '', 0),
(925, '2026-08-03', '2627108134', 'X PSPT', 'Hadir', '', 0),
(926, '2026-08-03', '2627108135', 'X PSPT', 'Hadir', '', 0),
(927, '2026-08-03', '2627108136', 'X PSPT', 'Hadir', '', 0),
(928, '2026-08-03', '2627108137', 'X PSPT', 'Hadir', '', 0),
(929, '2026-08-03', '2627108138', 'X PSPT', 'Hadir', '', 0),
(930, '2026-08-03', '2627108139', 'X PSPT', 'Hadir', '', 0),
(931, '2026-08-03', '2627108140', 'X PSPT', 'Hadir', '', 0),
(932, '2026-08-03', '2627108141', 'X PSPT', 'Hadir', '', 0),
(933, '2026-08-03', '2627108142', 'X PSPT', 'Hadir', '', 0),
(934, '2026-08-03', '2627108143', 'X PSPT', 'Hadir', '', 0),
(935, '2026-08-03', '2627108144', 'X PSPT', 'Hadir', '', 0),
(936, '2026-08-03', '2627108145', 'X PSPT', 'Hadir', '', 0),
(937, '2026-08-03', '2627108146', 'X PSPT', 'Hadir', '', 0),
(938, '2026-08-03', '2627108147', 'X PSPT', 'Hadir', '', 0),
(939, '2026-08-03', '2627108148', 'X PSPT', 'Hadir', '', 0),
(940, '2026-08-03', '2627108149', 'X PSPT', 'Hadir', '', 0),
(941, '2026-08-03', '2627108150', 'X PSPT', 'Hadir', '', 0),
(942, '2026-08-03', '2627108151', 'X PSPT', 'Hadir', '', 0),
(943, '2026-08-03', '2627108152', 'X PSPT', 'Hadir', '', 0),
(944, '2026-08-03', '2627108153', 'X PSPT', 'Sakit', 'Sakit', 0),
(945, '2026-08-03', '2627108154', 'X PSPT', 'Hadir', '', 0),
(946, '2026-08-03', '2627108155', 'X PSPT', 'Hadir', '', 0),
(947, '2026-08-03', '2627108156', 'X PSPT', 'Hadir', '', 0),
(948, '2026-08-03', '2627108157', 'X PSPT', 'Hadir', '', 0),
(949, '2026-08-03', '2627108158', 'X PSPT', 'Hadir', '', 0),
(950, '2026-08-03', '2627108159', 'X PSPT', 'Hadir', '', 0),
(951, '2026-08-03', '2627108160', 'X PSPT', 'Hadir', '', 0),
(952, '2026-08-03', '2627108161', 'X PSPT', 'Hadir', '', 0),
(953, '2026-08-03', '2627108162', 'X PSPT', 'Hadir', '', 0),
(954, '2026-08-03', '2627108163', 'X PSPT', 'Hadir', '', 0),
(955, '2026-08-03', '2627108164', 'X PSPT', 'Hadir', '', 0),
(956, '2026-08-03', '2627108165', 'X PSPT', 'Izin', 'Izin', 0),
(957, '2026-08-03', '2627108166', 'X PSPT', 'Hadir', '', 0),
(958, '2026-08-04', '2627108130', 'X PSPT', 'Hadir', '', 0),
(959, '2026-08-04', '2627108131', 'X PSPT', 'Hadir', '', 0),
(960, '2026-08-04', '2627108132', 'X PSPT', 'Hadir', '', 0),
(961, '2026-08-04', '2627108133', 'X PSPT', 'Hadir', '', 0),
(962, '2026-08-04', '2627108134', 'X PSPT', 'Hadir', '', 0),
(963, '2026-08-04', '2627108135', 'X PSPT', 'Hadir', '', 0),
(964, '2026-08-04', '2627108136', 'X PSPT', 'Hadir', '', 0),
(965, '2026-08-04', '2627108137', 'X PSPT', 'Hadir', '', 0),
(966, '2026-08-04', '2627108138', 'X PSPT', 'Hadir', '', 0),
(967, '2026-08-04', '2627108139', 'X PSPT', 'Hadir', '', 0),
(968, '2026-08-04', '2627108140', 'X PSPT', 'Hadir', '', 0),
(969, '2026-08-04', '2627108141', 'X PSPT', 'Hadir', '', 0),
(970, '2026-08-04', '2627108142', 'X PSPT', 'Hadir', '', 0),
(971, '2026-08-04', '2627108143', 'X PSPT', 'Hadir', '', 0),
(972, '2026-08-04', '2627108144', 'X PSPT', 'Hadir', '', 0),
(973, '2026-08-04', '2627108145', 'X PSPT', 'Hadir', '', 0),
(974, '2026-08-04', '2627108146', 'X PSPT', 'Hadir', '', 0),
(975, '2026-08-04', '2627108147', 'X PSPT', 'Hadir', '', 0),
(976, '2026-08-04', '2627108148', 'X PSPT', 'Hadir', '', 0),
(977, '2026-08-04', '2627108149', 'X PSPT', 'Hadir', '', 0),
(978, '2026-08-04', '2627108150', 'X PSPT', 'Hadir', '', 0),
(979, '2026-08-04', '2627108151', 'X PSPT', 'Hadir', '', 0),
(980, '2026-08-04', '2627108152', 'X PSPT', 'Hadir', '', 0),
(981, '2026-08-04', '2627108153', 'X PSPT', 'Hadir', '', 0),
(982, '2026-08-04', '2627108154', 'X PSPT', 'Hadir', '', 0),
(983, '2026-08-04', '2627108155', 'X PSPT', 'Hadir', '', 0),
(984, '2026-08-04', '2627108156', 'X PSPT', 'Hadir', '', 0),
(985, '2026-08-04', '2627108157', 'X PSPT', 'Hadir', '', 0),
(986, '2026-08-04', '2627108158', 'X PSPT', 'Hadir', '', 0),
(987, '2026-08-04', '2627108159', 'X PSPT', 'Hadir', '', 0),
(988, '2026-08-04', '2627108160', 'X PSPT', 'Hadir', '', 0),
(989, '2026-08-04', '2627108161', 'X PSPT', 'Hadir', '', 0),
(990, '2026-08-04', '2627108162', 'X PSPT', 'Hadir', '', 0),
(991, '2026-08-04', '2627108163', 'X PSPT', 'Hadir', '', 0),
(992, '2026-08-04', '2627108164', 'X PSPT', 'Hadir', '', 0),
(993, '2026-08-04', '2627108165', 'X PSPT', 'Sakit', '', 0),
(994, '2026-08-04', '2627108166', 'X PSPT', 'Hadir', '', 0),
(995, '2026-08-08', '2627108130', 'X PSPT', 'Hadir', '', 0),
(996, '2026-08-08', '2627108131', 'X PSPT', 'Sakit', 'Sakit', 0),
(997, '2026-08-08', '2627108132', 'X PSPT', 'Hadir', '', 0),
(998, '2026-08-08', '2627108133', 'X PSPT', 'Hadir', '', 0),
(999, '2026-08-08', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1000, '2026-08-08', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1001, '2026-08-08', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1002, '2026-08-08', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1003, '2026-08-08', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1004, '2026-08-08', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1005, '2026-08-08', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1006, '2026-08-08', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1007, '2026-08-08', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1008, '2026-08-08', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1009, '2026-08-08', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1010, '2026-08-08', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1011, '2026-08-08', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1012, '2026-08-08', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1013, '2026-08-08', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1014, '2026-08-08', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1015, '2026-08-08', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1016, '2026-08-08', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1017, '2026-08-08', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1018, '2026-08-08', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1019, '2026-08-08', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1020, '2026-08-08', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1021, '2026-08-08', '2627108156', 'X PSPT', 'Hadir', '', 0);
INSERT INTO `kehadiran` (`id`, `tanggal`, `nis`, `kelas`, `status`, `keterangan`, `terlambat`) VALUES
(1022, '2026-08-08', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1023, '2026-08-08', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1024, '2026-08-08', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1025, '2026-08-08', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1026, '2026-08-08', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1027, '2026-08-08', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1028, '2026-08-08', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1029, '2026-08-08', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1030, '2026-08-08', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1031, '2026-08-08', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1032, '2026-08-06', '2425106281', 'XII PSPT', 'Sakit', '', 0),
(1033, '2026-08-06', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(1034, '2026-08-06', '2425106283', 'XII PSPT', 'Hadir', '', 0),
(1035, '2026-08-06', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(1036, '2026-08-06', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(1037, '2026-08-06', '2425106286', 'XII PSPT', 'Hadir', '', 0),
(1038, '2026-08-06', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(1039, '2026-08-06', '2425106288', 'XII PSPT', 'Hadir', '', 0),
(1040, '2026-08-06', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(1041, '2026-08-06', '2425106291', 'XII PSPT', 'Hadir', '', 0),
(1042, '2026-08-06', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(1043, '2026-08-06', '2425106293', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1044, '2026-08-06', '2425106294', 'XII PSPT', 'Hadir', '', 0),
(1045, '2026-08-06', '2425106295', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1046, '2026-08-06', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(1047, '2026-08-06', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(1048, '2026-08-06', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(1049, '2026-08-06', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(1050, '2026-08-06', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(1051, '2026-08-06', '2425106303', 'XII PSPT', 'Hadir', '', 0),
(1052, '2026-08-06', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(1053, '2026-08-06', '2425106305', 'XII PSPT', 'Hadir', '', 0),
(1054, '2026-08-06', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(1055, '2026-08-06', '2425106306', 'XII PSPT', 'Izin', '', 0),
(1056, '2026-08-06', '2425106307', 'XII PSPT', 'Hadir', '', 0),
(1057, '2026-08-06', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(1058, '2026-08-06', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(1059, '2026-08-06', '2425106309', 'XII PSPT', 'Hadir', '', 0),
(1060, '2026-08-06', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(1061, '2026-08-06', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(1062, '2026-08-06', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(1063, '2026-08-06', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(1064, '2026-08-06', '2425106314', 'XII PSPT', 'Hadir', '', 0),
(1065, '2026-08-06', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(1066, '2026-08-06', '2425106316', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1067, '2026-08-06', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(1068, '2026-08-06', '2425106318', 'XII PSPT', 'Hadir', '', 0),
(1069, '2026-08-06', '2425106319', 'XII PSPT', 'Hadir', '', 0),
(1070, '2026-08-06', '2425106320', 'XII PSPT', 'Hadir', '', 0),
(1071, '2026-08-06', '2425106321', 'XII PSPT', 'Hadir', '', 0),
(1072, '2026-08-06', '2425106322', 'XII PSPT', 'Hadir', '', 0),
(1073, '2026-08-07', '2425106281', 'XII PSPT', 'Hadir', '', 0),
(1074, '2026-08-07', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(1075, '2026-08-07', '2425106283', 'XII PSPT', 'Izin', '', 0),
(1076, '2026-08-07', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(1077, '2026-08-07', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(1078, '2026-08-07', '2425106286', 'XII PSPT', 'Hadir', '', 0),
(1079, '2026-08-07', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(1080, '2026-08-07', '2425106288', 'XII PSPT', 'Izin', '', 0),
(1081, '2026-08-07', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(1082, '2026-08-07', '2425106291', 'XII PSPT', 'Hadir', '', 0),
(1083, '2026-08-07', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(1084, '2026-08-07', '2425106293', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1085, '2026-08-07', '2425106294', 'XII PSPT', 'Sakit', '', 0),
(1086, '2026-08-07', '2425106295', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1087, '2026-08-07', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(1088, '2026-08-07', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(1089, '2026-08-07', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(1090, '2026-08-07', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(1091, '2026-08-07', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(1092, '2026-08-07', '2425106303', 'XII PSPT', 'Hadir', '', 0),
(1093, '2026-08-07', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(1094, '2026-08-07', '2425106305', 'XII PSPT', 'Hadir', '', 0),
(1095, '2026-08-07', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(1096, '2026-08-07', '2425106306', 'XII PSPT', 'Hadir', '', 0),
(1097, '2026-08-07', '2425106307', 'XII PSPT', 'Hadir', '', 0),
(1098, '2026-08-07', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(1099, '2026-08-07', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(1100, '2026-08-07', '2425106309', 'XII PSPT', 'Hadir', '', 0),
(1101, '2026-08-07', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(1102, '2026-08-07', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(1103, '2026-08-07', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(1104, '2026-08-07', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(1105, '2026-08-07', '2425106314', 'XII PSPT', 'Hadir', '', 0),
(1106, '2026-08-07', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(1107, '2026-08-07', '2425106316', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1108, '2026-08-07', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(1109, '2026-08-07', '2425106318', 'XII PSPT', 'Hadir', '', 0),
(1110, '2026-08-07', '2425106319', 'XII PSPT', 'Hadir', '', 0),
(1111, '2026-08-07', '2425106320', 'XII PSPT', 'Hadir', '', 0),
(1112, '2026-08-07', '2425106321', 'XII PSPT', 'Hadir', '', 0),
(1113, '2026-08-07', '2425106322', 'XII PSPT', 'Hadir', '', 0),
(1114, '2026-08-07', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1115, '2026-08-07', '2627108131', 'X PSPT', 'Sakit', '', 0),
(1116, '2026-08-07', '2627108132', 'X PSPT', 'Hadir', '', 0),
(1117, '2026-08-07', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1118, '2026-08-07', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1119, '2026-08-07', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1120, '2026-08-07', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1121, '2026-08-07', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1122, '2026-08-07', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1123, '2026-08-07', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1124, '2026-08-07', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1125, '2026-08-07', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1126, '2026-08-07', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1127, '2026-08-07', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1128, '2026-08-07', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1129, '2026-08-07', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1130, '2026-08-07', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1131, '2026-08-07', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1132, '2026-08-07', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1133, '2026-08-07', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1134, '2026-08-07', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1135, '2026-08-07', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1136, '2026-08-07', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1137, '2026-08-07', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1138, '2026-08-07', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1139, '2026-08-07', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1140, '2026-08-07', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1141, '2026-08-07', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1142, '2026-08-07', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1143, '2026-08-07', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1144, '2026-08-07', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1145, '2026-08-07', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1146, '2026-08-07', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1147, '2026-08-07', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1148, '2026-08-07', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1149, '2026-08-07', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1150, '2026-08-07', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1151, '2026-08-06', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1152, '2026-08-06', '2627108131', 'X PSPT', 'Hadir', '', 0),
(1153, '2026-08-06', '2627108132', 'X PSPT', 'Hadir', '', 0),
(1154, '2026-08-06', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1155, '2026-08-06', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1156, '2026-08-06', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1157, '2026-08-06', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1158, '2026-08-06', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1159, '2026-08-06', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1160, '2026-08-06', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1161, '2026-08-06', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1162, '2026-08-06', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1163, '2026-08-06', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1164, '2026-08-06', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1165, '2026-08-06', '2627108144', 'X PSPT', 'Sakit', '', 0),
(1166, '2026-08-06', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1167, '2026-08-06', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1168, '2026-08-06', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1169, '2026-08-06', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1170, '2026-08-06', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1171, '2026-08-06', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1172, '2026-08-06', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1173, '2026-08-06', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1174, '2026-08-06', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1175, '2026-08-06', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1176, '2026-08-06', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1177, '2026-08-06', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1178, '2026-08-06', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1179, '2026-08-06', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1180, '2026-08-06', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1181, '2026-08-06', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1182, '2026-08-06', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1183, '2026-08-06', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1184, '2026-08-06', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1185, '2026-08-06', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1186, '2026-08-06', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1187, '2026-08-06', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1188, '2026-08-10', '2425106281', 'XII PSPT', 'Hadir', '', 0),
(1189, '2026-08-10', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(1190, '2026-08-10', '2425106283', 'XII PSPT', 'Hadir', '', 0),
(1191, '2026-08-10', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(1192, '2026-08-10', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(1193, '2026-08-10', '2425106286', 'XII PSPT', 'Hadir', '', 0),
(1194, '2026-08-10', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(1195, '2026-08-10', '2425106288', 'XII PSPT', 'Hadir', '', 0),
(1196, '2026-08-10', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(1197, '2026-08-10', '2425106291', 'XII PSPT', 'Hadir', '', 0),
(1198, '2026-08-10', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(1199, '2026-08-10', '2425106293', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1200, '2026-08-10', '2425106294', 'XII PSPT', 'Sakit', '', 0),
(1201, '2026-08-10', '2425106295', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1202, '2026-08-10', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(1203, '2026-08-10', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(1204, '2026-08-10', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(1205, '2026-08-10', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(1206, '2026-08-10', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(1207, '2026-08-10', '2425106303', 'XII PSPT', 'Hadir', '', 0),
(1208, '2026-08-10', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(1209, '2026-08-10', '2425106305', 'XII PSPT', 'Hadir', '', 0),
(1210, '2026-08-10', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(1211, '2026-08-10', '2425106306', 'XII PSPT', 'Hadir', '', 0),
(1212, '2026-08-10', '2425106307', 'XII PSPT', 'Alfa', '', 0),
(1213, '2026-08-10', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(1214, '2026-08-10', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(1215, '2026-08-10', '2425106309', 'XII PSPT', 'Hadir', '', 0),
(1216, '2026-08-10', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(1217, '2026-08-10', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(1218, '2026-08-10', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(1219, '2026-08-10', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(1220, '2026-08-10', '2425106314', 'XII PSPT', 'Sakit', '', 0),
(1221, '2026-08-10', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(1222, '2026-08-10', '2425106316', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1223, '2026-08-10', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(1224, '2026-08-10', '2425106318', 'XII PSPT', 'Sakit', '', 0),
(1225, '2026-08-10', '2425106319', 'XII PSPT', 'Izin', '', 0),
(1226, '2026-08-10', '2425106320', 'XII PSPT', 'Izin', '', 0),
(1227, '2026-08-10', '2425106321', 'XII PSPT', 'Sakit', '', 0),
(1228, '2026-08-10', '2425106322', 'XII PSPT', 'Alfa', '', 0),
(1262, '2026-08-10', '111', 'X DKV 2', 'Hadir', '', 0),
(1263, '2026-08-10', '112', 'X DKV 2', 'Hadir', '', 0),
(1264, '2026-08-10', '113', 'X DKV 2', 'Hadir', '', 0),
(1265, '2026-08-10', '114', 'X DKV 2', 'Hadir', '', 0),
(1266, '2026-08-10', '115', 'X DKV 2', 'Hadir', '', 0),
(1267, '2026-08-10', '116', 'X DKV 2', 'Hadir', '', 0),
(1268, '2026-08-10', '117', 'X DKV 2', 'Hadir', '', 0),
(1269, '2026-08-10', '118', 'X DKV 2', 'Hadir', '', 0),
(1270, '2026-08-10', '119', 'X DKV 2', 'Hadir', '', 0),
(1271, '2026-08-10', '120', 'X DKV 2', 'Hadir', '', 0),
(1272, '2026-08-10', '121', 'X DKV 2', 'Hadir', '', 0),
(1273, '2026-08-10', '122', 'X DKV 2', 'Hadir', '', 0),
(1274, '2026-08-10', '123', 'X DKV 2', 'Hadir', '', 0),
(1275, '2026-08-10', '124', 'X DKV 2', 'Hadir', '', 0),
(1276, '2026-08-10', '125', 'X DKV 2', 'Hadir', '', 0),
(1277, '2026-08-10', '126', 'X DKV 2', 'Hadir', '', 0),
(1278, '2026-08-10', '127', 'X DKV 2', 'Hadir', '', 0),
(1279, '2026-08-10', '128', 'X DKV 2', 'Hadir', '', 0),
(1280, '2026-08-10', '129', 'X DKV 2', 'Hadir', '', 0),
(1281, '2026-08-10', '130', 'X DKV 2', 'Hadir', '', 0),
(1282, '2026-08-10', '131', 'X DKV 2', 'Hadir', '', 0),
(1283, '2026-08-10', '132', 'X DKV 2', 'Hadir', '', 0),
(1284, '2026-08-10', '133', 'X DKV 2', 'Hadir', '', 0),
(1285, '2026-08-10', '134', 'X DKV 2', 'Hadir', '', 0),
(1286, '2026-08-10', '135', 'X DKV 2', 'Hadir', '', 0),
(1287, '2026-08-10', '136', 'X DKV 2', 'Hadir', '', 0),
(1288, '2026-08-10', '137', 'X DKV 2', 'Hadir', '', 0),
(1289, '2026-08-10', '138', 'X DKV 2', 'Hadir', '', 0),
(1290, '2026-08-10', '139', 'X DKV 2', 'Hadir', '', 0),
(1291, '2026-08-10', '140', 'X DKV 2', 'Hadir', '', 0),
(1292, '2026-08-10', '141', 'X DKV 2', 'Hadir', '', 0),
(1293, '2026-08-10', '142', 'X DKV 2', 'Hadir', '', 0),
(1294, '2026-08-10', '143', 'X DKV 2', 'Hadir', '', 0),
(1295, '2026-08-11', '111', 'X DKV 2', 'Hadir', '', 0),
(1296, '2026-08-11', '112', 'X DKV 2', 'Hadir', '', 0),
(1297, '2026-08-11', '113', 'X DKV 2', 'Hadir', '', 0),
(1298, '2026-08-11', '114', 'X DKV 2', 'Hadir', '', 0),
(1299, '2026-08-11', '115', 'X DKV 2', 'Hadir', '', 0),
(1300, '2026-08-11', '116', 'X DKV 2', 'Hadir', '', 0),
(1301, '2026-08-11', '117', 'X DKV 2', 'Hadir', '', 0),
(1302, '2026-08-11', '118', 'X DKV 2', 'Hadir', '', 0),
(1303, '2026-08-11', '119', 'X DKV 2', 'Hadir', '', 0),
(1304, '2026-08-11', '120', 'X DKV 2', 'Hadir', '', 0),
(1305, '2026-08-11', '121', 'X DKV 2', 'Hadir', '', 0),
(1306, '2026-08-11', '122', 'X DKV 2', 'Hadir', '', 0),
(1307, '2026-08-11', '123', 'X DKV 2', 'Hadir', '', 0),
(1308, '2026-08-11', '124', 'X DKV 2', 'Hadir', '', 0),
(1309, '2026-08-11', '125', 'X DKV 2', 'Hadir', '', 0),
(1310, '2026-08-11', '126', 'X DKV 2', 'Hadir', '', 0),
(1311, '2026-08-11', '127', 'X DKV 2', 'Hadir', '', 0),
(1312, '2026-08-11', '128', 'X DKV 2', 'Hadir', '', 0),
(1313, '2026-08-11', '129', 'X DKV 2', 'Hadir', '', 0),
(1314, '2026-08-11', '130', 'X DKV 2', 'Hadir', '', 0),
(1315, '2026-08-11', '131', 'X DKV 2', 'Hadir', '', 0),
(1316, '2026-08-11', '132', 'X DKV 2', 'Hadir', '', 0),
(1317, '2026-08-11', '133', 'X DKV 2', 'Hadir', '', 0),
(1318, '2026-08-11', '134', 'X DKV 2', 'Hadir', '', 0),
(1319, '2026-08-11', '135', 'X DKV 2', 'Hadir', '', 0),
(1320, '2026-08-11', '136', 'X DKV 2', 'Hadir', '', 0),
(1321, '2026-08-11', '137', 'X DKV 2', 'Hadir', '', 0),
(1322, '2026-08-11', '138', 'X DKV 2', 'Hadir', '', 0),
(1323, '2026-08-11', '139', 'X DKV 2', 'Hadir', '', 0),
(1324, '2026-08-11', '140', 'X DKV 2', 'Hadir', '', 0),
(1325, '2026-08-11', '141', 'X DKV 2', 'Hadir', '', 0),
(1326, '2026-08-11', '142', 'X DKV 2', 'Hadir', '', 0),
(1327, '2026-08-11', '143', 'X DKV 2', 'Hadir', '', 0),
(1476, '2026-08-11', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1477, '2026-08-11', '2627108131', 'X PSPT', 'Hadir', '', 0),
(1478, '2026-08-11', '2627108132', 'X PSPT', 'Sakit', 'Sakit', 0),
(1479, '2026-08-11', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1480, '2026-08-11', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1481, '2026-08-11', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1482, '2026-08-11', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1483, '2026-08-11', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1484, '2026-08-11', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1485, '2026-08-11', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1486, '2026-08-11', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1487, '2026-08-11', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1488, '2026-08-11', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1489, '2026-08-11', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1490, '2026-08-11', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1491, '2026-08-11', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1492, '2026-08-11', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1493, '2026-08-11', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1494, '2026-08-11', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1495, '2026-08-11', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1496, '2026-08-11', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1497, '2026-08-11', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1498, '2026-08-11', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1499, '2026-08-11', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1500, '2026-08-11', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1501, '2026-08-11', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1502, '2026-08-11', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1503, '2026-08-11', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1504, '2026-08-11', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1505, '2026-08-11', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1506, '2026-08-11', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1507, '2026-08-11', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1508, '2026-08-11', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1509, '2026-08-11', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1510, '2026-08-11', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1511, '2026-08-11', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1512, '2026-08-11', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1513, '2026-08-10', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1514, '2026-08-10', '2627108131', 'X PSPT', 'Sakit', 'Sakit', 0),
(1515, '2026-08-10', '2627108132', 'X PSPT', 'Hadir', '', 0),
(1516, '2026-08-10', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1517, '2026-08-10', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1518, '2026-08-10', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1519, '2026-08-10', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1520, '2026-08-10', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1521, '2026-08-10', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1522, '2026-08-10', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1523, '2026-08-10', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1524, '2026-08-10', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1525, '2026-08-10', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1526, '2026-08-10', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1527, '2026-08-10', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1528, '2026-08-10', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1529, '2026-08-10', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1530, '2026-08-10', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1531, '2026-08-10', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1532, '2026-08-10', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1533, '2026-08-10', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1534, '2026-08-10', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1535, '2026-08-10', '2627108152', 'X PSPT', 'Hadir', '', 0);
INSERT INTO `kehadiran` (`id`, `tanggal`, `nis`, `kelas`, `status`, `keterangan`, `terlambat`) VALUES
(1536, '2026-08-10', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1537, '2026-08-10', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1538, '2026-08-10', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1539, '2026-08-10', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1540, '2026-08-10', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1541, '2026-08-10', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1542, '2026-08-10', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1543, '2026-08-10', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1544, '2026-08-10', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1545, '2026-08-10', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1546, '2026-08-10', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1547, '2026-08-10', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1548, '2026-08-10', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1549, '2026-08-10', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1587, '2026-08-12', '111', 'X DKV 2', 'Hadir', '', 0),
(1588, '2026-08-12', '112', 'X DKV 2', 'Sakit', '', 0),
(1589, '2026-08-12', '113', 'X DKV 2', 'Hadir', '', 0),
(1590, '2026-08-12', '114', 'X DKV 2', 'Hadir', '', 0),
(1591, '2026-08-12', '115', 'X DKV 2', 'Hadir', '', 0),
(1592, '2026-08-12', '116', 'X DKV 2', 'Hadir', '', 0),
(1593, '2026-08-12', '117', 'X DKV 2', 'Hadir', '', 0),
(1594, '2026-08-12', '118', 'X DKV 2', 'Hadir', '', 0),
(1595, '2026-08-12', '119', 'X DKV 2', 'Hadir', '', 0),
(1596, '2026-08-12', '120', 'X DKV 2', 'Hadir', '', 0),
(1597, '2026-08-12', '121', 'X DKV 2', 'Hadir', '', 0),
(1598, '2026-08-12', '122', 'X DKV 2', 'Hadir', '', 0),
(1599, '2026-08-12', '123', 'X DKV 2', 'Hadir', '', 0),
(1600, '2026-08-12', '124', 'X DKV 2', 'Hadir', '', 0),
(1601, '2026-08-12', '125', 'X DKV 2', 'Hadir', '', 0),
(1602, '2026-08-12', '126', 'X DKV 2', 'Hadir', '', 0),
(1603, '2026-08-12', '127', 'X DKV 2', 'Hadir', '', 0),
(1604, '2026-08-12', '128', 'X DKV 2', 'Sakit', '', 0),
(1605, '2026-08-12', '129', 'X DKV 2', 'Hadir', '', 0),
(1606, '2026-08-12', '130', 'X DKV 2', 'Hadir', '', 0),
(1607, '2026-08-12', '131', 'X DKV 2', 'Hadir', '', 0),
(1608, '2026-08-12', '132', 'X DKV 2', 'Hadir', '', 0),
(1609, '2026-08-12', '133', 'X DKV 2', 'Hadir', '', 0),
(1610, '2026-08-12', '134', 'X DKV 2', 'Hadir', '', 0),
(1611, '2026-08-12', '135', 'X DKV 2', 'Hadir', '', 0),
(1612, '2026-08-12', '136', 'X DKV 2', 'Hadir', '', 0),
(1613, '2026-08-12', '137', 'X DKV 2', 'Hadir', '', 0),
(1614, '2026-08-12', '138', 'X DKV 2', 'Hadir', '', 0),
(1615, '2026-08-12', '139', 'X DKV 2', 'Hadir', '', 0),
(1616, '2026-08-12', '140', 'X DKV 2', 'Hadir', '', 0),
(1617, '2026-08-12', '141', 'X DKV 2', 'Hadir', '', 0),
(1618, '2026-08-12', '142', 'X DKV 2', 'Hadir', '', 0),
(1619, '2026-08-12', '143', 'X DKV 2', 'Hadir', '', 0),
(1657, '2026-08-12', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1658, '2026-08-12', '2627108131', 'X PSPT', 'Hadir', '', 0),
(1659, '2026-08-12', '2627108132', 'X PSPT', 'Sakit', 'Sakit', 0),
(1660, '2026-08-12', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1661, '2026-08-12', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1662, '2026-08-12', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1663, '2026-08-12', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1664, '2026-08-12', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1665, '2026-08-12', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1666, '2026-08-12', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1667, '2026-08-12', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1668, '2026-08-12', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1669, '2026-08-12', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1670, '2026-08-12', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1671, '2026-08-12', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1672, '2026-08-12', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1673, '2026-08-12', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1674, '2026-08-12', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1675, '2026-08-12', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1676, '2026-08-12', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1677, '2026-08-12', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1678, '2026-08-12', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1679, '2026-08-12', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1680, '2026-08-12', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1681, '2026-08-12', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1682, '2026-08-12', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1683, '2026-08-12', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1684, '2026-08-12', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1685, '2026-08-12', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1686, '2026-08-12', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1687, '2026-08-12', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1688, '2026-08-12', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1689, '2026-08-12', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1690, '2026-08-12', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1691, '2026-08-12', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1692, '2026-08-12', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1693, '2026-08-12', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1694, '2026-08-12', '2425106281', 'XII PSPT', 'Izin', '', 0),
(1695, '2026-08-12', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(1696, '2026-08-12', '2425106283', 'XII PSPT', 'Hadir', '', 0),
(1697, '2026-08-12', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(1698, '2026-08-12', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(1699, '2026-08-12', '2425106286', 'XII PSPT', 'Hadir', '', 0),
(1700, '2026-08-12', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(1701, '2026-08-12', '2425106288', 'XII PSPT', 'Hadir', '', 0),
(1702, '2026-08-12', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(1703, '2026-08-12', '2425106291', 'XII PSPT', 'Hadir', '', 0),
(1704, '2026-08-12', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(1705, '2026-08-12', '2425106293', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1706, '2026-08-12', '2425106294', 'XII PSPT', 'Sakit', '', 0),
(1707, '2026-08-12', '2425106295', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1708, '2026-08-12', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(1709, '2026-08-12', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(1710, '2026-08-12', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(1711, '2026-08-12', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(1712, '2026-08-12', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(1713, '2026-08-12', '2425106303', 'XII PSPT', 'Hadir', '', 0),
(1714, '2026-08-12', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(1715, '2026-08-12', '2425106305', 'XII PSPT', 'Sakit', '', 0),
(1716, '2026-08-12', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(1717, '2026-08-12', '2425106306', 'XII PSPT', 'Hadir', '', 0),
(1718, '2026-08-12', '2425106307', 'XII PSPT', 'Hadir', '', 0),
(1719, '2026-08-12', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(1720, '2026-08-12', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(1721, '2026-08-12', '2425106309', 'XII PSPT', 'Izin', '', 0),
(1722, '2026-08-12', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(1723, '2026-08-12', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(1724, '2026-08-12', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(1725, '2026-08-12', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(1726, '2026-08-12', '2425106314', 'XII PSPT', 'Hadir', '', 0),
(1727, '2026-08-12', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(1728, '2026-08-12', '2425106316', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1729, '2026-08-12', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(1730, '2026-08-12', '2425106318', 'XII PSPT', 'Hadir', '', 0),
(1731, '2026-08-12', '2425106319', 'XII PSPT', 'Hadir', '', 0),
(1732, '2026-08-12', '2425106320', 'XII PSPT', 'Hadir', '', 0),
(1733, '2026-08-12', '2425106321', 'XII PSPT', 'Hadir', '', 0),
(1734, '2026-08-12', '2425106322', 'XII PSPT', 'Hadir', '', 0),
(1776, '2026-08-13', '2425106281', 'XII PSPT', 'Hadir', '', 0),
(1777, '2026-08-13', '2425106282', 'XII PSPT', 'Hadir', '', 0),
(1778, '2026-08-13', '2425106283', 'XII PSPT', 'Hadir', '', 0),
(1779, '2026-08-13', '2425106284', 'XII PSPT', 'Hadir', '', 0),
(1780, '2026-08-13', '2425106285', 'XII PSPT', 'Hadir', '', 0),
(1781, '2026-08-13', '2425106286', 'XII PSPT', 'Izin', '', 0),
(1782, '2026-08-13', '2425106287', 'XII PSPT', 'Hadir', '', 0),
(1783, '2026-08-13', '2425106288', 'XII PSPT', 'Hadir', '', 0),
(1784, '2026-08-13', '2425106290', 'XII PSPT', 'Hadir', '', 0),
(1785, '2026-08-13', '2425106291', 'XII PSPT', 'Izin', '', 0),
(1786, '2026-08-13', '2425106292', 'XII PSPT', 'Hadir', '', 0),
(1787, '2026-08-13', '2425106293', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1788, '2026-08-13', '2425106294', 'XII PSPT', 'Hadir', '', 0),
(1789, '2026-08-13', '2425106295', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1790, '2026-08-13', '2425106296', 'XII PSPT', 'Hadir', '', 0),
(1791, '2026-08-13', '2425106297', 'XII PSPT', 'Hadir', '', 0),
(1792, '2026-08-13', '2425106298', 'XII PSPT', 'Hadir', '', 0),
(1793, '2026-08-13', '2425106299', 'XII PSPT', 'Hadir', '', 0),
(1794, '2026-08-13', '2425106300', 'XII PSPT', 'Hadir', '', 0),
(1795, '2026-08-13', '2425106303', 'XII PSPT', 'Hadir', '', 0),
(1796, '2026-08-13', '2425106304', 'XII PSPT', 'Hadir', '', 0),
(1797, '2026-08-13', '2425106305', 'XII PSPT', 'Hadir', '', 0),
(1798, '2026-08-13', '2425106302', 'XII PSPT', 'Hadir', '', 0),
(1799, '2026-08-13', '2425106306', 'XII PSPT', 'Hadir', '', 0),
(1800, '2026-08-13', '2425106307', 'XII PSPT', 'Hadir', '', 0),
(1801, '2026-08-13', '2425106308', 'XII PSPT', 'Hadir', '', 0),
(1802, '2026-08-13', '2425106301', 'XII PSPT', 'Hadir', '', 0),
(1803, '2026-08-13', '2425106309', 'XII PSPT', 'Sakit', '', 0),
(1804, '2026-08-13', '2425106310', 'XII PSPT', 'Hadir', '', 0),
(1805, '2026-08-13', '2425106311', 'XII PSPT', 'Hadir', '', 0),
(1806, '2026-08-13', '2425106312', 'XII PSPT', 'Hadir', '', 0),
(1807, '2026-08-13', '2425106313', 'XII PSPT', 'Hadir', '', 0),
(1808, '2026-08-13', '2425106314', 'XII PSPT', 'Izin', '', 0),
(1809, '2026-08-13', '2425106315', 'XII PSPT', 'Hadir', '', 0),
(1810, '2026-08-13', '2425106316', 'XII PSPT', 'Hadir', 'Keluar', 0),
(1811, '2026-08-13', '2425106317', 'XII PSPT', 'Hadir', '', 0),
(1812, '2026-08-13', '2425106318', 'XII PSPT', 'Hadir', '', 0),
(1813, '2026-08-13', '2425106319', 'XII PSPT', 'Hadir', '', 0),
(1814, '2026-08-13', '2425106320', 'XII PSPT', 'Hadir', '', 0),
(1815, '2026-08-13', '2425106321', 'XII PSPT', 'Hadir', '', 0),
(1816, '2026-08-13', '2425106322', 'XII PSPT', 'Hadir', '', 0),
(1817, '2026-08-13', '111', 'X DKV 2', 'Hadir', '', 0),
(1818, '2026-08-13', '112', 'X DKV 2', 'Sakit', '', 0),
(1819, '2026-08-13', '113', 'X DKV 2', 'Hadir', '', 0),
(1820, '2026-08-13', '114', 'X DKV 2', 'Hadir', '', 0),
(1821, '2026-08-13', '115', 'X DKV 2', 'Hadir', '', 0),
(1822, '2026-08-13', '116', 'X DKV 2', 'Hadir', '', 0),
(1823, '2026-08-13', '117', 'X DKV 2', 'Hadir', '', 0),
(1824, '2026-08-13', '118', 'X DKV 2', 'Hadir', '', 0),
(1825, '2026-08-13', '119', 'X DKV 2', 'Hadir', '', 0),
(1826, '2026-08-13', '120', 'X DKV 2', 'Hadir', '', 0),
(1827, '2026-08-13', '121', 'X DKV 2', 'Hadir', '', 0),
(1828, '2026-08-13', '122', 'X DKV 2', 'Hadir', '', 0),
(1829, '2026-08-13', '123', 'X DKV 2', 'Hadir', '', 0),
(1830, '2026-08-13', '124', 'X DKV 2', 'Hadir', '', 0),
(1831, '2026-08-13', '125', 'X DKV 2', 'Hadir', '', 0),
(1832, '2026-08-13', '126', 'X DKV 2', 'Hadir', '', 0),
(1833, '2026-08-13', '127', 'X DKV 2', 'Hadir', '', 0),
(1834, '2026-08-13', '128', 'X DKV 2', 'Hadir', '', 0),
(1835, '2026-08-13', '129', 'X DKV 2', 'Hadir', '', 0),
(1836, '2026-08-13', '130', 'X DKV 2', 'Hadir', '', 0),
(1837, '2026-08-13', '131', 'X DKV 2', 'Hadir', '', 0),
(1838, '2026-08-13', '132', 'X DKV 2', 'Hadir', '', 0),
(1839, '2026-08-13', '133', 'X DKV 2', 'Hadir', '', 0),
(1840, '2026-08-13', '134', 'X DKV 2', 'Hadir', '', 0),
(1841, '2026-08-13', '135', 'X DKV 2', 'Hadir', '', 0),
(1842, '2026-08-13', '136', 'X DKV 2', 'Hadir', '', 0),
(1843, '2026-08-13', '137', 'X DKV 2', 'Hadir', '', 0),
(1844, '2026-08-13', '138', 'X DKV 2', 'Hadir', '', 0),
(1845, '2026-08-13', '139', 'X DKV 2', 'Hadir', '', 0),
(1846, '2026-08-13', '140', 'X DKV 2', 'Hadir', '', 0),
(1847, '2026-08-13', '141', 'X DKV 2', 'Hadir', '', 0),
(1848, '2026-08-13', '142', 'X DKV 2', 'Hadir', '', 0),
(1849, '2026-08-13', '143', 'X DKV 2', 'Hadir', '', 0),
(1850, '2026-08-14', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1851, '2026-08-14', '2627108131', 'X PSPT', 'Hadir', '', 0),
(1852, '2026-08-14', '2627108132', 'X PSPT', 'Hadir', '', 0),
(1853, '2026-08-14', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1854, '2026-08-14', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1855, '2026-08-14', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1856, '2026-08-14', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1857, '2026-08-14', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1858, '2026-08-14', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1859, '2026-08-14', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1860, '2026-08-14', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1861, '2026-08-14', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1862, '2026-08-14', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1863, '2026-08-14', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1864, '2026-08-14', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1865, '2026-08-14', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1866, '2026-08-14', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1867, '2026-08-14', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1868, '2026-08-14', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1869, '2026-08-14', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1870, '2026-08-14', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1871, '2026-08-14', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1872, '2026-08-14', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1873, '2026-08-14', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1874, '2026-08-14', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1875, '2026-08-14', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1876, '2026-08-14', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1877, '2026-08-14', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1878, '2026-08-14', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1879, '2026-08-14', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1880, '2026-08-14', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1881, '2026-08-14', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1882, '2026-08-14', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1883, '2026-08-14', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1884, '2026-08-14', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1885, '2026-08-14', '2627108165', 'X PSPT', 'Sakit', '', 0),
(1886, '2026-08-14', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1887, '2026-08-13', '2627108130', 'X PSPT', 'Hadir', '', 0),
(1888, '2026-08-13', '2627108131', 'X PSPT', 'Hadir', '', 0),
(1889, '2026-08-13', '2627108132', 'X PSPT', 'Hadir', '', 0),
(1890, '2026-08-13', '2627108133', 'X PSPT', 'Hadir', '', 0),
(1891, '2026-08-13', '2627108134', 'X PSPT', 'Hadir', '', 0),
(1892, '2026-08-13', '2627108135', 'X PSPT', 'Hadir', '', 0),
(1893, '2026-08-13', '2627108136', 'X PSPT', 'Hadir', '', 0),
(1894, '2026-08-13', '2627108137', 'X PSPT', 'Hadir', '', 0),
(1895, '2026-08-13', '2627108138', 'X PSPT', 'Hadir', '', 0),
(1896, '2026-08-13', '2627108139', 'X PSPT', 'Hadir', '', 0),
(1897, '2026-08-13', '2627108140', 'X PSPT', 'Hadir', '', 0),
(1898, '2026-08-13', '2627108141', 'X PSPT', 'Hadir', '', 0),
(1899, '2026-08-13', '2627108142', 'X PSPT', 'Hadir', '', 0),
(1900, '2026-08-13', '2627108143', 'X PSPT', 'Hadir', '', 0),
(1901, '2026-08-13', '2627108144', 'X PSPT', 'Hadir', '', 0),
(1902, '2026-08-13', '2627108145', 'X PSPT', 'Hadir', '', 0),
(1903, '2026-08-13', '2627108146', 'X PSPT', 'Hadir', '', 0),
(1904, '2026-08-13', '2627108147', 'X PSPT', 'Hadir', '', 0),
(1905, '2026-08-13', '2627108148', 'X PSPT', 'Hadir', '', 0),
(1906, '2026-08-13', '2627108149', 'X PSPT', 'Hadir', '', 0),
(1907, '2026-08-13', '2627108150', 'X PSPT', 'Hadir', '', 0),
(1908, '2026-08-13', '2627108151', 'X PSPT', 'Hadir', '', 0),
(1909, '2026-08-13', '2627108152', 'X PSPT', 'Hadir', '', 0),
(1910, '2026-08-13', '2627108153', 'X PSPT', 'Hadir', '', 0),
(1911, '2026-08-13', '2627108154', 'X PSPT', 'Hadir', '', 0),
(1912, '2026-08-13', '2627108155', 'X PSPT', 'Hadir', '', 0),
(1913, '2026-08-13', '2627108156', 'X PSPT', 'Hadir', '', 0),
(1914, '2026-08-13', '2627108157', 'X PSPT', 'Hadir', '', 0),
(1915, '2026-08-13', '2627108158', 'X PSPT', 'Hadir', '', 0),
(1916, '2026-08-13', '2627108159', 'X PSPT', 'Hadir', '', 0),
(1917, '2026-08-13', '2627108160', 'X PSPT', 'Hadir', '', 0),
(1918, '2026-08-13', '2627108161', 'X PSPT', 'Hadir', '', 0),
(1919, '2026-08-13', '2627108162', 'X PSPT', 'Hadir', '', 0),
(1920, '2026-08-13', '2627108163', 'X PSPT', 'Hadir', '', 0),
(1921, '2026-08-13', '2627108164', 'X PSPT', 'Hadir', '', 0),
(1922, '2026-08-13', '2627108165', 'X PSPT', 'Hadir', '', 0),
(1923, '2026-08-13', '2627108166', 'X PSPT', 'Hadir', '', 0),
(1924, '2026-08-14', '111', 'X DKV 2', 'Hadir', '', 0),
(1925, '2026-08-14', '112', 'X DKV 2', 'Sakit', '', 0),
(1926, '2026-08-14', '113', 'X DKV 2', 'Hadir', '', 0),
(1927, '2026-08-14', '114', 'X DKV 2', 'Hadir', '', 0),
(1928, '2026-08-14', '115', 'X DKV 2', 'Hadir', '', 0),
(1929, '2026-08-14', '116', 'X DKV 2', 'Hadir', '', 0),
(1930, '2026-08-14', '117', 'X DKV 2', 'Hadir', '', 0),
(1931, '2026-08-14', '118', 'X DKV 2', 'Hadir', '', 0),
(1932, '2026-08-14', '119', 'X DKV 2', 'Hadir', '', 0),
(1933, '2026-08-14', '120', 'X DKV 2', 'Hadir', '', 0),
(1934, '2026-08-14', '121', 'X DKV 2', 'Hadir', '', 0),
(1935, '2026-08-14', '122', 'X DKV 2', 'Hadir', '', 0),
(1936, '2026-08-14', '123', 'X DKV 2', 'Hadir', '', 0),
(1937, '2026-08-14', '124', 'X DKV 2', 'Hadir', '', 0),
(1938, '2026-08-14', '125', 'X DKV 2', 'Hadir', '', 0),
(1939, '2026-08-14', '126', 'X DKV 2', 'Hadir', '', 0),
(1940, '2026-08-14', '127', 'X DKV 2', 'Hadir', '', 0),
(1941, '2026-08-14', '128', 'X DKV 2', 'Hadir', '', 0),
(1942, '2026-08-14', '129', 'X DKV 2', 'Hadir', '', 0),
(1943, '2026-08-14', '130', 'X DKV 2', 'Hadir', '', 0),
(1944, '2026-08-14', '131', 'X DKV 2', 'Hadir', '', 0),
(1945, '2026-08-14', '132', 'X DKV 2', 'Hadir', '', 0),
(1946, '2026-08-14', '133', 'X DKV 2', 'Hadir', '', 0),
(1947, '2026-08-14', '134', 'X DKV 2', 'Hadir', '', 0),
(1948, '2026-08-14', '135', 'X DKV 2', 'Hadir', '', 0),
(1949, '2026-08-14', '136', 'X DKV 2', 'Hadir', '', 0),
(1950, '2026-08-14', '137', 'X DKV 2', 'Hadir', '', 0),
(1951, '2026-08-14', '138', 'X DKV 2', 'Hadir', '', 0),
(1952, '2026-08-14', '139', 'X DKV 2', 'Hadir', '', 0),
(1953, '2026-08-14', '140', 'X DKV 2', 'Hadir', '', 0),
(1954, '2026-08-14', '141', 'X DKV 2', 'Hadir', '', 0),
(1955, '2026-08-14', '142', 'X DKV 2', 'Hadir', '', 0),
(1956, '2026-08-14', '143', 'X DKV 2', 'Hadir', '', 0),
(1990, '2026-08-17', '111', 'X DKV 2', 'Hadir', '', 0),
(1991, '2026-08-17', '112', 'X DKV 2', 'Hadir', '', 0),
(1992, '2026-08-17', '113', 'X DKV 2', 'Hadir', '', 0),
(1993, '2026-08-17', '114', 'X DKV 2', 'Hadir', '', 0),
(1994, '2026-08-17', '115', 'X DKV 2', 'Hadir', '', 0),
(1995, '2026-08-17', '116', 'X DKV 2', 'Izin', '', 0),
(1996, '2026-08-17', '117', 'X DKV 2', 'Hadir', '', 0),
(1997, '2026-08-17', '118', 'X DKV 2', 'Hadir', '', 0),
(1998, '2026-08-17', '119', 'X DKV 2', 'Izin', '', 0),
(1999, '2026-08-17', '120', 'X DKV 2', 'Hadir', '', 0),
(2000, '2026-08-17', '121', 'X DKV 2', 'Hadir', '', 0),
(2001, '2026-08-17', '122', 'X DKV 2', 'Hadir', '', 0),
(2002, '2026-08-17', '123', 'X DKV 2', 'Alfa', '', 0),
(2003, '2026-08-17', '124', 'X DKV 2', 'Hadir', '', 0),
(2004, '2026-08-17', '125', 'X DKV 2', 'Hadir', '', 0),
(2005, '2026-08-17', '126', 'X DKV 2', 'Hadir', '', 0),
(2006, '2026-08-17', '127', 'X DKV 2', 'Hadir', '', 0),
(2007, '2026-08-17', '128', 'X DKV 2', 'Hadir', '', 0),
(2008, '2026-08-17', '129', 'X DKV 2', 'Hadir', '', 0),
(2009, '2026-08-17', '130', 'X DKV 2', 'Hadir', '', 0),
(2010, '2026-08-17', '131', 'X DKV 2', 'Hadir', '', 0),
(2011, '2026-08-17', '132', 'X DKV 2', 'Hadir', '', 0),
(2012, '2026-08-17', '133', 'X DKV 2', 'Hadir', '', 0),
(2013, '2026-08-17', '134', 'X DKV 2', 'Hadir', '', 0),
(2014, '2026-08-17', '135', 'X DKV 2', 'Hadir', '', 0),
(2015, '2026-08-17', '136', 'X DKV 2', 'Hadir', '', 0),
(2016, '2026-08-17', '137', 'X DKV 2', 'Hadir', '', 0),
(2017, '2026-08-17', '138', 'X DKV 2', 'Hadir', '', 0),
(2018, '2026-08-17', '139', 'X DKV 2', 'Hadir', '', 0),
(2019, '2026-08-17', '140', 'X DKV 2', 'Hadir', '', 0),
(2020, '2026-08-17', '141', 'X DKV 2', 'Hadir', '', 0),
(2021, '2026-08-17', '142', 'X DKV 2', 'Hadir', '', 0),
(2022, '2026-08-17', '143', 'X DKV 2', 'Hadir', '', 0),
(2023, '2026-08-18', '111', 'X DKV 2', 'Hadir', '', 0),
(2024, '2026-08-18', '112', 'X DKV 2', 'Hadir', '', 0);
INSERT INTO `kehadiran` (`id`, `tanggal`, `nis`, `kelas`, `status`, `keterangan`, `terlambat`) VALUES
(2025, '2026-08-18', '113', 'X DKV 2', 'Hadir', '', 0),
(2026, '2026-08-18', '114', 'X DKV 2', 'Hadir', '', 0),
(2027, '2026-08-18', '115', 'X DKV 2', 'Hadir', '', 0),
(2028, '2026-08-18', '116', 'X DKV 2', 'Hadir', '', 0),
(2029, '2026-08-18', '117', 'X DKV 2', 'Hadir', '', 0),
(2030, '2026-08-18', '118', 'X DKV 2', 'Hadir', '', 0),
(2031, '2026-08-18', '119', 'X DKV 2', 'Hadir', '', 0),
(2032, '2026-08-18', '120', 'X DKV 2', 'Hadir', '', 0),
(2033, '2026-08-18', '121', 'X DKV 2', 'Hadir', '', 0),
(2034, '2026-08-18', '122', 'X DKV 2', 'Hadir', '', 0),
(2035, '2026-08-18', '123', 'X DKV 2', 'Hadir', '', 0),
(2036, '2026-08-18', '124', 'X DKV 2', 'Hadir', '', 0),
(2037, '2026-08-18', '125', 'X DKV 2', 'Hadir', '', 0),
(2038, '2026-08-18', '126', 'X DKV 2', 'Hadir', '', 0),
(2039, '2026-08-18', '127', 'X DKV 2', 'Hadir', '', 0),
(2040, '2026-08-18', '128', 'X DKV 2', 'Hadir', '', 0),
(2041, '2026-08-18', '129', 'X DKV 2', 'Hadir', '', 0),
(2042, '2026-08-18', '130', 'X DKV 2', 'Hadir', '', 0),
(2043, '2026-08-18', '131', 'X DKV 2', 'Hadir', '', 0),
(2044, '2026-08-18', '132', 'X DKV 2', 'Hadir', '', 0),
(2045, '2026-08-18', '133', 'X DKV 2', 'Hadir', '', 0),
(2046, '2026-08-18', '134', 'X DKV 2', 'Hadir', '', 0),
(2047, '2026-08-18', '135', 'X DKV 2', 'Hadir', '', 0),
(2048, '2026-08-18', '136', 'X DKV 2', 'Hadir', '', 0),
(2049, '2026-08-18', '137', 'X DKV 2', 'Hadir', '', 0),
(2050, '2026-08-18', '138', 'X DKV 2', 'Hadir', '', 0),
(2051, '2026-08-18', '139', 'X DKV 2', 'Hadir', '', 0),
(2052, '2026-08-18', '140', 'X DKV 2', 'Hadir', '', 0),
(2053, '2026-08-18', '141', 'X DKV 2', 'Hadir', '', 0),
(2054, '2026-08-18', '142', 'X DKV 2', 'Hadir', '', 0),
(2055, '2026-08-18', '143', 'X DKV 2', 'Hadir', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kkm`
--

CREATE TABLE `kkm` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nilai_kkm` decimal(5,2) DEFAULT 75.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan_rumah`
--

CREATE TABLE `kunjungan_rumah` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nama_siswa` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `hasil` text DEFAULT NULL,
  `tindak_lanjut` varchar(255) DEFAULT NULL,
  `petugas` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_kerusakan`
--

CREATE TABLE `laporan_kerusakan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(150) DEFAULT NULL,
  `kerusakan` text DEFAULT NULL,
  `pelapor` varchar(150) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `jadwal_maintenance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(11) NOT NULL,
  `waktu` datetime DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `aksi` varchar(100) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `waktu`, `username`, `role`, `aksi`, `detail`) VALUES
(1, '2026-07-25 14:13:55', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(2, '2026-07-25 14:14:09', 'walas7a', 'Walikelas', 'LOGIN', 'Masuk'),
(3, '2026-07-25 14:37:13', 'walas7a', 'Walikelas', 'LOGOUT', ''),
(4, '2026-07-25 14:37:22', 'walas7a', 'Walikelas', 'LOGIN', 'Masuk'),
(5, '2026-07-25 14:38:51', '', '', 'ISI_KEHADIRAN', '2026-07-26'),
(6, '2026-07-25 14:38:52', 'walas7a', 'Walikelas', 'ISI_KEHADIRAN', '2026-07-26'),
(7, '2026-07-25 14:39:54', 'walas7a', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(8, '2026-07-25 14:40:21', 'walas7a', 'Walikelas', 'LOGOUT', ''),
(9, '2026-07-25 15:03:36', 'walas7a', 'Walikelas', 'LOGIN', 'Masuk'),
(10, '2026-07-25 15:03:58', '', '', 'ISI_KEHADIRAN', '2026-07-26'),
(11, '2026-07-25 15:03:59', 'walas7a', 'Walikelas', 'ISI_KEHADIRAN', '2026-07-26'),
(12, '2026-07-25 21:21:42', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(13, '2026-07-25 21:22:10', 'walas7a', 'Walikelas', 'LOGIN', 'Masuk'),
(14, '2026-07-25 21:23:04', '', '', 'ISI_KEHADIRAN', '2026-07-25'),
(15, '2026-07-25 21:23:05', 'walas7a', 'Walikelas', 'ISI_KEHADIRAN', '2026-07-25'),
(16, '2026-07-25 21:23:35', '', '', 'ISI_KEHADIRAN', '2026-07-26'),
(17, '2026-07-25 21:27:17', 'walas7a', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(18, '2026-07-25 22:49:24', 'walas7a', 'Walikelas', 'LOGOUT', ''),
(19, '2026-07-25 22:52:15', 'rofiq', 'Walikelas', 'LOGIN', 'Masuk'),
(20, '2026-07-25 23:01:17', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(21, '2026-07-25 23:02:30', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(22, '2026-07-26 00:04:22', 'rofiq', 'Walikelas', 'LOGIN', 'Masuk'),
(23, '2026-07-26 00:04:59', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(24, '2026-07-26 00:14:25', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(25, '2026-07-26 00:21:03', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(26, '2026-07-26 00:21:18', 'admin', 'SuperAdmin', 'LOGIN', 'Masuk'),
(27, '2026-07-26 00:23:04', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(28, '2026-07-26 00:23:12', 'adam', 'Guru', 'LOGIN', 'Masuk'),
(29, '2026-07-26 00:42:58', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(30, '2026-07-26 00:44:27', 'rofiq', 'Guru', 'LOGOUT', ''),
(31, '2026-07-26 00:44:36', 'admin', 'SuperAdmin', 'LOGIN', 'Masuk'),
(32, '2026-07-26 00:45:05', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(33, '2026-07-26 00:45:15', 'anggun', 'Walikelas', 'LOGIN', 'Masuk'),
(34, '2026-07-26 00:45:45', '', '', 'HAPUS_SISWA', '2425106281'),
(35, '2026-07-26 00:46:23', '', '', 'TAMBAH_SISWA', 'ABDI PRANANTA'),
(36, '2026-07-26 00:46:33', 'anggun', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(37, '2026-07-26 00:47:13', 'anggun', 'Guru', 'LOGOUT', ''),
(38, '2026-07-26 01:29:22', 'adam', 'Guru', 'LOGOUT', ''),
(39, '2026-07-26 02:13:55', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(40, '2026-07-26 02:14:59', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(41, '2026-07-26 02:16:04', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(42, '2026-07-26 04:18:44', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(43, '2026-07-26 04:19:11', '111', 'Siswa', 'LOGOUT', ''),
(44, '2026-07-26 05:03:01', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(45, '2026-07-26 05:14:32', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(46, '2026-07-26 05:15:18', '111', 'Siswa', 'LOGOUT', ''),
(47, '2026-07-26 05:18:21', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(48, '2026-07-26 05:27:33', 'rofiq', 'Guru', 'LOGOUT', ''),
(49, '2026-07-26 06:30:33', 'bendahara', 'Bendahara', 'LOGOUT', ''),
(50, '2026-07-26 06:31:15', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(51, '2026-07-26 06:35:17', 'bendahara', 'Bendahara', 'LOGOUT', ''),
(52, '2026-07-26 07:19:18', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(53, '2026-07-26 07:19:43', '2425106281', 'Siswa', 'LOGOUT', ''),
(54, '2026-07-26 09:13:38', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(55, '2026-07-26 09:18:15', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(56, '2026-07-26 09:30:27', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(57, '2026-07-26 09:30:40', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(58, '2026-07-26 09:37:48', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(59, '2026-07-26 09:42:02', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(60, '2026-07-26 09:42:25', 'hamid', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(61, '2026-07-26 09:44:22', 'hamid', 'Guru', 'LOGOUT', ''),
(62, '2026-07-26 09:47:28', 'rofiq', 'Guru', 'LOGOUT', ''),
(63, '2026-07-26 09:48:08', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(64, '2026-07-26 09:50:57', 'isna', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(65, '2026-07-26 09:52:31', 'isna', 'Guru', 'LOGOUT', ''),
(66, '2026-07-26 09:52:48', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(67, '2026-07-26 09:56:03', 'rofiq', 'Guru', 'LOGOUT', ''),
(68, '2026-07-26 09:56:23', 'umy', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(69, '2026-07-26 10:13:44', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(70, '2026-07-26 10:13:59', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(71, '2026-07-26 10:15:22', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(72, '2026-07-26 10:16:16', '118', 'Siswa', 'LOGOUT', ''),
(73, '2026-07-26 10:26:22', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(74, '2026-07-26 10:27:45', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(75, '2026-07-26 10:31:01', '111', 'Siswa', 'LOGOUT', ''),
(76, '2026-07-26 10:45:56', 'umy', 'Guru', 'LOGOUT', ''),
(77, '2026-07-26 10:50:24', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(78, '2026-07-26 10:53:08', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(79, '2026-07-26 10:53:59', 'hamid', 'Walikelas', 'LOGOUT', ''),
(80, '2026-07-26 18:04:52', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(81, '2026-07-26 19:16:27', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(82, '2026-07-26 19:21:16', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(83, '2026-07-27 05:34:24', 'rofiq', 'Guru', 'LOGOUT', ''),
(84, '2026-07-27 05:49:23', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(85, '2026-07-27 06:16:09', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(86, '2026-07-27 06:17:51', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(87, '2026-07-27 09:34:31', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(88, '2026-07-27 09:47:27', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(89, '2026-07-27 11:08:20', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(90, '2026-07-27 17:02:17', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(91, '2026-07-27 17:02:47', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(92, '2026-07-27 17:58:34', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(93, '2026-07-27 19:03:54', 'rofiq', 'Guru', 'LOGOUT', ''),
(94, '2026-07-28 08:20:24', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(95, '2026-07-28 08:26:47', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(96, '2026-07-28 08:48:54', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(97, '2026-07-28 08:49:40', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(98, '2026-07-28 08:58:16', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(99, '2026-07-28 09:01:55', 'rofiq', 'Guru', 'LOGOUT', ''),
(100, '2026-07-28 09:03:21', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(101, '2026-07-28 09:04:19', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(102, '2026-07-28 09:04:43', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(103, '2026-07-28 09:07:28', 'rofiq', 'Guru', 'LOGOUT', ''),
(104, '2026-07-28 09:09:14', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(105, '2026-07-28 09:10:20', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(106, '2026-07-28 09:11:42', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(107, '2026-07-28 09:35:17', 'rofiq', 'Guru', 'LOGOUT', ''),
(108, '2026-07-28 09:46:29', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(109, '2026-07-28 09:54:58', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(110, '2026-07-28 09:55:28', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(111, '2026-07-28 17:08:04', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(112, '2026-07-28 17:08:32', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(113, '2026-07-28 17:11:55', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(114, '2026-07-28 17:58:32', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(115, '2026-07-28 18:12:28', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(116, '2026-07-28 18:15:40', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(117, '2026-07-28 19:02:46', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(118, '2026-07-28 19:47:46', 'rofiq', 'Guru', 'LOGOUT', ''),
(119, '2026-07-28 19:51:21', 'herlita', 'Walikelas', 'LOGOUT', ''),
(120, '2026-07-29 08:37:46', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(121, '2026-07-29 08:38:14', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(122, '2026-07-29 10:13:59', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(123, '2026-07-29 10:20:32', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(124, '2026-07-29 11:15:44', 'rofiq', 'Guru', 'LOGOUT', ''),
(125, '2026-07-29 11:18:58', 'umy', 'Walikelas', 'LOGOUT', ''),
(126, '2026-07-29 11:20:13', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(127, '2026-07-29 11:21:17', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(128, '2026-07-29 11:22:29', 'adam', 'Guru', 'LOGOUT', ''),
(129, '2026-07-29 11:24:05', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(130, '2026-07-29 11:24:59', 'umy', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(131, '2026-07-29 16:31:45', 'umy', 'Guru', 'LOGOUT', ''),
(132, '2026-07-29 17:21:01', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(133, '2026-07-29 17:21:34', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(134, '2026-07-29 17:41:00', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(135, '2026-07-29 17:43:51', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(136, '2026-07-29 17:44:56', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(137, '2026-07-29 19:15:03', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(138, '2026-07-29 19:45:04', 'rofiq', 'Guru', 'LOGOUT', ''),
(139, '2026-07-29 19:50:00', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(140, '2026-07-29 20:08:51', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(141, '2026-07-29 21:08:50', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(142, '2026-07-29 21:09:42', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(143, '2026-07-29 23:32:28', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(144, '2026-07-29 23:32:49', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(145, '2026-07-29 23:52:02', 'rofiq', 'Guru', 'LOGOUT', ''),
(146, '2026-07-30 00:32:40', 'rofiq', 'Guru', 'LOGOUT', ''),
(147, '2026-07-30 00:33:07', 'rofiq', 'Guru', 'LOGOUT', ''),
(148, '2026-07-30 00:33:22', '111', 'Siswa', 'LOGOUT', ''),
(149, '2026-07-30 00:33:47', '111', 'Siswa', 'LOGOUT', ''),
(150, '2026-07-30 00:34:06', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(151, '2026-07-30 00:36:06', '112', 'Siswa', 'LOGOUT', ''),
(152, '2026-07-30 00:52:05', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(153, '2026-07-30 00:55:31', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(154, '2026-07-30 07:44:35', '111', 'Siswa', 'LOGOUT', ''),
(155, '2026-07-30 07:44:59', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(156, '2026-07-30 07:56:09', '112', 'Siswa', 'LOGOUT', ''),
(157, '2026-07-30 08:21:43', 'rofiq', 'Guru', 'LOGOUT', ''),
(158, '2026-07-30 08:21:55', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(159, '2026-07-30 17:09:57', '111', 'Siswa', 'LOGOUT', ''),
(160, '2026-07-30 18:17:51', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(161, '2026-07-30 19:19:15', '111', 'Siswa', 'LOGOUT', ''),
(162, '2026-07-30 20:12:25', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(163, '2026-07-30 20:12:53', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(164, '2026-07-30 20:13:01', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(165, '2026-07-30 20:38:48', 'rofiq', 'Guru', 'LOGOUT', ''),
(166, '2026-07-31 05:58:51', '111', 'Siswa', 'LOGOUT', ''),
(167, '2026-07-31 06:00:18', 'umy', 'Walikelas', 'LOGOUT', ''),
(168, '2026-07-31 06:01:31', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(169, '2026-07-31 06:03:20', 'rofiq', 'Guru', 'LOGOUT', ''),
(170, '2026-07-31 06:05:11', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(171, '2026-07-31 06:11:57', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(172, '2026-07-31 08:38:31', 'Zaskia', 'Sekretaris', 'LOGOUT', ''),
(173, '2026-07-31 08:41:22', 'umy', 'Walikelas', 'LOGOUT', ''),
(174, '2026-07-31 08:42:08', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(175, '2026-07-31 08:42:08', 'Zaskia', 'Sekretaris', 'LOGOUT', ''),
(176, '2026-07-31 08:44:41', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(177, '2026-07-31 08:45:31', 'saskya', 'Sekretaris', 'LOGOUT', ''),
(178, '2026-07-31 08:45:34', '111', 'Siswa', 'LOGOUT', ''),
(179, '2026-07-31 08:46:17', 'umy', 'Walikelas', 'LOGOUT', ''),
(180, '2026-07-31 08:47:58', 'umy', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(181, '2026-07-31 08:52:44', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(182, '2026-07-31 10:55:49', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(183, '2026-07-31 10:56:46', 'rofiq', 'Guru', 'LOGOUT', ''),
(184, '2026-07-31 10:57:21', '111', 'Siswa', 'LOGOUT', ''),
(185, '2026-07-31 10:57:51', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(186, '2026-07-31 10:58:39', 'rofiq', 'Guru', 'LOGOUT', ''),
(187, '2026-07-31 10:58:56', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(188, '2026-07-31 11:01:13', '111', 'Siswa', 'LOGOUT', ''),
(189, '2026-07-31 11:02:15', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(190, '2026-08-01 12:59:26', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(191, '2026-08-01 12:59:36', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(192, '2026-08-01 13:00:22', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(193, '2026-08-01 13:47:19', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(194, '2026-08-01 13:47:40', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(195, '2026-08-02 06:17:22', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(196, '2026-08-02 08:18:12', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(197, '2026-08-02 09:25:02', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(198, '2026-08-02 09:46:09', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(199, '2026-08-02 09:47:29', 'rofiq', 'Guru', 'LOGOUT', ''),
(200, '2026-08-02 09:48:25', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(201, '2026-08-02 09:49:40', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(202, '2026-08-02 09:50:48', 'cek', 'Walikelas', 'LOGOUT', ''),
(203, '2026-08-02 10:18:50', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(204, '2026-08-02 10:19:14', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(205, '2026-08-02 10:27:33', 'rofiq', 'Guru', 'LOGOUT', ''),
(206, '2026-08-02 10:27:47', '999', 'Siswa', 'LOGOUT', ''),
(207, '2026-08-02 10:28:05', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(208, '2026-08-02 11:13:36', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(209, '2026-08-02 11:20:11', 'rofiq', 'Guru', 'LOGOUT', ''),
(210, '2026-08-02 11:21:52', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(211, '2026-08-02 11:23:28', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(212, '2026-08-02 11:31:10', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(213, '2026-08-02 11:31:25', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(214, '2026-08-02 11:56:51', '111', 'Siswa', 'LOGOUT', ''),
(215, '2026-08-02 12:00:09', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(216, '2026-08-02 12:10:30', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(217, '2026-08-02 12:14:38', 'rofiq', 'Guru', 'LOGOUT', ''),
(218, '2026-08-02 12:25:42', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(219, '2026-08-02 12:25:57', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(220, '2026-08-02 19:52:33', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(221, '2026-08-02 19:52:49', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(222, '2026-08-02 19:53:17', 'rofiq', 'Guru', 'LOGOUT', ''),
(223, '2026-08-02 19:54:03', '111', 'Siswa', 'LOGOUT', ''),
(224, '2026-08-02 19:56:34', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(225, '2026-08-02 22:37:25', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(226, '2026-08-02 22:37:41', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(227, '2026-08-03 05:25:19', '112', 'Siswa', 'LOGOUT', ''),
(228, '2026-08-03 05:25:38', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(229, '2026-08-03 06:09:36', 'rofiq', 'Guru', 'LOGOUT', ''),
(230, '2026-08-03 06:10:44', '111', 'Siswa', 'LOGOUT', ''),
(231, '2026-08-03 06:11:09', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(232, '2026-08-03 06:11:53', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(233, '2026-08-03 06:17:57', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(234, '2026-08-03 10:40:02', 'rofiq', 'Guru', 'LOGOUT', ''),
(235, '2026-08-03 10:44:06', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(236, '2026-08-03 10:45:34', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(237, '2026-08-03 10:48:38', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(238, '2026-08-03 11:15:13', '111', 'Siswa', 'LOGOUT', ''),
(239, '2026-08-03 11:22:24', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(240, '2026-08-03 11:28:01', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(241, '2026-08-03 11:28:54', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(242, '2026-08-03 11:35:51', '112', 'Siswa', 'LOGOUT', ''),
(243, '2026-08-03 12:02:35', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(244, '2026-08-03 12:02:52', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(245, '2026-08-03 12:10:37', 'rofiq', 'Guru', 'LOGOUT', ''),
(246, '2026-08-03 12:13:57', '111', 'Siswa', 'LOGOUT', ''),
(247, '2026-08-03 12:14:14', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(248, '2026-08-03 18:27:34', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(249, '2026-08-03 18:28:49', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(250, '2026-08-03 18:29:09', 'rofiq', 'Guru', 'LOGOUT', ''),
(251, '2026-08-03 18:30:50', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(252, '2026-08-03 18:31:59', 'Alivia', 'Sekretaris', 'LOGOUT', ''),
(253, '2026-08-04 05:53:41', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(254, '2026-08-04 06:21:23', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(255, '2026-08-04 06:34:15', 'umy', 'Walikelas', 'LOGOUT', ''),
(256, '2026-08-04 06:56:31', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(257, '2026-08-04 08:00:55', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(258, '2026-08-04 09:11:06', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(259, '2026-08-04 09:12:33', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(260, '2026-08-04 09:24:38', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(261, '2026-08-04 09:24:52', 'rofiq', 'Guru', 'LOGOUT', ''),
(262, '2026-08-04 09:25:37', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(263, '2026-08-04 09:32:43', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(264, '2026-08-04 09:33:31', 'rofiq', 'Guru', 'LOGOUT', ''),
(265, '2026-08-04 19:36:35', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(266, '2026-08-05 00:23:39', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(267, '2026-08-05 01:26:16', 'rofiq', 'Guru', 'LOGOUT', ''),
(268, '2026-08-05 01:28:02', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(269, '2026-08-05 01:28:24', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(270, '2026-08-05 08:47:26', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(271, '2026-08-05 08:54:15', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(272, '2026-08-05 08:54:29', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(273, '2026-08-05 08:58:14', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(274, '2026-08-05 09:25:48', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(275, '2026-08-05 09:25:58', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(276, '2026-08-05 09:26:15', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(277, '2026-08-05 09:26:45', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(278, '2026-08-05 09:30:34', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(279, '2026-08-05 09:45:15', '111', 'Siswa', 'LOGOUT', ''),
(280, '2026-08-05 10:19:00', '111', 'Siswa', 'LOGOUT', ''),
(281, '2026-08-05 10:28:01', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(282, '2026-08-05 10:30:55', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(283, '2026-08-05 10:36:09', 'rofiq', 'Guru', 'LOGOUT', ''),
(284, '2026-08-05 10:37:15', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(285, '2026-08-05 10:41:29', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(286, '2026-08-05 10:42:06', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(287, '2026-08-05 10:46:24', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(288, '2026-08-05 18:42:40', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(289, '2026-08-05 18:43:54', 'rofiq', 'Guru', 'LOGOUT', ''),
(290, '2026-08-05 18:44:35', '111', 'Siswa', 'LOGOUT', ''),
(291, '2026-08-05 18:45:26', 'rofiq', 'Walikelas', 'LOGOUT', ''),
(292, '2026-08-06 00:10:17', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(293, '2026-08-06 00:10:50', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(294, '2026-08-06 16:34:54', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(295, '2026-08-06 19:08:09', 'umy', 'Guru', 'LOGOUT', ''),
(296, '2026-08-06 19:20:00', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(297, '2026-08-07 10:55:29', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(298, '2026-08-07 10:59:27', 'rofiq', 'Guru', 'LOGOUT', ''),
(299, '2026-08-07 11:05:25', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru');
INSERT INTO `log_aktivitas` (`id`, `waktu`, `username`, `role`, `aksi`, `detail`) VALUES
(300, '2026-08-07 11:07:12', 'rofiq', 'Guru', 'LOGOUT', ''),
(301, '2026-08-07 11:09:19', 'sekretaris', 'Sekretaris', 'LOGOUT', ''),
(302, '2026-08-07 11:10:15', 'bendahara', 'Bendahara', 'LOGOUT', ''),
(303, '2026-08-07 11:10:44', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(304, '2026-08-07 11:13:39', 'rofiq', 'Guru', 'LOGOUT', ''),
(305, '2026-08-07 11:14:40', '111', 'Siswa', 'LOGOUT', ''),
(306, '2026-08-07 11:16:03', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(307, '2026-08-09 18:01:56', 'rofiq', 'Guru', 'LOGOUT', ''),
(308, '2026-08-09 22:10:33', 'rofiq', 'Guru', 'SWITCH_ROLE', 'Ke Guru'),
(309, '2026-08-10 00:02:33', 'admin', 'SuperAdmin', 'LOGOUT', ''),
(310, '2026-08-10 00:08:20', 'rofiq', 'Walikelas', 'SWITCH_ROLE', 'Ke Walikelas'),
(311, '2026-08-10 01:15:13', 'umy', 'Walikelas', 'LOGOUT', ''),
(312, '2026-08-12 06:09:34', 'umy', 'Walikelas', 'LOGOUT', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `bab` varchar(100) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `jenis` varchar(40) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ket` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul_ajar`
--

CREATE TABLE `modul_ajar` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `jenis` varchar(40) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ket` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id`, `nis`, `kelas`, `nip`, `mapel`, `jenis`, `nilai`, `tanggal`) VALUES
(1, '2627108063', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(2, '2627108064', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(3, '2627108065', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(4, '2627108056', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(5, '2627108067', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(6, '2627108068', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(7, '2627108069', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(8, '2627108070', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(9, '2627108071', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(10, '2627108072', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(11, '2627108073', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(12, '2627108075', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(13, '2627108076', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(14, '2627108077', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(15, '2627108078', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(16, '2627108079', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(17, '2627108080', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(18, '2627108081', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(19, '2627108082', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(20, '2627108083', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(21, '2627108084', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(22, '2627108085', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(23, '2627108086', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(24, '2627108087', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(25, '2627108088', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(26, '2627108089', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(27, '2627108090', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(28, '2627108091', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(29, '2627108092', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(30, '2627108093', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(31, '2627108094', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(32, '2627108095', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(33, '2627108096', 'X DKV 1', 'rofiq', 'SKIL', 'NH1', '80.00', '2026-07-29'),
(66, '2627108130', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(67, '2627108132', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(68, '2627108133', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(69, '2627108134', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(70, '2627108135', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(71, '2627108137', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(72, '2627108138', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(73, '2627108139', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(74, '2627108140', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(75, '2627108141', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(76, '2627108142', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(77, '2627108143', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(78, '2627108144', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(79, '2627108145', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(80, '2627108146', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(81, '2627108147', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(82, '2627108148', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(83, '2627108149', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(84, '2627108150', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(85, '2627108151', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(86, '2627108153', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(87, '2627108154', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(88, '2627108155', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(89, '2627108156', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(90, '2627108157', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(91, '2627108158', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(92, '2627108159', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(93, '2627108160', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(94, '2627108161', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(95, '2627108162', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(96, '2627108164', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(97, '2627108165', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(98, '2627108166', 'X PSPT', 'rofiq', 'KKA (KODING)', 'NH1', '80.00', '2026-08-03'),
(134, '2425106199', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '75.00', '2026-08-06'),
(135, '2425106202', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '80.00', '2026-08-06'),
(136, '2425106209', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '80.00', '2026-08-06'),
(137, '2425106210', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '80.00', '2026-08-06'),
(138, '2425106213', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '85.00', '2026-08-06'),
(139, '2425106218', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '75.00', '2026-08-06'),
(140, '2425106220', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '80.00', '2026-08-06'),
(141, '2425106222', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '80.00', '2026-08-06'),
(142, '2425106223', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '75.00', '2026-08-06'),
(143, '2425106228', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '80.00', '2026-08-06'),
(144, '2425106230', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '85.00', '2026-08-06'),
(145, '2425106232', 'XII DKV 1', 'rofiq', 'KOMTYPE', 'NH1', '75.00', '2026-08-06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_pinjam` varchar(50) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(150) DEFAULT NULL,
  `peminjam` varchar(150) DEFAULT NULL,
  `jenis_peminjam` varchar(50) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `batas_waktu` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumpulan`
--

CREATE TABLE `pengumpulan` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `file_url` text DEFAULT NULL,
  `teks` text DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `tgl_kumpul` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `penulis` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `portofolio`
--

CREATE TABLE `portofolio` (
  `id` int(11) NOT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `jenis` varchar(40) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_guru`
--

CREATE TABLE `presensi_guru` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_masuk` varchar(10) DEFAULT NULL,
  `jam_selesai` varchar(10) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_mapel`
--

CREATE TABLE `presensi_mapel` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `jam_ke` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `presensi_mapel`
--

INSERT INTO `presensi_mapel` (`id`, `tanggal`, `kelas`, `nis`, `nip`, `mapel`, `status`, `jam_ke`, `created_at`, `updated_at`) VALUES
(1, '2026-07-24', 'X DKV 2', '111', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(2, '2026-07-24', 'X DKV 2', '112', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(3, '2026-07-24', 'X DKV 2', '113', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(4, '2026-07-24', 'X DKV 2', '114', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(5, '2026-07-24', 'X DKV 2', '115', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(6, '2026-07-24', 'X DKV 2', '116', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(7, '2026-07-24', 'X DKV 2', '117', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(8, '2026-07-24', 'X DKV 2', '118', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(9, '2026-07-24', 'X DKV 2', '119', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(10, '2026-07-24', 'X DKV 2', '120', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(11, '2026-07-24', 'X DKV 2', '121', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(12, '2026-07-24', 'X DKV 2', '122', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(13, '2026-07-24', 'X DKV 2', '123', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(14, '2026-07-24', 'X DKV 2', '124', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(15, '2026-07-24', 'X DKV 2', '125', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(16, '2026-07-24', 'X DKV 2', '126', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(17, '2026-07-24', 'X DKV 2', '127', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(18, '2026-07-24', 'X DKV 2', '128', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(19, '2026-07-24', 'X DKV 2', '129', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(20, '2026-07-24', 'X DKV 2', '130', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(21, '2026-07-24', 'X DKV 2', '131', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(22, '2026-07-24', 'X DKV 2', '132', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(23, '2026-07-24', 'X DKV 2', '133', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(24, '2026-07-24', 'X DKV 2', '134', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(25, '2026-07-24', 'X DKV 2', '135', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(26, '2026-07-24', 'X DKV 2', '136', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(27, '2026-07-24', 'X DKV 2', '137', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(28, '2026-07-24', 'X DKV 2', '138', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(29, '2026-07-24', 'X DKV 2', '139', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(30, '2026-07-24', 'X DKV 2', '140', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(31, '2026-07-24', 'X DKV 2', '141', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(32, '2026-07-24', 'X DKV 2', '142', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(33, '2026-07-24', 'X DKV 2', '143', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(34, '2026-07-27', 'X DKV 1', '2627108063', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(35, '2026-07-27', 'X DKV 1', '2627108064', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(36, '2026-07-27', 'X DKV 1', '2627108065', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(37, '2026-07-27', 'X DKV 1', '2627108056', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(38, '2026-07-27', 'X DKV 1', '2627108067', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(39, '2026-07-27', 'X DKV 1', '2627108068', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(40, '2026-07-27', 'X DKV 1', '2627108069', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(41, '2026-07-27', 'X DKV 1', '2627108070', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(42, '2026-07-27', 'X DKV 1', '2627108071', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(43, '2026-07-27', 'X DKV 1', '2627108072', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(44, '2026-07-27', 'X DKV 1', '2627108073', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(45, '2026-07-27', 'X DKV 1', '2627108074', 'rofiq', 'SKIL', 'Izin', NULL, NULL, NULL),
(46, '2026-07-27', 'X DKV 1', '2627108075', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(47, '2026-07-27', 'X DKV 1', '2627108076', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(48, '2026-07-27', 'X DKV 1', '2627108077', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(49, '2026-07-27', 'X DKV 1', '2627108078', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(50, '2026-07-27', 'X DKV 1', '2627108079', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(51, '2026-07-27', 'X DKV 1', '2627108080', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(52, '2026-07-27', 'X DKV 1', '2627108081', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(53, '2026-07-27', 'X DKV 1', '2627108082', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(54, '2026-07-27', 'X DKV 1', '2627108083', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(55, '2026-07-27', 'X DKV 1', '2627108084', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(56, '2026-07-27', 'X DKV 1', '2627108085', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(57, '2026-07-27', 'X DKV 1', '2627108086', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(58, '2026-07-27', 'X DKV 1', '2627108087', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(59, '2026-07-27', 'X DKV 1', '2627108088', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(60, '2026-07-27', 'X DKV 1', '2627108089', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(61, '2026-07-27', 'X DKV 1', '2627108090', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(62, '2026-07-27', 'X DKV 1', '2627108091', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(63, '2026-07-27', 'X DKV 1', '2627108092', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(64, '2026-07-27', 'X DKV 1', '2627108093', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(65, '2026-07-27', 'X DKV 1', '2627108094', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(66, '2026-07-27', 'X DKV 1', '2627108095', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(67, '2026-07-27', 'X DKV 1', '2627108096', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(106, '2026-07-27', 'X PSPT', '0', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(107, '2026-07-27', 'X PSPT', '2627108130', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(108, '2026-07-27', 'X PSPT', '2627108131', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(109, '2026-07-27', 'X PSPT', '2627108132', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(110, '2026-07-27', 'X PSPT', '2627108133', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(111, '2026-07-27', 'X PSPT', '2627108134', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(112, '2026-07-27', 'X PSPT', '2627108135', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(113, '2026-07-27', 'X PSPT', '2627108136', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(114, '2026-07-27', 'X PSPT', '2627108137', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(115, '2026-07-27', 'X PSPT', '2627108138', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(116, '2026-07-27', 'X PSPT', '2627108139', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(117, '2026-07-27', 'X PSPT', '2627108140', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(118, '2026-07-27', 'X PSPT', '2627108141', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(119, '2026-07-27', 'X PSPT', '2627108142', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(120, '2026-07-27', 'X PSPT', '2627108143', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(121, '2026-07-27', 'X PSPT', '2627108144', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(122, '2026-07-27', 'X PSPT', '2627108145', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(123, '2026-07-27', 'X PSPT', '2627108146', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(124, '2026-07-27', 'X PSPT', '2627108147', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(125, '2026-07-27', 'X PSPT', '2627108148', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(126, '2026-07-27', 'X PSPT', '2627108149', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(127, '2026-07-27', 'X PSPT', '2627108150', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(128, '2026-07-27', 'X PSPT', '2627108151', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(129, '2026-07-27', 'X PSPT', '2627108152', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(130, '2026-07-27', 'X PSPT', '2627108153', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(131, '2026-07-27', 'X PSPT', '2627108154', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(132, '2026-07-27', 'X PSPT', '2627108155', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(133, '2026-07-27', 'X PSPT', '2627108156', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(134, '2026-07-27', 'X PSPT', '2627108157', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(135, '2026-07-27', 'X PSPT', '2627108158', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(136, '2026-07-27', 'X PSPT', '2627108159', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(137, '2026-07-27', 'X PSPT', '2627108160', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(138, '2026-07-27', 'X PSPT', '2627108161', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(139, '2026-07-27', 'X PSPT', '2627108162', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(140, '2026-07-27', 'X PSPT', '2627108163', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(141, '2026-07-27', 'X PSPT', '2627108164', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(142, '2026-07-27', 'X PSPT', '2627108165', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(143, '2026-07-27', 'X PSPT', '2627108166', 'rofiq', 'KKA (KODING)', 'Hadir', NULL, NULL, NULL),
(144, '2026-07-27', 'X TKR 4', '2627108669', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(145, '2026-07-27', 'X TKR 4', '2627108670', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(146, '2026-07-27', 'X TKR 4', '2627108671', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(147, '2026-07-27', 'X TKR 4', '2627108672', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(148, '2026-07-27', 'X TKR 4', '2627108673', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(149, '2026-07-27', 'X TKR 4', '2627108674', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(150, '2026-07-27', 'X TKR 4', '2627108675', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(151, '2026-07-27', 'X TKR 4', '2627108676', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(152, '2026-07-27', 'X TKR 4', '2627108677', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(153, '2026-07-27', 'X TKR 4', '2627108678', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(154, '2026-07-27', 'X TKR 4', '2627108679', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(155, '2026-07-27', 'X TKR 4', '2627108680', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(156, '2026-07-27', 'X TKR 4', '2627108681', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(157, '2026-07-27', 'X TKR 4', '2627108682', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(158, '2026-07-27', 'X TKR 4', '2627108683', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(159, '2026-07-27', 'X TKR 4', '2627108684', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(160, '2026-07-27', 'X TKR 4', '2627108685', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(161, '2026-07-27', 'X TKR 4', '2627108686', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(162, '2026-07-27', 'X TKR 4', '2627108687', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(163, '2026-07-27', 'X TKR 4', '2627108688', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(164, '2026-07-27', 'X TKR 4', '2627108689', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(165, '2026-07-27', 'X TKR 4', '2627108691', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(166, '2026-07-27', 'X TKR 4', '2627108690', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(167, '2026-07-27', 'X TKR 4', '2627108692', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(168, '2026-07-27', 'X TKR 4', '2627108693', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(169, '2026-07-27', 'X TKR 4', '2627108694', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(170, '2026-07-27', 'X TKR 4', '2627108695', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(171, '2026-07-27', 'X TKR 4', '2627108696', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(172, '2026-07-27', 'X TKR 4', '2627108697', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(173, '2026-07-27', 'X TKR 4', '2627108698', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(174, '2026-07-27', 'X TKR 4', '2627108699', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(175, '2026-07-27', 'X TKR 4', '2627108700', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(176, '2026-07-27', 'X TKR 4', '2627108701', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(177, '2026-07-27', 'X TKR 4', '2627108702', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(178, '2026-07-27', 'X TKR 4', '2627108703', 'rofiq', 'PAIBP', 'Hadir', NULL, NULL, NULL),
(179, '2026-07-28', 'X DKV 1', '2627108063', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(180, '2026-07-28', 'X DKV 1', '2627108064', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(181, '2026-07-28', 'X DKV 1', '2627108065', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(182, '2026-07-28', 'X DKV 1', '2627108056', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(183, '2026-07-28', 'X DKV 1', '2627108067', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(184, '2026-07-28', 'X DKV 1', '2627108068', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(185, '2026-07-28', 'X DKV 1', '2627108069', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(186, '2026-07-28', 'X DKV 1', '2627108070', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(187, '2026-07-28', 'X DKV 1', '2627108071', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(188, '2026-07-28', 'X DKV 1', '2627108072', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(189, '2026-07-28', 'X DKV 1', '2627108073', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(190, '2026-07-28', 'X DKV 1', '2627108074', 'rofiq', 'KKA(KODING)', 'Izin', NULL, NULL, NULL),
(191, '2026-07-28', 'X DKV 1', '2627108075', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(192, '2026-07-28', 'X DKV 1', '2627108076', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(193, '2026-07-28', 'X DKV 1', '2627108077', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(194, '2026-07-28', 'X DKV 1', '2627108078', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(195, '2026-07-28', 'X DKV 1', '2627108079', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(196, '2026-07-28', 'X DKV 1', '2627108080', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(197, '2026-07-28', 'X DKV 1', '2627108081', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(198, '2026-07-28', 'X DKV 1', '2627108082', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(199, '2026-07-28', 'X DKV 1', '2627108083', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(200, '2026-07-28', 'X DKV 1', '2627108084', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(201, '2026-07-28', 'X DKV 1', '2627108085', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(202, '2026-07-28', 'X DKV 1', '2627108086', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(203, '2026-07-28', 'X DKV 1', '2627108087', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(204, '2026-07-28', 'X DKV 1', '2627108088', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(205, '2026-07-28', 'X DKV 1', '2627108089', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(206, '2026-07-28', 'X DKV 1', '2627108090', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(207, '2026-07-28', 'X DKV 1', '2627108091', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(208, '2026-07-28', 'X DKV 1', '2627108092', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(209, '2026-07-28', 'X DKV 1', '2627108093', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(210, '2026-07-28', 'X DKV 1', '2627108094', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(211, '2026-07-28', 'X DKV 1', '2627108095', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(212, '2026-07-28', 'X DKV 1', '2627108096', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(213, '2026-07-29', 'X DKV 2', '111', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(214, '2026-07-29', 'X DKV 2', '112', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(215, '2026-07-29', 'X DKV 2', '113', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(216, '2026-07-29', 'X DKV 2', '114', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(217, '2026-07-29', 'X DKV 2', '115', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(218, '2026-07-29', 'X DKV 2', '116', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(219, '2026-07-29', 'X DKV 2', '117', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(220, '2026-07-29', 'X DKV 2', '118', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(221, '2026-07-29', 'X DKV 2', '119', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(222, '2026-07-29', 'X DKV 2', '120', 'rofiq', 'KKA(KODING)', 'Sakit', NULL, NULL, NULL),
(223, '2026-07-29', 'X DKV 2', '121', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(224, '2026-07-29', 'X DKV 2', '122', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(225, '2026-07-29', 'X DKV 2', '123', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(226, '2026-07-29', 'X DKV 2', '124', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(227, '2026-07-29', 'X DKV 2', '125', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(228, '2026-07-29', 'X DKV 2', '126', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(229, '2026-07-29', 'X DKV 2', '127', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(230, '2026-07-29', 'X DKV 2', '128', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(231, '2026-07-29', 'X DKV 2', '129', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(232, '2026-07-29', 'X DKV 2', '130', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(233, '2026-07-29', 'X DKV 2', '131', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(234, '2026-07-29', 'X DKV 2', '132', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(235, '2026-07-29', 'X DKV 2', '133', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(236, '2026-07-29', 'X DKV 2', '134', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(237, '2026-07-29', 'X DKV 2', '135', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(238, '2026-07-29', 'X DKV 2', '136', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(239, '2026-07-29', 'X DKV 2', '137', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(240, '2026-07-29', 'X DKV 2', '138', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(241, '2026-07-29', 'X DKV 2', '139', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(242, '2026-07-29', 'X DKV 2', '140', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(243, '2026-07-29', 'X DKV 2', '141', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(244, '2026-07-29', 'X DKV 2', '142', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(245, '2026-07-29', 'X DKV 2', '143', 'rofiq', 'KKA(KODING)', 'Hadir', NULL, NULL, NULL),
(282, '2026-07-29', 'XI PSPT 1', '2526107258', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(283, '2026-07-29', 'XI PSPT 1', '2526107257', 'rofiq', 'Sesi Kelas', 'Sakit', NULL, NULL, NULL),
(284, '2026-07-29', 'XI PSPT 1', '2526107260', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(285, '2026-07-29', 'XI PSPT 1', '2526107261', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(286, '2026-07-29', 'XI PSPT 1', '2526107262', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(287, '2026-07-29', 'XI PSPT 1', '2526107263', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(288, '2026-07-29', 'XI PSPT 1', '2526107264', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(289, '2026-07-29', 'XI PSPT 1', '2526107265', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(290, '2026-07-29', 'XI PSPT 1', '2526107266', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(291, '2026-07-29', 'XI PSPT 1', '2526107267', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(292, '2026-07-29', 'XI PSPT 1', '2526107490', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(293, '2026-07-29', 'XI PSPT 1', '2526107268', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(294, '2026-07-29', 'XI PSPT 1', '2526107269', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(295, '2026-07-29', 'XI PSPT 1', '2526107270', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL);
INSERT INTO `presensi_mapel` (`id`, `tanggal`, `kelas`, `nis`, `nip`, `mapel`, `status`, `jam_ke`, `created_at`, `updated_at`) VALUES
(296, '2026-07-29', 'XI PSPT 1', '2526107271', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(297, '2026-07-29', 'XI PSPT 1', '2526107272', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(298, '2026-07-29', 'XI PSPT 1', '2526107273', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(299, '2026-07-29', 'XI PSPT 1', '2526107274', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(300, '2026-07-29', 'XI PSPT 1', '2526107275', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(301, '2026-07-29', 'XI PSPT 1', '2526107276', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(302, '2026-07-29', 'XI PSPT 1', '2526107277', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(303, '2026-07-29', 'XI PSPT 1', '2526107278', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(304, '2026-07-29', 'XI PSPT 1', '2526107279', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(305, '2026-07-29', 'XI PSPT 1', '2526107280', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(306, '2026-07-29', 'XI PSPT 1', '2526107281', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(307, '2026-07-29', 'XI PSPT 1', '2526107282', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(308, '2026-07-29', 'XI PSPT 1', '2526107283', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(309, '2026-07-29', 'XI PSPT 1', '2526107284', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(310, '2026-07-29', 'XI PSPT 1', '2526107285', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(311, '2026-07-29', 'XI PSPT 1', '2526107286', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(312, '2026-07-29', 'XI PSPT 1', '2526107287', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(313, '2026-07-29', 'XI PSPT 1', '2526107288', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(314, '2026-07-29', 'XI PSPT 1', '2526107289', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(315, '2026-07-29', 'XI PSPT 1', '2526107290', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(316, '2026-07-29', 'XI PSPT 1', '2526107291', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(317, '2026-07-29', 'XI PSPT 1', '2526107677', 'rofiq', 'Sesi Kelas', 'Hadir', NULL, NULL, NULL),
(318, '2026-07-29', 'XI PSPT 1', '2526107258', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(319, '2026-07-29', 'XI PSPT 1', '2526107257', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(320, '2026-07-29', 'XI PSPT 1', '2526107260', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(321, '2026-07-29', 'XI PSPT 1', '2526107261', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(322, '2026-07-29', 'XI PSPT 1', '2526107262', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(323, '2026-07-29', 'XI PSPT 1', '2526107263', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(324, '2026-07-29', 'XI PSPT 1', '2526107264', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(325, '2026-07-29', 'XI PSPT 1', '2526107265', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(326, '2026-07-29', 'XI PSPT 1', '2526107266', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(327, '2026-07-29', 'XI PSPT 1', '2526107267', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(328, '2026-07-29', 'XI PSPT 1', '2526107490', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(329, '2026-07-29', 'XI PSPT 1', '2526107268', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(330, '2026-07-29', 'XI PSPT 1', '2526107269', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(331, '2026-07-29', 'XI PSPT 1', '2526107270', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(332, '2026-07-29', 'XI PSPT 1', '2526107271', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(333, '2026-07-29', 'XI PSPT 1', '2526107272', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(334, '2026-07-29', 'XI PSPT 1', '2526107273', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(335, '2026-07-29', 'XI PSPT 1', '2526107274', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(336, '2026-07-29', 'XI PSPT 1', '2526107275', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(337, '2026-07-29', 'XI PSPT 1', '2526107276', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(338, '2026-07-29', 'XI PSPT 1', '2526107277', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(339, '2026-07-29', 'XI PSPT 1', '2526107278', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(340, '2026-07-29', 'XI PSPT 1', '2526107279', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(341, '2026-07-29', 'XI PSPT 1', '2526107280', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(342, '2026-07-29', 'XI PSPT 1', '2526107281', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(343, '2026-07-29', 'XI PSPT 1', '2526107282', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(344, '2026-07-29', 'XI PSPT 1', '2526107283', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(345, '2026-07-29', 'XI PSPT 1', '2526107284', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(346, '2026-07-29', 'XI PSPT 1', '2526107285', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(347, '2026-07-29', 'XI PSPT 1', '2526107286', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(348, '2026-07-29', 'XI PSPT 1', '2526107287', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(349, '2026-07-29', 'XI PSPT 1', '2526107288', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(350, '2026-07-29', 'XI PSPT 1', '2526107289', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(351, '2026-07-29', 'XI PSPT 1', '2526107290', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(352, '2026-07-29', 'XI PSPT 1', '2526107291', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(353, '2026-07-29', 'XI PSPT 1', '2526107677', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(354, '2026-07-30', 'XII DKV 1', '2425106198', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(355, '2026-07-30', 'XII DKV 1', '2425106199', 'rofiq', 'KOMTYPE', 'Sakit', NULL, NULL, NULL),
(356, '2026-07-30', 'XII DKV 1', '2425106200', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(357, '2026-07-30', 'XII DKV 1', '2425106201', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(358, '2026-07-30', 'XII DKV 1', '2425106202', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(359, '2026-07-30', 'XII DKV 1', '2425106203', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(360, '2026-07-30', 'XII DKV 1', '2425106204', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(361, '2026-07-30', 'XII DKV 1', '2425106205', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(362, '2026-07-30', 'XII DKV 1', '2425106206', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(363, '2026-07-30', 'XII DKV 1', '2425106207', 'rofiq', 'KOMTYPE', 'Sakit', NULL, NULL, NULL),
(364, '2026-07-30', 'XII DKV 1', '2425106208', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(365, '2026-07-30', 'XII DKV 1', '2425106209', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(366, '2026-07-30', 'XII DKV 1', '2425106210', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(367, '2026-07-30', 'XII DKV 1', '2425106211', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(368, '2026-07-30', 'XII DKV 1', '2425106212', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(369, '2026-07-30', 'XII DKV 1', '2425106213', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(370, '2026-07-30', 'XII DKV 1', '2425106214', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(371, '2026-07-30', 'XII DKV 1', '2425106215', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(372, '2026-07-30', 'XII DKV 1', '2425106216', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(373, '2026-07-30', 'XII DKV 1', '2425106217', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(374, '2026-07-30', 'XII DKV 1', '2425106218', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(375, '2026-07-30', 'XII DKV 1', '2425106219', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(376, '2026-07-30', 'XII DKV 1', '2425106220', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(377, '2026-07-30', 'XII DKV 1', '2425106222', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(378, '2026-07-30', 'XII DKV 1', '2425106223', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(379, '2026-07-30', 'XII DKV 1', '2425106966', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(380, '2026-07-30', 'XII DKV 1', '2425106225', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(381, '2026-07-30', 'XII DKV 1', '2425106226', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(382, '2026-07-30', 'XII DKV 1', '2425106227', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(383, '2026-07-30', 'XII DKV 1', '2425106228', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(384, '2026-07-30', 'XII DKV 1', '2425106230', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(385, '2026-07-30', 'XII DKV 1', '2425106231', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(386, '2026-07-30', 'XII DKV 1', '2425106232', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(387, '2026-07-30', 'XII DKV 1', '2425106233', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(388, '2026-07-30', 'XII DKV 1', '2425106234', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(389, '2026-07-30', 'XII DKV 1', '2425106968', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(390, '2026-07-30', 'XII DKV 1', '2425106235', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(391, '2026-07-30', 'XII DKV 1', '2425106236', 'rofiq', 'KOMTYPE', 'Sakit', NULL, NULL, NULL),
(392, '2026-07-30', 'XII DKV 1', '2425106237', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(393, '2026-07-30', 'XII DKV 1', '2425106238', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(394, '2026-07-30', 'X DKV 2', '111', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(395, '2026-07-30', 'X DKV 2', '112', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(396, '2026-07-30', 'X DKV 2', '113', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(397, '2026-07-30', 'X DKV 2', '114', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(398, '2026-07-30', 'X DKV 2', '115', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(399, '2026-07-30', 'X DKV 2', '116', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(400, '2026-07-30', 'X DKV 2', '117', 'rofiq', 'SKIL', 'Sakit', NULL, NULL, NULL),
(401, '2026-07-30', 'X DKV 2', '118', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(402, '2026-07-30', 'X DKV 2', '119', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(403, '2026-07-30', 'X DKV 2', '120', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(404, '2026-07-30', 'X DKV 2', '121', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(405, '2026-07-30', 'X DKV 2', '122', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(406, '2026-07-30', 'X DKV 2', '123', 'rofiq', 'SKIL', 'Sakit', NULL, NULL, NULL),
(407, '2026-07-30', 'X DKV 2', '124', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(408, '2026-07-30', 'X DKV 2', '125', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(409, '2026-07-30', 'X DKV 2', '126', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(410, '2026-07-30', 'X DKV 2', '127', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(411, '2026-07-30', 'X DKV 2', '128', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(412, '2026-07-30', 'X DKV 2', '129', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(413, '2026-07-30', 'X DKV 2', '130', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(414, '2026-07-30', 'X DKV 2', '131', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(415, '2026-07-30', 'X DKV 2', '132', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(416, '2026-07-30', 'X DKV 2', '133', 'rofiq', 'SKIL', 'Sakit', NULL, NULL, NULL),
(417, '2026-07-30', 'X DKV 2', '134', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(418, '2026-07-30', 'X DKV 2', '135', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(419, '2026-07-30', 'X DKV 2', '136', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(420, '2026-07-30', 'X DKV 2', '137', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(421, '2026-07-30', 'X DKV 2', '138', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(422, '2026-07-30', 'X DKV 2', '139', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(423, '2026-07-30', 'X DKV 2', '140', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(424, '2026-07-30', 'X DKV 2', '141', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(425, '2026-07-30', 'X DKV 2', '142', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(426, '2026-07-30', 'X DKV 2', '143', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(427, '2026-07-30', 'XII DKV 2', '2425106239', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(428, '2026-07-30', 'XII DKV 2', '2425106240', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(429, '2026-07-30', 'XII DKV 2', '2425106241', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(430, '2026-07-30', 'XII DKV 2', '2425106242', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(431, '2026-07-30', 'XII DKV 2', '2425106243', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(432, '2026-07-30', 'XII DKV 2', '2425106244', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(433, '2026-07-30', 'XII DKV 2', '2425106245', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(434, '2026-07-30', 'XII DKV 2', '2425106246', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(435, '2026-07-30', 'XII DKV 2', '2425106247', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(436, '2026-07-30', 'XII DKV 2', '2425106249', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(437, '2026-07-30', 'XII DKV 2', '2425106250', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(438, '2026-07-30', 'XII DKV 2', '2425106251', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(439, '2026-07-30', 'XII DKV 2', '2425106252', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(440, '2026-07-30', 'XII DKV 2', '2425106253', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(441, '2026-07-30', 'XII DKV 2', '2425106254', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(442, '2026-07-30', 'XII DKV 2', '2425106256', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(443, '2026-07-30', 'XII DKV 2', '2425106257', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(444, '2026-07-30', 'XII DKV 2', '2425106258', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(445, '2026-07-30', 'XII DKV 2', '2425106259', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(446, '2026-07-30', 'XII DKV 2', '2425106260', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(447, '2026-07-30', 'XII DKV 2', '2425106261', 'rofiq', 'KOMTYPE', 'Alfa', NULL, NULL, NULL),
(448, '2026-07-30', 'XII DKV 2', '2425106262', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(449, '2026-07-30', 'XII DKV 2', '2425106264', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(450, '2026-07-30', 'XII DKV 2', '2425106265', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(451, '2026-07-30', 'XII DKV 2', '2526116972', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(452, '2026-07-30', 'XII DKV 2', '2425106267', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(453, '2026-07-30', 'XII DKV 2', '2425106269', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(454, '2026-07-30', 'XII DKV 2', '2425106270', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(455, '2026-07-30', 'XII DKV 2', '2425106271', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(456, '2026-07-30', 'XII DKV 2', '2425106272', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(457, '2026-07-30', 'XII DKV 2', '2425106273', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(458, '2026-07-30', 'XII DKV 2', '2425106274', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(459, '2026-07-30', 'XII DKV 2', '2425106275', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(460, '2026-07-30', 'XII DKV 2', '2425106276', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(461, '2026-07-30', 'XII DKV 2', '2425106277', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(462, '2026-07-30', 'XII DKV 2', '2425106278', 'rofiq', 'KOMTYPE', 'Sakit', NULL, NULL, NULL),
(463, '2026-07-30', 'XII DKV 2', '2425106279', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(464, '2026-07-30', 'XII DKV 2', '2425106280', 'rofiq', 'KOMTYPE', 'Hadir', NULL, NULL, NULL),
(465, '2026-07-31', 'X DKV 2', '111', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(466, '2026-07-31', 'X DKV 2', '112', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(467, '2026-07-31', 'X DKV 2', '113', 'rofiq', 'SKIL', 'Sakit', NULL, NULL, NULL),
(468, '2026-07-31', 'X DKV 2', '114', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(469, '2026-07-31', 'X DKV 2', '115', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(470, '2026-07-31', 'X DKV 2', '116', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(471, '2026-07-31', 'X DKV 2', '117', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(472, '2026-07-31', 'X DKV 2', '118', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(473, '2026-07-31', 'X DKV 2', '119', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(474, '2026-07-31', 'X DKV 2', '120', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(475, '2026-07-31', 'X DKV 2', '121', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(476, '2026-07-31', 'X DKV 2', '122', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(477, '2026-07-31', 'X DKV 2', '123', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(478, '2026-07-31', 'X DKV 2', '124', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(479, '2026-07-31', 'X DKV 2', '125', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(480, '2026-07-31', 'X DKV 2', '126', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(481, '2026-07-31', 'X DKV 2', '127', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(482, '2026-07-31', 'X DKV 2', '128', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(483, '2026-07-31', 'X DKV 2', '129', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(484, '2026-07-31', 'X DKV 2', '130', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(485, '2026-07-31', 'X DKV 2', '131', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(486, '2026-07-31', 'X DKV 2', '132', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(487, '2026-07-31', 'X DKV 2', '133', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(488, '2026-07-31', 'X DKV 2', '134', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(489, '2026-07-31', 'X DKV 2', '135', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(490, '2026-07-31', 'X DKV 2', '136', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(491, '2026-07-31', 'X DKV 2', '137', 'rofiq', 'SKIL', 'Sakit', NULL, NULL, NULL),
(492, '2026-07-31', 'X DKV 2', '138', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(493, '2026-07-31', 'X DKV 2', '139', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(494, '2026-07-31', 'X DKV 2', '140', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(495, '2026-07-31', 'X DKV 2', '141', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(496, '2026-07-31', 'X DKV 2', '142', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(497, '2026-07-31', 'X DKV 2', '143', 'rofiq', 'SKIL', 'Hadir', NULL, NULL, NULL),
(568, '2026-07-31', 'X TKJ 5', '2627108029', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(569, '2026-07-31', 'X TKJ 5', '2627108030', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(570, '2026-07-31', 'X TKJ 5', '2627108031', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(571, '2026-07-31', 'X TKJ 5', '2627108032', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(572, '2026-07-31', 'X TKJ 5', '2627108033', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(573, '2026-07-31', 'X TKJ 5', '2627108034', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(574, '2026-07-31', 'X TKJ 5', '2627108035', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(575, '2026-07-31', 'X TKJ 5', '2627108036', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(576, '2026-07-31', 'X TKJ 5', '2627108037', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(577, '2026-07-31', 'X TKJ 5', '2627108038', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(578, '2026-07-31', 'X TKJ 5', '2627108039', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(579, '2026-07-31', 'X TKJ 5', '2627108040', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(580, '2026-07-31', 'X TKJ 5', '2627108041', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(581, '2026-07-31', 'X TKJ 5', '2627108042', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(582, '2026-07-31', 'X TKJ 5', '2627108043', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(583, '2026-07-31', 'X TKJ 5', '2627108044', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(584, '2026-07-31', 'X TKJ 5', '2627108045', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(585, '2026-07-31', 'X TKJ 5', '2627108046', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(586, '2026-07-31', 'X TKJ 5', '2627108047', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL);
INSERT INTO `presensi_mapel` (`id`, `tanggal`, `kelas`, `nis`, `nip`, `mapel`, `status`, `jam_ke`, `created_at`, `updated_at`) VALUES
(587, '2026-07-31', 'X TKJ 5', '2627108048', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(588, '2026-07-31', 'X TKJ 5', '2627108049', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(589, '2026-07-31', 'X TKJ 5', '2627108050', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(590, '2026-07-31', 'X TKJ 5', '2627108051', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(591, '2026-07-31', 'X TKJ 5', '2627108052', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(592, '2026-07-31', 'X TKJ 5', '2627108053', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(593, '2026-07-31', 'X TKJ 5', '2627108054', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(594, '2026-07-31', 'X TKJ 5', '2627108055', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(595, '2026-07-31', 'X TKJ 5', '2627108056', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(596, '2026-07-31', 'X TKJ 5', '-', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(597, '2026-07-31', 'X TKJ 5', '2627108057', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(598, '2026-07-31', 'X TKJ 5', '2627108058', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(599, '2026-07-31', 'X TKJ 5', '2627108059', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(600, '2026-07-31', 'X TKJ 5', '2627108060', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(601, '2026-07-31', 'X TKJ 5', '2627108061', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(602, '2026-07-31', 'X TKJ 5', '2627108062', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(603, '2026-08-03', 'X TKJ 5', '2627108029', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(604, '2026-08-03', 'X TKJ 5', '2627108030', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(605, '2026-08-03', 'X TKJ 5', '2627108031', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(606, '2026-08-03', 'X TKJ 5', '2627108032', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(607, '2026-08-03', 'X TKJ 5', '2627108033', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(608, '2026-08-03', 'X TKJ 5', '2627108034', 'rofiq', 'B. JAWA', 'Sakit', NULL, NULL, NULL),
(609, '2026-08-03', 'X TKJ 5', '2627108035', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(610, '2026-08-03', 'X TKJ 5', '2627108036', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(611, '2026-08-03', 'X TKJ 5', '2627108037', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(612, '2026-08-03', 'X TKJ 5', '2627108038', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(613, '2026-08-03', 'X TKJ 5', '2627108039', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(614, '2026-08-03', 'X TKJ 5', '2627108040', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(615, '2026-08-03', 'X TKJ 5', '2627108041', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(616, '2026-08-03', 'X TKJ 5', '2627108042', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(617, '2026-08-03', 'X TKJ 5', '2627108043', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(618, '2026-08-03', 'X TKJ 5', '2627108044', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(619, '2026-08-03', 'X TKJ 5', '2627108045', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(620, '2026-08-03', 'X TKJ 5', '2627108046', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(621, '2026-08-03', 'X TKJ 5', '2627108047', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(622, '2026-08-03', 'X TKJ 5', '2627108048', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(623, '2026-08-03', 'X TKJ 5', '2627108049', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(624, '2026-08-03', 'X TKJ 5', '2627108050', 'rofiq', 'B. JAWA', 'Alfa', NULL, NULL, NULL),
(625, '2026-08-03', 'X TKJ 5', '2627108051', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(626, '2026-08-03', 'X TKJ 5', '2627108052', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(627, '2026-08-03', 'X TKJ 5', '2627108053', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(628, '2026-08-03', 'X TKJ 5', '2627108054', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(629, '2026-08-03', 'X TKJ 5', '2627108055', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(630, '2026-08-03', 'X TKJ 5', '2627108056', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(631, '2026-08-03', 'X TKJ 5', '-', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(632, '2026-08-03', 'X TKJ 5', '2627108057', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(633, '2026-08-03', 'X TKJ 5', '2627108058', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(634, '2026-08-03', 'X TKJ 5', '2627108059', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(635, '2026-08-03', 'X TKJ 5', '2627108060', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(636, '2026-08-03', 'X TKJ 5', '2627108061', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(637, '2026-08-03', 'X TKJ 5', '2627108062', 'rofiq', 'B. JAWA', 'Hadir', NULL, NULL, NULL),
(638, '2026-08-05', 'XII DKV 1', '2425106198', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(639, '2026-08-05', 'XII DKV 1', '2425106199', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(640, '2026-08-05', 'XII DKV 1', '2425106200', 'rofiq', 'KOMTYPE', 'Dispensasi', 1, '2026-08-04 17:17:04', NULL),
(641, '2026-08-05', 'XII DKV 1', '2425106201', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(642, '2026-08-05', 'XII DKV 1', '2425106202', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(643, '2026-08-05', 'XII DKV 1', '2425106203', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(644, '2026-08-05', 'XII DKV 1', '2425106204', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(645, '2026-08-05', 'XII DKV 1', '2425106205', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(646, '2026-08-05', 'XII DKV 1', '2425106206', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(647, '2026-08-05', 'XII DKV 1', '2425106207', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(648, '2026-08-05', 'XII DKV 1', '2425106208', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(649, '2026-08-05', 'XII DKV 1', '2425106209', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(650, '2026-08-05', 'XII DKV 1', '2425106210', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(651, '2026-08-05', 'XII DKV 1', '2425106211', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(652, '2026-08-05', 'XII DKV 1', '2425106212', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(653, '2026-08-05', 'XII DKV 1', '2425106213', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(654, '2026-08-05', 'XII DKV 1', '2425106214', 'rofiq', 'KOMTYPE', 'Izin', 1, '2026-08-04 17:17:04', NULL),
(655, '2026-08-05', 'XII DKV 1', '2425106215', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(656, '2026-08-05', 'XII DKV 1', '2425106216', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(657, '2026-08-05', 'XII DKV 1', '2425106217', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(658, '2026-08-05', 'XII DKV 1', '2425106218', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(659, '2026-08-05', 'XII DKV 1', '2425106219', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(660, '2026-08-05', 'XII DKV 1', '2425106220', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(661, '2026-08-05', 'XII DKV 1', '2425106222', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(662, '2026-08-05', 'XII DKV 1', '2425106223', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(663, '2026-08-05', 'XII DKV 1', '2425106966', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(664, '2026-08-05', 'XII DKV 1', '2425106225', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(665, '2026-08-05', 'XII DKV 1', '2425106226', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(666, '2026-08-05', 'XII DKV 1', '2425106227', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(667, '2026-08-05', 'XII DKV 1', '2425106228', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(668, '2026-08-05', 'XII DKV 1', '2425106230', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(669, '2026-08-05', 'XII DKV 1', '2425106231', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(670, '2026-08-05', 'XII DKV 1', '2425106232', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(671, '2026-08-05', 'XII DKV 1', '2425106233', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(672, '2026-08-05', 'XII DKV 1', '2425106234', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(673, '2026-08-05', 'XII DKV 1', '2425106968', 'rofiq', 'KOMTYPE', 'Izin', 1, '2026-08-04 17:17:04', NULL),
(674, '2026-08-05', 'XII DKV 1', '2425106235', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(675, '2026-08-05', 'XII DKV 1', '2425106236', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(676, '2026-08-05', 'XII DKV 1', '2425106237', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(677, '2026-08-05', 'XII DKV 1', '2425106238', 'rofiq', 'KOMTYPE', 'Hadir', 1, '2026-08-04 17:17:04', NULL),
(678, '2026-08-05', 'XII DKV 2', '2425106239', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(679, '2026-08-05', 'XII DKV 2', '2425106240', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(680, '2026-08-05', 'XII DKV 2', '2425106241', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(681, '2026-08-05', 'XII DKV 2', '2425106242', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(682, '2026-08-05', 'XII DKV 2', '2425106243', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(683, '2026-08-05', 'XII DKV 2', '2425106244', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(684, '2026-08-05', 'XII DKV 2', '2425106245', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(685, '2026-08-05', 'XII DKV 2', '2425106246', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(686, '2026-08-05', 'XII DKV 2', '2425106247', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(687, '2026-08-05', 'XII DKV 2', '2425106249', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(688, '2026-08-05', 'XII DKV 2', '2425106250', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(689, '2026-08-05', 'XII DKV 2', '2425106251', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(690, '2026-08-05', 'XII DKV 2', '2425106252', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(691, '2026-08-05', 'XII DKV 2', '2425106253', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(692, '2026-08-05', 'XII DKV 2', '2425106254', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(693, '2026-08-05', 'XII DKV 2', '2425106256', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(694, '2026-08-05', 'XII DKV 2', '2425106257', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(695, '2026-08-05', 'XII DKV 2', '2425106258', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(696, '2026-08-05', 'XII DKV 2', '2425106259', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(697, '2026-08-05', 'XII DKV 2', '2425106260', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(698, '2026-08-05', 'XII DKV 2', '2425106261', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(699, '2026-08-05', 'XII DKV 2', '2425106262', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(700, '2026-08-05', 'XII DKV 2', '2425106264', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(701, '2026-08-05', 'XII DKV 2', '2425106265', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(702, '2026-08-05', 'XII DKV 2', '2526116972', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(703, '2026-08-05', 'XII DKV 2', '2425106267', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(704, '2026-08-05', 'XII DKV 2', '2425106269', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(705, '2026-08-05', 'XII DKV 2', '2425106270', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(706, '2026-08-05', 'XII DKV 2', '2425106271', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(707, '2026-08-05', 'XII DKV 2', '2425106272', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(708, '2026-08-05', 'XII DKV 2', '2425106273', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(709, '2026-08-05', 'XII DKV 2', '2425106274', 'rofiq', 'KOMTYPE', 'Alfa', 5, '2026-08-04 19:36:07', NULL),
(710, '2026-08-05', 'XII DKV 2', '2425106275', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(711, '2026-08-05', 'XII DKV 2', '2425106276', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(712, '2026-08-05', 'XII DKV 2', '2425106277', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(713, '2026-08-05', 'XII DKV 2', '2425106278', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(714, '2026-08-05', 'XII DKV 2', '2425106279', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL),
(715, '2026-08-05', 'XII DKV 2', '2425106280', 'rofiq', 'KOMTYPE', 'Hadir', 5, '2026-08-04 19:36:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rubrik`
--

CREATE TABLE `rubrik` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `komponen` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'TA_AKTIF', '2025/2026'),
(2, 'SEMESTER', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `nama_siswa` varchar(150) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `jk` varchar(5) DEFAULT NULL,
  `ttl` varchar(150) DEFAULT '',
  `alamat` varchar(255) DEFAULT '',
  `no_wa` varchar(30) DEFAULT '',
  `ekstra` varchar(255) DEFAULT '',
  `nama_ayah` varchar(150) DEFAULT '',
  `nama_ibu` varchar(150) DEFAULT '',
  `kerja_ayah` varchar(150) DEFAULT '',
  `kerja_ibu` varchar(150) DEFAULT '',
  `penghasilan_ortu` varchar(150) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas`, `jk`, `ttl`, `alamat`, `no_wa`, `ekstra`, `nama_ayah`, `nama_ibu`, `kerja_ayah`, `kerja_ibu`, `penghasilan_ortu`) VALUES
(1, '111', 'ABIGAIL NATASHA SETIA WAYORI', 'X DKV 2', 'P', 'jakarta, 24 maret 2010', 'jalan kakap kalisoka dukuwaru perbatasan Sindang', '082180004407', 'pramuka', 'Alexander wayori', 'nurdiana', 'pekerjaan swasta', 'ibu rumah tangga', '30 juta perbulan'),
(2, '112', 'AENA AZQIYAH', 'X DKV 2', 'P', '18 januari 2011', 'dukuringin', '081949203098', 'seni musik', 'juli sugiyanto', 'umroh', 'wirausaha', 'ibu rumah tangga', '3jt perminggu'),
(3, '113', 'AJI SETIAJI', 'X DKV 2', 'L', 'tegal 30 November 2010', 'Adiwerna penarukan', '0895395228213', 'badminton', 'Sudarman', 'latipah', 'wirausaha', 'wirausaha', '3juta perbulan'),
(4, '114', 'AKBAR KHALIF JAHBANA', 'X DKV 2', 'L', 'Tegal-28-desember-2010', 'Bogares lor Rt/Rw 06/02', '083172236344', '-', 'cahyono', 'siti nurlila', 'pedangang', 'pedagang', 'tidak tahu'),
(5, '115', 'ALFAN ALFIAN SALIM', 'X DKV 2', 'L', 'Tegal 10 - 11 - 2010', 'DS.talok RT06 RW 02', '085878044052', 'Sepak bola', 'Agus salim', 'Setiowati', 'Sudah tidak kerja', 'Ibu rumah tangga', 'Tidak tahu'),
(6, '116', 'ALFATIR NAZRIEL ILHAM', 'X DKV 2', 'L', 'Tegal 15, Desember 2010', 'Desa Sindang RT 2 RW 6', '082135363174', 'Rohis', 'Hasan asari', 'Siti sairoh', 'Pedagang', 'Ibu rumah tangga', '-(tidak tau)'),
(7, '117', 'AMANDA SAFIRA', 'X DKV 2', 'P', '20 mei 2011', 'Lebaksiu Desa kajen', '083833651533', 'pramuka', 'M. Safari', 'Dwi Puspita sari', 'Supit truk', 'Rumah tangga', 'kurang tau'),
(8, '118', 'ANDREA DIANONE', 'X DKV 2', 'L', 'Tegal 21 juli 2011', 'Kaliwadas rt7 rw02', '0895630223446', 'Basket, senimusik, Inggris club', 'Sumardi', 'Maryanti', 'Buruh', 'Buruh', 'UMR'),
(9, '119', 'CHESTA DAFFA WIDIYANTO', 'X DKV 2', 'L', 'Tegal,21 April 2011', 'SINDANG RT 04/ RW 04', '087709373648', 'Volly', 'Yanto', 'Widiarti', 'pedagang', 'jualan online', 'tidak tahu'),
(10, '120', 'DEVON RAJA BANAZAR', 'X DKV 2', 'L', 'Tegal 17 juni 2011', 'Kalisapu griya tiara asri2', '0851-6810-0035', 'Badminton', 'Kristono', 'Budi rosati', 'Gas samator', 'Jualan', '5jt'),
(11, '121', 'DITYO NUGROHO', 'X DKV 2', 'L', 'Brebes, 2 Juli 2011', 'RT 03 RW 05 Jalan Sawo, DukuhMaja, Songgom, Brebes', '0881 5665 755', 'English Club', 'M. Fachrudin', 'Uchriyah', 'Pedagang', 'Pedagang / Ibu Rumah Tangga', '1 000 000 - 2 000 000'),
(12, '122', 'FARDINA ASHAFIYYAH RAMADHANI', 'X DKV 2', 'P', 'tegal, 12-8-2010', 'tegalandong, perum Slawi regency', '085867168384', 'OSIS', 'Didin Haryanto', 'Farah Rizky Fitriani', 'pegawai swasta', 'guru', '4jt? 5jt? gtw pak'),
(13, '123', 'FAUZI AHMAD IBNU MAJAH', 'X DKV 2', 'L', 'tegal,30 april,2011', 'jatirawa kec tarub', '085166496235', 'Futsal', 'Joni', 'Rini Andriyani', 'pns', 'ibu rumah tangga', '-'),
(14, '124', 'FITRI TAHTA ALFIANA', 'X DKV 2', 'P', 'tegal,31 Agustus 2011', 'desa tembok lor RT 18 RW 2', '0889616737031', 'futsal', 'sukyadi', 'rokhimah', 'wiraswasta', 'ibu rumah tangga', 'kurang paham'),
(15, '125', 'HAMDAN HANIFAN AKBAR', 'X DKV 2', 'L', 'Tegal 08 maret 2011', 'kalisapu Rt04 Rw06', '085700705766', 'musik', 'JANUDIN', 'NUR FARIDAH', 'security', 'ibu rumah tangga', '1jt/bulan'),
(16, '126', 'IBNI AQIL AL MALIKI', 'X DKV 2', 'L', 'tegal 17 november 2010', 'siketi dukuh benda kec bumijawa kab tegal', '083895035384', 'musik', 'muh yasnaula', 'yasfin', 'perantauan', 'penjahit', '4 - 5 jt'),
(17, '127', 'ISNAN FEZA MUSTAFID', 'X DKV 2', 'L', 'Tegal/21/Oktober/2010', 'Pangkah Desa Depok RT 02 RW 02', '085696332250', 'futsal', 'Suswanto', 'Erna purwati', 'Buruh tani', 'Ibu rumah tangga', 'tidak tahu'),
(18, '128', 'KAYLA NUR SYAFA\'ATI', 'X DKV 2', 'P', '20 November 2010', 'Lebaksiu kidul', '085803524029', 'pramuka', 'maf\'ul alwi', 'Siti khusnika', 'wirausaha', 'rumah tangga', 'kurang tau'),
(19, '129', 'KIARA MELINDA', 'X DKV 2', 'P', 'Tegal, 9 Mei 2010', 'Lebaksiu, pendawa', '0878 8254 3663', '-', 'Danurip', 'Tarlimah', 'Dagang', 'Ibu rumah tangga', 'Nggak tau'),
(20, '130', 'MOH. TASSYAHRUL RAMADHANI', 'X DKV 2', 'L', 'Tegal tanggal 16 Agustus 2010', 'tembok kidul RT 22 RW 03 kecamatan Adiwerna kab Tegal', '+62 858-6401-3325', 'futsal', 'tasrudin', 'Siti warinah', 'proyek', 'ibu rumah tangga', '500k seminggu'),
(21, '131', 'MUHAMAD AJI ALFARIS', 'X DKV 2', 'L', 'Tegal 13 november 2010', 'desa procot', '0895393389789', 'Bola volly', 'Sakuri', 'Mukhayatun', 'Uda almarhum', 'Pedagang', '2.500.000.00 perbulan'),
(22, '132', 'MUHAMMAD AFFIFUDIN', 'X DKV 2', 'L', 'Tegal, 16 oktober 2010', 'dk. Pesawahan pangkah', '08985751188', 'Handball', 'Syafa udin', 'Tuti uswatun khasanah', 'Wiraswasta', 'Ibu rumah tangga', '50.000.000'),
(23, '133', 'MUHAMMAD PANJI', 'X DKV 2', 'L', 'Tegal , 2 januari 2011', 'Pedagangan , jalan semangka , rt4/rw2', '085600395403', 'badminton', 'Khaerudin', 'Sri antun', 'buruh', 'swasta', '1-3 juta sebulan'),
(24, '134', 'NIYARA FHALASIFA', 'X DKV 2', 'P', 'TEGAL,14 Maret 2011', 'Lebaksiu Kidul', '089512849286', 'basket, pramuka', 'Dahmudi', 'Jaroyah', 'wirausaha', 'Ibu rumah tangga', 'kurang tau'),
(25, '135', 'NOERIEN MU\'IDZ BACHTIAR', 'X DKV 2', 'L', 'TEGAL, 6 NOVEMBER 2010', 'Ds. Harjosari lor', '0822-6431-5319', 'FUTSAL', 'DJUMAIDI', 'SRI NURWANTI', 'PNS', 'karyawan harian lepas di CV. 2 tang', '-'),
(26, '136', 'OVI NURAINI', 'X DKV 2', 'P', '29 SEPTEMBER 2010', 'desa harjosari lor RT10/Rw03', '0895360602947', 'futsal putri, pmr', 'Mohamad Abdul rokman', 'Erni nurhayati', 'buruh', 'perdagang', 'tidak tau'),
(27, '137', 'RAYNOR TERTIA DARMAWAN', 'X DKV 2', 'L', 'TEGAL, 19 JUNI 2010', 'durensawit kesuben, kec. lebaksiu, kab. tegal', '083895344321', 'basket', 'Ery Darmawan', 'Lia Retnowati', 'karyawan pt', 'penjaga stand esteh', '5.000.000'),
(28, '138', 'RINI AMALIA PUTRI', 'X DKV 2', 'P', '27 April 2011', 'Harjosari lor RT/RW 06/26', '089646904014', '-', 'Rustono', 'Karsiyani', 'Buruh lepas/Tukang servis ac', 'Ibu rumah tangga', '50.000-100.000'),
(29, '139', 'RIZQI ANDHIKA PRATAMA', 'X DKV 2', 'L', 'Tegal 06 juli 2009', 'Pesalakan Adiwerna RT 36 RW 03', '085741100883', 'Bulutangkis basket', 'Andy tofani', 'Sri indah yuliarti', 'Satpam', 'Dagang', '1jt sampai 3jt'),
(30, '140', 'SEPTIANI NANDINI', 'X DKV 2', 'P', 'Tegal, adiwerna, jawa tegah', 'harjoasari lor rt 19/05', '0882007045060', '-', 'Edi nur yanto', 'Siti suripah', 'wirausaha', 'wirausaha', 'kurang paham'),
(31, '141', 'SITI AZMI FITRIANI', 'X DKV 2', 'L', 'tegal, 26 februari 2011', 'kambangan', '0856-4183-1814', 'badminton', 'andiani', 'dagang', 'dagang', 'rumah tangga', 'gatau'),
(32, '142', 'TRI ULFIYA FATKHUL JANAH', 'X DKV 2', 'P', 'tegal, 16 januari 2011', 'harjosari lor rt26/rw06', '0882-0079-87901', '-', 'wirso', 'siti aisah', 'buruh', 'jahit', 'kurang paham'),
(33, '143', 'ZAINI PUTRA PRATAMA', 'X DKV 2', 'L', 'TEGAL, 25 JANUARI 2011', 'DK. PESAWAHAN PANGKAH', '087712424903', '-', 'Muhamad Fauzan zen', 'Yanti peggi arista', 'Di Amerika', 'PT', '20 JT'),
(811, '2526106974', 'ADITA PUTRI IDYA', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(812, '2526106975', 'ADITYA ANANDA PUTRA', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(813, '2526106976', 'AHMAD FAIQ MURTADHO', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(814, '2526106977', 'AKIOKENKEI AHIL FIRDAUSI', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(815, '2526106978', 'ALIFA DITA JULIANA', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(816, '2526106979', 'ALMIRA NADHIFA ROZA', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(817, '2526106980', 'AYU INDRAWATI', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(818, '2526106981', 'AZZKA AFIF MAULANA PUTRA', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(819, '2526106982', 'BAHTIYAR AZHAR', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(820, '2526106983', 'BIBIT SATULUS', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(821, '2526106984', 'DAVI ALBHA ANDHIKA', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(822, '2526106985', 'EGA ALBIAN', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(823, '2526106986', 'FAWAS ALIFIAN SETIAWAN', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(824, '2526106987', 'FIANDIKA SATRIA HARIST', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(825, '2526106988', 'HIKAM SYAHRUL MUBAROK', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(826, '2526106989', 'ILHAM ZAKARIA', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(827, '2526106990', 'INES PUSPA DWI LESTARI', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(828, '2526106991', 'IRKHAM MAULANA ARYAPUTRA', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(829, '2526106992', 'KHALIL AKBAR ROBBIANSYAH', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(830, '2526106993', 'MUHAMMAD DAFA FAHLEVY', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(831, '2526106994', 'MOHAMAD KHAERUL NIZAM', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(832, '2526106995', 'M. MUSYAFFA SALMAN FARIS', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(833, '2526106996', 'MOKHAMAD KRESNA AL BARZANJI', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(834, '2526106997', 'MUSTAGHFIROH', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(835, '2526106998', 'NADIL ULUM ANNAFIS', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(836, '2526106999', 'NENCY ALISIYA NABILA', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(837, '2526107000', 'RAYIENDA CAHYANARA AHMAD', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(838, '2526107001', 'RENDY YUSUF SUBEKHI', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(839, '2526107002', 'SALMA AULIA RIZQI', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(840, '2526107003', 'SASTIN MAULIDA KUMALADEWI', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(841, '2526107004', 'SITI LUTFIANA FASA AMALIA', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(842, '2526107005', 'SYABILA PUTRI NUR AENI', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(843, '2526107006', 'TAHTA WIJHAH WAHID', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(844, '2526107007', 'WABNISSABIL AL BAASIT', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(845, '2526107008', 'YUSUF ARIF BUDIMAN', 'XI TKJ 1', 'L', '', '', '', '', '', '', '', '', ''),
(846, '2526107009', 'ZAHRATUL AMALIYAH', 'XI TKJ 1', 'P', '', '', '', '', '', '', '', '', ''),
(847, '2526107185', 'AGUNG PRASETYO ILHAM', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(848, '2526107186', 'AMALIA PUTRI', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(849, '2526107187', 'ARYA DWI SEBASTIAN VAERON', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(850, '2526107188', 'ARYASATYA MUHAMMAD ARSANESIA', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(851, '2526107189', 'CITRA ATHA SHABIRAH', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(852, '2526107190', 'FATHUR ROHMAN', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(853, '2526107191', 'GANESHA CAHAYA SAFANIA', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(854, '2526107192', 'IKFI KAMALIYAH SILMIYA', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(855, '2526107193', 'JUBAHANI NUR  SITA', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(856, '2526107195', 'KELVIN ADYATMA', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(857, '2526107196', 'LAILI MAULIDIA PERMATA', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(858, '2526107197', 'M. AZIZ ZIDNY ARRAFI', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(859, '2526107198', 'M. BAYU SATRIA', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(860, '2526107199', 'M. NAIZAR RIZQYA RAHMAN', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(861, '2526107200', 'MARKHAM ALI', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(862, '2526107201', 'MOH. FAIZAL KHOERUL IMAN', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(863, '2526107202', 'MOHAMAD MUFARJI FATHAN RAMADHANI', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(864, '2526107203', 'MOHAMAD RAFFI ISKANDAR', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(865, '2526107204', 'MOHAMMAD ILHAM', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(866, '2526107205', 'MUHAMAD AZKAL GHOMAM', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(867, '2526107206', 'MUHAMAD AZLAN IKHYA ULUMUDIN', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(868, '2526107207', 'MUHAMMAD FADLI NUR RANGKUTI', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(869, '2526107208', 'MUHAMMAD FATIHUR RIZQI', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(870, '2526107209', 'MUHAMMAD NAUFAL', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(871, '2526107210', 'RISMA AULIA AZ-ZAHRA', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(872, '2526107211', 'RIZKA AULIA NOVIANTI', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(873, '2526107212', 'SALSA BILA ZAHRA TUNNISA', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(874, '2526107213', 'SHIDQI ERLAND PUTRA RAMADHAN', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(875, '2526107214', 'SINTIA  AYU ISTIQOMAH', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(876, '2526107215', 'SULI LESTARI', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(877, '2526107216', 'SULISTIA WATI', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(878, '2526107217', 'SYESIAN GILANG  SAPUTRA', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(879, '2526107218', 'SYIFA ATHAYA AFIFAH', 'XI DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(880, '2526107219', 'THALITHA NAILAH TSAQIF', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(881, '2526107545', 'MUHAMMAD AL FATAH', 'XI DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(882, '2526107220', 'ABDUL A\'ZIZ', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(883, '2526107221', 'AFWAN MAULANA AZIDAN', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(884, '2526107222', 'AGHNA DAMARDJATI RAMADHAN', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(885, '2526107223', 'ALAM NA\'WID', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(886, '2526107224', 'ALFATH NAZAR', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(887, '2526107225', 'ALIM TA\'WID', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(888, '2526107226', 'ANDIKA BUANA', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(889, '2526107228', 'ANGGER BAGUS PRADITA', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(890, '2526107229', 'DINDA NUR SYIFA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(891, '2526107230', 'DWI PUTRA INDRAWAN', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(892, '2526107231', 'EMMANUEL DUSTIN', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(893, '2526107232', 'FAIQ PUTRA PRIMA', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(894, '2526107233', 'FAISHAL RIDLO WALIYAKUB', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(895, '2526107234', 'FAREZQI SYIFANIA AMIN', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(896, '2526107235', 'GHINA ALZENA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(897, '2526107236', 'GUMINTANG SAFFAH SALSABILA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(898, '2526107237', 'HAZBY DZIKRI ROMADHON', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(899, '2526107238', 'JUNI PRATAMA SETIAWAN', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(900, '2526107239', 'KAYLA AURELIA WENAS', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(901, '2526107240', 'LUTFIYYAH NUR RAJABANI', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(902, '2526107241', 'NABIL KHILMI', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(903, '2526107242', 'NAILLA DWI SAPUTRI', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(904, '2526107243', 'NANDA ARZYL VAIZKY', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(905, '2526107244', 'NAZMA UL AULA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(906, '2526107245', 'NASYA AULIA AGUSTIN', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(907, '2526107246', 'NAYTA WIDYATUN ZAKIYAH', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(908, '2526107247', 'NAYZIA YUNIARTI  RADISTI', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(909, '2526107248', 'NURIL SATRIAJI', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(910, '2526107249', 'QAILA NAFISHA SYAQINA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(911, '2526107250', 'RATIH YEKTI ANINDYA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(912, '2526107251', 'REFA NURALINA', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(913, '2526107252', 'RIZAL AINUN FAKHRI', 'XI DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(914, '2526107253', 'ROFIKOH FAZAH RAMADANI', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(915, '2526107254', 'SASKIA WULANDARI', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(916, '2526107255', 'SITI INDAH ELFARIYANI', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(917, '2526107094', 'ZANETA NAJWA AGUSTIN', 'XI DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(918, '2526107257', 'AHMAD HANIF NUR WAHID', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(919, '2526107258', 'A\'INUN HASSYA WAFIYAH', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(920, '2526107260', 'ANGGI MELODY', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(921, '2526107261', 'BUNGA OKTAVIAN DARMAWAN', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(922, '2526107262', 'DANY DWINUR SANTOSO RAHARJA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(923, '2526107263', 'EGA HADYAN SAPUTRA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(924, '2526107264', 'FAKHUR ROZI AINUR ROPIK', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(925, '2526107265', 'GALIH TRI WIBOWO', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(926, '2526107266', 'HANIF DANANG PRATAMA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(927, '2526107267', 'ILYANA ALZALYA', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(928, '2526107268', 'ISNAENI', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(929, '2526107269', 'KEZA AGNESZA', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(930, '2526107270', 'KHAERUL HUDA PRATAMA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(931, '2526107271', 'KHOTIBUL IMAMI', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(932, '2526107272', 'KIKI PRASETYO', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(933, '2526107273', 'LIONIL MESSI OKDISEN SAPUTRA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(934, '2526107274', 'M. WAHYU DILAN FAJAR', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(935, '2526107275', 'MAHASIDDHA NAGARJUNA TILOPA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(936, '2526107276', 'MAULIDIYA NUR  AZIZAH', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(937, '2526107277', 'MOH. MUSTOFA INAL AKHYAR', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(938, '2526107278', 'MUHAMAD ARSIL MAJID', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(939, '2526107279', 'MUHAMAD SYAHRUL AZAM', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(940, '2526107280', 'MUHAMMAD AZFA ALIFIANSYAH', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(941, '2526107281', 'MUHAMMAD BAMBANG RIZKI PRATAMA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(942, '2526107282', 'MUHAMMAD ILHAM ARIFIN', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(943, '2526107283', 'NAILAH AISY BILQIS', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(944, '2526107284', 'NAZYA RIZKI AZZURI', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(945, '2526107285', 'NITARIC GIRTDIEN', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(946, '2526107286', 'PRADITA BAYU HERLAMBANG', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(947, '2526107287', 'RESTU FAHRY RAMADHAN', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', '');
INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas`, `jk`, `ttl`, `alamat`, `no_wa`, `ekstra`, `nama_ayah`, `nama_ibu`, `kerja_ayah`, `kerja_ibu`, `penghasilan_ortu`) VALUES
(948, '2526107288', 'RIO HANIF AL FITROH', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(949, '2526107289', 'SATRIA KANGEN WIJAYA', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(950, '2526107290', 'SELLY TRI ANANDA', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(951, '2526107291', 'TYARA INDAH ENJELLINA', 'XI PSPT 1', 'P', '', '', '', '', '', '', '', '', ''),
(952, '2526107677', 'YUDA RAMADHANI', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(953, '2526107490', 'ISMAN FIRMANSYAH', 'XI PSPT 1', 'L', '', '', '', '', '', '', '', '', ''),
(954, '2526107292', 'ABDULLAH AZZAM ALDIZA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(955, '2526107293', 'ADINDA SETIA WATI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(956, '2526107294', 'AISYAH FATKHARANI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(957, '2526107295', 'AKBAR RIZKY DWI FIRMANSAH', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(958, '2526107296', 'AKHMAD ZAYYAN FAIQ', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(959, '2526107298', 'ARTHA ASMARA WIDJAYA MANDIRI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(960, '2526107299', 'CHAIRUNNISA', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(961, '2526107300', 'DAFA PUTRA ALFIAN ALAMSYAH', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(962, '2526107301', 'DHENA AYU AZIZAH LESTARI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(963, '2526107303', 'DIMAS AL FAREZA SAPUTRA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(964, '2526107304', 'DINDA PUTRI ZASKIA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(965, '2526107305', 'DIQI NURFALAH', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(966, '2526107306', 'FADLI KHAERUL ZAKARIYA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(967, '2526107307', 'FATIH HYLMY', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(968, '2526107308', 'FEBRIAN RIZQI MAULICHA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(969, '2526107310', 'HELFA ZINEDINZIDANE FACHRI ALBAR', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(970, '2526107311', 'HERU LISTIYONO AJI', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(971, '2526107312', 'IMAM HIDAYAT', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(972, '2526107313', 'M. KHILMAN HIDAYAT', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(973, '2526107314', 'M. YUDA PRIANDANU', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(974, '2526107315', 'MIZAR ABABIL', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(975, '2526107318', 'NAYRA HAMAAM AZKIA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(976, '2526107319', 'PUTRA BHAKTI NUGROHO', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(977, '2526107320', 'RAIHAN GIAN ARYANTO', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(978, '2526107321', 'RIZKI ADI ZAKARIA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(979, '2526107322', 'SELI ALIA PUTRI', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(980, '2526107323', 'SILVI NUR MAULIDA', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(981, '2526107324', 'SITI NURBAETY QUROTAA\'AYUN', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(982, '2526107325', 'SRI RAHMAWATI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(983, '2526107326', 'TRI FADIL NUR NURAZAK', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(984, '2526107327', 'WILIAM DINDA RAMADANI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(985, '2526107584', 'MUHAMMAD IRZAM ALA BAYHAKI', 'XI PSPT 2', 'L', '', '', '', '', '', '', '', '', ''),
(986, '2526107541', 'MUHAMAD ALFANDI', 'XI PSPT 2', 'P', '', '', '', '', '', '', '', '', ''),
(987, '2425106198', 'AINUN NASYIFA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(988, '2425106199', 'AL FARIS ZAKARIYAH RAMADHAN', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(989, '2425106200', 'ANDIN NOVIA ROSYIDI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(990, '2425106201', 'ANDINI EKA SAPUTRI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(991, '2425106202', 'ANINDIYA MAIKA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(992, '2425106203', 'AVRE GENAYA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(993, '2425106204', 'CAHAYA APRILIA PUTRI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(994, '2425106205', 'CAHAYA BUNGA ANINDYA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(995, '2425106206', 'DENIS ALAMSYAH', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(996, '2425106207', 'ENRICO SEBASTIAN', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(997, '2425106208', 'FAISAL HAKIKI', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(998, '2425106209', 'FAREL RAMADAN', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(999, '2425106210', 'FIE AMRINA ROSADA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1000, '2425106211', 'FIKRI APRIANSYAH', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1001, '2425106212', 'HANIFA NALYA PUTRI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1002, '2425106213', 'HAYYA AMANY', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1003, '2425106214', 'IRLAN APRILIANSYACH', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1004, '2425106215', 'KEVIN FAHRURROZI AL HAQ', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1005, '2425106216', 'LAUDIA PUTRI ULFIYANI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1006, '2425106217', 'M. KHAIRUL IKHSAN', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1007, '2425106218', 'M. WILDAN  NUR SYAFIAN', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1008, '2425106219', 'MAGDALENA FATIMAH AZ ZAHRA SEGARA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1009, '2425106220', 'MIZYATUN NAZWA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1010, '2425106222', 'MUH. RAIKHAN FADILAH', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1011, '2425106223', 'MUHAMAD ABDUL REZA', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1012, '2425106225', 'MUHAMMAD HAEKAL FADHIL', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1013, '2425106966', 'MUHAMMAD AFAN ADIMASQI', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1014, '2425106226', 'MUHAMMAD VIRGIAWAN LISTIANTO', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1015, '2425106227', 'NADIA AYU KUSUMA AZIZ', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1016, '2425106228', 'NAZWA ROBIAH AL-ADAWIYAH', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1017, '2425106230', 'NURUL AINI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1018, '2425106231', 'NURUL IZZA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1019, '2425106232', 'OKTAVIA NESHA AGATHA', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1020, '2425106233', 'RAIHAN JUNIAR ADZIKRI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1021, '2425106234', 'RATU ASTRIANA', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1022, '2425106235', 'SRI WINDI ARTI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1023, '2425106236', 'SYAFIQ MAULANA ALWAFI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1024, '2425106237', 'TRI LUNA ANJANI', 'XII DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1025, '2425106238', 'ZHAHWAH AURORA PUTRI', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1026, '2425106968', 'SIGIT ABDUL MUTAKIN', 'XII DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1027, '2425106239', 'ABDI LUTFI PRATAMA', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1028, '2425106240', 'ABDI SETYO NUGROHO', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1029, '2425106241', 'ABDUL HANNAN SYAH FARDANI ADI P.', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1030, '2425106242', 'ADITYA RESKY MAULANA', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1031, '2425106243', 'AHMAD ZENAL ASIKIN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1032, '2425106244', 'AISYAH RAHMA', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1033, '2425106245', 'AUFA AZMI RIZQULLAH', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1034, '2425106246', 'AUFA NABIL ADNAN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1035, '2425106247', 'CAHAYA FATIMAH AZ ZAHRA', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1036, '2425106249', 'DELA PUPITASARI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1037, '2425106250', 'DIKA PRAMUDYA', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1038, '2425106251', 'DIMAS ADLI SETIAWAN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1039, '2425106252', 'DIVA MUFFAQI NAJIB', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1040, '2425106253', 'DWI INTAN KOMALA DEWI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1041, '2425106254', 'DWI MARDATILAH SAHARANI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1042, '2425106256', 'FARIS ABDITYA', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1043, '2425106257', 'HABIBATUL MAULIDA', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1044, '2425106258', 'HALIMATUSSA\'DIYYAH', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1045, '2425106259', 'HANI FITRIANI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1046, '2425106260', 'ILMA ZULFATUN AENI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1047, '2425106261', 'KHISNI HULUL ADNI', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1048, '2425106262', 'M. AKHDAN WACHDANI', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1049, '2425106264', 'MOCHAMMAD REZALDY ARIFIN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1050, '2425106265', 'MOH. GILANG RAMADAN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1051, '2425106267', 'MUHAMMAD ZUHRU ZAMAN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1052, '2425106269', 'NAYLA TRI RAMADHINI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1053, '2425106270', 'NURIA MAULIDAH', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1054, '2425106271', 'NURSYIFA GHADIZA ARIFAH', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1055, '2425106272', 'QEMAL GERALDINO RIZKY', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1056, '2425106273', 'REVI CAHYA MAULIDA', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1057, '2425106274', 'RIZKI SYARIF HIDAYATULLAH', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1058, '2425106275', 'RIZKY NUR OKTAFIANI', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1059, '2425106276', 'RIZKY RAMADHAN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1060, '2425106277', 'SULIS IFTAH FAUZIYAH', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1061, '2425106278', 'TIFANNY SHAFA AZ ZAHRA', 'XII DKV 2', 'P', '', '', '', '', '', '', '', '', ''),
(1062, '2425106279', 'UBAIDILLAH FAQIH', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1063, '2425106280', 'VINCENT ALEXANDER YANNIO', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1064, '2526116972', 'MUHAMAD ARIS SETIAWAN', 'XII DKV 2', 'L', '', '', '', '', '', '', '', '', ''),
(1065, '2425106281', 'ABDI PRANANTA', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1066, '2425106282', 'ADINDA PUTRI NABILA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1067, '2425106283', 'ALIVAH RARA ARIYANI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1068, '2425106284', 'ALIVIA NUR SYA\'BANI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1069, '2425106285', 'ALLEA KHAERINA PUTRI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1070, '2425106286', 'ALYAZALUNA FADIA\'ULNAJMI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1071, '2425106287', 'AROFAH HISYAM AD\'HA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1072, '2425106288', 'ATSALITSA YULIARTI SAFINA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1073, '2425106290', 'AZKA NUFAIL SYAKIR', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1074, '2425106291', 'AZRA KHAYLA ANINDYA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1075, '2425106292', 'AZZA NANI MAGHFIROH', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1076, '2425106293', 'DIANA RASTIYANA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1077, '2425106294', 'DWI SETYAWATI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1078, '2425106295', 'ERICHA VEYNIASTANIYA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1079, '2425106296', 'FABIAN PUTRA MUSTAMI', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1080, '2425106297', 'IQBAL KHOLIK SAHPUTRA', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1081, '2425106298', 'JESSICA ANDREANI NADITIA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1082, '2425106299', 'KHOIRUL HAMIDAH', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1083, '2425106300', 'KHUSNUL NOVIA AZZAHRA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1084, '2425106301', 'MUHAMMAD AKBAR YHANIZAR', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1085, '2425106302', 'MOCH. ALWAN RIZKI ADITIA', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1086, '2425106303', 'M. HUSEN LAITUPA', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1087, '2425106304', 'M. TEGUH FARKHAN AL-KHAN', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1088, '2425106305', 'MAYDEANA LABITA KATARINE', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1089, '2425106306', 'MOH. ARIEL KHAQ', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1090, '2425106307', 'MOH. YUNUS', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1091, '2425106308', 'MOHAMMAD DEFANO', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1092, '2425106309', 'MUHAMMAD AL FAUZI', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1093, '2425106310', 'MUHAMMAD ALIF FEBRIHARTO', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1094, '2425106311', 'MUHAMMAD IRZIN MAULANA', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1095, '2425106312', 'MUHAMMAD MIFTAKHUDIN', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1096, '2425106313', 'NAJWA AURA YASMIN', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1097, '2425106314', 'NASHA OCTAVIA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1098, '2425106315', 'NAZRIL ARIF', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1099, '2425106316', 'PUJI ROKHMATUL FAQIH', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1100, '2425106317', 'PUTRA ERDIANSYAH', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1101, '2425106318', 'SELI DWI CANTIKA', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1102, '2425106319', 'SEPTI PURNAMA RAMADHANI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1103, '2425106320', 'SITI ZIFANA SEPTIANI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1104, '2425106321', 'SULISTIAWATI', 'XII PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1105, '2425106322', 'SUPEBRI DIHAR SAPUTRA', 'XII PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1106, '2627108063', 'AHMAD FAHRI LABIQ', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1107, '2627108064', 'ANANDA ELLES PRAYITNO', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1108, '2627108065', 'ANDHINTYA REVA RAMADHANI', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1109, '2627108056', 'ANGEL VIORENZA RIYADI', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1110, '2627108067', 'ANGGA VINO PRATAMA', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1111, '2627108068', 'AZKA AZKIATUL MUNTAZZA', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1112, '2627108069', 'DEVIN REZKY SATORI', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1113, '2627108070', 'FAKHRI ABADI', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1114, '2627108071', 'FAZA ZAIDAH NABILATUL AZAMI', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1115, '2627108072', 'FIQI RAFA SULISTYAN', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1116, '2627108073', 'HAFIZAH NAZWA ISMAIL', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1117, '2627108074', 'HARITS SUFYAN ATSAURI', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1118, '2627108075', 'IBNU FAHRIZAL HILMI', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1119, '2627108076', 'ILHAM FADILLAH', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1120, '2627108077', 'KHAERUNNISA ABHARINA SAJIDAH', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1121, '2627108078', 'MOH. SURUR ARIFIN', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1122, '2627108079', 'MOHAMAD FAHMI SYAHRIZAL', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1123, '2627108080', 'MUH. DAFFA AZZAFI', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1124, '2627108081', 'MUHAMAD RAYKHAN BACHDIM', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1125, '2627108082', 'MUHAMMAD GHAZAN AHNAF GHAZALI', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1126, '2627108083', 'MUHAMMAD NIZZAM NURSALIM', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1127, '2627108084', 'NABILA FITRIA NINGSIH', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1128, '2627108085', 'NAFIATUL HIDAYAH', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1129, '2627108086', 'NIBIA ZATAILINI', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1130, '2627108087', 'PRASA NU\'ARSO TAULADANY', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1131, '2627108088', 'RICO ASADEL ALVARO', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1132, '2627108089', 'RIFQI WIBOWO', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1133, '2627108090', 'RINDI FITRI SAFARINA', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1134, '2627108091', 'RIZAQI SETIYAWAN', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1135, '2627108092', 'SABITA DINDA ARRASULI', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1136, '2627108093', 'SITI NUR AISYAH', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1137, '2627108094', 'ZAHRA NUR AINI NAFECHA', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1138, '2627108095', 'ZAIN RAFIF PUTRA', 'X DKV 1', 'L', '', '', '', '', '', '', '', '', ''),
(1139, '2627108096', 'ZHARFA NAURA HUSEIN', 'X DKV 1', 'P', '', '', '', '', '', '', '', '', ''),
(1140, '2627108130', 'ADLINA SYAKILA', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1141, '2627108131', 'AHMAD JAUHARUDIN KAMAL FATA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1142, '2627108132', 'AIDA ULFATUN NAILA', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1143, '2627108133', 'AISYAH NUR FADHILAH', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1144, '2627108134', 'ALZIARA SEPTIANA', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1145, '2627108135', 'ARVERO KHULFA ADHANI', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1146, '2627108136', 'AUFAL MEROM', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1147, '2627108137', 'AULIA RAHMA', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1148, '2627108138', 'CAHAYA APRIZAH KURNIYANTO', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1149, '2627108139', 'CLAUREL SHEERA W.', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1150, '2627108140', 'ELVIN SANJAYA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1151, '2627108141', 'FADIA AKHMAD', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1152, '2627108142', 'FALDO RIZKY RAMADHAN', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1153, '2627108143', 'FIQIH FAKRIZALANI', 'X PSPT', 'L', '', '', '', '', '', '', '', '', '');
INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas`, `jk`, `ttl`, `alamat`, `no_wa`, `ekstra`, `nama_ayah`, `nama_ibu`, `kerja_ayah`, `kerja_ibu`, `penghasilan_ortu`) VALUES
(1154, '2627108144', 'FIZI AKBAR RAMADHAN', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1155, '2627108145', 'INDRA MUFTI MAHESA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1156, '2627108146', 'KENDANA NDORO SANO', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1157, '2627108147', 'LAURA WINDY APRILIA', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1158, '2627108148', 'M FATIR KARIM', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1159, '2627108149', 'M. IBNU HASAN', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1160, '2627108150', 'MAFATIHIR RAFA ALAWI', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1161, '2627108151', 'MOCH. ZHAENUL MUSTOFA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1162, '2627108152', 'MUHAMAD FADLAN MAULANA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1163, '2627108153', 'MUHAMAD FATHUR RAHMAN', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1164, '2627108154', 'MUHAMAD YUSRIL MUSTAQIEM', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1165, '2627108155', 'MUHAMMAD DIKA PUJI MAULANA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1166, '2627108156', 'MUHAMMAD RISKY ROMADON', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1167, '2627108157', 'NEYSA HASNA KHAIRUNNISA', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1168, '2627108158', 'RAFA GUSTI PRATAMA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1169, '2627108159', 'RAIHAN KRISDIYANTO', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1170, '2627108160', 'RETNO MULYAWATI', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1171, '2627108161', 'ROSITA PUTRI', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1172, '2627108162', 'RULLENCIA SEPTIANI SAFITRI', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1173, '2627108163', 'SASKYA SALZABILLAH', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1174, '2627108164', 'SATRIA PUTRA SETIAWAN', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1175, '2627108165', 'SURYA ADI TAMA', 'X PSPT', 'L', '', '', '', '', '', '', '', '', ''),
(1176, '2627108166', 'WAHYUNIA IKA NURJANAH', 'X PSPT', 'P', '', '', '', '', '', '', '', '', ''),
(1177, '2627107995', 'ADITYA AFTRO', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1178, '2627107996', 'ADITYA RIFQI PRATAMA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1179, '2627107997', 'AINUN BILKIS', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1180, '2627107998', 'AKBAR SEPUTRA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1181, '2627107999', 'ALSA TRIANA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1182, '2627108000', 'ANISA PUTRI FEBRIANI', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1183, '2627108001', 'ARDIYANSYAH', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1184, '2627108002', 'ARSYA C. AL ZAHRRA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1185, '2627108003', 'AVKA BAGUS PRATAMA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1186, '2627108004', 'AYATUL KHUSNA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1187, '2627108005', 'BAYU DWI LESMANA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1188, '2627108006', 'BINTANG FITRIANAH SUHARTO', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1189, '2627108007', 'CHELA OKTA HOSANA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1190, '2627108008', 'DEWI MUSTIKA SARI', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1191, '2627108009', 'DZAKY DAVADIEN ISMAIL', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1192, '2627108010', 'ELYSA REVIANA RISTY', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1193, '2627108011', 'FADLAN MUAINUL MUBIN', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1194, '2627108012', 'FALYA HADIE ALTHAFUNISA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1195, '2627108013', 'FATHYA ARDHA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1196, '2627108014', 'HABIBAH FILDZA SABRINA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1197, '2627108015', 'KEISHA NURAENI NAJIBAH', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1198, '2627108016', 'MAULANA ADITIA SAPUTRA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1199, '2627108017', 'MOH. ALZAMUL HIKAM', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1200, '2627108018', 'MUHAMMAD DIVO FARIANSYAH', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1201, '2627108019', 'NAZRIEL PUTRA ARDANA', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1202, '2627108020', 'NEA YUNIRA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1203, '2627108021', 'RISMA AZ ZAHWA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1204, '2627108022', 'RISQI AMELLIA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1205, '2627108023', 'SAHABAT FIRMAN', 'X TKJ 4', 'L', '', '', '', '', '', '', '', '', ''),
(1206, '2627108024', 'SINTA KUMALA SARI', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1207, '2627108025', 'SYAKILA RAMADHANI', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1208, '2627108026', 'TIAS AYU ASTIZA', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1209, '2627108027', 'ZAHIRA NATASYA PUTRI', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1210, '2627108028', 'ZAHWA KHAFIZAH', 'X TKJ 4', 'P', '', '', '', '', '', '', '', '', ''),
(1211, '2627108029', 'ADHITAMA DWI PANGESTU', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1212, '2627108030', 'AMELIA NADIFA FITRI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1213, '2627108031', 'BIMA RANGGA WIJAYA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1214, '2627108032', 'CANDRA PRADIPTA BIMA SENA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1215, '2627108033', 'DAFA SAUQI SAFANI', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1216, '2627108034', 'DANDI ARIF WICAKSONO', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1217, '2627108035', 'EHAN DWI ARYANTO', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1218, '2627108036', 'ERSA NADIA ALTAFANISA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1219, '2627108037', 'FADILAH AHMAD MAULANA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1220, '2627108038', 'FANEZ ARYA WIJAYA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1221, '2627108039', 'HUSNI RAKHIM', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1222, '2627108040', 'JUWITA WULANDARI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1223, '2627108041', 'KAMILA ZAHROTUL WAKHIDA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1224, '2627108042', 'KANIA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1225, '2627108043', 'KASIH APRIANI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1226, '2627108044', 'KEZIA CHRISTY KURNIAWAN', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1227, '2627108045', 'KHANSA AURA ZAHRA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1228, '2627108046', 'LINVINA SARI DEWI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1229, '2627108047', 'M. RIZQI MAULANA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1230, '2627108048', 'MAHIRA HASNA KAMILA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1231, '2627108049', 'MARSYA ABEL SAFITRI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1232, '2627108050', 'MOH FIRMAN JAFARI', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1233, '2627108051', 'MOH. MAFATIKHUL MIZAN', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1234, '2627108052', 'NAFIATUN NABIILAH', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1235, '2627108053', 'NOVA DWI VANESA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1236, '2627108054', 'NUR MAY ISTANTI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1237, '2627108055', 'RAFKI BAGUS PRATAMA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1238, '2627108056', 'SALSABILA NADIYA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1239, '2627108057', 'SYAFA PUTRI ALVIRIANI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1240, '2627108058', 'VINZA AMALIA PUTRI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1241, '2627108059', 'WINDA YUNI PRATAMA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1242, '2627108060', 'YUDHA FAHREZA', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1243, '2627108061', 'YUSRON IBADILLAH', 'X TKJ 5', 'L', '', '', '', '', '', '', '', '', ''),
(1244, '2627108062', 'ZASKIA ANASTASYA', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1245, '-', 'SUCI ROSMAWATI', 'X TKJ 5', 'P', '', '', '', '', '', '', '', '', ''),
(1246, '2627108669', 'ABDUL LATIF', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1247, '2627108670', 'AHMAD ALFAHRI', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1248, '2627108671', 'AKMAL SYIFA AL HADIRI', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1249, '2627108672', 'ALBI PRIMADHIKA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1250, '2627108673', 'ALBIZAR MUHAROMI', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1251, '2627108674', 'AQIB MUSYAFA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1252, '2627108675', 'ARLAN FAHMI IHFANI', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1253, '2627108676', 'ARYA SATRIA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1254, '2627108677', 'ASEP KHAFID AZZAMI', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1255, '2627108678', 'DAFA ARDIANSYAH', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1256, '2627108679', 'DWI PRASETYO', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1257, '2627108680', 'EGI SATRIYAN', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1258, '2627108681', 'FADLI EKO SAPUTRA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1259, '2627108682', 'IKHWAN AL AMIN', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1260, '2627108683', 'KHAERUL SANDIKA MULYA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1261, '2627108684', 'M.MAHFUDZ KAFABIH', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1262, '2627108685', 'MARFIN ARDIAN SYAH PUTRA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1263, '2627108686', 'MAULANA AHMAD MUBAROK', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1264, '2627108687', 'MOH. ZIDAN', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1265, '2627108688', 'MOHAMAD REHAN AS SIDIQ', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1266, '2627108689', 'MOHAMMAD AWALUDIN', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1267, '2627108690', 'MUHAMMAD ARKHAN ANDREAS', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1268, '2627108691', 'MUHAMMAD AL-FATH WIGUNA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1269, '2627108692', 'MUHAMMAD WILDAN SAPUTRA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1270, '2627108693', 'NANDA SURYA BUMANTARA', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1271, '2627108694', 'NOVAL FAWAS HUSEIN', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1272, '2627108695', 'PUTRI VANIA ALINE', 'X TKR 4', 'P', '', '', '', '', '', '', '', '', ''),
(1273, '2627108696', 'RAFA IZAM FIRMANSYAH', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1274, '2627108697', 'REFAN ARI WIBOWO', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1275, '2627108698', 'REZAR ALYATAR ATAHASAN', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1276, '2627108699', 'RIDHO ANGGER PRASETYO', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1277, '2627108700', 'SAFINATUL JANAH', 'X TKR 4', 'P', '', '', '', '', '', '', '', '', ''),
(1278, '2627108701', 'TANFA YANUAR KISDIANO', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1279, '2627108702', 'TRI BAGUS HARYANTO', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1280, '2627108703', 'ZENDRA SATRIA GANDA BAYU', 'X TKR 4', 'L', '', '', '', '', '', '', '', '', ''),
(1282, 'NIS', 'Nama', 'Kelas', 'JK', 'TTL', 'Alamat', 'No_WA', 'Ekstra', 'Nama_Ayah', 'Nama_Ibu', 'Pekerjaan_Ayah', 'Pekerjaan_Ibu', 'Penghasilan_Ortu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_meta`
--

CREATE TABLE `siswa_meta` (
  `nis` varchar(50) NOT NULL,
  `kontak_darurat` varchar(255) DEFAULT NULL,
  `catatan_medis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `struktur_kelas`
--

CREATE TABLE `struktur_kelas` (
  `id` int(11) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `nama_siswa` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `struktur_kelas`
--

INSERT INTO `struktur_kelas` (`id`, `kelas`, `jabatan`, `nis`, `nama_siswa`) VALUES
(1, 'X DKV 2', 'Ketua Kelas', '', 'MOH. TASYAHRUL RAMADHANI'),
(2, 'X DKV 2', 'Wakil Ketua', '', 'AMANDA SAFIRA'),
(3, 'X DKV 2', 'Sekretaris', '', 'FARDINA ASHAFIYAH'),
(4, 'X DKV 2', 'Bendahara', '', 'AENA RIZQIYAH'),
(5, 'X DKV 2', 'Anggota', '', 'KAYLA NUR SYAFAATI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tatatertib`
--

CREATE TABLE `tatatertib` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `pelanggaran` varchar(255) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `mapel` varchar(150) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `instruksi` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `rubrik_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`id`, `nip`, `kelas`, `mapel`, `judul`, `deadline`, `instruksi`, `lampiran`, `rubrik_id`) VALUES
(1, 'rofiq', 'X DKV 2', '', 'Tugas', '2026-07-26', 'Wajib', '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(150) DEFAULT NULL,
  `nip` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `kelas`, `nama_lengkap`, `nip`) VALUES
(1, 'rofiq', '$2y$10$OXE.j6uGUWUCSUk3qEXx9OP6CQ14DzuQNY9bHgrY6rUr9xk2GxCR.', 'Walikelas', 'X DKV 2', 'Mohamad Ainur Rofiq, S.Pd', 'rofiq'),
(2, 'anggun', '$2y$10$RyDhhVVrlcNr2i.dLcZB2Ocs.UKYC/RHm63f1SzYfW86x2XTovJcC', 'Walikelas', 'XII PSPT', 'Anggun Lukmana, S.Kom.i', 'anggun'),
(3, 'isna', '$2y$10$9YmDClrUNFXhJkLf0R6gnOopUWjI3nfTqmh.qzO8ydfviVHalhBgC', 'Walikelas', 'XI PSPT 1', 'Isna Nahia, S.Pd', 'isna'),
(4, 'hamid', '$2y$10$nOeT.4WNX4W1rK6lBDLHfum4A7ihBS2FvvY1zY7/WhkfDmWmpoKW6', 'Walikelas', 'XII DKV 2', 'Nurul Hamid, S.Kom,', 'hamid'),
(5, 'herlita', '$2y$10$o8YzTCyO4Zr8SN6YQfy1K.73JReWUg2QT8V.jbLGdyP7FpfBnhwBO', 'Walikelas', 'XI DKV 2', 'Herlita Ayu, S.Pd.', 'herlita'),
(6, 'satria', '$2y$10$HzJZwNuq/NDikbCBssw9hOZDVd46A8MMHc.JM3rnLcV3tRQkPN/Vi', 'Walikelas', 'XI PSPT 2', 'Satria Pratam G.W, S.Kom.', 'satria'),
(7, 'umy', '$2y$10$NvEw.havpkXhECQ2fUHIrurXjo/.sbnneg.U0OZUcWZMpJsSpnP2m', 'Walikelas', 'X PSPT', 'Umy Khoerunnisya, S.Pd.', 'umy'),
(8, 'ketua', '$2y$10$7KK5pBlv7hY6XEMfO9FxSuq1jk.JbVkLWK8vyoK48Zspif6FtfaVi', 'Ketua', 'X DKV 2', 'Ketua', ''),
(9, 'adam', '$2y$10$tJPFEbspb9NcnoYr8jNkkOfVJ117/vdeVIAGo.9XjakTxsC5b6Hda', 'Guru', '', 'Adam Pramudiar, S.Kom', 'adam'),
(10, 'sekretaris', '$2y$10$M40Tm8tM32T4LPnfgzoRm.iX82d718.JGyDT496sPmGD8m5IY1goS', 'Sekretaris', 'X DKV 2', 'Sekretaris', ''),
(11, 'bendahara', '$2y$10$p8ibUUzsD8j7396GWNymGOXwz3XgcXlOnkS7Ys4.tDpTyFcpf4S22', 'Bendahara', 'X DKV 2', 'Bendahara', ''),
(12, '111', '$2y$10$8BYtN4ScJzryXEaQ7xxs/Ok0enurum2GDxMeqP9YEXuU6BdyC68oe', 'Siswa', 'X DKV 2', 'ABIGAIL NATASHA SETIA WAYORI', ''),
(13, '112', '$2y$10$CULhDDRFhgQ3qs6.r/8aceT9J410kC73TzBG1nGeDYHxXGpa3p70q', 'Siswa', 'X DKV 2', 'AENA AZQIYAH', ''),
(14, '113', '$2y$10$Mxj50tr.tN.FPHgpNbWEsOJDWTH99i3OdklblRhdxyNSnU86E7KSu', 'Siswa', 'X DKV 2', 'AJI SETIAJI', ''),
(15, '114', '$2y$10$H5p9xuOt7nQfug4kRcAYR.JybUJXaK5BUq0GJ27qXbp7SGTG07VF.', 'Siswa', 'X DKV 2', 'AKBAR KHALIF JAHBANA', ''),
(16, '115', '$2y$10$3vy2DEROYjxizJkSiF7IgeNIH7AEsx.ZzPbvzMejgmkSRIkR5TuDu', 'Siswa', 'X DKV 2', 'ALFAN ALFIAN SALIM', ''),
(17, '116', '$2y$10$Gs6pjEnWZnMUltDLRsi3/.7goZxQosXIXH1UqxF605c6JS19JVcE6', 'Siswa', 'X DKV 2', 'ALFATIR NAZRIEL ILHAM', ''),
(18, '117', '$2y$10$JYrVEqYJCcr8dvClVasPReaCByDdE9zFKVxZOE3V3VwGzXu2pgXVC', 'Siswa', 'X DKV 2', 'AMANDA SAFIRA', ''),
(19, '118', '$2y$10$/3f39ZD9ocJHqUp37t7Tmu5pQ2wako0ZXFKHOhxDpYPe5DNL3ecP.', 'Siswa', 'X DKV 2', 'ANDREA DIANONE', ''),
(20, '119', '$2y$10$7BQEbDZh5Y//qM.26WFug.jvoKbDTnp9owKwBFPK42/nnUvAkkkYK', 'Siswa', 'X DKV 2', 'CHESTA DAFFA WIDIYANTO', ''),
(21, '120', '$2y$10$naghuQ0/b7TZ8P1CJhMLNOU.A9vGpc8wlqUZou2qp5zvQnN6EzoRm', 'Siswa', 'X DKV 2', 'DEVON RAJA BANAZAR', ''),
(22, '121', '$2y$10$uwyD46FJZIZFHVq5bOcWDecujzDg/OFcFamXs/3Z9DUiE86PpoppG', 'Siswa', 'X DKV 2', 'DITYO NUGROHO', ''),
(23, '122', '$2y$10$0igoCliUHWNX9UwG.DkM9OCiTS89Q2EmL3eLHq0rK4RpeTeZXFJUy', 'Siswa', 'X DKV 2', 'FARDINA ASHAFIYYAH RAMADHANI', ''),
(24, '123', '$2y$10$pq4k/PJcXJ51YcJNUVWMiu1DS5HxhluMmk0O4f508jmlnOsbhQZ6m', 'Siswa', 'X DKV 2', 'FAUZI AHMAD IBNU MAJAH', ''),
(25, '124', '$2y$10$v9lS1a7JcJagkvx.I.6XUuNmbshy36JsFx8hNh8gqfdiVADv6xWeK', 'Siswa', 'X DKV 2', 'FITRI TAHTA ALFIANA', ''),
(26, '125', '$2y$10$DIw1cZrKU5V1FRE7XQ7G9OELBwhbeeGnZUYBJA/GZZJ1WzsP0BWxK', 'Siswa', 'X DKV 2', 'HAMDAN HANIFAN AKBAR', ''),
(27, '126', '$2y$10$Zvta3qsTtVPDq9v3IhqzgeXqOhcSSN4msxqYGjtPTy51hjNZu4Hva', 'Siswa', 'X DKV 2', 'IBNI AQIL AL MALIKI', ''),
(28, '127', '$2y$10$uid8n3rl1/bZQWpNnTt5n.K1ZnZ6N7jq2gNqfzeolJ2J.lIDCjHVO', 'Siswa', 'X DKV 2', 'ISNAN FEZA MUSTAFID', ''),
(29, '128', '$2y$10$KABD5huNeYuSmemTFhI.nuEvhXbOGULIElpfH1j3p9KYqCgVDTb5y', 'Siswa', 'X DKV 2', 'KAYLA NUR SYAFA\'ATI', ''),
(30, '129', '$2y$10$X7ZQZyVoJ0LhWHoTzlvOx.luzzbaOcf0FZynMHqcv6xCmFnDGWQze', 'Siswa', 'X DKV 2', 'KIARA MELINDA', ''),
(31, '130', '$2y$10$gYNXO92Iuz9cIqjmqIM7h.d5EZnJuqPgCWUhYIuQYl37lHrTwuhVO', 'Siswa', 'X DKV 2', 'MOH. TASSYAHRUL RAMADHANI', ''),
(32, '131', '$2y$10$rh3JjjC/IHCGlBhv1STasOUiLut69TdHcu88fKnqyl2EMdEkXKvsG', 'Siswa', 'X DKV 2', 'MUHAMAD AJI ALFARIS', ''),
(33, '132', '$2y$10$U2qyGxIFvpopLvAhxpf7sufWgGn/FBQIHrJm4Coj1YWGmrJmOSbWC', 'Siswa', 'X DKV 2', 'MUHAMMAD AFFIFUDIN', ''),
(34, '133', '$2y$10$ZtVm3xfqKVmLQeVi24IAKOK4YSxdYFzp.ln16ZWglcBqHAJVBy/l6', 'Siswa', 'X DKV 2', 'MUHAMMAD PANJI', ''),
(35, '134', '$2y$10$tID2G7ikXPP6td5WUNj0vercM8Tm4ZAWdU6x0CcNjzrbHjyGPzk8G', 'Siswa', 'X DKV 2', 'NIYARA FHALASIFA', ''),
(36, '135', '$2y$10$ksHpAJpM6A0lWi/5r0mKFOwIbKPVwPXnCwvP2jrz1FVT4VPM7lo66', 'Siswa', 'X DKV 2', 'NOERIEN MU\'IDZ BACHTIAR', ''),
(37, '136', '$2y$10$HDZVwOF3HWOtJwP5zhy5feLdpscrNNePjvwIhc9pDaYs8CC/VtvbS', 'Siswa', 'X DKV 2', 'OVI NURAINI', ''),
(38, '137', '$2y$10$Px4UJ68H8JJV8kr4rd/AAuxci1XfpPwhmFhjH0OWHkBTwGWzRXR5u', 'Siswa', 'X DKV 2', 'RAYNOR TERTIA DARMAWAN', ''),
(39, '138', '$2y$10$PCFRjmcqB.kqe5JzGl4R3uBC7G48UoFTzs0JN7xriSQPvJOGw.fMO', 'Siswa', 'X DKV 2', 'RINI AMALIA PUTRI', ''),
(40, '139', '$2y$10$QijSsjrS2AEqibegNWmWxuDsq9wbXtz5DG5ei7PxfrnYAnA.DyfCy', 'Siswa', 'X DKV 2', 'RIZQI ANDHIKA PRATAMA', ''),
(41, '140', '$2y$10$hdYbAEWxEMV233H0SO1OAevGfId1Piq.KoBcl93sL5Vp97Xqu1SIG', 'Siswa', 'X DKV 2', 'SEPTIANI NANDINI', ''),
(42, '141', '$2y$10$/PC4lj1orOL1pbcnO.pnpedHvmZO43de2n9aoeNIEEfeM0jLCmUlC', 'Siswa', 'X DKV 2', 'SITI AZMI FITRIANI', ''),
(43, '142', '$2y$10$OZeo8D0DSxVJLTA7yFwizeL/l9hkYQc4KNceACn6BgPKnPNVCAPS2', 'Siswa', 'X DKV 2', 'TRI ULFIYA FATKHUL JANAH', ''),
(44, '143', '$2y$10$DBiwu0U3ACG8GzMonxD7VulVZbc8BeO2eD/Hp2LP7uZKYOw35q7Bq', 'Siswa', 'X DKV 2', 'ZAINI PUTRA PRATAMA', ''),
(45, '0', '$2y$10$MhYxOIn3blMA4YEFG0y78.vu9d9nG2/70Hz4ySOo1z56LpHag9CBq', 'Siswa', 'X PSPT', 'adlin', ''),
(46, '256107257', '$2y$10$6dxIc/Vjhf3tPY.EbG3Zz.RLa3SR7awj2UxF5GCl3W22dwSurwsL2', 'Siswa', 'XI PSPT 1', 'Ahmad Haniif Nur Wahid', ''),
(47, '256107258', '$2y$10$TUeBihYQW8/zbIeBNijmz.n.Vfmf/KDqPrCTpsohyqqBlv5TXi5vW', 'Siswa', 'XI PSPT 1', 'A\'inun Hasya Wafiyah', ''),
(48, '256107260', '$2y$10$atCMm6wnMbuoCPDC9fFM1et8l4MXYd.pegTp4CtV3mOYFLgegv102', 'Siswa', 'XI PSPT 1', 'Anggi Melodya', ''),
(49, '256107261', '$2y$10$AWJjv7pPU3dz.9NqZpDcZurNS2ieM1EyJ9fHawZM.hdxTm.V74YqK', 'Siswa', 'XI PSPT 1', 'Bunga Oktavian Darmawan', ''),
(50, '256107262', '$2y$10$v0HEqt4s7EPWPxh797bD7ufaZkBCPpwXWyP0HZpAWUtbppL64/AKC', 'Siswa', 'XI PSPT 1', 'Dany Dwinur Santoso Raharja', ''),
(52, 'admin', '$2y$10$cjtG1syvBuaEox2SeDJvg.SdMEWJuqQ2p5pj4bm4/YohXaUMQHF5G', 'SuperAdmin', 'ALL', 'Administrator', ''),
(53, 'toolman', '$2y$10$cO7oULdQ2012XKI2r/FPvOz1sW5D6JI9lkPLcyMOIRdFUqnHiUkf2', 'Toolman', 'ALL', 'Agus Sukisno', ''),
(55, '2425106281', '$2y$10$haRBYdOFMmmHb7zj8Eg1K.8bJARsFBiw/dFmF4LfGghDFn8tubfv.', 'Siswa', 'XII PSPT', 'ABDI PRANANTA', ''),
(59, '2627108063', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'AHMAD FAHRI LABIQ', ''),
(60, '2627108064', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ANANDA ELLES PRAYITNO', ''),
(61, '2627108065', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ANDHINTYA REVA RAMADHANI', ''),
(62, '2627108056', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ANGEL VIORENZA RIYADI', ''),
(63, '2627108067', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ANGGA VINO PRATAMA', ''),
(64, '2627108068', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'AZKA AZKIATUL MUNTAZZA', ''),
(65, '2627108069', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'DEVIN REZKY SATORI', ''),
(66, '2627108070', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'FAKHRI ABADI', ''),
(67, '2627108071', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'FAZA ZAIDAH NABILATUL AZAMI', ''),
(68, '2627108072', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'FIQI RAFA SULISTYAN', ''),
(69, '2627108073', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'HAFIZAH NAZWA ISMAIL', ''),
(70, '2627108074', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'HARITS SUFYAN ATSAURI', ''),
(71, '2627108075', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'IBNU FAHRIZAL HILMI', ''),
(72, '2627108076', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ILHAM FADILLAH', ''),
(73, '2627108077', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'KHAERUNNISA ABHARINA SAJIDAH', ''),
(74, '2627108078', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'MOH. SURUR ARIFIN', ''),
(75, '2627108079', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'MOHAMAD FAHMI SYAHRIZAL', ''),
(76, '2627108080', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'MUH. DAFFA AZZAFI', ''),
(77, '2627108081', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'MUHAMAD RAYKHAN BACHDIM', ''),
(78, '2627108082', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'MUHAMMAD GHAZAN AHNAF GHAZALI', ''),
(79, '2627108083', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'MUHAMMAD NIZZAM NURSALIM', ''),
(80, '2627108084', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'NABILA FITRIA NINGSIH', ''),
(81, '2627108085', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'NAFIATUL HIDAYAH', ''),
(82, '2627108086', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'NIBIA ZATAILINI', ''),
(83, '2627108087', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'PRASA NU\'ARSO TAULADANY', ''),
(84, '2627108088', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'RICO ASADEL ALVARO', ''),
(85, '2627108089', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'RIFQI WIBOWO', ''),
(86, '2627108090', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'RINDI FITRI SAFARINA', ''),
(87, '2627108091', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'RIZAQI SETIYAWAN', ''),
(88, '2627108092', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'SABITA DINDA ARRASULI', ''),
(89, '2627108093', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'SITI NUR AISYAH', ''),
(90, '2627108094', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ZAHRA NUR AINI NAFECHA', ''),
(91, '2627108095', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ZAIN RAFIF PUTRA', ''),
(92, '2627108096', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X DKV 1', 'ZHARFA NAURA HUSEIN', ''),
(93, '2627108130', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'ADLINA SYAKILA', ''),
(94, '2627108131', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'AHMAD JAUHARUDIN KAMAL FATA', ''),
(95, '2627108132', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'AIDA ULFATUN NAILA', ''),
(96, '2627108133', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'AISYAH NUR FADHILAH', ''),
(97, '2627108134', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'ALZIARA SEPTIANA', ''),
(98, '2627108135', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'ARVERO KHULFA ADHANI', ''),
(99, '2627108136', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'AUFAL MEROM', ''),
(100, '2627108137', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'AULIA RAHMA', ''),
(101, '2627108138', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'CAHAYA APRIZAH KURNIYANTO', ''),
(102, '2627108139', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'CLAUREL SHEERA W.', ''),
(103, '2627108140', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'ELVIN SANJAYA', ''),
(104, '2627108141', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'FADIA AKHMAD', ''),
(105, '2627108142', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'FALDO RIZKY RAMADHAN', ''),
(106, '2627108143', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'FIQIH FAKRIZALANI', ''),
(107, '2627108144', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'FIZI AKBAR RAMADHAN', ''),
(108, '2627108145', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'INDRA MUFTI MAHESA', ''),
(109, '2627108146', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'KENDANA NDORO SANO', ''),
(110, '2627108147', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'LAURA WINDY APRILIA', ''),
(111, '2627108148', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'M FATIR KARIM', ''),
(112, '2627108149', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'M. IBNU HASAN', ''),
(113, '2627108150', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MAFATIHIR RAFA ALAWI', ''),
(114, '2627108151', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MOCH. ZHAENUL MUSTOFA', ''),
(115, '2627108152', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MUHAMAD FADLAN MAULANA', ''),
(116, '2627108153', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MUHAMAD FATHUR RAHMAN', ''),
(117, '2627108154', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MUHAMAD YUSRIL MUSTAQIEM', ''),
(118, '2627108155', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MUHAMMAD DIKA PUJI MAULANA', ''),
(119, '2627108156', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'MUHAMMAD RISKY ROMADON', ''),
(120, '2627108157', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'NEYSA HASNA KHAIRUNNISA', ''),
(121, '2627108158', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'RAFA GUSTI PRATAMA', ''),
(122, '2627108159', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'RAIHAN KRISDIYANTO', ''),
(123, '2627108160', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'RETNO MULYAWATI', ''),
(124, '2627108161', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'ROSITA PUTRI', ''),
(125, '2627108162', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'RULLENCIA SEPTIANI SAFITRI', ''),
(126, '2627108163', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'SASKYA SALZABILLAH', ''),
(127, '2627108164', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'SATRIA PUTRA SETIAWAN', ''),
(128, '2627108165', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'SURYA ADI TAMA', ''),
(129, '2627108166', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X PSPT', 'WAHYUNIA IKA NURJANAH', ''),
(130, '2627107995', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ADITYA AFTRO', ''),
(131, '2627107996', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ADITYA RIFQI PRATAMA', ''),
(132, '2627107997', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'AINUN BILKIS', ''),
(133, '2627107998', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'AKBAR SEPUTRA', ''),
(134, '2627107999', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ALSA TRIANA', ''),
(135, '2627108000', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ANISA PUTRI FEBRIANI', ''),
(136, '2627108001', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ARDIYANSYAH', ''),
(137, '2627108002', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ARSYA C. AL ZAHRRA', ''),
(138, '2627108003', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'AVKA BAGUS PRATAMA', ''),
(139, '2627108004', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'AYATUL KHUSNA', ''),
(140, '2627108005', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'BAYU DWI LESMANA', ''),
(141, '2627108006', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'BINTANG FITRIANAH SUHARTO', ''),
(142, '2627108007', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'CHELA OKTA HOSANA', ''),
(143, '2627108008', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'DEWI MUSTIKA SARI', ''),
(144, '2627108009', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'DZAKY DAVADIEN ISMAIL', ''),
(145, '2627108010', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ELYSA REVIANA RISTY', ''),
(146, '2627108011', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'FADLAN MUAINUL MUBIN', ''),
(147, '2627108012', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'FALYA HADIE ALTHAFUNISA', ''),
(148, '2627108013', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'FATHYA ARDHA', ''),
(149, '2627108014', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'HABIBAH FILDZA SABRINA', ''),
(150, '2627108015', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'KEISHA NURAENI NAJIBAH', ''),
(151, '2627108016', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'MAULANA ADITIA SAPUTRA', ''),
(152, '2627108017', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'MOH. ALZAMUL HIKAM', ''),
(153, '2627108018', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'MUHAMMAD DIVO FARIANSYAH', ''),
(154, '2627108019', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'NAZRIEL PUTRA ARDANA', ''),
(155, '2627108020', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'NEA YUNIRA', ''),
(156, '2627108021', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'RISMA AZ ZAHWA', ''),
(157, '2627108022', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'RISQI AMELLIA', ''),
(158, '2627108023', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'SAHABAT FIRMAN', ''),
(159, '2627108024', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'SINTA KUMALA SARI', ''),
(160, '2627108025', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'SYAKILA RAMADHANI', ''),
(161, '2627108026', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'TIAS AYU ASTIZA', '');
INSERT INTO `users` (`id`, `username`, `password`, `role`, `kelas`, `nama_lengkap`, `nip`) VALUES
(162, '2627108027', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ZAHIRA NATASYA PUTRI', ''),
(163, '2627108028', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 4', 'ZAHWA KHAFIZAH', ''),
(164, '2627108029', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'ADHITAMA DWI PANGESTU', ''),
(165, '2627108030', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'AMELIA NADIFA FITRI', ''),
(166, '2627108031', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'BIMA RANGGA WIJAYA', ''),
(167, '2627108032', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'CANDRA PRADIPTA BIMA SENA', ''),
(168, '2627108033', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'DAFA SAUQI SAFANI', ''),
(169, '2627108034', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'DANDI ARIF WICAKSONO', ''),
(170, '2627108035', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'EHAN DWI ARYANTO', ''),
(171, '2627108036', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'ERSA NADIA ALTAFANISA', ''),
(172, '2627108037', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'FADILAH AHMAD MAULANA', ''),
(173, '2627108038', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'FANEZ ARYA WIJAYA', ''),
(174, '2627108039', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'HUSNI RAKHIM', ''),
(175, '2627108040', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'JUWITA WULANDARI', ''),
(176, '2627108041', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'KAMILA ZAHROTUL WAKHIDA', ''),
(177, '2627108042', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'KANIA', ''),
(178, '2627108043', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'KASIH APRIANI', ''),
(179, '2627108044', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'KEZIA CHRISTY KURNIAWAN', ''),
(180, '2627108045', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'KHANSA AURA ZAHRA', ''),
(181, '2627108046', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'LINVINA SARI DEWI', ''),
(182, '2627108047', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'M. RIZQI MAULANA', ''),
(183, '2627108048', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'MAHIRA HASNA KAMILA', ''),
(184, '2627108049', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'MARSYA ABEL SAFITRI', ''),
(185, '2627108050', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'MOH FIRMAN JAFARI', ''),
(186, '2627108051', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'MOH. MAFATIKHUL MIZAN', ''),
(187, '2627108052', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'NAFIATUN NABIILAH', ''),
(188, '2627108053', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'NOVA DWI VANESA', ''),
(189, '2627108054', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'NUR MAY ISTANTI', ''),
(190, '2627108055', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'RAFKI BAGUS PRATAMA', ''),
(191, '-', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'SUCI ROSMAWATI', ''),
(192, '2627108057', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'SYAFA PUTRI ALVIRIANI', ''),
(193, '2627108058', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'VINZA AMALIA PUTRI', ''),
(194, '2627108059', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'WINDA YUNI PRATAMA', ''),
(195, '2627108060', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'YUDHA FAHREZA', ''),
(196, '2627108061', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'YUSRON IBADILLAH', ''),
(197, '2627108062', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKJ 5', 'ZASKIA ANASTASYA', ''),
(198, '2627108669', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ABDUL LATIF', ''),
(199, '2627108670', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'AHMAD ALFAHRI', ''),
(200, '2627108671', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'AKMAL SYIFA AL HADIRI', ''),
(201, '2627108672', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ALBI PRIMADHIKA', ''),
(202, '2627108673', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ALBIZAR MUHAROMI', ''),
(203, '2627108674', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'AQIB MUSYAFA', ''),
(204, '2627108675', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ARLAN FAHMI IHFANI', ''),
(205, '2627108676', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ARYA SATRIA', ''),
(206, '2627108677', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ASEP KHAFID AZZAMI', ''),
(207, '2627108678', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'DAFA ARDIANSYAH', ''),
(208, '2627108679', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'DWI PRASETYO', ''),
(209, '2627108680', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'EGI SATRIYAN', ''),
(210, '2627108681', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'FADLI EKO SAPUTRA', ''),
(211, '2627108682', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'IKHWAN AL AMIN', ''),
(212, '2627108683', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'KHAERUL SANDIKA MULYA', ''),
(213, '2627108684', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'M.MAHFUDZ KAFABIH', ''),
(214, '2627108685', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MARFIN ARDIAN SYAH PUTRA', ''),
(215, '2627108686', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MAULANA AHMAD MUBAROK', ''),
(216, '2627108687', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MOH. ZIDAN', ''),
(217, '2627108688', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MOHAMAD REHAN AS SIDIQ', ''),
(218, '2627108689', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MOHAMMAD AWALUDIN', ''),
(219, '2627108691', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MUHAMMAD AL-FATH WIGUNA', ''),
(220, '2627108690', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MUHAMMAD ARKHAN ANDREAS', ''),
(221, '2627108692', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'MUHAMMAD WILDAN SAPUTRA', ''),
(222, '2627108693', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'NANDA SURYA BUMANTARA', ''),
(223, '2627108694', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'NOVAL FAWAS HUSEIN', ''),
(224, '2627108695', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'PUTRI VANIA ALINE', ''),
(225, '2627108696', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'RAFA IZAM FIRMANSYAH', ''),
(226, '2627108697', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'REFAN ARI WIBOWO', ''),
(227, '2627108698', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'REZAR ALYATAR ATAHASAN', ''),
(228, '2627108699', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'RIDHO ANGGER PRASETYO', ''),
(229, '2627108700', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'SAFINATUL JANAH', ''),
(230, '2627108701', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'TANFA YANUAR KISDIANO', ''),
(231, '2627108702', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'TRI BAGUS HARYANTO', ''),
(232, '2627108703', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'X TKR 4', 'ZENDRA SATRIA GANDA BAYU', ''),
(233, '2526107185', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'AGUNG PRASETYO ILHAM', ''),
(234, '2526107186', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'AMALIA PUTRI', ''),
(235, '2526107187', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'ARYA DWI SEBASTIAN VAERON', ''),
(236, '2526107188', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'ARYASATYA MUHAMMAD ARSANESIA', ''),
(237, '2526107189', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'CITRA ATHA SHABIRAH', ''),
(238, '2526107190', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'FATHUR ROHMAN', ''),
(239, '2526107191', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'GANESHA CAHAYA SAFANIA', ''),
(240, '2526107192', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'IKFI KAMALIYAH SILMIYA', ''),
(241, '2526107193', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'JUBAHANI NUR  SITA', ''),
(242, '2526107195', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'KELVIN ADYATMA', ''),
(243, '2526107196', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'LAILI MAULIDIA PERMATA', ''),
(244, '2526107197', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'M. AZIZ ZIDNY ARRAFI', ''),
(245, '2526107198', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'M. BAYU SATRIA', ''),
(246, '2526107199', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'M. NAIZAR RIZQYA RAHMAN', ''),
(247, '2526107200', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MARKHAM ALI', ''),
(248, '2526107201', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MOH. FAIZAL KHOERUL IMAN', ''),
(249, '2526107202', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MOHAMAD MUFARJI FATHAN RAMADHANI', ''),
(250, '2526107203', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MOHAMAD RAFFI ISKANDAR', ''),
(251, '2526107204', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MOHAMMAD ILHAM', ''),
(252, '2526107205', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MUHAMAD AZKAL GHOMAM', ''),
(253, '2526107206', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MUHAMAD AZLAN IKHYA ULUMUDIN', ''),
(254, '2526107545', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MUHAMMAD AL FATAH', ''),
(255, '2526107207', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MUHAMMAD FADLI NUR RANGKUTI', ''),
(256, '2526107208', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MUHAMMAD FATIHUR RIZQI', ''),
(257, '2526107209', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'MUHAMMAD NAUFAL', ''),
(258, '2526107210', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'RISMA AULIA AZ-ZAHRA', ''),
(259, '2526107211', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'RIZKA AULIA NOVIANTI', ''),
(260, '2526107212', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SALSA BILA ZAHRA TUNNISA', ''),
(261, '2526107213', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SHIDQI ERLAND PUTRA RAMADHAN', ''),
(262, '2526107214', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SINTIA  AYU ISTIQOMAH', ''),
(263, '2526107215', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SULI LESTARI', ''),
(264, '2526107216', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SULISTIA WATI', ''),
(265, '2526107217', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SYESIAN GILANG  SAPUTRA', ''),
(266, '2526107218', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'SYIFA ATHAYA AFIFAH', ''),
(267, '2526107219', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 1', 'THALITHA NAILAH TSAQIF', ''),
(268, '2526107220', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ABDUL A\'ZIZ', ''),
(269, '2526107221', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'AFWAN MAULANA AZIDAN', ''),
(270, '2526107222', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'AGHNA DAMARDJATI RAMADHAN', ''),
(271, '2526107223', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ALAM NA\'WID', ''),
(272, '2526107224', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ALFATH NAZAR', ''),
(273, '2526107225', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ALIM TA\'WID', ''),
(274, '2526107226', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ANDIKA BUANA', ''),
(275, '2526107228', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ANGGER BAGUS PRADITA', ''),
(276, '2526107229', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'DINDA NUR SYIFA', ''),
(277, '2526107230', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'DWI PUTRA INDRAWAN', ''),
(278, '2526107231', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'EMMANUEL DUSTIN', ''),
(279, '2526107232', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'FAIQ PUTRA PRIMA', ''),
(280, '2526107233', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'FAISHAL RIDLO WALIYAKUB', ''),
(281, '2526107234', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'FAREZQI SYIFANIA AMIN', ''),
(282, '2526107235', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'GHINA ALZENA', ''),
(283, '2526107236', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'GUMINTANG SAFFAH SALSABILA', ''),
(284, '2526107237', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'HAZBY DZIKRI ROMADHON', ''),
(285, '2526107238', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'JUNI PRATAMA SETIAWAN', ''),
(286, '2526107239', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'KAYLA AURELIA WENAS', ''),
(287, '2526107240', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'LUTFIYYAH NUR RAJABANI', ''),
(288, '2526107241', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NABIL KHILMI', ''),
(289, '2526107242', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NAILLA DWI SAPUTRI', ''),
(290, '2526107243', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NANDA ARZYL VAIZKY', ''),
(291, '2526107245', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NASYA AULIA AGUSTIN', ''),
(292, '2526107246', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NAYTA WIDYATUN ZAKIYAH', ''),
(293, '2526107247', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NAYZIA YUNIARTI  RADISTI', ''),
(294, '2526107244', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NAZMA UL AULA', ''),
(295, '2526107248', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'NURIL SATRIAJI', ''),
(296, '2526107249', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'QAILA NAFISHA SYAQINA', ''),
(297, '2526107250', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'RATIH YEKTI ANINDYA', ''),
(298, '2526107251', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'REFA NURALINA', ''),
(299, '2526107252', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'RIZAL AINUN FAKHRI', ''),
(300, '2526107253', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ROFIKOH FAZAH RAMADANI', ''),
(301, '2526107254', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'SASKIA WULANDARI', ''),
(302, '2526107255', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'SITI INDAH ELFARIYANI', ''),
(303, '2526107094', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI DKV 2', 'ZANETA NAJWA AGUSTIN', ''),
(304, '2526107258', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'A\'INUN HASSYA WAFIYAH', ''),
(305, '2526107257', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'AHMAD HANIF NUR WAHID', ''),
(306, '2526107260', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'ANGGI MELODY', ''),
(307, '2526107261', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'BUNGA OKTAVIAN DARMAWAN', ''),
(308, '2526107262', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'DANY DWINUR SANTOSO RAHARJA', ''),
(309, '2526107263', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'EGA HADYAN SAPUTRA', ''),
(310, '2526107264', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'FAKHUR ROZI AINUR ROPIK', ''),
(311, '2526107265', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'GALIH TRI WIBOWO', ''),
(312, '2526107266', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'HANIF DANANG PRATAMA', ''),
(313, '2526107267', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'ILYANA ALZALYA', ''),
(314, '2526107490', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'ISMAN FIRMANSYAH', '');
INSERT INTO `users` (`id`, `username`, `password`, `role`, `kelas`, `nama_lengkap`, `nip`) VALUES
(315, '2526107268', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'ISNAENI', ''),
(316, '2526107269', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'KEZA AGNESZA', ''),
(317, '2526107270', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'KHAERUL HUDA PRATAMA', ''),
(318, '2526107271', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'KHOTIBUL IMAMI', ''),
(319, '2526107272', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'KIKI PRASETYO', ''),
(320, '2526107273', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'LIONIL MESSI OKDISEN SAPUTRA', ''),
(321, '2526107274', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'M. WAHYU DILAN FAJAR', ''),
(322, '2526107275', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MAHASIDDHA NAGARJUNA TILOPA', ''),
(323, '2526107276', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MAULIDIYA NUR  AZIZAH', ''),
(324, '2526107277', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MOH. MUSTOFA INAL AKHYAR', ''),
(325, '2526107278', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MUHAMAD ARSIL MAJID', ''),
(326, '2526107279', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MUHAMAD SYAHRUL AZAM', ''),
(327, '2526107280', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MUHAMMAD AZFA ALIFIANSYAH', ''),
(328, '2526107281', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MUHAMMAD BAMBANG RIZKI PRATAMA', ''),
(329, '2526107282', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'MUHAMMAD ILHAM ARIFIN', ''),
(330, '2526107283', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'NAILAH AISY BILQIS', ''),
(331, '2526107284', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'NAZYA RIZKI AZZURI', ''),
(332, '2526107285', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'NITARIC GIRTDIEN', ''),
(333, '2526107286', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'PRADITA BAYU HERLAMBANG', ''),
(334, '2526107287', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'RESTU FAHRY RAMADHAN', ''),
(335, '2526107288', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'RIO HANIF AL FITROH', ''),
(336, '2526107289', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'SATRIA KANGEN WIJAYA', ''),
(337, '2526107290', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'SELLY TRI ANANDA', ''),
(338, '2526107291', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'TYARA INDAH ENJELLINA', ''),
(339, '2526107677', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 1', 'YUDA RAMADHANI', ''),
(340, '2526107292', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'ABDULLAH AZZAM ALDIZA', ''),
(341, '2526107293', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'ADINDA SETIA WATI', ''),
(342, '2526107294', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'AISYAH FATKHARANI', ''),
(343, '2526107295', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'AKBAR RIZKY DWI FIRMANSAH', ''),
(344, '2526107296', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'AKHMAD ZAYYAN FAIQ', ''),
(345, '2526107298', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'ARTHA ASMARA WIDJAYA MANDIRI', ''),
(346, '2526107299', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'CHAIRUNNISA', ''),
(347, '2526107300', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'DAFA PUTRA ALFIAN ALAMSYAH', ''),
(348, '2526107301', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'DHENA AYU AZIZAH LESTARI', ''),
(349, '2526107303', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'DIMAS AL FAREZA SAPUTRA', ''),
(350, '2526107304', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'DINDA PUTRI ZASKIA', ''),
(351, '2526107305', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'DIQI NURFALAH', ''),
(352, '2526107306', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'FADLI KHAERUL ZAKARIYA', ''),
(353, '2526107307', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'FATIH HYLMY', ''),
(354, '2526107308', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'FEBRIAN RIZQI MAULICHA', ''),
(355, '2526107310', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'HELFA ZINEDINZIDANE FACHRI ALBAR', ''),
(356, '2526107311', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'HERU LISTIYONO AJI', ''),
(357, '2526107312', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'IMAM HIDAYAT', ''),
(358, '2526107313', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'M. KHILMAN HIDAYAT', ''),
(359, '2526107314', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'M. YUDA PRIANDANU', ''),
(360, '2526107315', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'MIZAR ABABIL', ''),
(361, '2526107541', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'MUHAMAD ALFANDI', ''),
(362, '2526107584', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'MUHAMMAD IRZAM ALA BAYHAKI', ''),
(363, '2526107318', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'NAYRA HAMAAM AZKIA', ''),
(364, '2526107319', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'PUTRA BHAKTI NUGROHO', ''),
(365, '2526107320', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'RAIHAN GIAN ARYANTO', ''),
(366, '2526107321', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'RIZKI ADI ZAKARIA', ''),
(367, '2526107322', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'SELI ALIA PUTRI', ''),
(368, '2526107323', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'SILVI NUR MAULIDA', ''),
(369, '2526107324', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'SITI NURBAETY QUROTAA\'AYUN', ''),
(370, '2526107325', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'SRI RAHMAWATI', ''),
(371, '2526107326', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'TRI FADIL NUR NURAZAK', ''),
(372, '2526107327', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI PSPT 2', 'WILIAM DINDA RAMADANI', ''),
(373, '2526106974', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'ADITA PUTRI IDYA', ''),
(374, '2526106975', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'ADITYA ANANDA PUTRA', ''),
(375, '2526106976', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'AHMAD FAIQ MURTADHO', ''),
(376, '2526106977', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'AKIOKENKEI AHIL FIRDAUSI', ''),
(377, '2526106978', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'ALIFA DITA JULIANA', ''),
(378, '2526106979', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'ALMIRA NADHIFA ROZA', ''),
(379, '2526106980', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'AYU INDRAWATI', ''),
(380, '2526106981', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'AZZKA AFIF MAULANA PUTRA', ''),
(381, '2526106982', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'BAHTIYAR AZHAR', ''),
(382, '2526106983', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'BIBIT SATULUS', ''),
(383, '2526106984', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'DAVI ALBHA ANDHIKA', ''),
(384, '2526106985', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'EGA ALBIAN', ''),
(385, '2526106986', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'FAWAS ALIFIAN SETIAWAN', ''),
(386, '2526106987', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'FIANDIKA SATRIA HARIST', ''),
(387, '2526106988', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'HIKAM SYAHRUL MUBAROK', ''),
(388, '2526106989', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'ILHAM ZAKARIA', ''),
(389, '2526106990', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'INES PUSPA DWI LESTARI', ''),
(390, '2526106991', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'IRKHAM MAULANA ARYAPUTRA', ''),
(391, '2526106992', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'KHALIL AKBAR ROBBIANSYAH', ''),
(392, '2526106995', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'M. MUSYAFFA SALMAN FARIS', ''),
(393, '2526106994', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'MOHAMAD KHAERUL NIZAM', ''),
(394, '2526106996', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'MOKHAMAD KRESNA AL BARZANJI', ''),
(395, '2526106993', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'MUHAMMAD DAFA FAHLEVY', ''),
(396, '2526106997', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'MUSTAGHFIROH', ''),
(397, '2526106998', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'NADIL ULUM ANNAFIS', ''),
(398, '2526106999', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'NENCY ALISIYA NABILA', ''),
(399, '2526107000', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'RAYIENDA CAHYANARA AHMAD', ''),
(400, '2526107001', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'RENDY YUSUF SUBEKHI', ''),
(401, '2526107002', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'SALMA AULIA RIZQI', ''),
(402, '2526107003', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'SASTIN MAULIDA KUMALADEWI', ''),
(403, '2526107004', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'SITI LUTFIANA FASA AMALIA', ''),
(404, '2526107005', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'SYABILA PUTRI NUR AENI', ''),
(405, '2526107006', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'TAHTA WIJHAH WAHID', ''),
(406, '2526107007', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'WABNISSABIL AL BAASIT', ''),
(407, '2526107008', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'YUSUF ARIF BUDIMAN', ''),
(408, '2526107009', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XI TKJ 1', 'ZAHRATUL AMALIYAH', ''),
(409, '2425106198', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'AINUN NASYIFA', ''),
(410, '2425106199', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'AL FARIS ZAKARIYAH RAMADHAN', ''),
(411, '2425106200', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'ANDIN NOVIA ROSYIDI', ''),
(412, '2425106201', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'ANDINI EKA SAPUTRI', ''),
(413, '2425106202', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'ANINDIYA MAIKA', ''),
(414, '2425106203', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'AVRE GENAYA', ''),
(415, '2425106204', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'CAHAYA APRILIA PUTRI', ''),
(416, '2425106205', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'CAHAYA BUNGA ANINDYA', ''),
(417, '2425106206', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'DENIS ALAMSYAH', ''),
(418, '2425106207', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'ENRICO SEBASTIAN', ''),
(419, '2425106208', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'FAISAL HAKIKI', ''),
(420, '2425106209', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'FAREL RAMADAN', ''),
(421, '2425106210', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'FIE AMRINA ROSADA', ''),
(422, '2425106211', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'FIKRI APRIANSYAH', ''),
(423, '2425106212', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'HANIFA NALYA PUTRI', ''),
(424, '2425106213', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'HAYYA AMANY', ''),
(425, '2425106214', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'IRLAN APRILIANSYACH', ''),
(426, '2425106215', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'KEVIN FAHRURROZI AL HAQ', ''),
(427, '2425106216', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'LAUDIA PUTRI ULFIYANI', ''),
(428, '2425106217', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'M. KHAIRUL IKHSAN', ''),
(429, '2425106218', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'M. WILDAN  NUR SYAFIAN', ''),
(430, '2425106219', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MAGDALENA FATIMAH AZ ZAHRA SEGARA', ''),
(431, '2425106220', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MIZYATUN NAZWA', ''),
(432, '2425106222', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MUH. RAIKHAN FADILAH', ''),
(433, '2425106223', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MUHAMAD ABDUL REZA', ''),
(434, '2425106966', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MUHAMMAD AFAN ADIMASQI', ''),
(435, '2425106225', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MUHAMMAD HAEKAL FADHIL', ''),
(436, '2425106226', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'MUHAMMAD VIRGIAWAN LISTIANTO', ''),
(437, '2425106227', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'NADIA AYU KUSUMA AZIZ', ''),
(438, '2425106228', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'NAZWA ROBIAH AL-ADAWIYAH', ''),
(439, '2425106230', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'NURUL AINI', ''),
(440, '2425106231', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'NURUL IZZA', ''),
(441, '2425106232', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'OKTAVIA NESHA AGATHA', ''),
(442, '2425106233', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'RAIHAN JUNIAR ADZIKRI', ''),
(443, '2425106234', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'RATU ASTRIANA', ''),
(444, '2425106968', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'SIGIT ABDUL MUTAKIN', ''),
(445, '2425106235', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'SRI WINDI ARTI', ''),
(446, '2425106236', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'SYAFIQ MAULANA ALWAFI', ''),
(447, '2425106237', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'TRI LUNA ANJANI', ''),
(448, '2425106238', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 1', 'ZHAHWAH AURORA PUTRI', ''),
(449, '2425106239', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'ABDI LUTFI PRATAMA', ''),
(450, '2425106240', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'ABDI SETYO NUGROHO', ''),
(451, '2425106241', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'ABDUL HANNAN SYAH FARDANI ADI P.', ''),
(452, '2425106242', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'ADITYA RESKY MAULANA', ''),
(453, '2425106243', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'AHMAD ZENAL ASIKIN', ''),
(454, '2425106244', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'AISYAH RAHMA', ''),
(455, '2425106245', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'AUFA AZMI RIZQULLAH', ''),
(456, '2425106246', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'AUFA NABIL ADNAN', ''),
(457, '2425106247', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'CAHAYA FATIMAH AZ ZAHRA', ''),
(458, '2425106249', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'DELA PUPITASARI', ''),
(459, '2425106250', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'DIKA PRAMUDYA', ''),
(460, '2425106251', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'DIMAS ADLI SETIAWAN', ''),
(461, '2425106252', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'DIVA MUFFAQI NAJIB', ''),
(462, '2425106253', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'DWI INTAN KOMALA DEWI', ''),
(463, '2425106254', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'DWI MARDATILAH SAHARANI', ''),
(464, '2425106256', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'FARIS ABDITYA', ''),
(465, '2425106257', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'HABIBATUL MAULIDA', '');
INSERT INTO `users` (`id`, `username`, `password`, `role`, `kelas`, `nama_lengkap`, `nip`) VALUES
(466, '2425106258', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'HALIMATUSSA\'DIYYAH', ''),
(467, '2425106259', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'HANI FITRIANI', ''),
(468, '2425106260', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'ILMA ZULFATUN AENI', ''),
(469, '2425106261', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'KHISNI HULUL ADNI', ''),
(470, '2425106262', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'M. AKHDAN WACHDANI', ''),
(471, '2425106264', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'MOCHAMMAD REZALDY ARIFIN', ''),
(472, '2425106265', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'MOH. GILANG RAMADAN', ''),
(473, '2526116972', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'MUHAMAD ARIS SETIAWAN', ''),
(474, '2425106267', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'MUHAMMAD ZUHRU ZAMAN', ''),
(475, '2425106269', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'NAYLA TRI RAMADHINI', ''),
(476, '2425106270', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'NURIA MAULIDAH', ''),
(477, '2425106271', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'NURSYIFA GHADIZA ARIFAH', ''),
(478, '2425106272', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'QEMAL GERALDINO RIZKY', ''),
(479, '2425106273', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'REVI CAHYA MAULIDA', ''),
(480, '2425106274', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'RIZKI SYARIF HIDAYATULLAH', ''),
(481, '2425106275', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'RIZKY NUR OKTAFIANI', ''),
(482, '2425106276', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'RIZKY RAMADHAN', ''),
(483, '2425106277', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'SULIS IFTAH FAUZIYAH', ''),
(484, '2425106278', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'TIFANNY SHAFA AZ ZAHRA', ''),
(485, '2425106279', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'UBAIDILLAH FAQIH', ''),
(486, '2425106280', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII DKV 2', 'VINCENT ALEXANDER YANNIO', ''),
(487, '2425106282', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ADINDA PUTRI NABILA', ''),
(488, '2425106283', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ALIVAH RARA ARIYANI', ''),
(489, '2425106284', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ALIVIA NUR SYA\'BANI', ''),
(490, '2425106285', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ALLEA KHAERINA PUTRI', ''),
(491, '2425106286', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ALYAZALUNA FADIA\'ULNAJMI', ''),
(492, '2425106287', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'AROFAH HISYAM AD\'HA', ''),
(493, '2425106288', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ATSALITSA YULIARTI SAFINA', ''),
(494, '2425106290', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'AZKA NUFAIL SYAKIR', ''),
(495, '2425106291', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'AZRA KHAYLA ANINDYA', ''),
(496, '2425106292', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'AZZA NANI MAGHFIROH', ''),
(497, '2425106293', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'DIANA RASTIYANA', ''),
(498, '2425106294', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'DWI SETYAWATI', ''),
(499, '2425106295', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'ERICHA VEYNIASTANIYA', ''),
(500, '2425106296', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'FABIAN PUTRA MUSTAMI', ''),
(501, '2425106297', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'IQBAL KHOLIK SAHPUTRA', ''),
(502, '2425106298', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'JESSICA ANDREANI NADITIA', ''),
(503, '2425106299', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'KHOIRUL HAMIDAH', ''),
(504, '2425106300', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'KHUSNUL NOVIA AZZAHRA', ''),
(505, '2425106303', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'M. HUSEN LAITUPA', ''),
(506, '2425106304', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'M. TEGUH FARKHAN AL-KHAN', ''),
(507, '2425106305', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MAYDEANA LABITA KATARINE', ''),
(508, '2425106302', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MOCH. ALWAN RIZKI ADITIA', ''),
(509, '2425106306', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MOH. ARIEL KHAQ', ''),
(510, '2425106307', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MOH. YUNUS', ''),
(511, '2425106308', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MOHAMMAD DEFANO', ''),
(512, '2425106301', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MUHAMMAD AKBAR YHANIZAR', ''),
(513, '2425106309', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MUHAMMAD AL FAUZI', ''),
(514, '2425106310', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MUHAMMAD ALIF FEBRIHARTO', ''),
(515, '2425106311', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MUHAMMAD IRZIN MAULANA', ''),
(516, '2425106312', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'MUHAMMAD MIFTAKHUDIN', ''),
(517, '2425106313', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'NAJWA AURA YASMIN', ''),
(518, '2425106314', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'NASHA OCTAVIA', ''),
(519, '2425106315', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'NAZRIL ARIF', ''),
(520, '2425106316', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'PUJI ROKHMATUL FAQIH', ''),
(521, '2425106317', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'PUTRA ERDIANSYAH', ''),
(522, '2425106318', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'SELI DWI CANTIKA', ''),
(523, '2425106319', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'SEPTI PURNAMA RAMADHANI', ''),
(524, '2425106320', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'SITI ZIFANA SEPTIANI', ''),
(525, '2425106321', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'SULISTIAWATI', ''),
(526, '2425106322', '$2y$10$52zGdH/MQFeS3YHElUcmf.pN6BbkecIR56WG.HEHTO8fjm4pPEmji', 'Siswa', 'XII PSPT', 'SUPEBRI DIHAR SAPUTRA', ''),
(528, 'Alivia', '$2y$10$NmqfczeU7BQXJZ84CZkoHewSPLZZ3x4mZN9Yjf19HBDiG5UFY2ICi', 'Sekretaris', 'XII PSPT', 'Alivia nur sa\'bani', ''),
(529, 'septi', '$2y$10$jjwuQwQBOQOKebrqnISmVOAvmnYq2rSU3ce1LCVgWGCPX/Bm.sb5O', 'Bendahara', 'XII PSPT', 'Septi', ''),
(530, 'saskyasalza', '$2y$10$OuNVSbTP9fl6VpFm5iMc/O1OtJVNJ1/RAi6Fm1S.v3Qwd6squ1w8y', 'Sekretaris', 'X PSPT', 'Saskya Salzabillah', ''),
(531, 'Laura', '$2y$10$kFEsTofHA8kF4iTJbfUkCO9ukJv5kWPwiTwzyhsxJAfUMxIcIXXuS', 'Bendahara', 'X PSPT', 'Laura Windy', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agenda_mengajar`
--
ALTER TABLE `agenda_mengajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `bahan_praktik`
--
ALTER TABLE `bahan_praktik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`),
  ADD KEY `idx_nip_mapel` (`nip`,`mapel`);

--
-- Indeks untuk tabel `catatan_perilaku`
--
ALTER TABLE `catatan_perilaku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `catatan_sikap`
--
ALTER TABLE `catatan_sikap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kelas` (`kelas`),
  ADD KEY `idx_nis` (`nis`);

--
-- Indeks untuk tabel `cbt_exam`
--
ALTER TABLE `cbt_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`),
  ADD KEY `idx_token` (`token`);

--
-- Indeks untuk tabel `cbt_hasil`
--
ALTER TABLE `cbt_hasil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_exam_nis` (`exam_id`,`nis`);

--
-- Indeks untuk tabel `cbt_jawaban`
--
ALTER TABLE `cbt_jawaban`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_sesi_soal` (`sesi_id`,`soal_id`);

--
-- Indeks untuk tabel `cbt_sesi`
--
ALTER TABLE `cbt_sesi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ujian_nis` (`ujian_id`,`nis`);

--
-- Indeks untuk tabel `cbt_soal`
--
ALTER TABLE `cbt_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ujian` (`ujian_id`);

--
-- Indeks untuk tabel `cbt_ujian`
--
ALTER TABLE `cbt_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kelas_aktif` (`kelas`,`aktif`),
  ADD KEY `idx_token` (`token`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `guru_profil`
--
ALTER TABLE `guru_profil`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `jadwal_piket`
--
ALTER TABLE `jadwal_piket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `jurnal_bimbingan`
--
ALTER TABLE `jurnal_bimbingan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `jurnal_mengajar`
--
ALTER TABLE `jurnal_mengajar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tgl` (`tanggal`);

--
-- Indeks untuk tabel `kaskelas`
--
ALTER TABLE `kaskelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `katalog_alat`
--
ALTER TABLE `katalog_alat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas_tgl` (`kelas`,`tanggal`);

--
-- Indeks untuk tabel `kkm`
--
ALTER TABLE `kkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `kunjungan_rumah`
--
ALTER TABLE `kunjungan_rumah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `laporan_kerusakan`
--
ALTER TABLE `laporan_kerusakan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `modul_ajar`
--
ALTER TABLE `modul_ajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_nip_kelas` (`nip`,`kelas`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `pengumpulan`
--
ALTER TABLE `pengumpulan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tugas` (`tugas_id`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `portofolio`
--
ALTER TABLE `portofolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nis` (`nis`);

--
-- Indeks untuk tabel `presensi_guru`
--
ALTER TABLE `presensi_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `presensi_mapel`
--
ALTER TABLE `presensi_mapel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_nip_kelas` (`nip`,`kelas`);

--
-- Indeks untuk tabel `rubrik`
--
ALTER TABLE `rubrik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`),
  ADD KEY `idx_nis` (`nis`);

--
-- Indeks untuk tabel `siswa_meta`
--
ALTER TABLE `siswa_meta`
  ADD PRIMARY KEY (`nis`);

--
-- Indeks untuk tabel `struktur_kelas`
--
ALTER TABLE `struktur_kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `tatatertib`
--
ALTER TABLE `tatatertib`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_kelas` (`kelas`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nip` (`nip`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agenda_mengajar`
--
ALTER TABLE `agenda_mengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bahan_praktik`
--
ALTER TABLE `bahan_praktik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `catatan_perilaku`
--
ALTER TABLE `catatan_perilaku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `catatan_sikap`
--
ALTER TABLE `catatan_sikap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cbt_exam`
--
ALTER TABLE `cbt_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `cbt_hasil`
--
ALTER TABLE `cbt_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cbt_jawaban`
--
ALTER TABLE `cbt_jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `cbt_sesi`
--
ALTER TABLE `cbt_sesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `cbt_soal`
--
ALTER TABLE `cbt_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `cbt_ujian`
--
ALTER TABLE `cbt_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `inventaris`
--
ALTER TABLE `inventaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `jadwal_piket`
--
ALTER TABLE `jadwal_piket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `jurnal_bimbingan`
--
ALTER TABLE `jurnal_bimbingan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jurnal_mengajar`
--
ALTER TABLE `jurnal_mengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kaskelas`
--
ALTER TABLE `kaskelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `katalog_alat`
--
ALTER TABLE `katalog_alat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2056;

--
-- AUTO_INCREMENT untuk tabel `kkm`
--
ALTER TABLE `kkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kunjungan_rumah`
--
ALTER TABLE `kunjungan_rumah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `laporan_kerusakan`
--
ALTER TABLE `laporan_kerusakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `modul_ajar`
--
ALTER TABLE `modul_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengumpulan`
--
ALTER TABLE `pengumpulan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `portofolio`
--
ALTER TABLE `portofolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensi_guru`
--
ALTER TABLE `presensi_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensi_mapel`
--
ALTER TABLE `presensi_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716;

--
-- AUTO_INCREMENT untuk tabel `rubrik`
--
ALTER TABLE `rubrik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1283;

--
-- AUTO_INCREMENT untuk tabel `struktur_kelas`
--
ALTER TABLE `struktur_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tatatertib`
--
ALTER TABLE `tatatertib`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
