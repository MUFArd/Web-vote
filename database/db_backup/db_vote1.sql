-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk db_vote1
CREATE DATABASE IF NOT EXISTS `db_vote1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_vote1`;

-- membuang struktur untuk table db_vote1.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.cache: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.cache_locks: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.elections
CREATE TABLE IF NOT EXISTS `elections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama_election` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_organisasi` bigint unsigned NOT NULL,
  `id_tahun_ajaran` int unsigned NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status` enum('aktif','tidak aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tidak aktif',
  `id_tahun_ajar` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.elections: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.job_batches: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.kecamatan
CREATE TABLE IF NOT EXISTS `kecamatan` (
  `Kode_Kecamatan` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Kode_Wilayah` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Nama_Kecamatan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Kode_Kecamatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.kecamatan: ~2 rows (lebih kurang)
INSERT INTO `kecamatan` (`Kode_Kecamatan`, `Kode_Wilayah`, `Nama_Kecamatan`) VALUES
	('KEC001', 'WIL001', 'Kecamatan Sukamaju'),
	('KEC002', 'WIL001', 'Kecamatan Bahagia');

-- membuang struktur untuk table db_vote1.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.migrations: ~18 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2026_04_27_014748_create_m_guru_table', 0),
	(2, '2026_04_27_014748_create_m_kandidat_table', 0),
	(3, '2026_04_27_014748_create_m_organisasi_table', 0),
	(4, '2026_04_27_014748_create_m_siswa_table', 0),
	(5, '2026_04_27_014748_create_m_tahun_ajar_table', 0),
	(6, '2026_04_27_014748_create_m_user_table', 0),
	(7, '2026_04_27_014748_create_trs_vote_table', 0),
	(8, '2026_04_27_014749_create_v_detail_vote_view', 0),
	(9, '2026_04_27_014749_create_v_hasil_vote_view', 0),
	(10, '2026_04_27_014750_create_sp_insert_guru_proc', 0),
	(11, '2026_04_27_014750_create_sp_insert_kandidat_proc', 0),
	(12, '2026_04_27_014750_create_sp_insert_organisasi_proc', 0),
	(13, '2026_04_27_014750_create_sp_insert_user_proc', 0),
	(14, '2026_04_27_014750_create_sp_insert_vote_proc', 0),
	(15, '2026_04_27_014750_create_sp_update_guru_proc', 0),
	(16, '2026_04_27_014751_add_foreign_keys_to_m_kandidat_table', 0),
	(17, '2026_04_27_014751_add_foreign_keys_to_m_user_table', 0),
	(18, '2026_04_27_014751_add_foreign_keys_to_trs_vote_table', 0),
	(19, '0001_01_01_000000_create_users_table', 1),
	(20, '0001_01_01_000001_create_cache_table', 1),
	(21, '0001_01_01_000002_create_jobs_table', 1),
	(22, '2026_05_04_093302_create_personal_access_tokens_table', 2),
	(23, '2026_05_05_005159_create_elections_table', 3);

-- membuang struktur untuk table db_vote1.m_guru
CREATE TABLE IF NOT EXISTS `m_guru` (
  `id_guru` int NOT NULL AUTO_INCREMENT,
  `nama_guru` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `npwp` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_telephone` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_guru`),
  UNIQUE KEY `npwp` (`npwp`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.m_guru: ~12 rows (lebih kurang)
INSERT INTO `m_guru` (`id_guru`, `nama_guru`, `npwp`, `no_telephone`, `email`, `jenis_kelamin`, `is_active`) VALUES
	(1, 'Denisa Ramadanti', '262710101', '081283998980', 'denisarmdnii@gmail.com', 'P', 'Y'),
	(2, 'Lidiawati', '262710102', '081584773332', 'lialidiawati485@gmail.com', 'P', 'Y'),
	(3, 'Sri Rahayu', '262710103', '081584773332', 'zrie.y4yu0590@gmail.com', 'P', 'Y'),
	(4, 'Muhammad Haerudin', '262710104', '08158712514', '-', 'L', 'Y'),
	(5, 'Sediana Hadisujatma', '262710105', '081323585494', 'ssendianahadi@gmail.com', 'L', 'Y'),
	(6, 'Naufal Irgi Ramadhan', '262710106', '085882323114', 'mhmmdnouw@gmail.com', 'L', 'Y'),
	(7, 'Ade Supriadi', '262710107', '082210227844', 'adegodedsupriadi@gmail.com', 'L', 'Y'),
	(8, 'Eka Ayu Kurniasih', '262710108', '083895789355', 'ayukurniasihhh223@gmail.com', 'P', 'Y'),
	(9, 'Andika Mahendra', '262710109', '083894054762', 'andikamahendraaa16@gmail.com', 'L', 'Y'),
	(10, 'Susiana', '262710110', '081289838813', 'nugraharessy@gmail.com', 'P', 'Y'),
	(11, 'Sukron Ansori', '262710111', '081288953359', 'sukron.ansori87@gmail.com', 'L', 'Y'),
	(12, 'Eka Riana', '262710112', '087872285060', 'ekarianaperintis@gmail.com', 'L', 'Y');

-- membuang struktur untuk table db_vote1.m_kandidat
CREATE TABLE IF NOT EXISTS `m_kandidat` (
  `id_kandidat` int NOT NULL AUTO_INCREMENT,
  `nipd_ketua` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nipd_wakil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_organisasi` int DEFAULT NULL,
  `id_tahun_ajaran` int DEFAULT NULL,
  `visi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `misi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `nomer_urut` int DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kandidat`) USING BTREE,
  KEY `FK_m_kandidat_m_tahun_ajar` (`id_tahun_ajaran`),
  KEY `FK_m_kandidat_m_siswaa` (`nipd_ketua`) USING BTREE,
  KEY `nipd_wakil` (`nipd_wakil`),
  KEY `id_organisasi` (`id_organisasi`),
  CONSTRAINT `FK_m_kandidat_m_organisasi` FOREIGN KEY (`id_organisasi`) REFERENCES `m_organisasi` (`id_organisasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_m_kandidat_m_siswa` FOREIGN KEY (`nipd_ketua`) REFERENCES `m_siswa` (`nipd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_m_kandidat_m_siswa_2` FOREIGN KEY (`nipd_wakil`) REFERENCES `m_siswa` (`nipd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_m_kandidat_m_tahun_ajar` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `m_tahun_ajar` (`id_tahun_ajar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.m_kandidat: ~24 rows (lebih kurang)
INSERT INTO `m_kandidat` (`id_kandidat`, `nipd_ketua`, `nipd_wakil`, `id_organisasi`, `id_tahun_ajaran`, `visi`, `misi`, `foto`, `nomer_urut`, `is_active`) VALUES
	(38, '242510055', '242510056', 4, 1, 'Mewujudkan OSIS yang aktif dan berprestasi', 'Meningkatkan kegiatan ekstrakurikuler dan akademik', '', 1, 'N'),
	(39, '242510057', '242510060', 4, 1, 'Membangun sekolah yang harmonis dan berinovasi', 'Mengadakan program kreatif dan kolaboratif', '', 2, 'N'),
	(40, '242510061', '242510064', 4, 1, 'Mewujudkan OSIS yang solid dan berdedikasi', 'Meningkatkan prestasi akademik dan non-akademik', '', 3, 'N'),
	(41, '242510065', '242510066', 5, 1, 'Mewujudkan MPK yang transparan dan amanah', 'Meningkatkan pengawasan dan komunikasi organisasi', '', 1, 'N'),
	(42, '242510070', '242510071', 5, 1, 'Membangun sinergi antara siswa dan sekolah', 'Mengadakan forum diskusi dan aspirasi siswa', '', 2, 'N'),
	(43, '242510072', '242510074', 5, 1, 'Mewujudkan MPK yang profesional dan bertanggung jawab', 'Meningkatkan kualitas pengawasan organisasi', '', 3, 'N'),
	(44, '242510075', '242510076', 4, 2, 'Mewujudkan OSIS yang kreatif dan inovatif', 'Mengembangkan potensi siswa melalui kegiatan positif', '', 1, 'N'),
	(45, '242510077', '242510078', 4, 2, 'Membangun OSIS yang visioner dan progresif', 'Mengadakan program inovasi dan pengembangan diri', '', 2, 'N'),
	(46, '242510079', '242510080', 4, 2, 'Mewujudkan OSIS yang mandiri dan berkarakter', 'Meningkatkan kegiatan sosial dan kepedulian lingkungan', '', 3, 'N'),
	(47, '242510081', '242510073', 5, 2, 'Mewujudkan MPK yang adil dan bijaksana', 'Meningkatkan koordinasi antar organisasi sekolah', '', 1, 'N'),
	(48, '242510055', '242510057', 5, 2, 'Membangun MPK yang aktif dan responsif', 'Mengadakan evaluasi program kerja secara berkala', '', 2, 'N'),
	(49, '242510060', '242510061', 5, 2, 'Mewujudkan MPK yang aspiratif dan demokratis', 'Mengadakan musyawarah rutin dan evaluasi berkala', '', 3, 'N'),
	(50, '242510064', '242510065', 4, 3, 'Mewujudkan OSIS yang unggul dan bermartabat', 'Meningkatkan kualitas kegiatan intra dan ekstra sekolah', '', 1, 'N'),
	(51, '242510066', '242510070', 4, 3, 'Membangun OSIS yang berprestasi dan berintegritas', 'Mengadakan program pelatihan kepemimpinan', '', 2, 'N'),
	(52, '242510071', '242510072', 4, 3, 'Mewujudkan OSIS yang inovatif dan berdampak', 'Meningkatkan program kreativitas dan seni budaya', '', 3, 'N'),
	(53, '242510074', '242510075', 5, 3, 'Mewujudkan MPK yang kompeten dan terpercaya', 'Meningkatkan fungsi pengawasan dan advokasi siswa', '', 1, 'N'),
	(54, '242510076', '242510077', 5, 3, 'Membangun MPK yang harmonis dan solutif', 'Mengadakan program mediasi dan penyelesaian masalah', '', 2, 'N'),
	(55, '242510078', '242510079', 5, 3, 'Mewujudkan MPK yang transparan dan akuntabel', 'Meningkatkan keterbukaan informasi organisasi', '', 3, 'N'),
	(56, '242510059', '242510067', 4, 4, 'Mewujudkan OSIS yang berkarakter dan berprestasi', 'Mengadakan program pembinaan karakter siswa', '', 1, 'Y'),
	(57, '242510063', '242510062', 4, 4, 'Mewujudkan OSIS yang progresif dan bertanggung jawab', 'Mengadakan kegiatan sosial dan lingkungan sekolah', '', 2, 'Y'),
	(58, '242510080', '242510081', 4, 4, 'Membangun OSIS yang inklusif dan berdaya saing', 'Meningkatkan program pengembangan bakat dan minat', '', 3, 'Y'),
	(59, '242510068', '242510069', 5, 4, 'Mewujudkan MPK yang solid dan berintegritas', 'Meningkatkan sinergi antara MPK dan OSIS', '', 1, 'Y'),
	(60, '242510073', '242510074', 5, 4, 'Membangun MPK yang inovatif dan adaptif', 'Mengadakan program evaluasi dan pengembangan organisasi', '', 2, 'Y'),
	(61, '242510075', '242510076', 5, 4, 'Mewujudkan MPK yang demokratis dan aspiratif', 'Meningkatkan partisipasi siswa dalam organisasi', '', 3, 'Y');

-- membuang struktur untuk table db_vote1.m_organisasi
CREATE TABLE IF NOT EXISTS `m_organisasi` (
  `id_organisasi` int NOT NULL AUTO_INCREMENT,
  `nama_organisasi` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` enum('Y','N') COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_organisasi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.m_organisasi: ~2 rows (lebih kurang)
INSERT INTO `m_organisasi` (`id_organisasi`, `nama_organisasi`, `is_active`) VALUES
	(4, 'OSIS', 'Y'),
	(5, 'MPK', 'Y');

-- membuang struktur untuk table db_vote1.m_siswa
CREATE TABLE IF NOT EXISTS `m_siswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_siswa` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nipd` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nomor_telefon` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kelas` int DEFAULT NULL,
  `jurusan` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nipd` (`nipd`),
  KEY `nama_siswa` (`nama_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.m_siswa: ~214 rows (lebih kurang)
INSERT INTO `m_siswa` (`id`, `nama_siswa`, `nipd`, `nomor_telefon`, `alamat`, `email`, `jenis_kelamin`, `kelas`, `jurusan`, `is_active`) VALUES
	(1, 'Abdul Syahril Pratama', '242510055', '085772468392', 'Perum 2', 'abdulsyaril07@gmail.com', 'L', 11, 'RPL', 'Y'),
	(2, 'Dimas Surya Putra', '242510056', '081412098259', 'Perum 2 Sentraland', 'dondimascarlo@gmail.com', 'L', 11, 'RPL', 'Y'),
	(3, 'Emre Razaq', '242510057', '081918820584', 'Taman Sari', 'emreaja480@gmail.com', 'L', 11, 'RPL', 'Y'),
	(4, 'Farel Apandi', '242510058', '08983000362', 'Perum 2 Jl Jambu 2 No 19', 'farelapandi@gmail.com', 'L', 11, 'RPL', 'Y'),
	(5, 'Felicya Agatha Susanto Lie', '242510059', '08998998663', 'Millenium City', 'felicyafelicya03@gmail.com', 'P', 11, 'RPL', 'Y'),
	(6, 'Fiqih Al Farizi', '242510060', '081999718152', 'Kabasiran Tamansari', 'kaiymc20@gmail.com', 'L', 11, 'RPL', 'Y'),
	(7, 'Iskandar Ibrahim', '242510061', '089507334685', 'Griya', 'iskandaribrahimibam@gmail.com', 'L', 11, 'RPL', 'Y'),
	(8, 'Marchel Hugo Putra Ramadhan', '242510062', '085882270825', 'Griya Parung Panjang', 'osinken2000@gmail.com', 'L', 11, 'RPL', 'Y'),
	(9, 'Maulidan Alif Wicaksono', '242510063', '081386202661', 'Foresthill', 'maulidana360@gmail.com', 'L', 11, 'RPL', 'Y'),
	(10, 'Melvin Olivia', '242510064', '085779485241', 'Sadangan', 'melvinolivia14@gmail.com', 'P', 11, 'RPL', 'Y'),
	(11, 'Muhamad Irfan Ardiansyah', '242510065', '081525776692', 'Kp Cilangkap', 'm.irfan21062009@gmail.com', 'L', 11, 'RPL', 'Y'),
	(12, 'M. Fahry Tri G', '242510066', '087771517495', 'Kp Marga Mekar', 'fahri08111@gmail.com', 'L', 11, 'RPL', 'Y'),
	(13, 'Muhammad Farel Andriani', '242510067', '085776649749', 'Perum 2', 'muhammadfarelandriani@gmail.com', 'L', 11, 'RPL', 'Y'),
	(14, 'Muhammad Ihwan Utomo', '242510068', '085710480148', 'Griya Parung Panjang', 'utomoihwan@gmail.com', 'L', 11, 'RPL', 'Y'),
	(15, 'Novita Damayanti', '242510069', '089532500000', 'Kp Sadangan', 'novitadamayanti401@gmail.com', 'P', 11, 'RPL', 'Y'),
	(16, 'Nurlita', '242510070', '089651810420', 'Kp Cibeber', 'lita8531@gmail.com', 'P', 11, 'RPL', 'Y'),
	(17, 'Oktapia Nurpadilah', '242510071', '089653348904', 'Kp Sukamanah', 'oktapia939@gmail.com', 'P', 11, 'RPL', 'Y'),
	(18, 'Putra Kasela', '242510072', '083874599435', 'Perum 2', 'kaselaputra12@gmail.com', 'L', 11, 'RPL', 'Y'),
	(19, 'Ramadhan Agil Siraj', '242510073', '085871615850', 'Griya', 'honibusa2008@gmail.com', 'L', 11, 'RPL', 'Y'),
	(20, 'Ratu Haerunnisa', '242510074', '088290645151', 'Perumnas 2', 'ratuhrnns@gmail.com', 'P', 11, 'RPL', 'Y'),
	(21, 'Reyvan Darmawan', '242510075', '08886159470', 'Sadang', 'reyvandarmawan21008@gmail.com', 'L', 11, 'RPL', 'Y'),
	(22, 'Rina Rusliana', '242510076', '085218100625', 'Griya Parung Panjang', 'rusliana.rina029@gmail.com', 'P', 11, 'RPL', 'Y'),
	(23, 'Robiyatun Nisa', '242510077', '085691838442', 'Griya Parung Panjang', 'robiyatunnisa14@gmail.com', 'P', 11, 'RPL', 'Y'),
	(24, 'Saka Novagio', '242510078', '088101361003', 'Jl Sidaro', 'sakanovagio0111@gmail.com', 'L', 11, 'RPL', 'Y'),
	(25, 'Siti Nur Kholisha', '242510079', '088290957722', 'Kp Sukamanah', 'imjieunyuri12@gmail.com', 'P', 11, 'RPL', 'Y'),
	(26, 'Sugiarto Raharjo', '242510080', '085893814541', 'Perum Sekar Tanjung', 'raharjosugiarto4@gmail.com', 'L', 11, 'RPL', 'Y'),
	(27, 'Umar Hafidz Muhyidin', '242510081', '085710196817', 'Perum 2', 'umarhafidz0102@gmail.com', 'L', 11, 'RPL', 'Y'),
	(243, 'Abanda Aldirra', '242510107', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(244, 'Abdul Azis Al Ajhari', '242510143', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(245, 'Abdul Muis', '242510179', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(246, 'Abidin', '242510001', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(247, 'Adji Saputra', '242510028', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(248, 'Adrian Sadiran', '242510002', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(249, 'Adventus Tambunan', '242510108', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(250, 'Afifah Adawiyyah', '242510109', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(251, 'Al Farezh Khairan Abrar', '242510144', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(252, 'Aldi Ramadan', '242510180', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(253, 'Alfith Alfaiz Bayhaqqy', '242510110', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(254, 'Aliffia Rafifah Indrani', '242510145', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(255, 'Alika Syifana', '242510181', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(256, 'Alip Firdaus', '242510029', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(257, 'Allisa Purnama', '242510111', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(258, 'Alvi Ramadhan', '242510030', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(259, 'Alvian Imanuel Manurung', '242510003', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(260, 'Alya Syavira', '242510146', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(261, 'Ananda Rehan', '242510031', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(262, 'Anjelita Aulia', '242510112', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(263, 'Aprilia Tri Anjani', '242510147', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(264, 'Ardiansyah', '242510148', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(265, 'Ari Arasyid', '242510032', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(266, 'Ari Dwi Yanto', '242510082', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(267, 'Arkhan Fikrhamsyah', '242510182', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(268, 'Aryasatya Bayanaka', '242510083', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(269, 'Aulia Cahya Ramadhani', '242510084', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(270, 'Aura Ramadhani', '242510149', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(271, 'Avrilita Zahra Putri', '242510113', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(272, 'Awalul Romadhon', '242510033', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(273, 'Bagas Gilang Ramadhan', '242510114', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(274, 'Bayu Riffiansyah Sukardi', '242510150', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(275, 'Bela Novita', '242510115', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(276, 'Bela Silvia Sari', '242510183', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(277, 'Beryl Adrienne Widayat', '242510085', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(278, 'Canda Aprila Fajriano', '242510086', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(279, 'Cindy Febriana Putri', '242510184', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(280, 'Darian Azraqi', '242510034', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(281, 'David William', '242510116', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(282, 'Dede Ahmad Fahrezi', '242510151', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(283, 'Dendra Wijaya', '242510185', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(284, 'Destavia Anjani', '242510004', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(285, 'Devano Yoga Fahreza', '242510005', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(286, 'Dhea Ardelia', '242510117', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(287, 'Dira Oktavia', '242510035', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(288, 'Dita Nofita Syahrani', '242510186', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(289, 'Edward Raya Fadillah', '242510036', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(290, 'Eka Putri Agustin', '242510152', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(291, 'Ernawati', '242510006', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(292, 'Ervan Banyu Andira', '242510118', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(293, 'Ery Jati Pramono Aji', '242510007', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(294, 'Fadilla Nur Azizah', '242510037', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(295, 'Fadli Pradana', '242510153', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(296, 'Fahmi Mahesal', '242510087', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(297, 'Farel Irta Aryandi', '242510187', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(298, 'Fatir Muhammad', '242510088', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(299, 'Fazri Apriyanto', '242510008', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(300, 'Febi Antonius', '242510089', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(301, 'Fina', '242510119', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(302, 'Furnama Widia Sari', '242510090', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(303, 'Ghaisani Najwa Alifah', '242510091', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(304, 'Ghaza Fabian Alfariz', '242510188', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(305, 'Habib Iqhsan Muamala', '242510038', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(306, 'Hilyatul Aulia', '242510154', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(307, 'Ibnu', '242510092', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(308, 'Imam Ahmad Rosyidin', '242510093', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(309, 'Intan Mugniani', '242510189', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(310, 'Ismi Cahyati Kurniawan', '242510120', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(311, 'Jahra', '242510121', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(312, 'Jeams Dreco Rupiasa', '242510039', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(313, 'Jelita Oktaviani', '242510155', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(314, 'Jesi Aulia Agustin', '242510190', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(315, 'Jesika Nursifa', '242510156', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(316, 'Jhonatan Avryan', '242510009', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(317, 'Junia Khairunnisya', '242510191', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(318, 'Karima', '242510192', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(319, 'Keyara Putri', '242510157', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(320, 'Kheysia Rahmadani', '242510094', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(321, 'Khumairah Maulidiah', '242510122', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(322, 'Laila Seftya Rahayu', '242510193', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(323, 'Lintang Rayya Samudra', '242510095', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(324, 'Lusiana', '242510123', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(325, 'M Khaidar Algifari', '242510158', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(326, 'Marcellino Vivaldi', '242510159', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(327, 'Mei Syila', '242510124', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(328, 'Miftah Febriansyah', '242510010', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(329, 'Millanda Fransisca Gunawan', '242510194', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(330, 'Mita Fitria', '242510125', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(331, 'Mohamad Reja', '242510011', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(332, 'Mohammad Rifa Aditya', '242510012', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(333, 'Muhamad Abdul Gofur', '242510040', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(334, 'Muhamad Chairiel Ariyansyah', '242510013', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(335, 'Muhamad Fachry', '242510096', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(336, 'Muhamad Faiz Ramadhan', '242510041', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(337, 'Muhamad Kharis Prama Maheswara', '242510014', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(338, 'Muhamad Raffi Al Hafidz', '242510042', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(339, 'Muhamad Rafli Awaludin', '242510126', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(340, 'Muhamad Raga Restu', '242510160', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(341, 'Muhamad Rasya Prasetyo', '242510097', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(342, 'Muhamad Refan Ivandi', '242510195', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(343, 'Muhamad Reyhan Al Fatir', '242510015', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(344, 'Muhamad Riski Dwi Gunawan', '242510127', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(345, 'Muhamad Rizki', '242510161', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(346, 'Muhammad Adly Septi', '242510196', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(347, 'Muhammad Akmal Fachrudin', '242510043', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(348, 'Muhammad Alif Adiputra', '242510128', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(349, 'Muhammad Fachri', '242510016', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(350, 'Muhammad Jibillah Nur Abdillah', '242510098', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(351, 'Muhammad Qadafi Maliki Khalik', '242510197', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(352, 'Mutia Putri Ramadani', '242510162', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(353, 'Mutiara Azzahra', '242510198', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(354, 'Nahdan Antasena Rusdi', '242510017', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(355, 'Najwa Juliani', '242510199', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(356, 'Nayla Dinda Arifin', '242510099', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(357, 'Naysila Dwi Novita', '242510129', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(358, 'Naysila Insani', '242510163', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(359, 'Nazhira Lulu Aulia', '242510200', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(360, 'Nazwa Nur Aprilia Setiawan', '242510130', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(361, 'Nazwa Safitri', '242510201', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(362, 'Nazwa Zahra Aulia', '242510164', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(363, 'Nesa', '242510131', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(364, 'Nia Ramaidah', '242510165', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(365, 'Nindi Putri', '242510018', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(366, 'Novita Riana Rahmania', '242510132', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(367, 'Nurhadi', '242510044', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(368, 'Nurhayati', '242510045', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(369, 'Nursaila', '242510166', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(370, 'Puspita Sari', '242510202', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(371, 'Putri Aulia', '242510133', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(372, 'Putri Fadilah Oktaviani', '242510019', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(373, 'Qushay Abdhillah', '242510046', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(374, 'Rachel Listi Aghista', '242510167', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(375, 'Raden Muhammad Nijar Anugrah', '242510134', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(376, 'Rafi Aufa', '242510168', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(377, 'Rafly Oktavian', '242510020', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(378, 'Rahma Khaerunisa', '242510135', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(379, 'Rani Rusliani', '242510100', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(380, 'Reni Anggraeni', '242510203', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(381, 'Renita Bela', '242510169', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(382, 'Reno', '242510204', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(383, 'Ridho Nurul Fa izin', '242510047', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(384, 'Rifqi Ilham Maulana', '242510021', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(385, 'Rijal Baedillah Saputra', '242510136', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(386, 'Rina Amelia Nurinjani', '242510137', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(387, 'Ripaldi', '242510022', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(388, 'Riyadhatul Gilang Adriyanto', '242510048', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(389, 'Rizki Al Jabbar', '242510023', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(390, 'Rizki Al Qodri Ginting', '242510049', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(391, 'Rizky', '242510050', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(392, 'Rizky Ramadhan', '242510101', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(393, 'Robiatul Kamila', '242510170', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(394, 'Rodiawati', '242510205', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(395, 'Roihan Akmal Baihaki', '242510206', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(396, 'Rosa Anggraeni', '242510171', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(397, 'Sabria Widi Mulia', '242510138', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(398, 'Safa Aulia Ardianti', '242510207', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(399, 'SAHIDIN BACHRI', '242510214', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(400, 'Sahrul Pauzi', '242510051', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(401, 'Salsabila Nur Aprilia Rohadi', '242510172', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(402, 'Satria Gunawan', '242510024', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(403, 'Satrio', '242510025', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(404, 'Septia Ramadiyanti', '242510208', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(405, 'Shabrina Muthia Mafaza', '242510102', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(406, 'Shereen Naurah Salsabila', '242510052', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(407, 'Sinseza Ria Wijaya', '242510139', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(408, 'Sinta', '242510173', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(409, 'Siti Laela Sari', '242510174', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(410, 'Siti Nurlaeny', '242510209', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(411, 'Siti Rayhana Zahra Qolbi', '242510140', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(412, 'Soffy Dwi Agustin', '242510103', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(413, 'Sukses Mulya Saputra', '242510104', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(414, 'Sunita Agustiarini Putri', '242510210', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(415, 'Tasya Firmansyah', '242510175', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(416, 'Tasya Utami Dewi', '242510105', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(417, 'Tegar Albi Frahesa', '242510211', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(418, 'Tiara Putri Chaerunnisa', '242510141', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(419, 'Tiara Wulandari', '242510212', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(420, 'Ulan Nainda Suci Diani', '242510176', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(421, 'Vanesya Martin', '242510177', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(422, 'Vatsan Wira Yuda Khadofa', '242510026', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(423, 'Vino Aldiyansyah', '242510213', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(424, 'Vino Erdiansyah', '242510178', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(425, 'Yuda Pratama', '242510106', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(426, 'Yudha Firmansyah', '242510027', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(427, 'Yudi', '242510053', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(428, 'Zahira Adzka Alifa', '242510142', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(429, 'Zihan Aulia', '242510054', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- membuang struktur untuk table db_vote1.m_tahun_ajar
CREATE TABLE IF NOT EXISTS `m_tahun_ajar` (
  `id_tahun_ajar` int NOT NULL AUTO_INCREMENT,
  `tahun_ajar` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tahun_ajar`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.m_tahun_ajar: ~4 rows (lebih kurang)
INSERT INTO `m_tahun_ajar` (`id_tahun_ajar`, `tahun_ajar`, `deskripsi`, `is_active`) VALUES
	(1, '2022/2023', NULL, 'N'),
	(2, '2023/2024', NULL, 'N'),
	(3, '2024/2025', NULL, 'N'),
	(4, '2025/2026', NULL, 'Y'),
	(5, '2026/2027', NULL, 'Y');

-- membuang struktur untuk table db_vote1.m_user
CREATE TABLE IF NOT EXISTS `m_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nipd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `npwp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('siswa','guru','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'siswa',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `email_guru` (`npwp`) USING BTREE,
  KEY `email_murid` (`nipd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.m_user: ~253 rows (lebih kurang)
INSERT INTO `m_user` (`id_user`, `nama`, `nipd`, `npwp`, `role`, `password`, `remember_token`, `is_active`) VALUES
	(1, 'Abdul Syahril Pratama', '242510055', NULL, 'siswa', '$2y$12$f1AunvBvZ/ACHoJhxlpm2enXGgwzDJAqBg/qA88fl38QBNTndukFC', 'tok1', 'Y'),
	(2, 'Dimas Surya Putra', '242510056', NULL, 'siswa', '$2y$12$MHVFWZ15zs/Aekwyh9Mv8OpRW6WPRcdBnXPyVLV2xuN4Cgop5/Nai', 'tok2', 'Y'),
	(3, 'Emre Razaq', '242510057', NULL, 'siswa', '$2y$12$xNFWwXWYLoUcCX5ZDa9C/OejJAL72fR553sd0XA8PYfkncHDkHiAO', 'tok3', 'Y'),
	(4, 'Farel Apandi', '242510058', NULL, 'siswa', '$2y$12$OJV/YjUthLpamhs8fBprJObWgIzWczOJ3UolFUNfOhrszmq9z/SB6', 'tok4', 'Y'),
	(5, 'Felicya Agatha Susanto Lie', '242510059', NULL, 'siswa', '$2y$12$3TT8Ny.rqm9vUXb0cE8i8OIaJGOF.fXs5nBIoINdQ0WIcIlYHQcju', 'tok5', 'Y'),
	(6, 'Fiqih Al Farizi', '242510060', NULL, 'siswa', '$2y$12$k4fy80GSsyGhuaI3vKNXAOOxgQX6TfVLOM5V9RM1kr9xuvn51var.', 'tok6', 'Y'),
	(7, 'Iskandar Ibrahim', '242510061', NULL, 'siswa', '$2y$12$4T8Noxn5/wiGhKBie.kBe.Q0Yq7Ab5t7ZDrL9N/7.TqFnNM6ElzCK', 'tok7', 'Y'),
	(8, 'Marchel Hugo Putra Ramadhan', '242510062', NULL, 'siswa', '$2y$12$POcYZH3aVRghoZnvviDtBOZLb7wAy2ZLstL828SfM5sPg/pcqHaTS', 'tok8', 'Y'),
	(9, 'Maulidan Alif Wicaksono', '242510063', NULL, 'siswa', '$2y$12$eb9Wt6Ioa/Ch4V.KIn4HEuEBl5JbRJHKYA7.hks/Fx8X6qojpL9Yy', 'tok9', 'Y'),
	(10, 'Melvin Olivia', '242510064', NULL, 'siswa', '$2y$12$1wzO0wijI79P6pEYxC9gG.dmiTyNmZqbifrlBV8sB4GhGWQtOY9WW', 'tok10', 'Y'),
	(11, 'Muhamad Irfan Ardiansyah', '242510065', NULL, 'siswa', '$2y$12$kKOnu/a3iHdWNHdvQ15HjuPaYy8x/wjmZ3LVKBSsQJ8LevbbYoTh6', 'tok11', 'Y'),
	(12, 'M. Fahry Tri G', '242510066', NULL, 'siswa', '$2y$12$9.m/LkpT8gzV0un4v7v7/uE2EfM4Gd9k3YeQIXgRrb5YXQgtx2Moi', 'tok12', 'Y'),
	(13, 'Muhammad Farel Andriani', '242510067', NULL, 'siswa', '$2y$12$see9rjzw6Q2LofJhEF5go.3jrUBtNJmr6h0U6sFCNYUC0vm55y1UG', 'tok13', 'Y'),
	(14, 'Muhammad Ihwan Utomo', '242510068', NULL, 'siswa', '$2y$12$uvpQg7wEUaY6ADxPQDg2huM3dHLZAPse0dt6IemmUoZG2.uBAs07W', 'tok14', 'Y'),
	(15, 'Novita Damayanti', '242510069', NULL, 'siswa', '$2y$12$htMNK6kyFc3UVl85WlEggOQjl/OiScIKTowTHJ5b0VHucDbaVRQ8m', 'tok15', 'Y'),
	(16, 'Nurlita', '242510070', NULL, 'siswa', '$2y$12$Rw.AKQMWpkspRL5G3rKDR.tkHtICyLny8/xTERx5dNJXFwVzWlEmK', 'tok16', 'Y'),
	(17, 'Oktapia Nurpadilah', '242510071', NULL, 'siswa', '$2y$12$QWSEqR1xgNUC.VWwPdNTc.49FLKMCTjw1e2wCQxXvYcCiFTscYy0W', 'tok17', 'Y'),
	(18, 'Putra Kasela', '242510072', NULL, 'siswa', '$2y$12$2qVV6lLRcjoZqLSU19tj7.MKTExOjOLp7zPa4DIYfowIUHAo5KkDW', 'tok18', 'Y'),
	(19, 'Ramadhan Agil Siraj', '242510073', NULL, 'siswa', '$2y$12$erMRa4B61JLei8dAAhIiiuIvwHIVV/Ywnomf/1yYSAc1hAWeHYSTa', 'tok19', 'Y'),
	(20, 'Ratu Haerunnisa', '242510074', NULL, 'siswa', '$2y$12$6v2PofbzEkBoRyPM4Exrbejl82s8AH5SHsECrOtKKTPDYsR9Le3q.', 'tok20', 'Y'),
	(21, 'Reyvan Darmawan', '242510075', NULL, 'siswa', '$2y$12$gN9laCsfnGMCa6MFBkyIt.9X903ilLL8gzW6sD585Dp695gGB96sa', 'tok21', 'Y'),
	(22, 'Rina Rusliana', '242510076', NULL, 'siswa', '$2y$12$rzObnMLz8t2EZ7gPXcc1MeWiRIAvKob351rMbMn5Y9UC5fwOGUlMy', 'tok22', 'Y'),
	(23, 'Robiyatun Nisa', '242510077', NULL, 'siswa', '$2y$12$iarDBe276HFbRju04e42rexnO7xNivTm7IrB7fUgrjlc75VbsoQEu', 'tok23', 'Y'),
	(24, 'Saka Novagio', '242510078', NULL, 'siswa', '$2y$12$zw4999bNf1IAtuYcwKonh.fDBR77XTphuN7RyHYFmwnvvOqpaaODy', 'tok24', 'Y'),
	(25, 'Siti Nur Kholisha', '242510079', NULL, 'siswa', '$2y$12$pIv9af2x1fWaNXlK0Nb1i.l3vsMsZxgnEPceEXtpmt8Dxc0U2UPja', 'tok25', 'Y'),
	(26, 'Sugiarto Raharjo', '242510080', NULL, 'siswa', '$2y$12$/C2lzfr8RiZnCEcDqiKopO5.lCB.A5A1v4GqdRryE.J6R2GT.qw1y', 'tok26', 'Y'),
	(27, 'Umar Hafidz Muhyidin', '242510081', NULL, 'siswa', '$2y$12$94xPi3gWiWwvxOdsVauCMOb.SddD168VfOPhAIHKjDwccMR.WHelq', 'tok27', 'Y'),
	(28, 'Denisa Ramadanti', NULL, '262710101', 'guru', '$2y$12$YHvICyNP1eN9lr3/rzHWHOJq.Wy0sJgyHn8/SNO/qgQnBIWMCZAQa', 'g1', 'Y'),
	(29, 'Lidiawati', NULL, '262710102', 'guru', '$2y$12$9Z1G1F1ZAsnIBW0tz1mRV.xWI5jF9E.dzWozhMuRZ2wXzeqTZqCN6', 'g2', 'Y'),
	(30, 'Sri Rahayu', NULL, '262710103', 'guru', '$2y$12$MuZrzywyo2EpWJjYikg8QOpJnxk3ZCoed2dFEDm2.NzjYsNoGTjve', 'g3', 'Y'),
	(31, 'Muhammad Haerudin', NULL, '262710104', 'guru', '$2y$12$M5XzE4K1wUCA0LYphzK3Ju6hd4LXK9hSg1AJ1TxMYw3R6uZIojIMK', 'g4', 'Y'),
	(32, 'Sediana Hadisujatma', NULL, '262710105', 'guru', '$2y$12$PId292SE2MRKGAO/iVS4.OQuqsGnH/recc6t11uVZSNdnMu6yCv3a', 'g5', 'Y'),
	(33, 'Naufal Irgi Ramadhan', NULL, '262710106', 'guru', '$2y$12$L9jRpcAADrN6BXgIpFqhxe71drxWiCtPoilS9q.P9zdDKdaRp5IHW', 'g6', 'Y'),
	(34, 'Ade Supriadi', NULL, '262710107', 'guru', '$2y$12$LjrgX.yEs9RN/ic7y6fu9eF8CHmPgH41Y7OOxYEHl52TjHnDvkyVe', 'g7', 'Y'),
	(35, 'Eka Ayu Kurniasih', NULL, '262710108', 'guru', '$2y$12$DU3g1oE03YRWqf7W2zxT6ODJOU1qSfueYtu1aJUBCSJQyJmwqMrC2', 'g8', 'Y'),
	(36, 'Andika Mahendra', NULL, '262710109', 'guru', '$2y$12$1inw.YlKZoM31UxoZi3WDOryA4IdnYlcruIIO7Lg6FiTvGSlpqNuy', 'g9', 'Y'),
	(37, 'Susiana', NULL, '262710110', 'guru', '$2y$12$KwFU4AKaowvfg1/xiwsns./O8OsDG6yyGLPSlIiL3a18W/g9Ve6Hq', 'g10', 'Y'),
	(38, 'Sukron Ansori', NULL, '262710111', 'guru', '$2y$12$FjVNqwVYf9CjK3vwM4InP.dxgjRPo3nY/Ej.0Qx0yvd7ExdNV6866', 'g11', 'Y'),
	(39, 'Eka Riana', NULL, '262710112', 'guru', '$2y$12$DJadDx3brCgmJObOhBzXAO6r2Vnd7gzXdKbBQp540WByi6Anplu9u', 'g12', 'Y'),
	(40, 'Abdul Syahril Pratama', '242510055', NULL, 'siswa', '$2y$12$f1AunvBvZ/ACHoJhxlpm2enXGgwzDJAqBg/qA88fl38QBNTndukFC', 'TOK28', 'Y'),
	(41, 'Dimas Surya Putra', '242510056', NULL, 'siswa', '$2y$12$MHVFWZ15zs/Aekwyh9Mv8OpRW6WPRcdBnXPyVLV2xuN4Cgop5/Nai', 'TOK29', 'Y'),
	(42, 'Emre Razaq', '242510057', NULL, 'siswa', '$2y$12$xNFWwXWYLoUcCX5ZDa9C/OejJAL72fR553sd0XA8PYfkncHDkHiAO', 'TOK30', 'Y'),
	(43, 'Farel Apandi', '242510058', NULL, 'siswa', '$2y$12$OJV/YjUthLpamhs8fBprJObWgIzWczOJ3UolFUNfOhrszmq9z/SB6', 'TOK31', 'Y'),
	(44, 'Felicya Agatha Susanto Lie', '242510059', NULL, 'siswa', '$2y$12$3TT8Ny.rqm9vUXb0cE8i8OIaJGOF.fXs5nBIoINdQ0WIcIlYHQcju', 'TOK32', 'Y'),
	(45, 'Fiqih Al Farizi', '242510060', NULL, 'siswa', '$2y$12$k4fy80GSsyGhuaI3vKNXAOOxgQX6TfVLOM5V9RM1kr9xuvn51var.', 'TOK33', 'Y'),
	(46, 'Iskandar Ibrahim', '242510061', NULL, 'siswa', '$2y$12$4T8Noxn5/wiGhKBie.kBe.Q0Yq7Ab5t7ZDrL9N/7.TqFnNM6ElzCK', 'TOK34', 'Y'),
	(47, 'Marchel Hugo Putra Ramadhan', '242510062', NULL, 'siswa', '$2y$12$POcYZH3aVRghoZnvviDtBOZLb7wAy2ZLstL828SfM5sPg/pcqHaTS', 'TOK35', 'Y'),
	(48, 'Maulidan Alif Wicaksono', '242510063', NULL, 'siswa', '$2y$12$eb9Wt6Ioa/Ch4V.KIn4HEuEBl5JbRJHKYA7.hks/Fx8X6qojpL9Yy', 'TOK36', 'Y'),
	(49, 'Melvin Olivia', '242510064', NULL, 'siswa', '$2y$12$1wzO0wijI79P6pEYxC9gG.dmiTyNmZqbifrlBV8sB4GhGWQtOY9WW', 'TOK37', 'Y'),
	(50, 'Muhamad Irfan Ardiansyah', '242510065', NULL, 'siswa', '$2y$12$kKOnu/a3iHdWNHdvQ15HjuPaYy8x/wjmZ3LVKBSsQJ8LevbbYoTh6', 'TOK38', 'Y'),
	(51, 'M. Fahry Tri G', '242510066', NULL, 'siswa', '$2y$12$9.m/LkpT8gzV0un4v7v7/uE2EfM4Gd9k3YeQIXgRrb5YXQgtx2Moi', 'TOK39', 'Y'),
	(52, 'Muhammad Farel Andriani', '242510067', NULL, 'siswa', '$2y$12$see9rjzw6Q2LofJhEF5go.3jrUBtNJmr6h0U6sFCNYUC0vm55y1UG', 'TOK40', 'Y'),
	(53, 'Muhammad Ihwan Utomo', '242510068', NULL, 'siswa', '$2y$12$uvpQg7wEUaY6ADxPQDg2huM3dHLZAPse0dt6IemmUoZG2.uBAs07W', 'TOK41', 'Y'),
	(54, 'Novita Damayanti', '242510069', NULL, 'siswa', '$2y$12$htMNK6kyFc3UVl85WlEggOQjl/OiScIKTowTHJ5b0VHucDbaVRQ8m', 'TOK42', 'Y'),
	(55, 'Nurlita', '242510070', NULL, 'siswa', '$2y$12$Rw.AKQMWpkspRL5G3rKDR.tkHtICyLny8/xTERx5dNJXFwVzWlEmK', 'TOK43', 'Y'),
	(56, 'Oktapia Nurpadilah', '242510071', NULL, 'siswa', '$2y$12$QWSEqR1xgNUC.VWwPdNTc.49FLKMCTjw1e2wCQxXvYcCiFTscYy0W', 'TOK44', 'Y'),
	(57, 'Putra Kasela', '242510072', NULL, 'siswa', '$2y$12$2qVV6lLRcjoZqLSU19tj7.MKTExOjOLp7zPa4DIYfowIUHAo5KkDW', 'TOK45', 'Y'),
	(58, 'Ramadhan Agil Siraj', '242510073', NULL, 'siswa', '$2y$12$erMRa4B61JLei8dAAhIiiuIvwHIVV/Ywnomf/1yYSAc1hAWeHYSTa', 'TOK46', 'Y'),
	(59, 'Ratu Haerunnisa', '242510074', NULL, 'siswa', '$2y$12$6v2PofbzEkBoRyPM4Exrbejl82s8AH5SHsECrOtKKTPDYsR9Le3q.', 'TOK47', 'Y'),
	(60, 'Reyvan Darmawan', '242510075', NULL, 'siswa', '$2y$12$gN9laCsfnGMCa6MFBkyIt.9X903ilLL8gzW6sD585Dp695gGB96sa', 'TOK48', 'Y'),
	(61, 'Rina Rusliana', '242510076', NULL, 'siswa', '$2y$12$rzObnMLz8t2EZ7gPXcc1MeWiRIAvKob351rMbMn5Y9UC5fwOGUlMy', 'TOK49', 'Y'),
	(62, 'Robiyatun Nisa', '242510077', NULL, 'siswa', '$2y$12$iarDBe276HFbRju04e42rexnO7xNivTm7IrB7fUgrjlc75VbsoQEu', 'TOK50', 'Y'),
	(63, 'Saka Novagio', '242510078', NULL, 'siswa', '$2y$12$zw4999bNf1IAtuYcwKonh.fDBR77XTphuN7RyHYFmwnvvOqpaaODy', 'TOK51', 'Y'),
	(64, 'Siti Nur Kholisha', '242510079', NULL, 'siswa', '$2y$12$pIv9af2x1fWaNXlK0Nb1i.l3vsMsZxgnEPceEXtpmt8Dxc0U2UPja', 'TOK52', 'Y'),
	(65, 'Sugiarto Raharjo', '242510080', NULL, 'siswa', '$2y$12$/C2lzfr8RiZnCEcDqiKopO5.lCB.A5A1v4GqdRryE.J6R2GT.qw1y', 'TOK53', 'Y'),
	(66, 'Umar Hafidz Muhyidin', '242510081', NULL, 'siswa', '$2y$12$94xPi3gWiWwvxOdsVauCMOb.SddD168VfOPhAIHKjDwccMR.WHelq', 'TOK54', 'Y'),
	(67, 'Abanda Aldirra', '242510107', NULL, 'siswa', '$2y$12$55ktX0.4oABS6l6wYME58.o9nKXZJGAfMpmsX3/7.HTLGwF.3VFPq', 'TOK55', 'Y'),
	(68, 'Abdul Azis Al Ajhari', '242510143', NULL, 'siswa', '$2y$12$uQHCJspz.bOu9LE/Vfo7b.5ltukOx0tQkHFEpoJXOS7lP1EsXSH02', 'TOK56', 'Y'),
	(69, 'Abdul Muis', '242510179', NULL, 'siswa', '$2y$12$bYd2eDEI8SHLBB.TgXP75.G39PIvfwb6wVzYwL5ZIku9g5h/wUx4.', 'TOK57', 'Y'),
	(70, 'Abidin', '242510001', NULL, 'siswa', '$2y$12$I3hzYfGKukOj.5ROhqe9EO0QV7453TQqZLbJpLnrKCPTgM1M7S5WG', 'TOK58', 'Y'),
	(71, 'Adji Saputra', '242510028', NULL, 'siswa', '$2y$12$701ZD8FQOqPM2r2kb61K5.DswYZ/j5Cz6.y1BGcKvtPwUK64o4Feu', 'TOK59', 'Y'),
	(72, 'Adrian Sadiran', '242510002', NULL, 'siswa', '$2y$12$LWlH/Fc/K3oYMhKndMcV2.NCBbKq/IieA7AcYnda7xCLDpPpoma2y', 'TOK60', 'Y'),
	(73, 'Adventus Tambunan', '242510108', NULL, 'siswa', '$2y$12$LjwDRq8cRGaJ72RPR9Hubey6YvMmEe7QevMwHIvJOYfBJCBYxi2b2', 'TOK61', 'Y'),
	(74, 'Afifah Adawiyyah', '242510109', NULL, 'siswa', '$2y$12$EcAFRFTvCSy7gsa4gRMakeCtGznx2tJHScuzFhMvGbKA7sO13NHLO', 'TOK62', 'Y'),
	(75, 'Al Farezh Khairan Abrar', '242510144', NULL, 'siswa', '$2y$12$GPjQztw77UhdC9o22rfBMuWOChxGqWHGcBcpVfEsQPAmJS1PL/vM6', 'TOK63', 'Y'),
	(76, 'Aldi Ramadan', '242510180', NULL, 'siswa', '$2y$12$iMnmAAZs4W/o2y6PORhG/ONGFwfLSohiCBZUwtJEdK/ehr82TBoIm', 'TOK64', 'Y'),
	(77, 'Alfith Alfaiz Bayhaqqy', '242510110', NULL, 'siswa', '$2y$12$6NgFHVTBjfcsquXca8u9neC.i41QI/oBBQ43BwplTGGCcao.Xd13.', 'TOK65', 'Y'),
	(78, 'Aliffia Rafifah Indrani', '242510145', NULL, 'siswa', '$2y$12$7SLsYWiuIHMS2nle.F7Mxe1byGoP2w.lctyYp4f/eBh0A6GVQ1BQm', 'TOK66', 'Y'),
	(79, 'Alika Syifana', '242510181', NULL, 'siswa', '$2y$12$2VN/MTyq1KSUsxtuS9wbb.iTNNUPv2Diudkih8yPLUjMvRAlQEDsC', 'TOK67', 'Y'),
	(80, 'Alip Firdaus', '242510029', NULL, 'siswa', '$2y$12$A3vTJRge5JTmAKmQmmh1aeWc8iC10uEVfMS7g07zoS2IeiRWycg2O', 'TOK68', 'Y'),
	(81, 'Allisa Purnama', '242510111', NULL, 'siswa', '$2y$12$SqLxDgX49LWiWecLfa1Sr.M5k9BQpVvW55SEEe/rixbofJlOm096i', 'TOK69', 'Y'),
	(82, 'Alvi Ramadhan', '242510030', NULL, 'siswa', '$2y$12$lVQd2UqFKU2UiJMGG6seVuLW7a1nYaGJ/zxMHbFVNgKppzwpLHUiy', 'TOK70', 'Y'),
	(83, 'Alvian Imanuel Manurung', '242510003', NULL, 'siswa', '$2y$12$6E.sGVpNiXswENMl092CfONtxl0xMNOotzFHhvfmi1HSKxUpjOxpi', 'TOK71', 'Y'),
	(84, 'Alya Syavira', '242510146', NULL, 'siswa', '$2y$12$ZIBznaJKgCGpEQJF822JYOVhATpgRJOAY.DGrsq56hmzuHJDWKAy.', 'TOK72', 'Y'),
	(85, 'Ananda Rehan', '242510031', NULL, 'siswa', '$2y$12$TzbLkXqgeZyh0daF630pluF3huQdO5n/ZVUlCPpxBbmlARAfw4KmC', 'TOK73', 'Y'),
	(86, 'Anjelita Aulia', '242510112', NULL, 'siswa', '$2y$12$OwLKtzVXpcjLCsCJInTV8usi1QCYRNweVnr7pqNxNWOKVil7EqQEW', 'TOK74', 'Y'),
	(87, 'Aprilia Tri Anjani', '242510147', NULL, 'siswa', '$2y$12$T3X/zZGsHLgHRILJoagLSOm1Cxn0pUGjaXGruDUhYhksplNvZB7jW', 'TOK75', 'Y'),
	(88, 'Ardiansyah', '242510148', NULL, 'siswa', '$2y$12$JrI1dXPgHoR.BcOzFlXjbueMriN9IunBFXAIdB4ALQ1acXt02PpVO', 'TOK76', 'Y'),
	(89, 'Ari Arasyid', '242510032', NULL, 'siswa', '$2y$12$skkGlVdBSX1h7UUQdeWNeejswIdftxyBXFqQqOv93JGKk/BM8lQF2', 'TOK77', 'Y'),
	(90, 'Ari Dwi Yanto', '242510082', NULL, 'siswa', '$2y$12$arPNs5eut4Is3tnQYrKGo.T9btI2lVpFli03zPNwfb8bevQ8YDMqu', 'TOK78', 'Y'),
	(91, 'Arkhan Fikrhamsyah', '242510182', NULL, 'siswa', '$2y$12$QZD9j/Rp6ei9T/E9dv2PIe75VxWpO0TjdhGyg82S8/jRDITA0bPS2', 'TOK79', 'Y'),
	(92, 'Aryasatya Bayanaka', '242510083', NULL, 'siswa', '$2y$12$RR.EnQY3UQkfraOXWqYsFeCmJt8tK./0fjti8C1nOmJ9KrmLaxMiO', 'TOK80', 'Y'),
	(93, 'Aulia Cahya Ramadhani', '242510084', NULL, 'siswa', '$2y$12$tJIl9kBPjsS2K7sokFZBUuPbeWncBRC8m.oBZUAJb1vhpqMr4tkZ.', 'TOK81', 'Y'),
	(94, 'Aura Ramadhani', '242510149', NULL, 'siswa', '$2y$12$aw7BmriQ5g4S/NJS/OHXXOTREVtB2cyRzA8M61PDhKN/TeTtdTAXy', 'TOK82', 'Y'),
	(95, 'Avrilita Zahra Putri', '242510113', NULL, 'siswa', '$2y$12$21kwRC8Cfl28sFTFpHH5KO0l8wQsu0g6..Iualln3WBdEiL1F6BV2', 'TOK83', 'Y'),
	(96, 'Awalul Romadhon', '242510033', NULL, 'siswa', '$2y$12$.HvpRic0i6D0DsMvkNGZFOKrE7rwDaPyc7z55XoX29h2G95OvQONy', 'TOK84', 'Y'),
	(97, 'Bagas Gilang Ramadhan', '242510114', NULL, 'siswa', '$2y$12$cnpF98AeDFhbZn9AdhROJu7n5rRzgjjVxEdv68SEEkwhPZOq397Mu', 'TOK85', 'Y'),
	(98, 'Bayu Riffiansyah Sukardi', '242510150', NULL, 'siswa', '$2y$12$/C7MDwQ8E13HKL/Ry4JI6uNmOe8pqLrPZNur9E3YSGBhjVSMjiI1.', 'TOK86', 'Y'),
	(99, 'Bela Novita', '242510115', NULL, 'siswa', '$2y$12$Zk.1sGZdeZ6te14Zl6odGumm4Wb8s9/ai0htxxVnLEJdR2GR2Nll.', 'TOK87', 'Y'),
	(100, 'Bela Silvia Sari', '242510183', NULL, 'siswa', '$2y$12$ElBg0.1LAVK5bVJWnyD9H.bDoK.jluopRTL69YIKTHlTjTLLlxdC6', 'TOK88', 'Y'),
	(101, 'Beryl Adrienne Widayat', '242510085', NULL, 'siswa', '$2y$12$9hi.QXY8tlBOhmpflLMOWeM7Ey1rHZknWVsjptqRAooYbj9RIcJ9G', 'TOK89', 'Y'),
	(102, 'Canda Aprila Fajriano', '242510086', NULL, 'siswa', '$2y$12$sFCHuL0YKgi/g4C1b7EDee7.scBG2bNrwu1v.hBE8v2sXt1GC4rxy', 'TOK90', 'Y'),
	(103, 'Cindy Febriana Putri', '242510184', NULL, 'siswa', '$2y$12$Dfs6/Cy3hKJ7ppX0OHGkz.h3ylFiCZqC0NWgDwm5K1rUsFTKPW5qK', 'TOK91', 'Y'),
	(104, 'Darian Azraqi', '242510034', NULL, 'siswa', '$2y$12$SvBqotj5lkKK8nJb3pf64enDLLo8qOXdsE1tQsOYqwytyIc5dkGa.', 'TOK92', 'Y'),
	(105, 'David William', '242510116', NULL, 'siswa', '$2y$12$hWJc.RiK390oYMakTDqEV.4XqX0MFe7/mN89fmra3b78UHsY.LTZ6', 'TOK93', 'Y'),
	(106, 'Dede Ahmad Fahrezi', '242510151', NULL, 'siswa', '$2y$12$pRpbRNScyBBN0pg8gwOjm.BZO0rQwzDuLqqdwoPUBGQr08F9kC6Xa', 'TOK94', 'Y'),
	(107, 'Dendra Wijaya', '242510185', NULL, 'siswa', '$2y$12$EHLC6A9smRJDTOpBzXNp8eQ85U/b5LjMwVDB0QvHcdetMDEUhB4z6', 'TOK95', 'Y'),
	(108, 'Destavia Anjani', '242510004', NULL, 'siswa', '$2y$12$4oxHw5Dc6O0udS7gU/hiGuuslFrzk0XQEVD.EIXp4QZqDCP5uM8Tu', 'TOK96', 'Y'),
	(109, 'Devano Yoga Fahreza', '242510005', NULL, 'siswa', '$2y$12$uZbU2NIjBHiM41CFkViWfOk64E./PxxHDvcyZ87doSomT/Wj/uAL.', 'TOK97', 'Y'),
	(110, 'Dhea Ardelia', '242510117', NULL, 'siswa', '$2y$12$eCq5jGOPJb6.mrsbO3UACu9tGfg49WWrIuMMdOXPuTIhCJdgGxxQ.', 'TOK98', 'Y'),
	(111, 'Dira Oktavia', '242510035', NULL, 'siswa', '$2y$12$Hcs3ZmppLIJoWD5Ib4EXZOLzC.GPXIaOguDDfmDClqJsS72ibbND6', 'TOK99', 'Y'),
	(112, 'Dita Nofita Syahrani', '242510186', NULL, 'siswa', '$2y$12$fatbmEYlXKMASuXoFcVyHeAz6qbukrlGAULHIXvx9Gz10TOKHRoTm', 'TOK100', 'Y'),
	(113, 'Edward Raya Fadillah', '242510036', NULL, 'siswa', '$2y$12$I6Cxd5VnBDlZW1jGJal2R.MG/6FmTE8GhZ.Ru7tco2HzUie2PgSla', 'TOK101', 'Y'),
	(114, 'Eka Putri Agustin', '242510152', NULL, 'siswa', '$2y$12$DwQa7vgJrXiKfd.BnEC/A.6haUe/3FWTLC8k1wo2BJYEEo8M3Htfq', 'TOK102', 'Y'),
	(115, 'Ernawati', '242510006', NULL, 'siswa', '$2y$12$7mUWmbNsJjUKTfbTxCsCluvobDIRLLFCsAMORe67SvqC.gGcqzkD.', 'TOK103', 'Y'),
	(116, 'Ervan Banyu Andira', '242510118', NULL, 'siswa', '$2y$12$sf9q9IHIt91c45c.Z43sFeTOy99RVhfbwVOuz1ukEqIL7k9OC3ywe', 'TOK104', 'Y'),
	(117, 'Ery Jati Pramono Aji', '242510007', NULL, 'siswa', '$2y$12$I/ykphDVslNxHFfPpoglxuN7pIl4PXYBDcAIbjFxAWLBRabVTnt7.', 'TOK105', 'Y'),
	(118, 'Fadilla Nur Azizah', '242510037', NULL, 'siswa', '$2y$12$vcYk0kXQ4MssLkK2zllgj.EiN5OhSBBWIOatzr8sXkI7LhKKBfyw.', 'TOK106', 'Y'),
	(119, 'Fadli Pradana', '242510153', NULL, 'siswa', '$2y$12$NSzNsXRPB7nilsgoziwE5.2eq1LAyR2OPW/mxc39E5ldPHCu.9yF.', 'TOK107', 'Y'),
	(120, 'Fahmi Mahesal', '242510087', NULL, 'siswa', '$2y$12$ucnA92AabB2VkGEYkbSvlubz6rFGSPt7t5ooVkuHRlPQnQaNrRsFO', 'TOK108', 'Y'),
	(121, 'Farel Irta Aryandi', '242510187', NULL, 'siswa', '$2y$12$U9JON/FCsS2JPB2mS8OrlOri/GacCpIodDMK5QIQcw.ddeehWjsou', 'TOK109', 'Y'),
	(122, 'Fatir Muhammad', '242510088', NULL, 'siswa', '$2y$12$mlbuhG/RZ5nere9mF77eIObrOI4H5Vdly79NpHjF82mDeqAL.zHtO', 'TOK110', 'Y'),
	(123, 'Fazri Apriyanto', '242510008', NULL, 'siswa', '$2y$12$f36om8ch4rOBBtyhGfoOf.eBkQWWqm8iyGQTILjRTnj2QnGYfCxX.', 'TOK111', 'Y'),
	(124, 'Febi Antonius', '242510089', NULL, 'siswa', '$2y$12$WR60Cz2qMROkLuiU.C0jQeRJy5LbOVRVK1k.CePSLBDgQphshNhPa', 'TOK112', 'Y'),
	(125, 'Fina', '242510119', NULL, 'siswa', '$2y$12$Mk/HWmMwc8MoarfQY9F7Y.hSIJ/bPeyvX59svuO3.RgbKnGHdraha', 'TOK113', 'Y'),
	(126, 'Furnama Widia Sari', '242510090', NULL, 'siswa', '$2y$12$1rMrhd.sHtEzBVtaNhgwEuMCSgIwYGI9UBodJE1sZERjbYy51nI1u', 'TOK114', 'Y'),
	(127, 'Ghaisani Najwa Alifah', '242510091', NULL, 'siswa', '$2y$12$z4y7MQn0ZFcWqHvFClbarO/kbVx78HDQ1yiFJ.monY0PdNlXxcsOS', 'TOK115', 'Y'),
	(128, 'Ghaza Fabian Alfariz', '242510188', NULL, 'siswa', '$2y$12$HsUOetfbtJMgBJhw/msSl.nse7CYU2s8yUWLPsVrPDNqN3RAKOPy.', 'TOK116', 'Y'),
	(129, 'Habib Iqhsan Muamala', '242510038', NULL, 'siswa', '$2y$12$NrLWnNt3SqfOt9MB7wF21O5q.DDo0sjX1R3DcqlyHvqrxwEHhBuEC', 'TOK117', 'Y'),
	(130, 'Hilyatul Aulia', '242510154', NULL, 'siswa', '$2y$12$sCpCygjIPMRWkMpl.6eXneFOK6s7i2UbP/UORy5yfaiXHdzXs3FSu', 'TOK118', 'Y'),
	(131, 'Ibnu', '242510092', NULL, 'siswa', '$2y$12$ez89Csf/Nfwf/SMXE3.gnOreVFRAjvrZWL4aTvQpofR2ye.ff4njC', 'TOK119', 'Y'),
	(132, 'Imam Ahmad Rosyidin', '242510093', NULL, 'siswa', '$2y$12$wQrzTZTESgQJ8go9fTVi4uJ3zWRhhU3lDkziIgY6NXji53eY5dHiO', 'TOK120', 'Y'),
	(133, 'Intan Mugniani', '242510189', NULL, 'siswa', '$2y$12$zaUcaDiplkkDobuaJA0BFOUynDPk.ARQHoNoS98JN/M4IbCX6tI9O', 'TOK121', 'Y'),
	(134, 'Ismi Cahyati Kurniawan', '242510120', NULL, 'siswa', '$2y$12$tFJJXVtZSutNDMNkmzTBTOH4dA259uHDa3dZRwTc7fLwzY.USJXCC', 'TOK122', 'Y'),
	(135, 'Jahra', '242510121', NULL, 'siswa', '$2y$12$ZO/EsA5cQHCPER/LWMlkIuQ4rGjFd5RdRPyu33DgTtJzMH38UAFYm', 'TOK123', 'Y'),
	(136, 'Jeams Dreco Rupiasa', '242510039', NULL, 'siswa', '$2y$12$165MC7rO/zVC7nUkdS72Q.AJgU4OaX64x2pHtivG6g5wulaghKNuq', 'TOK124', 'Y'),
	(137, 'Jelita Oktaviani', '242510155', NULL, 'siswa', '$2y$12$6GSNMZzZQ/OX..X9GMVmm.TwrvqFvq3GiQ2arebR2KhfIn3pfB5BK', 'TOK125', 'Y'),
	(138, 'Jesi Aulia Agustin', '242510190', NULL, 'siswa', '$2y$12$E8VOCK4hMOI9kYRk6mSps.d0sB7Zui1xdI43RObb2bjVTOywZeluG', 'TOK126', 'Y'),
	(139, 'Jesika Nursifa', '242510156', NULL, 'siswa', '$2y$12$ZcZUIn2Iw3t04cNT1ypvMOknSm2DsZBH.T3yjY.TGKBM93MVX9Cgq', 'TOK127', 'Y'),
	(140, 'Jhonatan Avryan', '242510009', NULL, 'siswa', '$2y$12$7nh7vjL4T/CXcokbP9Xg4.DH.zBiQKCSHD3LD52hlxlAD5Yqkymm2', 'TOK128', 'Y'),
	(141, 'Junia Khairunnisya', '242510191', NULL, 'siswa', '$2y$12$cCNLL1aQxHjQdxKsei4Su.cyAmdT5axCiWDVQbz2y6T9tlnO/Th0K', 'TOK129', 'Y'),
	(142, 'Karima', '242510192', NULL, 'siswa', '$2y$12$MtyekZjAQRSOM/sUDaZJG.32HtU6KBS4QNmXeBE7PwwVVV5BTuvlW', 'TOK130', 'Y'),
	(143, 'Keyara Putri', '242510157', NULL, 'siswa', '$2y$12$Jd2iZUiaLmtLJZSCf4s5uOPP4f3/P54h1Gm5tSKA5vV5dqBPeuQYK', 'TOK131', 'Y'),
	(144, 'Kheysia Rahmadani', '242510094', NULL, 'siswa', '$2y$12$F7B/0mBU1hfNZHVJTlHYrub3r6xGliqk/g/w66vtRs7MuASKZ9KBy', 'TOK132', 'Y'),
	(145, 'Khumairah Maulidiah', '242510122', NULL, 'siswa', '$2y$12$i.U1suhXPJ4Tc8WCgU4ixOb0mbly6t2X98FW.AQCOgHvz6f2kgZ6G', 'TOK133', 'Y'),
	(146, 'Laila Seftya Rahayu', '242510193', NULL, 'siswa', '$2y$12$34MGn.pM.A6xvLmUaLCXMe/uBjgvajMWD1AJUGJeU2egpEfQBL6vy', 'TOK134', 'Y'),
	(147, 'Lintang Rayya Samudra', '242510095', NULL, 'siswa', '$2y$12$M9/jiYSzotFheVfY6SzT0.RVN6vyJ.VA.XWV2.BaqcYKHzq4zS/tu', 'TOK135', 'Y'),
	(148, 'Lusiana', '242510123', NULL, 'siswa', '$2y$12$p9OCBxmqOra2ekweZAKjHeM1qieyLyGNk16tfmqIXhNUYn5ZV7uYK', 'TOK136', 'Y'),
	(149, 'M Khaidar Algifari', '242510158', NULL, 'siswa', '$2y$12$CDcpgCqL6J3s5emmPBAsMug.RcpGwdX2ZGUdHAQ/fMcnxfe5U72Iu', 'TOK137', 'Y'),
	(150, 'Marcellino Vivaldi', '242510159', NULL, 'siswa', '$2y$12$BzoywoffvI3rlcOuu66xkeVEn4I5b80kgxFnSu/zY4.DFgUgGJV5O', 'TOK138', 'Y'),
	(151, 'Mei Syila', '242510124', NULL, 'siswa', '$2y$12$SD3/dOcYFlrh3FDR6kUdaOx2krvDsfKKsi0DiTIKsBnzJzwbyl6wG', 'TOK139', 'Y'),
	(152, 'Miftah Febriansyah', '242510010', NULL, 'siswa', '$2y$12$5Q2WZMA3oz1u5uS9MywRKu8uu8Yo8UgJtGgf2F0d4FxdkYFf56RWm', 'TOK140', 'Y'),
	(153, 'Millanda Fransisca Gunawan', '242510194', NULL, 'siswa', '$2y$12$Omuo5O/eBBm50fUhvpjTveU4xU/wZ2RFDI5dn7XsxVYDcRZRsymWS', 'TOK141', 'Y'),
	(154, 'Mita Fitria', '242510125', NULL, 'siswa', '$2y$12$TndKpFXakvyUx39bMHzSz.9S9EkWv3G52KurwjGDI4f9JSKeF0cz2', 'TOK142', 'Y'),
	(155, 'Mohamad Reja', '242510011', NULL, 'siswa', '$2y$12$XdOohqpmIj/NkcZmy6obh.1aXf9R5Yn4CJB.MhzYZHuCAJpZhk/6e', 'TOK143', 'Y'),
	(156, 'Mohammad Rifa Aditya', '242510012', NULL, 'siswa', '$2y$12$USIB/M3L4PLtS4yIybIfNOJyl0H7hnK2M50JKCsZiaC4jWpXjGlHq', 'TOK144', 'Y'),
	(157, 'Muhamad Abdul Gofur', '242510040', NULL, 'siswa', '$2y$12$gjWaZCDNCSeAzTBiJkkVxeB9zmMH44IQGgsP8nHVmvEIDx9LuQoKK', 'TOK145', 'Y'),
	(158, 'Muhamad Chairiel Ariyansyah', '242510013', NULL, 'siswa', '$2y$12$vuPJNkIHaF.MVNIUc5fQBOCbQBUXt8xgOArnPYsnKsGG2qtK56iy2', 'TOK146', 'Y'),
	(159, 'Muhamad Fachry', '242510096', NULL, 'siswa', '$2y$12$PRPESJdAhbfwUOFmBByN5eW2LunHPYdDdK9wRnnAhXvIL6Tmy3k4.', 'TOK147', 'Y'),
	(160, 'Muhamad Faiz Ramadhan', '242510041', NULL, 'siswa', '$2y$12$urzuegpN2eCPcTDW.5ZMRu0B4wkQdvbGDTEoeVGu7RQ4lUvP/jiNa', 'TOK148', 'Y'),
	(161, 'Muhamad Kharis Prama Maheswara', '242510014', NULL, 'siswa', '$2y$12$a9AJ2geZE/wwbhVtTFtJ3uMFFNzdIiJM4c9GTz0fLwoPP63uBVqTO', 'TOK149', 'Y'),
	(162, 'Muhamad Raffi Al Hafidz', '242510042', NULL, 'siswa', '$2y$12$QD6BMaxL.ibsrhYlLA5ZSeyrPE76lI0Wc.ZJ99xeIMhklt2o4YPv.', 'TOK150', 'Y'),
	(163, 'Muhamad Rafli Awaludin', '242510126', NULL, 'siswa', '$2y$12$DxNfHXTp5xhgM/Yf.g0.WOOaQcrV5nFu7Diw8BRO7WGGUcJRp.pmW', 'TOK151', 'Y'),
	(164, 'Muhamad Raga Restu', '242510160', NULL, 'siswa', '$2y$12$FteYpETAdeCA.HTavfu/ru6MhJt1r31J2F5NEENgC1FvwRdMrpfvm', 'TOK152', 'Y'),
	(165, 'Muhamad Rasya Prasetyo', '242510097', NULL, 'siswa', '$2y$12$W3iQL8kxZXQwEH3aaloC5urgmHFKUqZPNZX5XdrwM0mVJiQZAgNZu', 'TOK153', 'Y'),
	(166, 'Muhamad Refan Ivandi', '242510195', NULL, 'siswa', '$2y$12$a2k2akhnOBz5GkNQLWjXE.SdBhYkIhvJMMdI3n5g2Cp5bVNEXhg4a', 'TOK154', 'Y'),
	(167, 'Muhamad Reyhan Al Fatir', '242510015', NULL, 'siswa', '$2y$12$XtI6KGCWDnGIZXDi331Y2egLarMpu.u3Jhg5Ebsnw4zbD4FUDaUgy', 'TOK155', 'Y'),
	(168, 'Muhamad Riski Dwi Gunawan', '242510127', NULL, 'siswa', '$2y$12$Geumx.jo9GOaqgIX2/TqIOV165P42aKojclbaYYYRx1Cez0YLLU2e', 'TOK156', 'Y'),
	(169, 'Muhamad Rizki', '242510161', NULL, 'siswa', '$2y$12$qAkgby4bKMZ4SJrhcsCgKOj4IpOBnFl8Ui7dc7psZ7p77.O51VC/6', 'TOK157', 'Y'),
	(170, 'Muhammad Adly Septi', '242510196', NULL, 'siswa', '$2y$12$IU7gX1wkA/efPENSADni.e.poW1qOwkheb1v4ju.XResZPMIhR5kS', 'TOK158', 'Y'),
	(171, 'Muhammad Akmal Fachrudin', '242510043', NULL, 'siswa', '$2y$12$REkiIFo3383tC4845K7J9e7aZxZ/OcURPAao9Kv9pandC1wspBIu6', 'TOK159', 'Y'),
	(172, 'Muhammad Alif Adiputra', '242510128', NULL, 'siswa', '$2y$12$y3uXXVDBVLS4Yt.0gJGH1.7LdqYWsf6YjXDafPih93BQwf0wnzeq6', 'TOK160', 'Y'),
	(173, 'Muhammad Fachri', '242510016', NULL, 'siswa', '$2y$12$jYra42hfLGrIfBnb7cJnr.6OCIvUYJKTc4G/lR0Fi20LrWEKjlole', 'TOK161', 'Y'),
	(174, 'Muhammad Jibillah Nur Abdillah', '242510098', NULL, 'siswa', '$2y$12$lm15tGIht9hPGqY1mPC4aOplA36A7HldbPD1Jh0KEyDTLJ3xoCife', 'TOK162', 'Y'),
	(175, 'Muhammad Qadafi Maliki Khalik', '242510197', NULL, 'siswa', '$2y$12$E1UnNJF9grGxDPxyMz8f2.PtsN1A/bBuMQg40J6S5ygkIYbgYyAP6', 'TOK163', 'Y'),
	(176, 'Mutia Putri Ramadani', '242510162', NULL, 'siswa', '$2y$12$XZ4ybGGsDEt9f5P.FZC28.GQTQT2AePGsb4Vzk.1TVfIi0e0NZ9iG', 'TOK164', 'Y'),
	(177, 'Mutiara Azzahra', '242510198', NULL, 'siswa', '$2y$12$12pOHHuCsoUMN8a9ybCY7.3B8HLFWq8fFuu1esbLosaijviIv9Hhm', 'TOK165', 'Y'),
	(178, 'Nahdan Antasena Rusdi', '242510017', NULL, 'siswa', '$2y$12$fTnifS/boChlIMejkqvugeLhZKtQGETWvp28Bqinwg6c1HOmzFpe2', 'TOK166', 'Y'),
	(179, 'Najwa Juliani', '242510199', NULL, 'siswa', '$2y$12$4h34K96SbJ6pJGmh9m/TM..vLynWsCrwCxCrP7scg5H4eApAaxlXO', 'TOK167', 'Y'),
	(180, 'Nayla Dinda Arifin', '242510099', NULL, 'siswa', '$2y$12$GJGZDaSaqmw7QCyPaWO0ZOCd59NAtrRhOrPTWatgpo0T46ubiyE7O', 'TOK168', 'Y'),
	(181, 'Naysila Dwi Novita', '242510129', NULL, 'siswa', '$2y$12$qGThMTaOxSZ2gqAtSr.n7.jhRY3XvpeLshWSm3M8pl8O4DFcQ4L6W', 'TOK169', 'Y'),
	(182, 'Naysila Insani', '242510163', NULL, 'siswa', '$2y$12$MzEsOruN6HJQ/uAt06wOre3NCVrkT8/5UFtUb/J1PNo0rpvHk57py', 'TOK170', 'Y'),
	(183, 'Nazhira Lulu Aulia', '242510200', NULL, 'siswa', '$2y$12$2RjrqtNYnMR7k8ORXnWvtOBdvZoVrRR0S53qiYgrnsXE.hqzkV9ba', 'TOK171', 'Y'),
	(184, 'Nazwa Nur Aprilia Setiawan', '242510130', NULL, 'siswa', '$2y$12$SHB9b5isIUA3ePQOZioKUOHISWe3hIeVbQNGZ1htz3n1m/AtZJPtK', 'TOK172', 'Y'),
	(185, 'Nazwa Safitri', '242510201', NULL, 'siswa', '$2y$12$97p6x2d0pHSdiQUWJ3RS0uSyhvmRwex6UEQQuRKSXSaduZk0sIr3a', 'TOK173', 'Y'),
	(186, 'Nazwa Zahra Aulia', '242510164', NULL, 'siswa', '$2y$12$RpwTfSOdo63Mt.a8KP33e.eDAuk6hCkx6pgayhPyXIwylP5QviWL.', 'TOK174', 'Y'),
	(187, 'Nesa', '242510131', NULL, 'siswa', '$2y$12$3aDQOPb6GertmY2CAIXv3eU.OhZrigZ59A0WLZqpNZIgfXdDG3dXO', 'TOK175', 'Y'),
	(188, 'Nia Ramaidah', '242510165', NULL, 'siswa', '$2y$12$/Ev5AqvV7ic/LK7/Tqlt2OqzcKWrbBQJ6f0uAzkeRiDVbGipY3ngi', 'TOK176', 'Y'),
	(189, 'Nindi Putri', '242510018', NULL, 'siswa', '$2y$12$mHbooiI3xShinYKRZReqweYff5M7tVHgH/xJVfd25sMIgSRkVw3qu', 'TOK177', 'Y'),
	(190, 'Novita Riana Rahmania', '242510132', NULL, 'siswa', '$2y$12$ldCCvZQbTZ57ZtAS.QprueiiF6J6X3b62Y/P6SzwDJJIxxM4hUoCG', 'TOK178', 'Y'),
	(191, 'Nurhadi', '242510044', NULL, 'siswa', '$2y$12$k94L8R6agpBuQ1WZk4uO0u0lC/lGSiGdiICk4RDXa/Kb6MkqZQlFq', 'TOK179', 'Y'),
	(192, 'Nurhayati', '242510045', NULL, 'siswa', '$2y$12$TYVpNilX9IgPcr10UbWPOOuumVUr0eDavi1/j7zLpduNHBdQcIKgi', 'TOK180', 'Y'),
	(193, 'Nursaila', '242510166', NULL, 'siswa', '$2y$12$qNO/ywoKmXwvXIwWaBqQBu.wYJLMWRhKXJ9Iagr0j07Zvw5mLYZ3q', 'TOK181', 'Y'),
	(194, 'Puspita Sari', '242510202', NULL, 'siswa', '$2y$12$0GcUSBoHU6nEghNrgIs6zObRHyZipwEmwK9iCjgfLA8mxTE/Xqzbq', 'TOK182', 'Y'),
	(195, 'Putri Aulia', '242510133', NULL, 'siswa', '$2y$12$A7AP.9IcpAO5re.4VBbDseJNGadmQ46u1zIudUT09TXQW74DNW7J.', 'TOK183', 'Y'),
	(196, 'Putri Fadilah Oktaviani', '242510019', NULL, 'siswa', '$2y$12$gxncwXj8.zC3HVCxAkU1tuxtJz2K/z1UB6vUrzuZqEkO23j6fDTSO', 'TOK184', 'Y'),
	(197, 'Qushay Abdhillah', '242510046', NULL, 'siswa', '$2y$12$PyzP3Wp8kFdTx.12nZJUf.ZXYNh.GvU4UREZx/u7sGaH58N08oTc6', 'TOK185', 'Y'),
	(198, 'Rachel Listi Aghista', '242510167', NULL, 'siswa', '$2y$12$4ICGNPhFRsdlyPK3cKocy.8NBwHX1qJErXDBxLHkcTF09Prb2rDuK', 'TOK186', 'Y'),
	(199, 'Raden Muhammad Nijar Anugrah', '242510134', NULL, 'siswa', '$2y$12$CQfKkHO3XP.TyNVP1nOipuU6VRq6yE8DjUeXx9CyLTnLhI6nFWQM2', 'TOK187', 'Y'),
	(200, 'Rafi Aufa', '242510168', NULL, 'siswa', '$2y$12$LXIrV1HyDdtYDTr4xE0hgOpa4.NwNiM35i3njH2FqSVEzHTRK4L2G', 'TOK188', 'Y'),
	(201, 'Rafly Oktavian', '242510020', NULL, 'siswa', '$2y$12$Jct7Q1E7tiAiHbtS8lldcume0wlKbOQGonRizaAsx6ty3IBmCTOVK', 'TOK189', 'Y'),
	(202, 'Rahma Khaerunisa', '242510135', NULL, 'siswa', '$2y$12$/6ZSCo1TFUwmc2XHAcDqE.mx3KsT.7HDhJ88WVK93Uy3tqlJ28spC', 'TOK190', 'Y'),
	(203, 'Rani Rusliani', '242510100', NULL, 'siswa', '$2y$12$WgKWd96ru2slU4ldjefKDuUHvUChenrgr.SkIYsJPu6/AmJnfaLW2', 'TOK191', 'Y'),
	(204, 'Reni Anggraeni', '242510203', NULL, 'siswa', '$2y$12$VRq77AAhuo31vSY1ku5SQOc4XCBmGhN1b4p44OxOBcOx2G9.PqYwi', 'TOK192', 'Y'),
	(205, 'Renita Bela', '242510169', NULL, 'siswa', '$2y$12$TcZ0dtriVdMZDkl.7xGtMutdJzn7MAlqPMDk64bUl9WNeGKwaA6se', 'TOK193', 'Y'),
	(206, 'Reno', '242510204', NULL, 'siswa', '$2y$12$r27Efj63vkNj7hm811CA5uJI.pDt8onc1xxMF9gSKbSZoFqzEKO.C', 'TOK194', 'Y'),
	(207, 'Ridho Nurul Fa izin', '242510047', NULL, 'siswa', '$2y$12$6vP5NsKolBqPxjj8335ecuA4OiE9/VQR5Ha69/tZU5m4IMx2gamDi', 'TOK195', 'Y'),
	(208, 'Rifqi Ilham Maulana', '242510021', NULL, 'siswa', '$2y$12$bIiDZKFQcN5nuMHItKXcLuIq2Kmp3CRgqX5zzab6mjK8lEAHUvYk2', 'TOK196', 'Y'),
	(209, 'Rijal Baedillah Saputra', '242510136', NULL, 'siswa', '$2y$12$MT2fqwaraDw49Tx/YXPN9uHv3RJCSf55eKAIPAMG/Dgj3WvVIEBpW', 'TOK197', 'Y'),
	(210, 'Rina Amelia Nurinjani', '242510137', NULL, 'siswa', '$2y$12$VfgoGIb9lODsTLwB.bemqu/73JPFeqNs/5tQQJmidFm2/r9fm1oUi', 'TOK198', 'Y'),
	(211, 'Ripaldi', '242510022', NULL, 'siswa', '$2y$12$UvFxctIO5orwF.URICdpg.jD1u6jNKylXUpGrBZpjuzKzFklpVpbC', 'TOK199', 'Y'),
	(212, 'Riyadhatul Gilang Adriyanto', '242510048', NULL, 'siswa', '$2y$12$CnRdMObJLel1zhIyzWl9kOtZpFsyWa9sr9AP74zpH2fbbDsRfYYg2', 'TOK200', 'Y'),
	(213, 'Rizki Al Jabbar', '242510023', NULL, 'siswa', '$2y$12$SMtf9OXpZkUOVJJP8GfED.T9VMgiOO9L.vwHtHPojNEYRM/jujKXK', 'TOK201', 'Y'),
	(214, 'Rizki Al Qodri Ginting', '242510049', NULL, 'siswa', '$2y$12$i97biVAxz0r.EG7maI2H6.T51MLBrv7y0GRiUSSt21hCIKmahbt02', 'TOK202', 'Y'),
	(215, 'Rizky', '242510050', NULL, 'siswa', '$2y$12$FHXz5VA2jK6D.Z4qgCKH/uj79pyFPvuu9V/5jjXny0oQQpBt8uRzu', 'TOK203', 'Y'),
	(216, 'Rizky Ramadhan', '242510101', NULL, 'siswa', '$2y$12$FBCWC9LTVZfkrygDIDEuOOSL74h3xahY67KALMAuUtrBEiQtqupvm', 'TOK204', 'Y'),
	(217, 'Robiatul Kamila', '242510170', NULL, 'siswa', '$2y$12$Uqq72aocyZpE9qRQNWmxZeiUXKpFRML8mw5rlpUXk7adZAGrlPgcu', 'TOK205', 'Y'),
	(218, 'Rodiawati', '242510205', NULL, 'siswa', '$2y$12$wHDo8G9ETrRGk8shfuFlMO00G0Qhkad.CyK0ApC2QQrAn0Fn.iiBy', 'TOK206', 'Y'),
	(219, 'Roihan Akmal Baihaki', '242510206', NULL, 'siswa', '$2y$12$8cqANPqYpnhBO149LXtWbOS79jStN1yD/HXNlKmgIvDpMXO392Dbi', 'TOK207', 'Y'),
	(220, 'Rosa Anggraeni', '242510171', NULL, 'siswa', '$2y$12$o7Yhs74/G0RCcgyGZA4.DeAXNdTMA16YWJZs.dfMc7tgqmotiyEfe', 'TOK208', 'Y'),
	(221, 'Sabria Widi Mulia', '242510138', NULL, 'siswa', '$2y$12$5SAAG6ucSHzZONIYLApEceibefNJ6kMZVoobt0leqr2.Lg8RtMmJO', 'TOK209', 'Y'),
	(222, 'Safa Aulia Ardianti', '242510207', NULL, 'siswa', '$2y$12$LVwK5EYdHuUOVU8YL.WJ8uTHT.CMLa.WLQupjgwZfU5Pz88EKiZ0G', 'TOK210', 'Y'),
	(223, 'SAHIDIN BACHRI', '242510214', NULL, 'siswa', '$2y$12$SUojfWV17hE1YeXaKwZhV.7Rw.1HK2gH7/f6s8P2tAM2ELCOf0nYG', 'TOK211', 'Y'),
	(224, 'Sahrul Pauzi', '242510051', NULL, 'siswa', '$2y$12$pHM7Wp0DxfAP0MBjx5H78OHQkJAE5pJsxt.zGfj35zqBRU80iX.ba', 'TOK212', 'Y'),
	(225, 'Salsabila Nur Aprilia Rohadi', '242510172', NULL, 'siswa', '$2y$12$gnksN0QJ9CaJmBof536M0.jr4yhB4h2bWrxpLu1RkxQXG.ZJO0KfO', 'TOK213', 'Y'),
	(226, 'Satria Gunawan', '242510024', NULL, 'siswa', '$2y$12$HmL4ZcbJjTM2999PB96P5ukSueUz7Bpqh4WMY/mN8NqO2YJMwNJVC', 'TOK214', 'Y'),
	(227, 'Satrio', '242510025', NULL, 'siswa', '$2y$12$kS9cs1cvVG6UNa5MDdBJjuNtyax6tV28AM/c0aGZskYlp.m1l4ItC', 'TOK215', 'Y'),
	(228, 'Septia Ramadiyanti', '242510208', NULL, 'siswa', '$2y$12$nzquhxJ249NW.cRkYbG0VOX1eu3cJFxiwsBort.XyRXB4lVttKVG.', 'TOK216', 'Y'),
	(229, 'Shabrina Muthia Mafaza', '242510102', NULL, 'siswa', '$2y$12$7L3CRhBOUrHf1fE32Um8vurFlo7LrNLzJaUEKYPb/FirSaBUOLFaC', 'TOK217', 'Y'),
	(230, 'Shereen Naurah Salsabila', '242510052', NULL, 'siswa', '$2y$12$iS86MVHMQAAt7yqJ79ZiZOQrJaqdQ3UYeZA67M/X6wug.uoBydh5W', 'TOK218', 'Y'),
	(231, 'Sinseza Ria Wijaya', '242510139', NULL, 'siswa', '$2y$12$i9zoC4Wv9H9jr2fENj4THuLsw6vi26CTXa8ugcTrTp0AIUnuxS6Oq', 'TOK219', 'Y'),
	(232, 'Sinta', '242510173', NULL, 'siswa', '$2y$12$3uTRR/MCc7gmugVRIM595u8n2rh/a/m/IqnfGqxXFG01fnJ3zSPtS', 'TOK220', 'Y'),
	(233, 'Siti Laela Sari', '242510174', NULL, 'siswa', '$2y$12$DlwD170Ieovd6OIXGE6bK.Kqg8lmCZXJ6AzoET6qkE1EyadGQ.L/G', 'TOK221', 'Y'),
	(234, 'Siti Nurlaeny', '242510209', NULL, 'siswa', '$2y$12$GAS3x5tCmfAAPnSWFqcMXuFxugB0b07/ntzloY5wpshIV/zv1YaLK', 'TOK222', 'Y'),
	(235, 'Siti Rayhana Zahra Qolbi', '242510140', NULL, 'siswa', '$2y$12$pBSF4ppimB8qFWArRNtLkeDVS9dnViYOpFbYcFuKx3XiloFTTCcqu', 'TOK223', 'Y'),
	(236, 'Soffy Dwi Agustin', '242510103', NULL, 'siswa', '$2y$12$W7uo8dEytdaHqUubS6Go7eccunCG4ZTCxhkPdUEMpp0NwX/96HFbq', 'TOK224', 'Y'),
	(237, 'Sukses Mulya Saputra', '242510104', NULL, 'siswa', '$2y$12$O0bRojNzAFXYERFa.tTaHugCesRKdOP.mPVE9ay3Q7uwCB8R.B/Xq', 'TOK225', 'Y'),
	(238, 'Sunita Agustiarini Putri', '242510210', NULL, 'siswa', '$2y$12$O7Uf/c/xxjNn.37W/WMKFeHz4eT99BaV2NFDC97z1OftalBCcEE4.', 'TOK226', 'Y'),
	(239, 'Tasya Firmansyah', '242510175', NULL, 'siswa', '$2y$12$lWZP.hDXddYowTmDJ5Xa5ubls4Pk0IPo8/ivUsA3UArr4LQWZLXvm', 'TOK227', 'Y'),
	(240, 'Tasya Utami Dewi', '242510105', NULL, 'siswa', '$2y$12$2UR7Vp6QHumqdgAopvt2guMZOGP/c/DzMD10PehUtjKOt9NEo7cZC', 'TOK228', 'Y'),
	(241, 'Tegar Albi Frahesa', '242510211', NULL, 'siswa', '$2y$12$mEJ22E3brXwn9HBRckVqYuUYC4mKB81ZvLihTwf3FBYKnazvUw38W', 'TOK229', 'Y'),
	(242, 'Tiara Putri Chaerunnisa', '242510141', NULL, 'siswa', '$2y$12$RS.v1VHLwEcSbJ0LVWRA1ugEaCeukRmBbxyE.9cowN6ptj7pRrv1S', 'TOK230', 'Y'),
	(243, 'Tiara Wulandari', '242510212', NULL, 'siswa', '$2y$12$HSA6jBYcDlTa0fPv8u5yreiGnMw9FQP5gSKY4IRpjBgzWoDhWMHwK', 'TOK231', 'Y'),
	(244, 'Ulan Nainda Suci Diani', '242510176', NULL, 'siswa', '$2y$12$U4Rqx8xtVMWiYLP1VHC6R.6S0Dxxpaoo0njGNEtYDjaxUO7rLk69a', 'TOK232', 'Y'),
	(245, 'Vanesya Martin', '242510177', NULL, 'siswa', '$2y$12$HhyDSX92QbF9vFoEPT4FB.mSQrvhkNWVPJmr.jYdGJA6FlifYTw5G', 'TOK233', 'Y'),
	(246, 'Vatsan Wira Yuda Khadofa', '242510026', NULL, 'siswa', '$2y$12$vGMG/tQVVpNiKCaEUnzIVuaRi.3TKg2X1vcRYTN2IKMIN24l1tNBy', 'TOK234', 'Y'),
	(247, 'Vino Aldiyansyah', '242510213', NULL, 'siswa', '$2y$12$00wQjl3LhaiN4XBYDjmo4OSbzF9eq/TtvUKR2PTdo8Cl/1buJR9A6', 'TOK235', 'Y'),
	(248, 'Vino Erdiansyah', '242510178', NULL, 'siswa', '$2y$12$FNxKTzeq6KKJW3HnOxGYJOL5mdDdpIB75oII9IOqNXiZzv9EKwbNC', 'TOK236', 'Y'),
	(249, 'Yuda Pratama', '242510106', NULL, 'siswa', '$2y$12$jUJO2nmd8yVDfHwSFHeg3uXXzFzMCi3mHA5sBh1slf96jAXodKOoG', 'TOK237', 'Y'),
	(250, 'Yudha Firmansyah', '242510027', NULL, 'siswa', '$2y$12$hh9obhp0KTAhU3EvHRAxDOqgsFlEbYK4q205oz/sni3pjm2CnAZEK', 'TOK238', 'Y'),
	(251, 'Yudi', '242510053', NULL, 'siswa', '$2y$12$SjHZtCOR.NJlxzRfowNOneyU7HHmHENEyUyS.Pmy73otDcUWVa3NO', 'TOK239', 'Y'),
	(252, 'Zahira Adzka Alifa', '242510142', NULL, 'siswa', '$2y$12$qHSjYDFbIeO4MrjeYsNyDOWSmy8rX/c/pPjuinBBjrLYmK1V.RjPG', 'TOK240', 'Y'),
	(253, 'Zihan Aulia', '242510054', NULL, 'siswa', '$2y$12$3USVjyiWXLXtnKo3a7th5.l3rG10jgnQQ/zdjrHyGbfN9GszQbn8W', 'TOK241', 'Y');

-- membuang struktur untuk table db_vote1.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.password_reset_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table db_vote1.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.personal_access_tokens: ~0 rows (lebih kurang)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\UserModel', 13, 'auth_token', '3ceb6753ca1ef7613b9b9b98bc695e18e9286918b9f18619e1542ebae41a0b64', '["*"]', '2026-05-04 03:53:20', NULL, '2026-05-04 03:00:14', '2026-05-04 03:53:20');

-- membuang struktur untuk table db_vote1.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.sessions: ~5 rows (lebih kurang)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('6COOVJ38el1XQdKV9zgzEGXkh1znTxbzmCwsxPCS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'eyJfZmxhc2giOnsibmV3IjpbXSwib2xkIjpbXX0sInBhc3N3b3JkX2hhc2hfd2ViIjoiZmRjYTk1YTAyYWMxNjY5ZGJjNjBkNmZiYTA3ZTE5MDU1MTRlNzdlNTA2YjdmNWNjMzA1YzMxMzkwYzQ2MWZlMyIsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYWRtaW5cL2d1cnUiLCJyb3V0ZSI6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5ndXJ1LmluZGV4In0sIl90b2tlbiI6InA3RmdVNzZQWVpwbVV2dURpZUhXZWJ5TGM2YWNSTGsySVh1SUJ4RkgiLCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MSwidGFibGVzIjp7ImM1NWI2NzUzN2U5YjU5ZGY4YzU2ZjI3M2U0ZTExOGM4X2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibmFtYV9ndXJ1IiwibGFiZWwiOiJOYW1hIGd1cnUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibnB3cCIsImxhYmVsIjoiTnB3cCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJub190ZWxlcGhvbmUiLCJsYWJlbCI6Ik5vIHRlbGVwaG9uZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJlbWFpbCIsImxhYmVsIjoiRW1haWwgYWRkcmVzcyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJqZW5pc19rZWxhbWluIiwibGFiZWwiOiJKZW5pcyBrZWxhbWluIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlzX2FjdGl2ZSIsImxhYmVsIjoiSXMgYWN0aXZlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dfX0=', 1778547362),
	('h5yrSLriRuvrIaV7bgLzfZyDINDh73RrDX8cQNWS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiI2SEV2T0hqREtSUnZrWWFJbE15NTl0bVgwSzB0NzJneXlRZ0VKMmp2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pbiIsInJvdXRlIjoiZmlsYW1lbnQuYWRtaW4ucGFnZXMuZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiZmRjYTk1YTAyYWMxNjY5ZGJjNjBkNmZiYTA3ZTE5MDU1MTRlNzdlNTA2YjdmNWNjMzA1YzMxMzkwYzQ2MWZlMyJ9', 1778547365),
	('LmNodIiaUiTHQqtR5pgH3EAbZfExoZ3bntYbQj2u', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ6VWNBWWZ3eVkxNzFJeEVwallpZVVvODYwc2IwY0NnZXNJMlhuYVo5IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC92b3RlLWRhdGEiLCJyb3V0ZSI6ImdlbmVyYXRlZDo6clBJaUswTXdibzh2c2xWdiJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxLCJwYXNzd29yZF9oYXNoX3dlYiI6ImZkY2E5NWEwMmFjMTY2OWRiYzYwZDZmYmEwN2UxOTA1NTE0ZTc3ZTUwNmI3ZjVjYzMwNWMzMTM5MGM0NjFmZTMiLCJ0YWJsZXMiOnsiYzU1YjY3NTM3ZTliNTlkZjhjNTZmMjczZTRlMTE4YzhfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJuYW1hX2d1cnUiLCJsYWJlbCI6Ik5hbWEgZ3VydSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJucHdwIiwibGFiZWwiOiJOcHdwIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im5vX3RlbGVwaG9uZSIsImxhYmVsIjoiTm8gdGVsZXBob25lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImVtYWlsIiwibGFiZWwiOiJFbWFpbCBhZGRyZXNzIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImplbmlzX2tlbGFtaW4iLCJsYWJlbCI6IkplbmlzIGtlbGFtaW4iLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaXNfYWN0aXZlIiwibGFiZWwiOiJJcyBhY3RpdmUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sIjNhMDAyMTZjOWY2OGQxNDc0MTI2ZTQ1YmNlNTk4NmMxX2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibmlwZF9rZXR1YSIsImxhYmVsIjoiTmlwZCBrZXR1YSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJuaXBkX3dha2lsIiwibGFiZWwiOiJOaXBkIHdha2lsIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlkX29yZ2FuaXNhc2kiLCJsYWJlbCI6IklkIG9yZ2FuaXNhc2kiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaWRfdGFodW5fYWphcmFuIiwibGFiZWwiOiJJZCB0YWh1biBhamFyYW4iLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiZm90byIsImxhYmVsIjoiRm90byIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJub21lcl91cnV0IiwibGFiZWwiOiJOb21lciB1cnV0IiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlzX2FjdGl2ZSIsImxhYmVsIjoiSXMgYWN0aXZlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dLCI2Nzk5N2QxNWQ0M2ZlZTM4NTQ3NzU4YjFiZTU3MGNiNl9jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlkIiwibGFiZWwiOiJJRCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJuYW1hX3Npc3dhIiwibGFiZWwiOiJOYW1hIHNpc3dhIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im5pcGQiLCJsYWJlbCI6Ik5pcGQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibm9tb3JfdGVsZWZvbiIsImxhYmVsIjoiTm9tb3IgdGVsZWZvbiIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJhbGFtYXQiLCJsYWJlbCI6IkFsYW1hdCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJlbWFpbCIsImxhYmVsIjoiRW1haWwgYWRkcmVzcyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJqZW5pc19rZWxhbWluIiwibGFiZWwiOiJKZW5pcyBrZWxhbWluIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImtlbGFzIiwibGFiZWwiOiJLZWxhcyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJqdXJ1c2FuIiwibGFiZWwiOiJKdXJ1c2FuIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlzX2FjdGl2ZSIsImxhYmVsIjoiSXMgYWN0aXZlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dLCIwN2M4YjIzODEyMjQ3MzQzM2JiZTljNzQ1OThhMDcxN19jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImlkX3RhaHVuX2FqYXIiLCJsYWJlbCI6IklkIHRhaHVuIGFqYXIiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoidGFodW5fYWphciIsImxhYmVsIjoiVGFodW4gYWphciIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJkZXNrcmlwc2kiLCJsYWJlbCI6IkRlc2tyaXBzaSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJpc19hY3RpdmUiLCJsYWJlbCI6IklzIGFjdGl2ZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9XSwiMWZhNGU3MmQ1MTVlNjYxMTE3ZTMzZGQyMWI5ZThhYTBfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJpZF91c2VyIiwibGFiZWwiOiJJZCB1c2VyIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im5hbWEiLCJsYWJlbCI6Ik5hbWEiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibmlwZCIsImxhYmVsIjoiTmlwZCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJucHdwIiwibGFiZWwiOiJOcHdwIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InJvbGUiLCJsYWJlbCI6IlJvbGUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaXNfYWN0aXZlIiwibGFiZWwiOiJJcyBhY3RpdmUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sIjFmYTRlNzJkNTE1ZTY2MTExN2UzM2RkMjFiOWU4YWEwX3Blcl9wYWdlIjoiNTAifSwiZmlsYW1lbnQiOltdfQ==', 1778551954),
	('VSG1Xsnvuo65FrPeyto0zerbQek09tF5IZIe0rQH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJoM0VUOUY2ZHRhZTI1Z1RyT0ZjamxNd2h6ampWZWxWVHZGTVc5T3lzIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1778547362),
	('wEsCXoNt3g7Vvfzb1m9VE9MESLsMWcRvvEIctciV', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJGZW5iM201VHlLU2t4clExaVpNNWtaclNOQ2k5ZTRKNjRGNlIxWjNBIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiZmRjYTk1YTAyYWMxNjY5ZGJjNjBkNmZiYTA3ZTE5MDU1MTRlNzdlNTA2YjdmNWNjMzA1YzMxMzkwYzQ2MWZlMyIsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYWRtaW4iLCJyb3V0ZSI6ImZpbGFtZW50LmFkbWluLnBhZ2VzLmRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1778546016);

-- membuang struktur untuk procedure db_vote1.sp_check_vote_all
DELIMITER //
CREATE PROCEDURE `sp_check_vote_all`(
	IN `p_nipd` VARCHAR(20),
	IN `p_npwp` VARCHAR(20)
)
BEGIN
	SELECT COUNT(tv.id_vote) AS total
    FROM trs_vote tv
    JOIN m_kandidat mk ON tv.id_kandidat = mk.id_kandidat
    JOIN m_organisasi mo ON mk.id_organisasi = mo.id_organisasi
    WHERE (tv.nipd = p_nipd OR tv.npwp = p_npwp);
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_check_vote_mpk
DELIMITER //
CREATE PROCEDURE `sp_check_vote_mpk`(
	IN `p_nipd` VARCHAR(20),
	IN `p_npwp` VARCHAR(20)
)
BEGIN
	SELECT COUNT(tv.id_vote) AS total
    FROM trs_vote tv
    JOIN m_kandidat mk ON tv.id_kandidat = mk.id_kandidat
    JOIN m_organisasi mo ON mk.id_organisasi = mo.id_organisasi
    WHERE (tv.nipd = p_nipd OR tv.npwp = p_npwp)
      AND mo.nama_organisasi = 'MPK';
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_check_vote_osis
DELIMITER //
CREATE PROCEDURE `sp_check_vote_osis`(
	IN `p_nipd` VARCHAR(20),
	IN `p_npwp` VARCHAR(20)
)
BEGIN
    SELECT COUNT(tv.id_vote) AS total
    FROM trs_vote tv
    JOIN m_kandidat mk ON tv.id_kandidat = mk.id_kandidat
    JOIN m_organisasi mo ON mk.id_organisasi = mo.id_organisasi
    WHERE (tv.nipd = p_nipd
       OR tv.npwp = p_npwp)
       AND mo.nama_organisasi = 'OSIS';
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_delete_guru
DELIMITER //
CREATE PROCEDURE `sp_delete_guru`(
    IN p_id_guru INT(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM m_guru WHERE id_guru = p_id_guru) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data guru tidak ditemukan.';
    END IF;

    IF EXISTS (SELECT 1 FROM m_guru WHERE id_guru = p_id_guru AND is_active = 'Y') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus guru yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;

    DELETE FROM m_guru WHERE id_guru = p_id_guru;

    COMMIT;

    SELECT 'Delete berhasil' AS status, p_id_guru AS id_guru;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_delete_kandidat
DELIMITER //
CREATE PROCEDURE `sp_delete_kandidat`(
	IN `p_id_kandidat` INT(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM m_kandidat WHERE id_kandidat = p_id_kandidat) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data kandidat tidak ditemukan.';
    END IF;

    -- Validasi: kandidat aktif tidak bisa langsung dihapus
    IF EXISTS (SELECT 1 FROM m_kandidat WHERE id_kandidat = p_id_kandidat AND is_active = 'Y') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus kandidat yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;

    DELETE FROM m_kandidat WHERE id_kandidat = p_id_kandidat;

    COMMIT;

    SELECT 'Delete berhasil' AS status, p_id_kandidat AS id_kandidat;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_delete_organisasi
DELIMITER //
CREATE PROCEDURE `sp_delete_organisasi`(
    IN p_id_organisasi INT(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Validasi: data harus ada
    IF NOT EXISTS (SELECT 1 FROM m_organisasi WHERE id_organisasi = p_id_organisasi) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data organisasi tidak ditemukan.';
    END IF;

    -- Validasi: organisasi aktif tidak bisa langsung dihapus
    IF EXISTS (
        SELECT 1 FROM m_organisasi
        WHERE id_organisasi = p_id_organisasi AND is_active = 'Y'
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus organisasi yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;

    -- Validasi: tidak bisa hapus jika masih direferensi oleh kandidat
    IF EXISTS (
        SELECT 1 FROM m_kandidat
        WHERE id_organisasi = p_id_organisasi
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus organisasi yang masih memiliki data kandidat.';
    END IF;

    DELETE FROM m_organisasi WHERE id_organisasi = p_id_organisasi;

    COMMIT;

    SELECT 'Delete berhasil' AS status, p_id_organisasi AS id_organisasi;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_delete_siswa
DELIMITER //
CREATE PROCEDURE `sp_delete_siswa`(
	IN `p_nipd` INT(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data siswa tidak ditemukan.';
    END IF;

    DELETE FROM m_siswa WHERE nipd = p_nipd;

    COMMIT;

    SELECT 'Delete berhasil' AS status, p_id AS id;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_delete_tahun_ajar
DELIMITER //
CREATE PROCEDURE `sp_delete_tahun_ajar`(
    IN p_id_tahun_ajar INT
)
BEGIN
    DECLARE v_is_active CHAR(1);

    SELECT is_active INTO v_is_active
    FROM m_tahun_ajar
    WHERE id_tahun_ajar = p_id_tahun_ajar;

    IF v_is_active IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data tahun ajar tidak ditemukan';
    END IF;

    IF v_is_active = '1' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus tahun ajar yang sedang aktif';
    END IF;

    DELETE FROM m_tahun_ajar
    WHERE id_tahun_ajar = p_id_tahun_ajar;

    SELECT 'Berhasil dihapus' AS pesan;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_delete_user
DELIMITER //
CREATE PROCEDURE `sp_delete_user`(
    IN p_id_user INT(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Validasi: data harus ada
    IF NOT EXISTS (SELECT 1 FROM m_user WHERE id_user = p_id_user) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data user tidak ditemukan.';
    END IF;

    -- Validasi: user aktif tidak bisa langsung dihapus
    IF EXISTS (SELECT 1 FROM m_user WHERE id_user = p_id_user AND is_active = 'Y') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus user yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;

    DELETE FROM m_user WHERE id_user = p_id_user;

    COMMIT;

    SELECT 'Delete berhasil' AS status, p_id_user AS id_user;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_get_tahun_ajar
DELIMITER //
CREATE PROCEDURE `sp_get_tahun_ajar`(
    IN p_id_tahun_ajar INT  -- NULL = semua data
)
BEGIN
    IF p_id_tahun_ajar IS NULL THEN
        SELECT * FROM m_tahun_ajar ORDER BY tahun_ajar DESC;
    ELSE
        SELECT * FROM m_tahun_ajar
        WHERE  id_tahun_ajar = p_id_tahun_ajar;
    END IF;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_get_vote
DELIMITER //
CREATE PROCEDURE `sp_get_vote`(
    IN p_id_tahun_ajaran INT,   -- NULL = semua tahun
    IN p_id_kandidat     INT    -- NULL = semua kandidat
)
BEGIN
    SELECT
        v.id_vote,
        v.nipd,
        v.npwp,
        v.id_kandidat,
        k.nama_kandidat,
        v.id_tahun_ajaran,
        ta.tahun_ajar,
        v.tgl_vote
    FROM      trs_vote v
    JOIN      m_kandidat  k  ON k.id_kandidat   = v.id_kandidat
    JOIN      m_tahun_ajar ta ON ta.id_tahun_ajar = v.id_tahun_ajaran
    WHERE   (p_id_tahun_ajaran IS NULL OR v.id_tahun_ajaran = p_id_tahun_ajaran)
      AND   (p_id_kandidat     IS NULL OR v.id_kandidat     = p_id_kandidat)
    ORDER BY v.tgl_vote DESC;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_guru
DELIMITER //
CREATE PROCEDURE `sp_insert_guru`(
    IN p_nama_guru     VARCHAR(100),
    IN p_npwp          VARCHAR(20),
    IN p_no_telephone  VARCHAR(15),
    IN p_email         VARCHAR(100),
    IN p_jenis_kelamin VARCHAR(50),
    IN p_is_active     CHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_nama_guru IS NULL OR TRIM(p_nama_guru) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama guru tidak boleh kosong.';
    END IF;

    IF p_email IS NULL OR TRIM(p_email) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email tidak boleh kosong.';
    END IF;

    IF EXISTS (SELECT 1 FROM m_guru WHERE email = LOWER(TRIM(p_email))) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email sudah terdaftar, gunakan email lain.';
    END IF;

    IF p_npwp IS NOT NULL AND TRIM(p_npwp) <> '' THEN
        IF EXISTS (SELECT 1 FROM m_guru WHERE npwp = TRIM(p_npwp)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP sudah terdaftar.';
        END IF;
    END IF;

    INSERT INTO m_guru (
        nama_guru, npwp, no_telephone,
        email, jenis_kelamin, is_active
    ) VALUES (
        TRIM(p_nama_guru),
        TRIM(p_npwp),
        TRIM(p_no_telephone),
        LOWER(TRIM(p_email)),
        p_jenis_kelamin,
        IFNULL(p_is_active, 'Y')
    );

    COMMIT;

    SELECT 'Insert berhasil' AS status, LAST_INSERT_ID() AS id_guru;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_kandidat
DELIMITER //
CREATE PROCEDURE `sp_insert_kandidat`(
	IN `p_nipd_ketua` VARCHAR(50),
	IN `p_nipd_wakil` VARCHAR(50),
	IN `p_id_organisasi` INT(10),
	IN `p_id_tahun_ajaran` INT(10),
	IN `p_visi` TEXT,
	IN `p_misi` TEXT,
	IN `p_foto` VARCHAR(255),
	IN `p_nomer_urut` INT(10),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_nipd_ketua IS NULL OR TRIM(p_nipd_ketua) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Ketua tidak boleh kosong.';
    END IF;

    IF p_nipd_wakil IS NULL OR TRIM(p_nipd_wakil) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Wakil tidak boleh kosong.';
    END IF;

    IF p_nipd_ketua = p_nipd_wakil THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ketua dan Wakil tidak boleh siswa yang sama.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd_ketua) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Ketua tidak ditemukan di data siswa.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd_wakil) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Wakil tidak ditemukan di data siswa.';
    END IF;

    -- Validasi: organisasi harus ada
    IF NOT EXISTS (SELECT 1 FROM m_organisasi WHERE id_organisasi = p_id_organisasi) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Organisasi tidak ditemukan.';
    END IF;

    -- Validasi: tahun ajaran harus ada
    IF NOT EXISTS (SELECT 1 FROM m_tahun_ajar WHERE id_tahun_ajar = p_id_tahun_ajaran) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tahun ajaran tidak ditemukan.';
    END IF;

    -- Validasi: nomer_urut tidak boleh duplikat dalam organisasi & tahun ajaran yang sama
    IF EXISTS (
        SELECT 1 FROM m_kandidat
        WHERE nomer_urut      = p_nomer_urut
          AND id_organisasi   = p_id_organisasi
          AND id_tahun_ajaran = p_id_tahun_ajaran
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nomer urut sudah digunakan pada organisasi & tahun ajaran yang sama.';
    END IF;

    -- Validasi: satu siswa hanya boleh menjadi kandidat 1x per organisasi & tahun ajaran
    IF EXISTS (
        SELECT 1 FROM m_kandidat
        WHERE id_organisasi   = p_id_organisasi
          AND id_tahun_ajaran = p_id_tahun_ajaran
          AND (nipd_ketua = p_nipd_ketua OR nipd_wakil = p_nipd_ketua
            OR nipd_ketua = p_nipd_wakil OR nipd_wakil = p_nipd_wakil)
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salah satu siswa sudah terdaftar sebagai kandidat pada organisasi & tahun ajaran yang sama.';
    END IF;

    INSERT INTO m_kandidat (
        nipd_ketua, nipd_wakil, id_organisasi, id_tahun_ajaran,
        visi, misi, foto, nomer_urut, is_active
    ) VALUES (
        p_nipd_ketua, p_nipd_wakil, p_id_organisasi, p_id_tahun_ajaran,
        p_visi, p_misi, IFNULL(p_foto, ''), p_nomer_urut, IFNULL(p_is_active, 'Y')
    );

    COMMIT;

    SELECT 'Insert berhasil' AS status, LAST_INSERT_ID() AS id_kandidat;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_organisasi
DELIMITER //
CREATE PROCEDURE `sp_insert_organisasi`(
	IN `p_nama_organisasi` VARCHAR(50),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_nama_organisasi IS NULL OR TRIM(p_nama_organisasi) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama organisasi tidak boleh kosong.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM m_organisasi
        WHERE LOWER(nama_organisasi) = LOWER(TRIM(p_nama_organisasi))
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama organisasi sudah terdaftar.';
    END IF;

    INSERT INTO m_organisasi (nama_organisasi, is_active)
    VALUES (TRIM(p_nama_organisasi), IFNULL(p_is_active, 'Y'));

    COMMIT;

    SELECT 'Insert berhasil' AS status, LAST_INSERT_ID() AS id_organisasi;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_siswa
DELIMITER //
CREATE PROCEDURE `sp_insert_siswa`(
	IN `p_id` INT(10),
	IN `p_nama_siswa` VARCHAR(100),
	IN `p_nipd` VARCHAR(20),
	IN `p_nomor_telefon` VARCHAR(20),
	IN `p_alamat` VARCHAR(255),
	IN `p_email` VARCHAR(100),
	IN `p_jenis_kelamin` CHAR(1),
	IN `p_kelas` INT(10),
	IN `p_jurusan` VARCHAR(10),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD sudah terdaftar.';
    END IF;

    INSERT INTO m_siswa (
        id, nama_siswa, nipd, nomor_telefon,
        alamat, email, jenis_kelamin, kelas, jurusan, is_active
    ) VALUES (
        p_id, p_nama_siswa, p_nipd, p_nomor_telefon,
        p_alamat, p_email, p_jenis_kelamin, p_kelas, p_jurusan, p_is_active
    );

    COMMIT;

    SELECT 'Insert berhasil' AS status, p_nipd AS nipd;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_tahun_ajar
DELIMITER //
CREATE PROCEDURE `sp_insert_tahun_ajar`(
    IN p_id_tahun_ajar  INT,
    IN p_tahun_ajar    VARCHAR(9),
    IN p_deskripsi     VARCHAR(255),
    IN p_is_active     CHAR(1)
)
BEGIN
    -- Validasi format tahun (contoh: 2024/2025)
    IF p_tahun_ajar NOT REGEXP '^[0-9]{4}/[0-9]{4}$' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Format tahun ajar harus YYYY/YYYY';
    END IF;

    -- Jika set aktif, nonaktifkan yang lain dulu
    IF p_is_active = '1' THEN
        UPDATE m_tahun_ajar SET is_active = '0';
    END IF;

    INSERT INTO m_tahun_ajar
        (id_tahun_ajar, tahun_ajar, deskripsi, is_active)
    VALUES
        (p_id_tahun_ajar, p_tahun_ajar, p_deskripsi, p_is_active);

    SELECT 'Berhasil ditambahkan' AS pesan,
           p_id_tahun_ajar            AS id_tahun_ajar;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_user
DELIMITER //
CREATE PROCEDURE `sp_insert_user`(
	IN `p_id_user` INT(10),
	IN `p_nama` VARCHAR(50),
	IN `p_nipd` VARCHAR(100),
	IN `p_npwp` VARCHAR(100),
	IN `p_role` VARCHAR(15),
	IN `p_password` VARCHAR(255),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_nama IS NULL OR TRIM(p_nama) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama tidak boleh kosong.';
    END IF;

    IF p_role IS NULL OR TRIM(p_role) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Role tidak boleh kosong.';
    END IF;

    IF p_role NOT IN ('admin', 'guru', 'siswa') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Role hanya boleh: admin, guru, atau siswa.';
    END IF;

    IF p_password IS NULL OR TRIM(p_password) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Password tidak boleh kosong.';
    END IF;

    IF EXISTS (SELECT 1 FROM m_user WHERE id_user = p_id_user) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ID User sudah terdaftar.';
    END IF;

    -- Validasi: nipd tidak boleh duplikat (jika diisi)
    IF p_nipd IS NOT NULL AND TRIM(p_nipd) <> '' THEN
        IF EXISTS (SELECT 1 FROM m_user WHERE nipd = TRIM(p_nipd)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NIPD sudah terdaftar sebagai user.';
        END IF;
    END IF;

    IF p_npwp IS NOT NULL AND TRIM(p_npwp) <> '' THEN
        IF EXISTS (SELECT 1 FROM m_user WHERE npwp = TRIM(p_npwp)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP sudah terdaftar sebagai user.';
        END IF;
    END IF;

    IF p_role = 'siswa' THEN
        IF p_nipd IS NULL OR TRIM(p_nipd) = '' THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NIPD wajib diisi untuk role siswa.';
        END IF;
        IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = TRIM(p_nipd)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NIPD tidak ditemukan di data siswa.';
        END IF;
    END IF;

    IF p_role = 'guru' THEN
        IF p_npwp IS NULL OR TRIM(p_npwp) = '' THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP wajib diisi untuk role guru.';
        END IF;
        IF NOT EXISTS (SELECT 1 FROM m_guru WHERE npwp = TRIM(p_npwp)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP tidak ditemukan di data guru.';
        END IF;
    END IF;

    INSERT INTO m_user (
        id_user, nama, nipd, npwp,
        role, password, remember_token, is_active
    ) VALUES (
        p_id_user,
        TRIM(p_nama),
        NULLIF(TRIM(p_nipd), ''),
        NULLIF(TRIM(p_npwp), ''),
        p_role,
        p_password,
        NULL,
        IFNULL(p_is_active, 'Y')
    );

    COMMIT;

    SELECT 'Insert berhasil' AS status, p_id_user AS id_user;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_insert_vote
DELIMITER //
CREATE PROCEDURE `sp_insert_vote`(
	IN `p_nipd` VARCHAR(20),
	IN `p_npwp` VARCHAR(20),
	IN `p_id_kandidat` INT
)
BEGIN
DECLARE v_tahun_ajaran INT;
   SELECT id_tahun_ajar
   INTO v_tahun_ajaran
   FROM m_tahun_ajar
   WHERE is_active = 'Y'
   LIMIT 1;
INSERT INTO trs_vote (nipd,npwp,id_kandidat, id_tahun_ajaran, tgl_vote) VALUES (p_nipd,p_npwp,p_id_kandidat, v_tahun_ajaran, NOW());
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_login
DELIMITER //
CREATE PROCEDURE `sp_login`(
	IN `p_username` VARCHAR(100)
)
BEGIN
    SELECT 
    	  id_user,
    	  nama,
        nipd,
        npwp,
        role,
        password,
        is_active
    FROM m_user
    WHERE 
        (nipd = p_username OR npwp = p_username)
        AND is_active = 'Y'
    LIMIT 1;

END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_rekap_vote
DELIMITER //
CREATE PROCEDURE `sp_rekap_vote`(
    IN p_id_tahun_ajaran INT
)
BEGIN
    SELECT
        k.id_kandidat,
        k.nama_kandidat,
        ta.tahun_ajar,
        COUNT(v.id_vote)                       AS total_suara,
        ROUND(
            COUNT(v.id_vote) * 100.0 /
            NULLIF(SUM(COUNT(v.id_vote)) OVER
                (PARTITION BY v.id_tahun_ajaran), 0
            ), 2
        )                                        AS persentase
    FROM       m_kandidat k
    LEFT JOIN trs_vote v
           ON v.id_kandidat = k.id_kandidat
          AND v.id_tahun_ajaran = p_id_tahun_ajaran
    LEFT JOIN m_tahun_ajar ta
           ON ta.id_tahun_ajar = p_id_tahun_ajaran
    GROUP BY
        k.id_kandidat, k.nama_kandidat, ta.tahun_ajar, v.id_tahun_ajaran
    ORDER BY total_suara DESC;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_set_aktif_tahun_ajar
DELIMITER //
CREATE PROCEDURE `sp_set_aktif_tahun_ajar`(
    IN p_id_tahun_ajar INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    SELECT COUNT(*) INTO v_exists
    FROM m_tahun_ajar
    WHERE id_tahun_ajar = p_id_tahun_ajar;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data tahun ajar tidak ditemukan';
    END IF;

    UPDATE m_tahun_ajar SET is_active = '0';

    UPDATE m_tahun_ajar
    SET    is_active = '1'
    WHERE  id_tahun_ajar = p_id_tahun_ajar;

    SELECT 'Tahun ajar aktif diperbarui' AS pesan,
           p_id_tahun_ajar                AS id_tahun_ajar;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_update_guru
DELIMITER //
CREATE PROCEDURE `sp_update_guru`(
    IN p_id_guru       INT(10),
    IN p_nama_guru     VARCHAR(100),
    IN p_npwp          VARCHAR(20),
    IN p_no_telephone  VARCHAR(15),
    IN p_email         VARCHAR(100),
    IN p_jenis_kelamin VARCHAR(50),
    IN p_is_active     CHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM m_guru WHERE id_guru = p_id_guru) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data guru tidak ditemukan.';
    END IF;

    IF p_nama_guru IS NULL OR TRIM(p_nama_guru) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama guru tidak boleh kosong.';
    END IF;

    IF p_email IS NULL OR TRIM(p_email) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email tidak boleh kosong.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM m_guru
        WHERE email = LOWER(TRIM(p_email)) AND id_guru <> p_id_guru
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email sudah digunakan oleh guru lain.';
    END IF;

    IF p_npwp IS NOT NULL AND TRIM(p_npwp) <> '' THEN
        IF EXISTS (
            SELECT 1 FROM m_guru
            WHERE npwp = TRIM(p_npwp) AND id_guru <> p_id_guru
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP sudah digunakan oleh guru lain.';
        END IF;
    END IF;

    UPDATE m_guru SET
        nama_guru     = TRIM(p_nama_guru),
        npwp          = TRIM(p_npwp),
        no_telephone  = TRIM(p_no_telephone),
        email         = LOWER(TRIM(p_email)),
        jenis_kelamin = p_jenis_kelamin,
        is_active     = p_is_active
    WHERE id_guru = p_id_guru;

    COMMIT;

    SELECT 'Update berhasil' AS status, p_id_guru AS id_guru;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_update_kandidat
DELIMITER //
CREATE PROCEDURE `sp_update_kandidat`(
    IN p_id_kandidat     INT(10),
    IN p_nipd_ketua      VARCHAR(50),
    IN p_nipd_wakil      VARCHAR(50),
    IN p_id_organisasi   INT(10),
    IN p_id_tahun_ajaran INT(10),
    IN p_visi            TEXT,
    IN p_misi            TEXT,
    IN p_foto            VARCHAR(255),
    IN p_nomer_urut      INT(10),
    IN p_is_active       ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Validasi: data harus ada
    IF NOT EXISTS (SELECT 1 FROM m_kandidat WHERE id_kandidat = p_id_kandidat) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data kandidat tidak ditemukan.';
    END IF;

    -- Validasi: nipd_ketua wajib diisi
    IF p_nipd_ketua IS NULL OR TRIM(p_nipd_ketua) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Ketua tidak boleh kosong.';
    END IF;

    -- Validasi: nipd_wakil wajib diisi
    IF p_nipd_wakil IS NULL OR TRIM(p_nipd_wakil) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Wakil tidak boleh kosong.';
    END IF;

    -- Validasi: ketua dan wakil tidak boleh orang yang sama
    IF p_nipd_ketua = p_nipd_wakil THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ketua dan Wakil tidak boleh siswa yang sama.';
    END IF;

    -- Validasi: ketua harus ada di m_siswa
    IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd_ketua) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Ketua tidak ditemukan di data siswa.';
    END IF;

    -- Validasi: wakil harus ada di m_siswa
    IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd_wakil) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD Wakil tidak ditemukan di data siswa.';
    END IF;

    -- Validasi: organisasi harus ada
    IF NOT EXISTS (SELECT 1 FROM m_organisasi WHERE id_organisasi = p_id_organisasi) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Organisasi tidak ditemukan.';
    END IF;

    -- Validasi: tahun ajaran harus ada
    IF NOT EXISTS (SELECT 1 FROM m_tahun_ajar WHERE id_tahun_ajar = p_id_tahun_ajaran) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tahun ajaran tidak ditemukan.';
    END IF;

    -- Validasi: nomer_urut tidak boleh duplikat (kecuali dirinya sendiri)
    IF EXISTS (
        SELECT 1 FROM m_kandidat
        WHERE nomer_urut      = p_nomer_urut
          AND id_organisasi   = p_id_organisasi
          AND id_tahun_ajaran = p_id_tahun_ajaran
          AND id_kandidat    <> p_id_kandidat
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nomer urut sudah digunakan pada organisasi & tahun ajaran yang sama.';
    END IF;

    UPDATE m_kandidat SET
        nipd_ketua      = p_nipd_ketua,
        nipd_wakil      = p_nipd_wakil,
        id_organisasi   = p_id_organisasi,
        id_tahun_ajaran = p_id_tahun_ajaran,
        visi            = p_visi,
        misi            = p_misi,
        foto            = IFNULL(p_foto, ''),
        nomer_urut      = p_nomer_urut,
        is_active       = p_is_active
    WHERE id_kandidat = p_id_kandidat;

    COMMIT;

    SELECT 'Update berhasil' AS status, p_id_kandidat AS id_kandidat;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_update_organisasi
DELIMITER //
CREATE PROCEDURE `sp_update_organisasi`(
	IN `p_id_organisasi` INT(10),
	IN `p_nama_organisasi` VARCHAR(50),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM m_organisasi WHERE id_organisasi = p_id_organisasi) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data organisasi tidak ditemukan.';
    END IF;

    IF p_nama_organisasi IS NULL OR TRIM(p_nama_organisasi) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama organisasi tidak boleh kosong.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM m_organisasi
        WHERE LOWER(nama_organisasi) = LOWER(TRIM(p_nama_organisasi))
          AND id_organisasi <> p_id_organisasi
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama organisasi sudah digunakan oleh organisasi lain.';
    END IF;

    UPDATE m_organisasi SET
        nama_organisasi = TRIM(p_nama_organisasi),
        is_active       = p_is_active
    WHERE id_organisasi = p_id_organisasi;

    COMMIT;

    SELECT 'Update berhasil' AS status, p_id_organisasi AS id_organisasi;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_update_siswa
DELIMITER //
CREATE PROCEDURE `sp_update_siswa`(
	IN `p_id` INT(10),
	IN `p_nama_siswa` VARCHAR(100),
	IN `p_nipd` VARCHAR(20),
	IN `p_nomor_telefon` VARCHAR(20),
	IN `p_alamat` VARCHAR(255),
	IN `p_email` VARCHAR(100),
	IN `p_jenis_kelamin` CHAR(1),
	IN `p_kelas` INT(10),
	IN `p_jurusan` VARCHAR(10),
	IN `p_is_active` ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE id = p_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data siswa tidak ditemukan.';
    END IF;


    IF EXISTS (SELECT 1 FROM m_siswa WHERE nipd = p_nipd AND id <> p_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'NIPD sudah digunakan oleh siswa lain.';
    END IF;

    UPDATE m_siswa SET
        nama_siswa    = p_nama_siswa,
        nipd          = p_nipd,
        nomor_telefon = p_nomor_telefon,
        alamat        = p_alamat,
        email         = p_email,
        jenis_kelamin = p_jenis_kelamin,
        kelas         = p_kelas,
        jurusan       = p_jurusan,
        is_active     = p_is_active
    WHERE id = p_id;

    COMMIT;

    SELECT 'Update berhasil' AS status, p_nipd AS nipd;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_update_tahun_ajar
DELIMITER //
CREATE PROCEDURE `sp_update_tahun_ajar`(
    IN p_id_tahun_ajar  INT,
    IN p_tahun_ajar    VARCHAR(9),
    IN p_deskripsi     VARCHAR(255),
    IN p_is_active     CHAR(1)
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    SELECT COUNT(*) INTO v_exists
    FROM m_tahun_ajar
    WHERE id_tahun_ajar = p_id_tahun_ajar;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data tahun ajar tidak ditemukan';
    END IF;

    IF p_is_active = '1' THEN
        UPDATE m_tahun_ajar
        SET is_active = '0'
        WHERE id_tahun_ajar <> p_id_tahun_ajar;
    END IF;

    UPDATE m_tahun_ajar
    SET
        tahun_ajar = p_tahun_ajar,
        deskripsi  = p_deskripsi,
        is_active  = p_is_active
    WHERE id_tahun_ajar = p_id_tahun_ajar;

    SELECT 'Berhasil diperbarui' AS pesan,
           ROW_COUNT()            AS rows_affected;
END//
DELIMITER ;

-- membuang struktur untuk procedure db_vote1.sp_update_user
DELIMITER //
CREATE PROCEDURE `sp_update_user`(
    IN p_id_user        INT(10),
    IN p_nama           VARCHAR(50),
    IN p_nipd           VARCHAR(100),
    IN p_npwp           VARCHAR(100),
    IN p_role           VARCHAR(15),
    IN p_password       VARCHAR(255),  -- NULL = tidak ganti password
    IN p_is_active      ENUM('Y','N')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Validasi: data harus ada
    IF NOT EXISTS (SELECT 1 FROM m_user WHERE id_user = p_id_user) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data user tidak ditemukan.';
    END IF;

    -- Validasi: nama tidak boleh kosong
    IF p_nama IS NULL OR TRIM(p_nama) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama tidak boleh kosong.';
    END IF;

    -- Validasi: role
    IF p_role NOT IN ('admin', 'guru', 'siswa') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Role hanya boleh: admin, guru, atau siswa.';
    END IF;

    -- Validasi: nipd duplikat (kecuali dirinya sendiri)
    IF p_nipd IS NOT NULL AND TRIM(p_nipd) <> '' THEN
        IF EXISTS (
            SELECT 1 FROM m_user
            WHERE nipd = TRIM(p_nipd) AND id_user <> p_id_user
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NIPD sudah digunakan oleh user lain.';
        END IF;
    END IF;

    -- Validasi: npwp duplikat (kecuali dirinya sendiri)
    IF p_npwp IS NOT NULL AND TRIM(p_npwp) <> '' THEN
        IF EXISTS (
            SELECT 1 FROM m_user
            WHERE npwp = TRIM(p_npwp) AND id_user <> p_id_user
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP sudah digunakan oleh user lain.';
        END IF;
    END IF;

    -- Validasi: jika role = 'siswa', nipd wajib ada di m_siswa
    IF p_role = 'siswa' THEN
        IF p_nipd IS NULL OR TRIM(p_nipd) = '' THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NIPD wajib diisi untuk role siswa.';
        END IF;
        IF NOT EXISTS (SELECT 1 FROM m_siswa WHERE nipd = TRIM(p_nipd)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NIPD tidak ditemukan di data siswa.';
        END IF;
    END IF;

    -- Validasi: jika role = 'guru', npwp wajib ada di m_guru
    IF p_role = 'guru' THEN
        IF p_npwp IS NULL OR TRIM(p_npwp) = '' THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP wajib diisi untuk role guru.';
        END IF;
        IF NOT EXISTS (SELECT 1 FROM m_guru WHERE npwp = TRIM(p_npwp)) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'NPWP tidak ditemukan di data guru.';
        END IF;
    END IF;

    UPDATE m_user SET
        nama      = TRIM(p_nama),
        nipd      = NULLIF(TRIM(p_nipd), ''),
        npwp      = NULLIF(TRIM(p_npwp), ''),
        role      = p_role,
        password  = CASE WHEN p_password IS NOT NULL AND TRIM(p_password) <> ''
                         THEN p_password
                         ELSE password
                    END,
        is_active = p_is_active
    WHERE id_user = p_id_user;

    COMMIT;

    SELECT 'Update berhasil' AS status, p_id_user AS id_user;
END//
DELIMITER ;

-- membuang struktur untuk table db_vote1.tiang
CREATE TABLE IF NOT EXISTS `tiang` (
  `Nomor_Tiang` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Nomor_Gardu` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Letak_Tiang` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Nomor_Tiang`),
  KEY `idx_tiang_gardu` (`Nomor_Gardu`),
  CONSTRAINT `fk_tiang_gardu` FOREIGN KEY (`Nomor_Gardu`) REFERENCES `gardu` (`Nomor_Gardu`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.tiang: ~3 rows (lebih kurang)
INSERT INTO `tiang` (`Nomor_Tiang`, `Nomor_Gardu`, `Letak_Tiang`) VALUES
	('TNG001', 'GRD001', 'Depan Balai Desa'),
	('TNG002', 'GRD001', 'Pertigaan Jalan Merdeka'),
	('TNG003', 'GRD002', 'Samping Pasar');

-- membuang struktur untuk table db_vote1.trs_vote
CREATE TABLE IF NOT EXISTS `trs_vote` (
  `id_vote` int NOT NULL AUTO_INCREMENT,
  `nipd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `npwp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_kandidat` int DEFAULT NULL,
  `id_tahun_ajaran` int DEFAULT NULL,
  `tgl_vote` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_vote`) USING BTREE,
  KEY `tahun_ajaran` (`id_tahun_ajaran`),
  KEY `id_kandidat` (`id_kandidat`),
  KEY `id_users` (`nipd`) USING BTREE,
  KEY `npwp` (`npwp`),
  CONSTRAINT `FK_trs_vote_m_guru` FOREIGN KEY (`npwp`) REFERENCES `m_guru` (`npwp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_trs_vote_m_kandidat` FOREIGN KEY (`id_kandidat`) REFERENCES `m_kandidat` (`id_kandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_trs_vote_m_siswa` FOREIGN KEY (`nipd`) REFERENCES `m_siswa` (`nipd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_trs_vote_m_tahun_ajar` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `m_tahun_ajar` (`id_tahun_ajar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel db_vote1.trs_vote: ~10 rows (lebih kurang)
INSERT INTO `trs_vote` (`id_vote`, `nipd`, `npwp`, `id_kandidat`, `id_tahun_ajaran`, `tgl_vote`) VALUES
	(52, '242510067', NULL, 56, 4, '2026-05-07 13:13:11'),
	(53, '242510067', NULL, 60, 4, '2026-05-07 13:15:19'),
	(54, '242510068', NULL, 56, 4, '2026-05-07 13:15:54'),
	(55, '242510068', NULL, 59, 4, '2026-05-07 13:16:02'),
	(56, '242510081', NULL, 56, 4, '2026-05-07 13:20:32'),
	(57, '242510081', NULL, 60, 4, '2026-05-07 13:20:56'),
	(58, '242510059', NULL, 57, 4, '2026-05-07 13:28:07'),
	(59, '242510059', NULL, 61, 4, '2026-05-07 13:28:32'),
	(60, '242510055', NULL, 56, 4, '2026-05-07 13:33:06'),
	(61, '242510055', NULL, 60, 4, '2026-05-07 13:33:29'),
	(62, '242510080', NULL, 58, 4, '2026-05-12 00:54:18'),
	(63, '242510080', NULL, 60, 4, '2026-05-12 00:55:00');

-- membuang struktur untuk table db_vote1.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel db_vote1.users: ~0 rows (lebih kurang)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'muhammadfarelandriani@gmail.com', NULL, '$2y$12$gwEhAgtkoeY.K2HUPCl41ONpyi7doYOIvupDeBkf9Iqlv2ncF3Pd2', 'IQql0ghR8lFvv5j9S4ZfF7alP257yRfcVJqvmRPVMjYHrn8cU8mIR8DyNgTd', '2026-05-04 17:51:08', '2026-05-04 17:51:08');

-- membuang struktur untuk view db_vote1.vw_guru_aktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_guru_aktif` (
	`id_guru` INT(10) NOT NULL,
	`nama_guru` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`no_telephone` VARCHAR(15) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_guru_all
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_guru_all` (
	`id_guru` INT(10) NOT NULL,
	`nama_guru` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`no_telephone` VARCHAR(15) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_guru_nonaktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_guru_nonaktif` (
	`id_guru` INT(10) NOT NULL,
	`nama_guru` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`no_telephone` VARCHAR(15) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_guru_rekap
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_guru_rekap` (
	`jenis_kelamin` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`jumlah_guru` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_kandidat_mpk
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_kandidat_mpk` (
	`id_kandidat` INT(10) NOT NULL,
	`nipd_ketua` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nipd_wakil` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`id_organisasi` INT(10) NULL,
	`id_tahun_ajaran` INT(10) NULL,
	`visi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`misi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`foto` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`nomer_urut` INT(10) NULL,
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_kandidat_osis
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_kandidat_osis` (
	`id_kandidat` INT(10) NOT NULL,
	`nipd_ketua` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nipd_wakil` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`id_organisasi` INT(10) NULL,
	`id_tahun_ajaran` INT(10) NULL,
	`visi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`misi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`foto` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`nomer_urut` INT(10) NULL,
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_organisasi_aktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_organisasi_aktif` (
	`id_organisasi` INT(10) NOT NULL,
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_organisasi_all
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_organisasi_all` (
	`id_organisasi` INT(10) NOT NULL,
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` ENUM('Y','N') NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_organisasi_nonaktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_organisasi_nonaktif` (
	`id_organisasi` INT(10) NOT NULL,
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_organisasi_rekap
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_organisasi_rekap` (
	`id_organisasi` INT(10) NOT NULL,
	`nama_organisasi` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` ENUM('Y','N') NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_kandidat` BIGINT(19) NOT NULL,
	`kandidat_aktif` DECIMAL(23,0) NULL,
	`kandidat_nonaktif` DECIMAL(23,0) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_progress_mpk
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_progress_mpk` (
	`id_kandidat` INT(10) NOT NULL,
	`nomer_urut` INT(10) NULL,
	`foto` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`visi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`misi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`id_organisasi` INT(10) NULL,
	`id_tahun_ajaran` INT(10) NULL,
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`total_vote` BIGINT(19) NOT NULL,
	`persentase` DECIMAL(25,1) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_progress_mpk_periode
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_progress_mpk_periode` (
	`id_kandidat` INT(10) NOT NULL,
	`nomer_urut` INT(10) NULL,
	`foto` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`visi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`misi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`id_organisasi` INT(10) NULL,
	`id_tahun_ajaran` INT(10) NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`total_vote` BIGINT(19) NOT NULL,
	`persentase` DECIMAL(25,1) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_progress_osis
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_progress_osis` (
	`id_kandidat` INT(10) NOT NULL,
	`nomer_urut` INT(10) NULL,
	`foto` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`visi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`misi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`id_organisasi` INT(10) NULL,
	`periode` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`kosong` CHAR NOT NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`total_vote` BIGINT(19) NOT NULL,
	`persentase` DECIMAL(25,1) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_progress_osis_periode
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_progress_osis_periode` (
	`id_kandidat` INT(10) NOT NULL,
	`nomer_urut` INT(10) NULL,
	`foto` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`visi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`misi` TEXT NULL COLLATE 'utf8mb4_general_ci',
	`id_organisasi` INT(10) NULL,
	`id_tahun_ajaran` INT(10) NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`nama_ketua` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_wakil` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`total_vote` BIGINT(19) NOT NULL,
	`persentase` DECIMAL(25,1) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_siswa_aktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_siswa_aktif` (
	`id` INT(10) NOT NULL,
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`nomor_telefon` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`alamat` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_siswa_all
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_siswa_all` (
	`id` INT(10) NOT NULL,
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`nomor_telefon` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`alamat` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_siswa_nonaktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_siswa_nonaktif` (
	`id` INT(10) NOT NULL,
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`nomor_telefon` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`alamat` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_siswa_per_kelas
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_siswa_per_kelas` (
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`id` INT(10) NOT NULL,
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`nomor_telefon` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`jenis_kelamin` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_siswa_rekap
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_siswa_rekap` (
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_siswa` BIGINT(19) NOT NULL,
	`laki_laki` DECIMAL(23,0) NULL,
	`perempuan` DECIMAL(23,0) NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_user_aktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_user_aktif` (
	`id_user` INT(10) NOT NULL,
	`nama` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`role` ENUM('siswa','guru','admin') NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_guru` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_user_all
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_user_all` (
	`id_user` INT(10) NOT NULL,
	`nama` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`role` ENUM('siswa','guru','admin') NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`kelas` INT(10) NULL,
	`jurusan` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_guru` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_user_per_role
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_user_per_role` (
	`role` ENUM('siswa','guru','admin') NULL COLLATE 'utf8mb4_general_ci',
	`id_user` INT(10) NOT NULL,
	`nama` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nipd` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_siswa` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`nama_guru` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.vw_user_rekap
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `vw_user_rekap` (
	`role` ENUM('siswa','guru','admin') NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(9) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`jumlah_user` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_detail_vote
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_detail_vote` 
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_hasil_vote
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_hasil_vote` (
	`id_kandidat` INT(10) NOT NULL,
	`nipd_ketua` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nipd_wakil` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`total_suara` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_partisipasi_vote
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_partisipasi_vote` (
	`id_tahun_ajar` INT(10) NOT NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`tahun_aktif` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`total_suara` BIGINT(19) NOT NULL,
	`total_pemilih_nipd` BIGINT(19) NOT NULL,
	`total_pemilih_npwp` BIGINT(19) NOT NULL,
	`vote_pertama` TIMESTAMP NULL,
	`vote_terakhir` TIMESTAMP NULL,
	`durasi_voting_menit` BIGINT(19) NULL,
	`hari_aktif_voting` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_pemenang_vote
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_pemenang_vote` (
	`id_tahun_ajar` INT(10) NOT NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`tahun_aktif` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`id_kandidat` INT(10) NOT NULL,
	`total_suara` BIGINT(19) NOT NULL,
	`persentase` DECIMAL(26,2) NULL,
	`ranking` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_rekap_suara
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_rekap_suara` (
	`id_tahun_ajar` INT(10) NOT NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`tahun_aktif` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`id_kandidat` INT(10) NOT NULL,
	`total_suara` BIGINT(19) NOT NULL,
	`persentase` DECIMAL(26,2) NULL,
	`ranking` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_tahun_ajar
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_tahun_ajar` (
	`id_tahun_ajar` INT(10) NOT NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`deskripsi` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`tahun_ajar_label` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_tahun_ajar_aktif
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_tahun_ajar_aktif` (
	`id_tahun_ajar` INT(10) NOT NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`deskripsi` VARCHAR(255) NULL COLLATE 'utf8mb4_general_ci',
	`status_label` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_tahun_ajar_dropdown
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_tahun_ajar_dropdown` (
	`value` INT(10) NOT NULL,
	`label` VARCHAR(17) NULL COLLATE 'utf8mb4_general_ci',
	`is_active` CHAR(1) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_tahun_ajar_summary
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_tahun_ajar_summary` (
	`total_data` BIGINT(19) NOT NULL,
	`total_aktif` DECIMAL(23,0) NULL,
	`total_nonaktif` DECIMAL(23,0) NULL,
	`tahun_ajar_terbaru` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`tahun_ajar_terlama` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk view db_vote1.v_vote_detail
-- Membuat tabel sementara untuk menangani kesalahan ketergantungan VIEW
CREATE TABLE `v_vote_detail` (
	`id_vote` INT(10) NOT NULL,
	`nipd` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`npwp` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`id_kandidat` INT(10) NULL,
	`id_tahun_ajaran` INT(10) NULL,
	`tahun_ajar` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`tahun_aktif` CHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`tgl_vote` TIMESTAMP NULL,
	`tanggal_vote` DATE NULL,
	`jam_vote` TIME NULL,
	`hari_vote` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- membuang struktur untuk trigger db_vote1.trg_before_delete_guru
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_delete_guru` BEFORE DELETE ON `m_guru` FOR EACH ROW BEGIN
    IF OLD.is_active = 'Y' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus guru yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_delete_organisasi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_delete_organisasi` BEFORE DELETE ON `m_organisasi` FOR EACH ROW BEGIN
    -- Blokir hapus jika masih aktif
    IF OLD.is_active = 'Y' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus organisasi yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;

    -- Blokir hapus jika masih ada kandidat terkait
    IF EXISTS (SELECT 1 FROM m_kandidat WHERE id_organisasi = OLD.id_organisasi) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus organisasi yang masih memiliki data kandidat.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_delete_siswa
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_delete_siswa` BEFORE DELETE ON `m_siswa` FOR EACH ROW BEGIN
    IF OLD.is_active = 'Y' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus siswa yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_delete_user
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_delete_user` BEFORE DELETE ON `m_user` FOR EACH ROW BEGIN
    IF OLD.is_active = 'Y' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus user yang masih aktif. Non-aktifkan terlebih dahulu.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_insert_guru
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_insert_guru` BEFORE INSERT ON `m_guru` FOR EACH ROW BEGIN
    SET NEW.nama_guru    = TRIM(NEW.nama_guru);
    SET NEW.email        = LOWER(TRIM(NEW.email));
    SET NEW.npwp         = TRIM(NEW.npwp);
    SET NEW.no_telephone = TRIM(NEW.no_telephone);

    IF NEW.is_active IS NULL OR TRIM(NEW.is_active) = '' THEN
        SET NEW.is_active = 'Y';
    END IF;

    IF NEW.nama_guru IS NULL OR NEW.nama_guru = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama guru tidak boleh kosong.';
    END IF;

    IF NEW.email IS NULL OR NEW.email = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email tidak boleh kosong.';
    END IF;

    IF NEW.jenis_kelamin IS NOT NULL
       AND NEW.jenis_kelamin NOT IN ('Laki-laki', 'Perempuan', 'L', 'P') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Jenis kelamin hanya boleh: Laki-laki / Perempuan / L / P.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_insert_organisasi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_insert_organisasi` BEFORE INSERT ON `m_organisasi` FOR EACH ROW BEGIN
    -- Sanitasi
    SET NEW.nama_organisasi = TRIM(NEW.nama_organisasi);

    -- Default is_active = 'Y'
    IF NEW.is_active IS NULL THEN
        SET NEW.is_active = 'Y';
    END IF;

    -- Validasi nama tidak boleh kosong
    IF NEW.nama_organisasi IS NULL OR NEW.nama_organisasi = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama organisasi tidak boleh kosong.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_insert_user
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_insert_user` BEFORE INSERT ON `m_user` FOR EACH ROW BEGIN
    -- Sanitasi
    SET NEW.nama = TRIM(NEW.nama);
    IF NEW.nipd IS NOT NULL THEN SET NEW.nipd = TRIM(NEW.nipd); END IF;
    IF NEW.npwp IS NOT NULL THEN SET NEW.npwp = TRIM(NEW.npwp); END IF;

    -- Default is_active = 'Y'
    IF NEW.is_active IS NULL THEN
        SET NEW.is_active = 'Y';
    END IF;

    -- Validasi nama
    IF NEW.nama IS NULL OR NEW.nama = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama tidak boleh kosong.';
    END IF;

    -- Validasi role
    IF NEW.role NOT IN ('admin', 'guru', 'siswa') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Role hanya boleh: admin, guru, atau siswa.';
    END IF;

    -- Validasi password
    IF NEW.password IS NULL OR TRIM(NEW.password) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Password tidak boleh kosong.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_update_guru
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_update_guru` BEFORE UPDATE ON `m_guru` FOR EACH ROW BEGIN
    SET NEW.nama_guru    = TRIM(NEW.nama_guru);
    SET NEW.email        = LOWER(TRIM(NEW.email));
    SET NEW.npwp         = TRIM(NEW.npwp);
    SET NEW.no_telephone = TRIM(NEW.no_telephone);

    IF NEW.nama_guru IS NULL OR NEW.nama_guru = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama guru tidak boleh kosong.';
    END IF;

    IF NEW.email IS NULL OR NEW.email = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email tidak boleh kosong.';
    END IF;

    IF NEW.jenis_kelamin IS NOT NULL
       AND NEW.jenis_kelamin NOT IN ('Laki-laki', 'Perempuan', 'L', 'P') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Jenis kelamin hanya boleh: Laki-laki / Perempuan / L / P.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_update_organisasi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_update_organisasi` BEFORE UPDATE ON `m_organisasi` FOR EACH ROW BEGIN
    -- Sanitasi
    SET NEW.nama_organisasi = TRIM(NEW.nama_organisasi);

    -- Validasi nama tidak boleh kosong
    IF NEW.nama_organisasi IS NULL OR NEW.nama_organisasi = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama organisasi tidak boleh kosong.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_update_siswa
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_update_siswa` BEFORE UPDATE ON `m_siswa` FOR EACH ROW BEGIN
    SET NEW.nama_siswa = TRIM(NEW.nama_siswa);

    SET NEW.email = LOWER(TRIM(NEW.email));

    IF NEW.jenis_kelamin NOT IN ('L', 'P') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Jenis kelamin hanya boleh L (Laki-laki) atau P (Perempuan).';
    END IF;

    IF NEW.email IS NULL OR NEW.email = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email tidak boleh kosong.';
    END IF;

    IF NEW.nama_siswa IS NULL OR NEW.nama_siswa = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama siswa tidak boleh kosong.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_before_update_user
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_before_update_user` BEFORE UPDATE ON `m_user` FOR EACH ROW BEGIN
    -- Sanitasi
    SET NEW.nama = TRIM(NEW.nama);
    IF NEW.nipd IS NOT NULL THEN SET NEW.nipd = TRIM(NEW.nipd); END IF;
    IF NEW.npwp IS NOT NULL THEN SET NEW.npwp = TRIM(NEW.npwp); END IF;

    -- Validasi nama
    IF NEW.nama IS NULL OR NEW.nama = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nama tidak boleh kosong.';
    END IF;

    -- Validasi role
    IF NEW.role NOT IN ('admin', 'guru', 'siswa') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Role hanya boleh: admin, guru, atau siswa.';
    END IF;

    -- Jaga agar password tidak bisa di-set kosong saat update
    IF NEW.password IS NULL OR TRIM(NEW.password) = '' THEN
        SET NEW.password = OLD.password;
    END IF;

    -- remember_token tidak perlu divalidasi (dikelola aplikasi)
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_tahun_ajar_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_tahun_ajar_before_delete` BEFORE DELETE ON `m_tahun_ajar` FOR EACH ROW BEGIN
    IF OLD.is_active = 'Y' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus tahun ajar yang sedang aktif';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_vote_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_vote_before_delete` BEFORE DELETE ON `trs_vote` FOR EACH ROW BEGIN
    DECLARE v_tahun_aktif INT DEFAULT 0;

    SELECT COUNT(*) INTO v_tahun_aktif
    FROM  m_tahun_ajar
    WHERE id_tahun_ajar = OLD.id_tahun_ajaran
      AND  is_active     = '1';

    IF v_tahun_aktif > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak dapat menghapus vote pada tahun ajaran yang masih aktif';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_vote_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_vote_before_insert` BEFORE INSERT ON `trs_vote` FOR EACH ROW BEGIN
    DECLARE v_sudah_vote INT DEFAULT 0;
    DECLARE v_tahun_aktif INT DEFAULT 0;
    DECLARE v_org VARCHAR(20);

    -- cek tahun aktif
    SELECT COUNT(*) INTO v_tahun_aktif
    FROM m_tahun_ajar
    WHERE id_tahun_ajar = NEW.id_tahun_ajaran
      AND is_active = 'Y';

    IF v_tahun_aktif = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tahun ajaran tidak aktif';
    END IF;

    -- ambil organisasi kandidat
    SELECT mo.nama_organisasi
    INTO v_org
    FROM m_kandidat mk
    JOIN m_organisasi mo ON mk.id_organisasi = mo.id_organisasi
    WHERE mk.id_kandidat = NEW.id_kandidat;

    -- cek sudah vote di organisasi yang sama
    SELECT COUNT(*)
    INTO v_sudah_vote
    FROM trs_vote tv
    JOIN m_kandidat mk ON tv.id_kandidat = mk.id_kandidat
    JOIN m_organisasi mo ON mk.id_organisasi = mo.id_organisasi
    WHERE (tv.nipd = NEW.nipd OR tv.npwp = NEW.npwp)
      AND mo.nama_organisasi = v_org;

    IF v_sudah_vote > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Anda sudah vote di organisasi ini';
    END IF;

    -- auto timestamp
    IF NEW.tgl_vote IS NULL THEN
        SET NEW.tgl_vote = NOW();
    END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk trigger db_vote1.trg_vote_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_vote_before_update` BEFORE UPDATE ON `trs_vote` FOR EACH ROW BEGIN
    -- Larang perubahan kandidat yang sudah dipilih
    IF NEW.id_kandidat <> OLD.id_kandidat THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Pilihan kandidat tidak dapat diubah setelah vote dicatat';
    END IF;

    -- Larang perubahan pemilik vote
    IF NEW.nipd <> OLD.nipd OR NEW.npwp <> OLD.npwp THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Data pemilih (nipd/npwp) tidak dapat diubah';
    END IF;

    -- Larang perubahan tahun ajaran
    IF NEW.id_tahun_ajaran <> OLD.id_tahun_ajaran THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tahun ajaran pada vote tidak dapat diubah';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- membuang struktur untuk view db_vote1.vw_guru_aktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_guru_aktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_guru_aktif` AS select `m_guru`.`id_guru` AS `id_guru`,`m_guru`.`nama_guru` AS `nama_guru`,`m_guru`.`npwp` AS `npwp`,`m_guru`.`no_telephone` AS `no_telephone`,`m_guru`.`email` AS `email`,`m_guru`.`jenis_kelamin` AS `jenis_kelamin` from `m_guru` where (`m_guru`.`is_active` = 'Y') order by `m_guru`.`nama_guru`;

-- membuang struktur untuk view db_vote1.vw_guru_all
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_guru_all`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_guru_all` AS select `m_guru`.`id_guru` AS `id_guru`,`m_guru`.`nama_guru` AS `nama_guru`,`m_guru`.`npwp` AS `npwp`,`m_guru`.`no_telephone` AS `no_telephone`,`m_guru`.`email` AS `email`,`m_guru`.`jenis_kelamin` AS `jenis_kelamin`,`m_guru`.`is_active` AS `is_active`,(case `m_guru`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label` from `m_guru` order by `m_guru`.`nama_guru`;

-- membuang struktur untuk view db_vote1.vw_guru_nonaktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_guru_nonaktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_guru_nonaktif` AS select `m_guru`.`id_guru` AS `id_guru`,`m_guru`.`nama_guru` AS `nama_guru`,`m_guru`.`npwp` AS `npwp`,`m_guru`.`no_telephone` AS `no_telephone`,`m_guru`.`email` AS `email`,`m_guru`.`jenis_kelamin` AS `jenis_kelamin` from `m_guru` where (`m_guru`.`is_active` = 'N') order by `m_guru`.`nama_guru`;

-- membuang struktur untuk view db_vote1.vw_guru_rekap
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_guru_rekap`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_guru_rekap` AS select `m_guru`.`jenis_kelamin` AS `jenis_kelamin`,`m_guru`.`is_active` AS `is_active`,(case `m_guru`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label`,count(0) AS `jumlah_guru` from `m_guru` group by `m_guru`.`jenis_kelamin`,`m_guru`.`is_active` order by `m_guru`.`jenis_kelamin`,`m_guru`.`is_active`;

-- membuang struktur untuk view db_vote1.vw_kandidat_mpk
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_kandidat_mpk`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_kandidat_mpk` AS select `mk`.`id_kandidat` AS `id_kandidat`,`mk`.`nipd_ketua` AS `nipd_ketua`,`mk`.`nipd_wakil` AS `nipd_wakil`,`mk`.`id_organisasi` AS `id_organisasi`,`mk`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`mk`.`visi` AS `visi`,`mk`.`misi` AS `misi`,`mk`.`foto` AS `foto`,`mk`.`nomer_urut` AS `nomer_urut`,`mk`.`is_active` AS `is_active`,`ketua`.`nama_siswa` AS `nama_ketua`,`wakil`.`nama_siswa` AS `nama_wakil`,`mo`.`nama_organisasi` AS `nama_organisasi` from (((`m_kandidat` `mk` join `m_siswa` `ketua` on((`mk`.`nipd_ketua` = `ketua`.`nipd`))) join `m_siswa` `wakil` on((`mk`.`nipd_wakil` = `wakil`.`nipd`))) join `m_organisasi` `mo` on((`mk`.`id_organisasi` = `mo`.`id_organisasi`))) where ((`mo`.`nama_organisasi` = 'MPK') and (`mk`.`is_active` = 'Y'));

-- membuang struktur untuk view db_vote1.vw_kandidat_osis
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_kandidat_osis`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_kandidat_osis` AS select `mk`.`id_kandidat` AS `id_kandidat`,`mk`.`nipd_ketua` AS `nipd_ketua`,`mk`.`nipd_wakil` AS `nipd_wakil`,`mk`.`id_organisasi` AS `id_organisasi`,`mk`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`mk`.`visi` AS `visi`,`mk`.`misi` AS `misi`,`mk`.`foto` AS `foto`,`mk`.`nomer_urut` AS `nomer_urut`,`mk`.`is_active` AS `is_active`,`ketua`.`nama_siswa` AS `nama_ketua`,`wakil`.`nama_siswa` AS `nama_wakil`,`mo`.`nama_organisasi` AS `nama_organisasi` from (((`m_kandidat` `mk` join `m_siswa` `ketua` on((`mk`.`nipd_ketua` = `ketua`.`nipd`))) join `m_siswa` `wakil` on((`mk`.`nipd_wakil` = `wakil`.`nipd`))) join `m_organisasi` `mo` on((`mk`.`id_organisasi` = `mo`.`id_organisasi`))) where ((`mo`.`nama_organisasi` = 'OSIS') and (`mk`.`is_active` = 'Y'));

-- membuang struktur untuk view db_vote1.vw_organisasi_aktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_organisasi_aktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_organisasi_aktif` AS select `m_organisasi`.`id_organisasi` AS `id_organisasi`,`m_organisasi`.`nama_organisasi` AS `nama_organisasi` from `m_organisasi` where (`m_organisasi`.`is_active` = 'Y') order by `m_organisasi`.`nama_organisasi`;

-- membuang struktur untuk view db_vote1.vw_organisasi_all
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_organisasi_all`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_organisasi_all` AS select `m_organisasi`.`id_organisasi` AS `id_organisasi`,`m_organisasi`.`nama_organisasi` AS `nama_organisasi`,`m_organisasi`.`is_active` AS `is_active`,(case `m_organisasi`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label` from `m_organisasi` order by `m_organisasi`.`nama_organisasi`;

-- membuang struktur untuk view db_vote1.vw_organisasi_nonaktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_organisasi_nonaktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_organisasi_nonaktif` AS select `m_organisasi`.`id_organisasi` AS `id_organisasi`,`m_organisasi`.`nama_organisasi` AS `nama_organisasi` from `m_organisasi` where (`m_organisasi`.`is_active` = 'N') order by `m_organisasi`.`nama_organisasi`;

-- membuang struktur untuk view db_vote1.vw_organisasi_rekap
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_organisasi_rekap`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_organisasi_rekap` AS select `o`.`id_organisasi` AS `id_organisasi`,`o`.`nama_organisasi` AS `nama_organisasi`,`o`.`is_active` AS `is_active`,(case `o`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label`,count(`k`.`id_kandidat`) AS `total_kandidat`,sum((`k`.`is_active` = 'Y')) AS `kandidat_aktif`,sum((`k`.`is_active` = 'N')) AS `kandidat_nonaktif` from (`m_organisasi` `o` left join `m_kandidat` `k` on((`k`.`id_organisasi` = `o`.`id_organisasi`))) group by `o`.`id_organisasi`,`o`.`nama_organisasi`,`o`.`is_active` order by `o`.`nama_organisasi`;

-- membuang struktur untuk view db_vote1.vw_progress_mpk
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_progress_mpk`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_progress_mpk` AS select `k`.`id_kandidat` AS `id_kandidat`,`k`.`nomer_urut` AS `nomer_urut`,`k`.`foto` AS `foto`,`k`.`visi` AS `visi`,`k`.`misi` AS `misi`,`k`.`id_organisasi` AS `id_organisasi`,`k`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`s_ketua`.`nama_siswa` AS `nama_ketua`,`s_wakil`.`nama_siswa` AS `nama_wakil`,count(`v`.`id_vote`) AS `total_vote`,round(((count(`v`.`id_vote`) * 100.0) / nullif((select count(0) from (`trs_vote` `tv` join `m_kandidat` `mk` on((`mk`.`id_kandidat` = `tv`.`id_kandidat`))) where (`mk`.`id_organisasi` = `k`.`id_organisasi`)),0)),1) AS `persentase` from (((`m_kandidat` `k` left join `m_siswa` `s_ketua` on((`s_ketua`.`nipd` = `k`.`nipd_ketua`))) left join `m_siswa` `s_wakil` on((`s_wakil`.`nipd` = `k`.`nipd_wakil`))) left join `trs_vote` `v` on((`v`.`id_kandidat` = `k`.`id_kandidat`))) where ((`k`.`id_organisasi` = 5) and (`k`.`is_active` = 'Y')) group by `k`.`id_kandidat`,`k`.`nomer_urut`,`k`.`foto`,`k`.`visi`,`k`.`misi`,`k`.`id_organisasi`,`k`.`id_tahun_ajaran`,`s_ketua`.`nama_siswa`,`s_wakil`.`nama_siswa` order by `total_vote` desc;

-- membuang struktur untuk view db_vote1.vw_progress_mpk_periode
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_progress_mpk_periode`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_progress_mpk_periode` AS select `k`.`id_kandidat` AS `id_kandidat`,`k`.`nomer_urut` AS `nomer_urut`,`k`.`foto` AS `foto`,`k`.`visi` AS `visi`,`k`.`misi` AS `misi`,`k`.`id_organisasi` AS `id_organisasi`,`k`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`ta`.`tahun_ajar` AS `tahun_ajar`,`s_ketua`.`nama_siswa` AS `nama_ketua`,`s_wakil`.`nama_siswa` AS `nama_wakil`,count(`v`.`id_vote`) AS `total_vote`,round(((count(`v`.`id_vote`) * 100.0) / nullif((select count(0) from (`trs_vote` `tv` join `m_kandidat` `mk` on((`mk`.`id_kandidat` = `tv`.`id_kandidat`))) where ((`mk`.`id_organisasi` = `k`.`id_organisasi`) and (`mk`.`id_tahun_ajaran` = `k`.`id_tahun_ajaran`))),0)),1) AS `persentase` from ((((`m_kandidat` `k` left join `m_siswa` `s_ketua` on((`s_ketua`.`nipd` = `k`.`nipd_ketua`))) left join `m_siswa` `s_wakil` on((`s_wakil`.`nipd` = `k`.`nipd_wakil`))) left join `trs_vote` `v` on((`v`.`id_kandidat` = `k`.`id_kandidat`))) left join `m_tahun_ajar` `ta` on((`ta`.`id_tahun_ajar` = `k`.`id_tahun_ajaran`))) where (`k`.`id_organisasi` = 5) group by `k`.`id_kandidat`,`k`.`nomer_urut`,`k`.`foto`,`k`.`visi`,`k`.`misi`,`k`.`id_organisasi`,`k`.`id_tahun_ajaran`,`ta`.`tahun_ajar`,`s_ketua`.`nama_siswa`,`s_wakil`.`nama_siswa` order by `k`.`id_tahun_ajaran` desc,`total_vote` desc;

-- membuang struktur untuk view db_vote1.vw_progress_osis
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_progress_osis`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_progress_osis` AS select `k`.`id_kandidat` AS `id_kandidat`,`k`.`nomer_urut` AS `nomer_urut`,`k`.`foto` AS `foto`,`k`.`visi` AS `visi`,`k`.`misi` AS `misi`,`k`.`id_organisasi` AS `id_organisasi`,`mt`.`tahun_ajar` AS `periode`,'' AS `kosong`,`s_ketua`.`nama_siswa` AS `nama_ketua`,`s_wakil`.`nama_siswa` AS `nama_wakil`,count(`v`.`id_vote`) AS `total_vote`,round(((count(`v`.`id_vote`) * 100.0) / nullif((select count(0) from (`trs_vote` `tv` join `m_kandidat` `mk` on((`mk`.`id_kandidat` = `tv`.`id_kandidat`))) where (`mk`.`id_organisasi` = `k`.`id_organisasi`)),0)),1) AS `persentase` from ((((`m_kandidat` `k` left join `m_siswa` `s_ketua` on((`s_ketua`.`nipd` = `k`.`nipd_ketua`))) left join `m_siswa` `s_wakil` on((`s_wakil`.`nipd` = `k`.`nipd_wakil`))) left join `trs_vote` `v` on((`v`.`id_kandidat` = `k`.`id_kandidat`))) left join `m_tahun_ajar` `mt` on((`mt`.`id_tahun_ajar` = `k`.`id_tahun_ajaran`))) where ((`k`.`id_organisasi` = 4) and (`k`.`is_active` = 'Y')) group by `k`.`id_kandidat`,`k`.`nomer_urut`,`k`.`foto`,`k`.`visi`,`k`.`misi`,`k`.`id_organisasi`,`k`.`id_tahun_ajaran`,`s_ketua`.`nama_siswa`,`s_wakil`.`nama_siswa` order by `total_vote` desc;

-- membuang struktur untuk view db_vote1.vw_progress_osis_periode
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_progress_osis_periode`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_progress_osis_periode` AS select `k`.`id_kandidat` AS `id_kandidat`,`k`.`nomer_urut` AS `nomer_urut`,`k`.`foto` AS `foto`,`k`.`visi` AS `visi`,`k`.`misi` AS `misi`,`k`.`id_organisasi` AS `id_organisasi`,`k`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`ta`.`tahun_ajar` AS `tahun_ajar`,`s_ketua`.`nama_siswa` AS `nama_ketua`,`s_wakil`.`nama_siswa` AS `nama_wakil`,count(`v`.`id_vote`) AS `total_vote`,round(((count(`v`.`id_vote`) * 100.0) / nullif((select count(0) from (`trs_vote` `tv` join `m_kandidat` `mk` on((`mk`.`id_kandidat` = `tv`.`id_kandidat`))) where ((`mk`.`id_organisasi` = `k`.`id_organisasi`) and (`mk`.`id_tahun_ajaran` = `k`.`id_tahun_ajaran`))),0)),1) AS `persentase` from ((((`m_kandidat` `k` left join `m_siswa` `s_ketua` on((`s_ketua`.`nipd` = `k`.`nipd_ketua`))) left join `m_siswa` `s_wakil` on((`s_wakil`.`nipd` = `k`.`nipd_wakil`))) left join `trs_vote` `v` on((`v`.`id_kandidat` = `k`.`id_kandidat`))) left join `m_tahun_ajar` `ta` on((`ta`.`id_tahun_ajar` = `k`.`id_tahun_ajaran`))) where ((`k`.`id_organisasi` = 4) and (`ta`.`is_active` = 'N')) group by `k`.`id_kandidat`,`k`.`nomer_urut`,`k`.`foto`,`k`.`visi`,`k`.`misi`,`k`.`id_organisasi`,`k`.`id_tahun_ajaran`,`ta`.`tahun_ajar`,`s_ketua`.`nama_siswa`,`s_wakil`.`nama_siswa` order by `k`.`id_tahun_ajaran` desc,`total_vote` desc;

-- membuang struktur untuk view db_vote1.vw_siswa_aktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_siswa_aktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_siswa_aktif` AS select `m_siswa`.`id` AS `id`,`m_siswa`.`nama_siswa` AS `nama_siswa`,`m_siswa`.`nipd` AS `nipd`,`m_siswa`.`nomor_telefon` AS `nomor_telefon`,`m_siswa`.`alamat` AS `alamat`,`m_siswa`.`email` AS `email`,(case `m_siswa`.`jenis_kelamin` when 'L' then 'Laki-laki' when 'P' then 'Perempuan' else '-' end) AS `jenis_kelamin`,`m_siswa`.`kelas` AS `kelas`,`m_siswa`.`jurusan` AS `jurusan` from `m_siswa` where (`m_siswa`.`is_active` = 'Y') order by `m_siswa`.`nama_siswa`;

-- membuang struktur untuk view db_vote1.vw_siswa_all
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_siswa_all`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_siswa_all` AS select `m_siswa`.`id` AS `id`,`m_siswa`.`nama_siswa` AS `nama_siswa`,`m_siswa`.`nipd` AS `nipd`,`m_siswa`.`nomor_telefon` AS `nomor_telefon`,`m_siswa`.`alamat` AS `alamat`,`m_siswa`.`email` AS `email`,(case `m_siswa`.`jenis_kelamin` when 'L' then 'Laki-laki' when 'P' then 'Perempuan' else '-' end) AS `jenis_kelamin`,`m_siswa`.`kelas` AS `kelas`,`m_siswa`.`jurusan` AS `jurusan`,`m_siswa`.`is_active` AS `is_active`,(case `m_siswa`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label` from `m_siswa` order by `m_siswa`.`nama_siswa`;

-- membuang struktur untuk view db_vote1.vw_siswa_nonaktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_siswa_nonaktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_siswa_nonaktif` AS select `m_siswa`.`id` AS `id`,`m_siswa`.`nama_siswa` AS `nama_siswa`,`m_siswa`.`nipd` AS `nipd`,`m_siswa`.`nomor_telefon` AS `nomor_telefon`,`m_siswa`.`alamat` AS `alamat`,`m_siswa`.`email` AS `email`,(case `m_siswa`.`jenis_kelamin` when 'L' then 'Laki-laki' when 'P' then 'Perempuan' else '-' end) AS `jenis_kelamin`,`m_siswa`.`kelas` AS `kelas`,`m_siswa`.`jurusan` AS `jurusan` from `m_siswa` where (`m_siswa`.`is_active` = 'N') order by `m_siswa`.`nama_siswa`;

-- membuang struktur untuk view db_vote1.vw_siswa_per_kelas
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_siswa_per_kelas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_siswa_per_kelas` AS select `m_siswa`.`kelas` AS `kelas`,`m_siswa`.`jurusan` AS `jurusan`,`m_siswa`.`id` AS `id`,`m_siswa`.`nama_siswa` AS `nama_siswa`,`m_siswa`.`nipd` AS `nipd`,`m_siswa`.`nomor_telefon` AS `nomor_telefon`,`m_siswa`.`email` AS `email`,(case `m_siswa`.`jenis_kelamin` when 'L' then 'Laki-laki' when 'P' then 'Perempuan' else '-' end) AS `jenis_kelamin` from `m_siswa` where (`m_siswa`.`is_active` = 'Y') order by `m_siswa`.`kelas`,`m_siswa`.`jurusan`,`m_siswa`.`nama_siswa`;

-- membuang struktur untuk view db_vote1.vw_siswa_rekap
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_siswa_rekap`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_siswa_rekap` AS select `m_siswa`.`kelas` AS `kelas`,`m_siswa`.`jurusan` AS `jurusan`,`m_siswa`.`is_active` AS `is_active`,(case `m_siswa`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label`,count(0) AS `total_siswa`,sum((`m_siswa`.`jenis_kelamin` = 'L')) AS `laki_laki`,sum((`m_siswa`.`jenis_kelamin` = 'P')) AS `perempuan` from `m_siswa` group by `m_siswa`.`kelas`,`m_siswa`.`jurusan`,`m_siswa`.`is_active` order by `m_siswa`.`kelas`,`m_siswa`.`jurusan`,`m_siswa`.`is_active`;

-- membuang struktur untuk view db_vote1.vw_user_aktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_user_aktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_user_aktif` AS select `u`.`id_user` AS `id_user`,`u`.`nama` AS `nama`,`u`.`role` AS `role`,`u`.`nipd` AS `nipd`,`s`.`nama_siswa` AS `nama_siswa`,`s`.`kelas` AS `kelas`,`s`.`jurusan` AS `jurusan`,`u`.`npwp` AS `npwp`,`g`.`nama_guru` AS `nama_guru` from ((`m_user` `u` left join `m_siswa` `s` on((`s`.`nipd` = `u`.`nipd`))) left join `m_guru` `g` on((`g`.`npwp` = `u`.`npwp`))) where (`u`.`is_active` = 'Y') order by `u`.`role`,`u`.`nama`;

-- membuang struktur untuk view db_vote1.vw_user_all
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_user_all`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_user_all` AS select `u`.`id_user` AS `id_user`,`u`.`nama` AS `nama`,`u`.`role` AS `role`,`u`.`nipd` AS `nipd`,`s`.`nama_siswa` AS `nama_siswa`,`s`.`kelas` AS `kelas`,`s`.`jurusan` AS `jurusan`,`u`.`npwp` AS `npwp`,`g`.`nama_guru` AS `nama_guru`,`u`.`is_active` AS `is_active`,(case `u`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label` from ((`m_user` `u` left join `m_siswa` `s` on((`s`.`nipd` = `u`.`nipd`))) left join `m_guru` `g` on((`g`.`npwp` = `u`.`npwp`))) order by `u`.`role`,`u`.`nama`;

-- membuang struktur untuk view db_vote1.vw_user_per_role
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_user_per_role`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_user_per_role` AS select `u`.`role` AS `role`,`u`.`id_user` AS `id_user`,`u`.`nama` AS `nama`,`u`.`nipd` AS `nipd`,`s`.`nama_siswa` AS `nama_siswa`,`u`.`npwp` AS `npwp`,`g`.`nama_guru` AS `nama_guru`,`u`.`is_active` AS `is_active`,(case `u`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label` from ((`m_user` `u` left join `m_siswa` `s` on((`s`.`nipd` = `u`.`nipd`))) left join `m_guru` `g` on((`g`.`npwp` = `u`.`npwp`))) order by `u`.`role`,`u`.`nama`;

-- membuang struktur untuk view db_vote1.vw_user_rekap
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `vw_user_rekap`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_user_rekap` AS select `m_user`.`role` AS `role`,`m_user`.`is_active` AS `is_active`,(case `m_user`.`is_active` when 'Y' then 'Aktif' when 'N' then 'Non-Aktif' else '-' end) AS `status_label`,count(0) AS `jumlah_user` from `m_user` group by `m_user`.`role`,`m_user`.`is_active` order by `m_user`.`role`,`m_user`.`is_active`;

-- membuang struktur untuk view db_vote1.v_detail_vote
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_detail_vote`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_detail_vote` AS select `u`.`nama` AS `nama`,`k`.`id_kandidat` AS `id_kandidat`,`v`.`tgl_vote` AS `tgl_vote` from ((`trs_vote` `v` join `m_user` `u` on((`v`.`id_user` = `u`.`id_user`))) join `m_kandidat` `k` on((`v`.`id_kandidat` = `k`.`id_kandidat`)));

-- membuang struktur untuk view db_vote1.v_hasil_vote
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_hasil_vote`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_hasil_vote` AS select `k`.`id_kandidat` AS `id_kandidat`,`k`.`nipd_ketua` AS `nipd_ketua`,`k`.`nipd_wakil` AS `nipd_wakil`,count(`v`.`id_vote`) AS `total_suara` from (`m_kandidat` `k` left join `trs_vote` `v` on((`k`.`id_kandidat` = `v`.`id_kandidat`))) group by `k`.`id_kandidat`,`k`.`nipd_ketua`,`k`.`nipd_wakil` order by `total_suara` desc;

-- membuang struktur untuk view db_vote1.v_partisipasi_vote
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_partisipasi_vote`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_partisipasi_vote` AS select `ta`.`id_tahun_ajar` AS `id_tahun_ajar`,`ta`.`tahun_ajar` AS `tahun_ajar`,`ta`.`is_active` AS `tahun_aktif`,count(`v`.`id_vote`) AS `total_suara`,count(distinct `v`.`nipd`) AS `total_pemilih_nipd`,count(distinct `v`.`npwp`) AS `total_pemilih_npwp`,min(`v`.`tgl_vote`) AS `vote_pertama`,max(`v`.`tgl_vote`) AS `vote_terakhir`,timestampdiff(MINUTE,min(`v`.`tgl_vote`),max(`v`.`tgl_vote`)) AS `durasi_voting_menit`,count(distinct cast(`v`.`tgl_vote` as date)) AS `hari_aktif_voting` from (`m_tahun_ajar` `ta` left join `trs_vote` `v` on((`v`.`id_tahun_ajaran` = `ta`.`id_tahun_ajar`))) group by `ta`.`id_tahun_ajar`,`ta`.`tahun_ajar`,`ta`.`is_active` order by `ta`.`tahun_ajar` desc;

-- membuang struktur untuk view db_vote1.v_pemenang_vote
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_pemenang_vote`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_pemenang_vote` AS select `v_rekap_suara`.`id_tahun_ajar` AS `id_tahun_ajar`,`v_rekap_suara`.`tahun_ajar` AS `tahun_ajar`,`v_rekap_suara`.`tahun_aktif` AS `tahun_aktif`,`v_rekap_suara`.`id_kandidat` AS `id_kandidat`,`v_rekap_suara`.`total_suara` AS `total_suara`,`v_rekap_suara`.`persentase` AS `persentase`,`v_rekap_suara`.`ranking` AS `ranking` from `v_rekap_suara` where ((`v_rekap_suara`.`ranking` = 1) and (`v_rekap_suara`.`total_suara` > 0)) order by `v_rekap_suara`.`tahun_ajar` desc;

-- membuang struktur untuk view db_vote1.v_rekap_suara
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_rekap_suara`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_rekap_suara` AS select `ta`.`id_tahun_ajar` AS `id_tahun_ajar`,`ta`.`tahun_ajar` AS `tahun_ajar`,`ta`.`is_active` AS `tahun_aktif`,`k`.`id_kandidat` AS `id_kandidat`,count(`v`.`id_vote`) AS `total_suara`,round(((count(`v`.`id_vote`) * 100.0) / nullif(sum(count(`v`.`id_vote`)) OVER (PARTITION BY `ta`.`id_tahun_ajar` ) ,0)),2) AS `persentase`,rank() OVER (PARTITION BY `ta`.`id_tahun_ajar` ORDER BY count(`v`.`id_vote`) desc )  AS `ranking` from ((`m_kandidat` `k` join `m_tahun_ajar` `ta`) left join `trs_vote` `v` on(((`v`.`id_kandidat` = `k`.`id_kandidat`) and (`v`.`id_tahun_ajaran` = `ta`.`id_tahun_ajar`)))) group by `ta`.`id_tahun_ajar`,`ta`.`tahun_ajar`,`ta`.`is_active`,`k`.`id_kandidat` order by `ta`.`tahun_ajar` desc,`total_suara` desc;

-- membuang struktur untuk view db_vote1.v_tahun_ajar
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_tahun_ajar`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tahun_ajar` AS select `m_tahun_ajar`.`id_tahun_ajar` AS `id_tahun_ajar`,`m_tahun_ajar`.`tahun_ajar` AS `tahun_ajar`,`m_tahun_ajar`.`deskripsi` AS `deskripsi`,`m_tahun_ajar`.`is_active` AS `is_active`,(case `m_tahun_ajar`.`is_active` when '1' then 'Aktif' when '0' then 'Tidak Aktif' else 'Tidak Diketahui' end) AS `status_label`,concat(substr(`m_tahun_ajar`.`tahun_ajar`,1,4),'/',substr(`m_tahun_ajar`.`tahun_ajar`,6,4)) AS `tahun_ajar_label` from `m_tahun_ajar` order by `m_tahun_ajar`.`tahun_ajar` desc;

-- membuang struktur untuk view db_vote1.v_tahun_ajar_aktif
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_tahun_ajar_aktif`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tahun_ajar_aktif` AS select `m_tahun_ajar`.`id_tahun_ajar` AS `id_tahun_ajar`,`m_tahun_ajar`.`tahun_ajar` AS `tahun_ajar`,`m_tahun_ajar`.`deskripsi` AS `deskripsi`,'Aktif' AS `status_label` from `m_tahun_ajar` where (`m_tahun_ajar`.`is_active` = '1') limit 1;

-- membuang struktur untuk view db_vote1.v_tahun_ajar_dropdown
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_tahun_ajar_dropdown`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tahun_ajar_dropdown` AS select `m_tahun_ajar`.`id_tahun_ajar` AS `value`,concat(`m_tahun_ajar`.`tahun_ajar`,if((`m_tahun_ajar`.`is_active` = '1'),' (Aktif)','')) AS `label`,`m_tahun_ajar`.`is_active` AS `is_active` from `m_tahun_ajar` order by `m_tahun_ajar`.`is_active` desc,`m_tahun_ajar`.`tahun_ajar` desc;

-- membuang struktur untuk view db_vote1.v_tahun_ajar_summary
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_tahun_ajar_summary`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tahun_ajar_summary` AS select count(0) AS `total_data`,sum((case when (`m_tahun_ajar`.`is_active` = '1') then 1 else 0 end)) AS `total_aktif`,sum((case when (`m_tahun_ajar`.`is_active` = '0') then 1 else 0 end)) AS `total_nonaktif`,max(`m_tahun_ajar`.`tahun_ajar`) AS `tahun_ajar_terbaru`,min(`m_tahun_ajar`.`tahun_ajar`) AS `tahun_ajar_terlama` from `m_tahun_ajar`;

-- membuang struktur untuk view db_vote1.v_vote_detail
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_vote_detail`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_vote_detail` AS select `v`.`id_vote` AS `id_vote`,`v`.`nipd` AS `nipd`,`v`.`npwp` AS `npwp`,`v`.`id_kandidat` AS `id_kandidat`,`v`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`ta`.`tahun_ajar` AS `tahun_ajar`,`ta`.`is_active` AS `tahun_aktif`,`v`.`tgl_vote` AS `tgl_vote`,cast(`v`.`tgl_vote` as date) AS `tanggal_vote`,cast(`v`.`tgl_vote` as time) AS `jam_vote`,dayname(`v`.`tgl_vote`) AS `hari_vote` from ((`trs_vote` `v` join `m_kandidat` `k` on((`k`.`id_kandidat` = `v`.`id_kandidat`))) join `m_tahun_ajar` `ta` on((`ta`.`id_tahun_ajar` = `v`.`id_tahun_ajaran`))) order by `v`.`tgl_vote` desc;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
