-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 20, 2022 at 06:32 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `bkbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendas`
--

CREATE TABLE `agendas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `title`, `slug`, `short_description`, `content`, `img`, `thumbnail`, `created_by`, `updated_by`, `status`, `hit`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 1, 'pertama', 'pertama', 'tester', '<p>dasdadad</p>', '07022022-(pertama).jpg', '07022022-(pertama).jpg', 'Super Admin Website', 'Super Admin Website', 'show', 2, '2022-02-07 07:04:32', '2022-02-07 05:03:33', '2022-02-07 07:04:32'),
(6, 1, 'kedua', 'kedua', 'dasdad', '<p>adasda</p>', '07022022-(kedua).jpg', '07022022-(kedua).jpg', 'Super Admin Website', 'Super Admin Website', 'show', 0, '2022-02-07 07:07:23', '2022-02-07 07:01:54', '2022-02-07 07:07:23'),
(7, 1, 'liquid332', 'liquid332', 'dasfda', '<p>dasda</p>', '07022022-(liquid332).jpg', '07022022-(liquid332).jpg', 'Super Admin Website', 'Super Admin Website', 'show', 0, '2022-02-08 14:32:44', '2022-02-07 07:08:19', '2022-02-08 14:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`id`, `article_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 4, 1, NULL, NULL),
(4, 5, 1, NULL, NULL),
(5, 6, 1, NULL, NULL),
(6, 7, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bencanas`
--

CREATE TABLE `bencanas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kecamatan_id` bigint(20) NOT NULL,
  `desa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jb_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tgl_bencana` date NOT NULL,
  `m_mkk` int(11) DEFAULT NULL,
  `m_mjw` int(11) DEFAULT NULL,
  `m_hlg` int(11) DEFAULT NULL,
  `m_md` int(11) DEFAULT NULL,
  `m_lk` int(11) DEFAULT NULL,
  `m_tkk` int(11) DEFAULT NULL,
  `m_tjw` int(11) DEFAULT NULL,
  `r_hcr` int(11) DEFAULT NULL,
  `r_rb` int(11) DEFAULT NULL,
  `r_rs` int(11) DEFAULT NULL,
  `r_rr` int(11) DEFAULT NULL,
  `r_trc` int(11) DEFAULT NULL,
  `sl_trd` int(11) DEFAULT NULL,
  `sl_skl` int(11) DEFAULT NULL,
  `sl_ti` int(11) DEFAULT NULL,
  `sl_swh` int(11) DEFAULT NULL,
  `sl_drt` int(11) DEFAULT NULL,
  `sl_empg` int(11) DEFAULT NULL,
  `sl_jtrd` int(11) DEFAULT NULL,
  `sl_jtrc` int(11) DEFAULT NULL,
  `sl_pts` int(11) DEFAULT NULL,
  `keterangan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bencanas`
--

INSERT INTO `bencanas` (`id`, `kecamatan_id`, `desa_id`, `jb_id`, `tgl_bencana`, `m_mkk`, `m_mjw`, `m_hlg`, `m_md`, `m_lk`, `m_tkk`, `m_tjw`, `r_hcr`, `r_rb`, `r_rs`, `r_rr`, `r_trc`, `sl_trd`, `sl_skl`, `sl_ti`, `sl_swh`, `sl_drt`, `sl_empg`, `sl_jtrd`, `sl_jtrc`, `sl_pts`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 5, 50, 8, '2021-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anjai', '2022-02-19 08:12:25', '2022-02-20 09:03:40'),
(2, 21, 32, 6, '2021-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'reas', '2022-02-20 08:55:04', '2022-02-20 09:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'kegiatan', 'kegiatan', 'Super Admin Website', NULL, 'show', '2022-02-07 03:41:09', '2022-02-07 03:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desas`
--

CREATE TABLE `desas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kecamatan_id` bigint(20) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `desas`
--

INSERT INTO `desas` (`id`, `kecamatan_id`, `name`, `created_at`, `updated_at`) VALUES
(30, 1, 'Anggasari', '2022-02-18 07:11:03', '2022-02-19 05:58:15'),
(31, 23, 'Babakan Wanakerta', '2022-02-18 07:11:03', '2022-02-19 07:40:37'),
(32, 21, 'Balingbing', '2022-02-18 07:11:03', '2022-02-19 06:55:44'),
(33, 1, 'Bantarsari', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(34, 5, 'Belendung', '2022-02-18 07:11:03', '2022-02-19 07:22:16'),
(35, 1, 'Binong', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(36, 1, 'Blanakan', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(37, 1, 'Ciasem hilir', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(38, 3, 'Ciasem Tengah', '2022-02-18 07:11:03', '2022-02-19 07:16:30'),
(39, 1, 'Ciater', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(40, 1, 'Cibalandong', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(41, 29, 'Cibuluh', '2022-02-18 07:11:03', '2022-02-19 07:15:16'),
(42, 1, 'Cidahu', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(43, 10, 'Cigadog', '2022-02-18 07:11:03', '2022-02-19 07:07:02'),
(44, 26, 'Cigadung', '2022-02-18 07:11:03', '2022-02-19 06:59:02'),
(45, 6, 'Cijambe', '2022-02-18 07:11:03', '2022-02-19 07:12:25'),
(46, 1, 'Cijengkol', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(47, 1, 'Cikujang ', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(48, 1, 'Cimanggu', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(49, 1, 'Cimehmal', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(50, 5, 'Cinangsi', '2022-02-18 07:11:03', '2022-02-19 06:55:08'),
(51, 6, 'Cirangkong', '2022-02-18 07:11:03', '2022-02-19 07:36:33'),
(52, 5, 'Cisaga', '2022-02-18 07:11:03', '2022-02-19 07:30:55'),
(53, 1, 'Cisampih', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(54, 25, 'Citamekar', '2022-02-18 07:11:03', '2022-02-19 06:58:18'),
(55, 1, 'Compreng', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(56, 1, 'Cupunagara', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(57, 1, 'Curugrendeng', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(58, 26, 'Dangdeur', '2022-02-18 07:11:03', '2022-02-19 07:03:31'),
(59, 10, 'Darmaga', '2022-02-18 07:11:03', '2022-02-19 07:16:50'),
(60, 12, 'Dawuan Kidul', '2022-02-18 07:11:03', '2022-02-19 06:57:21'),
(61, 1, 'Dukuh', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(62, 1, 'Gardusayang', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(63, 19, 'Gembor', '2022-02-18 07:11:03', '2022-02-19 06:57:05'),
(64, 19, 'Gunung Sari', '2022-02-18 07:11:03', '2022-02-19 07:36:58'),
(65, 1, 'Gunung sembung', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(66, 6, 'Gunungtua', '2022-02-18 07:11:03', '2022-02-19 07:01:43'),
(67, 12, 'Jambalaer', '2022-02-18 07:11:03', '2022-02-19 07:27:18'),
(68, 1, 'Jatibaru', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(69, 1, 'Jatireja', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(70, 14, 'Kalijati barat', '2022-02-18 07:11:03', '2022-02-19 07:35:12'),
(71, 14, 'Kalijati Timur', '2022-02-18 07:11:03', '2022-02-19 07:34:40'),
(72, 23, 'Kaliwadas', '2022-02-18 07:11:03', '2022-02-19 07:41:07'),
(73, 19, 'Kamarung', '2022-02-18 07:11:03', '2022-02-19 07:35:40'),
(74, 1, 'Karanganyar', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(75, 18, 'Karanghegar', '2022-02-18 07:11:03', '2022-02-19 07:08:51'),
(76, 1, 'Karangmukti', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(77, 1, 'Kasomalang Kulon', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(78, 1, 'Kasomalang Wetan', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(79, 7, 'Kaunganten', '2022-02-18 07:11:03', '2022-02-19 07:23:31'),
(80, 1, 'Kediri', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(81, 19, 'Kemarung', '2022-02-18 07:11:03', '2022-02-19 07:17:42'),
(82, 1, 'Kiarasari', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(83, 1, 'Kihiyang', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(84, 1, 'Kumpay', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(85, 16, 'Legon Wetan', '2022-02-18 07:11:03', '2022-02-19 07:00:18'),
(86, 24, 'Leles', '2022-02-18 07:11:03', '2022-02-19 07:10:42'),
(87, 1, 'Lengkong', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(88, 5, 'Majasari', '2022-02-18 07:11:03', '2022-02-19 07:34:21'),
(89, 12, 'Manyeti', '2022-02-18 07:11:03', '2022-02-19 07:12:49'),
(90, 14, 'Marengmang', '2022-02-18 07:11:03', '2022-02-19 07:27:47'),
(91, 1, 'Margasari', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(92, 10, 'Mayang', '2022-02-18 07:11:03', '2022-02-19 06:58:41'),
(94, 7, 'Mekarsari', '2022-02-18 07:11:03', '2022-02-19 06:59:55'),
(95, 19, 'Mulyasari', '2022-02-18 07:11:03', '2022-02-19 07:11:40'),
(96, 1, 'Nagrog', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(97, 23, 'Neglasari', '2022-02-18 07:11:03', '2022-02-19 07:38:28'),
(98, 23, 'Pagon', '2022-02-18 07:11:03', '2022-02-19 07:39:02'),
(99, 1, 'Pakuhaji', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(100, 4, 'Palasari', '2022-02-18 07:11:03', '2022-02-19 07:04:56'),
(101, 22, 'Pamanukan', '2022-02-18 07:11:03', '2022-02-19 06:59:18'),
(102, 23, 'Parapatan', '2022-02-18 07:11:03', '2022-02-19 07:39:35'),
(103, 1, 'Parung', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(104, 15, 'Pasanggarahan', '2022-02-18 07:11:03', '2022-02-19 06:53:25'),
(105, 26, 'Pasirkareumbi', '2022-02-18 07:11:03', '2022-02-19 06:52:57'),
(107, 1, 'Ponggang', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(108, 1, 'Purwadadi Timur', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(109, 12, 'Rawalele', '2022-02-18 07:11:03', '2022-02-19 07:24:24'),
(110, 1, 'Sadawana', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(111, 1, 'Salamjaya', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(112, 1, 'Sarireja', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(113, 9, 'Simpar', '2022-02-18 07:11:03', '2022-02-19 06:56:13'),
(114, 7, 'Sindangsari', '2022-02-18 07:11:03', '2022-02-19 07:31:52'),
(115, 12, 'Situsari', '2022-02-18 07:11:03', '2022-02-19 07:20:57'),
(116, 1, 'Soklat', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(117, 1, 'Subang', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(118, 1, 'Sukahurip', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(119, 1, 'Sukakerti', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(120, 26, 'Sukamelang', '2022-02-18 07:11:03', '2022-02-19 07:14:36'),
(121, 19, 'Sukamulya', '2022-02-18 07:11:03', '2022-02-19 07:18:31'),
(122, 1, 'Sumbersari', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(123, 1, 'Tanggulun Timur', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(124, 2, 'Tanjolaya', '2022-02-18 07:11:03', '2022-02-19 07:07:58'),
(125, 6, 'Tanjungtiga', '2022-02-18 07:11:03', '2022-02-19 07:06:46'),
(126, 1, 'Tanjungwangi', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(127, 1, 'Wanajaya', '2022-02-18 07:11:03', '2022-02-18 07:11:03'),
(128, 26, 'Wanareja', '2022-02-18 07:11:03', '2022-02-19 07:19:06'),
(130, 16, 'Mayangan', '2022-02-19 06:33:19', '2022-02-19 06:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `kelompok` int(2) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `name`, `slug`, `description`, `img`, `status`, `kelompok`, `created_at`, `updated_at`) VALUES
(14, 'Bidang Rehabilitas dan Rekontuksi', 'bidang-rehabilitas-dan-rekontuksi', '-', NULL, 'show', 2, '2022-01-25 05:15:17', '2022-02-08 14:50:03'),
(15, 'BIdang Ketentraman Masyarakat dan Ketertiban Umum', 'bidang-ketentraman-masyarakat-dan-ketertiban-umum', '-', NULL, 'show', 2, '2022-01-25 05:16:01', '2022-01-27 19:16:17'),
(16, 'Bidang Pencegahan dan Kearsipan', 'bidang-pencegahan-dan-kearsipan', '-', NULL, 'show', 2, '2022-01-25 05:16:47', '2022-02-08 14:46:19'),
(17, 'Sub Bagian Umum dan Kepegawaian', 'sub-bagian-umum-dan-kepegawaian', '-', NULL, 'show', 1, '2022-02-10 03:16:48', '2022-02-10 03:16:48'),
(18, 'Kelompok Jabatan Fungsional', 'kelompok-jabatan-fungsional', '-', NULL, 'show', 1, '2022-02-10 03:17:08', '2022-02-10 03:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `fotos`
--

CREATE TABLE `fotos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info_graphics`
--

CREATE TABLE `info_graphics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_graphics`
--

INSERT INTO `info_graphics` (`id`, `title`, `slug`, `img`, `thumbnail`, `description`, `hit`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 'dasda', 'dasda', 'wXneoPeRAkEDyI3LtaDGdg632JxVLaA4M5V2DcXl.png', 'wXneoPeRAkEDyI3LtaDGdg632JxVLaA4M5V2DcXl.png', 'dasda', 0, 'Super Admin Website', NULL, 'show', '2022-02-07 13:48:40', '2022-02-07 13:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_bencanas`
--

CREATE TABLE `jenis_bencanas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_bencanas`
--

INSERT INTO `jenis_bencanas` (`id`, `name`, `created_at`, `updated_at`) VALUES
(6, 'Tanah Longsor', '2022-02-19 07:49:31', '2022-02-19 07:49:31'),
(7, 'Angin Kencang', '2022-02-19 07:50:49', '2022-02-19 07:50:49'),
(8, 'Banjir & Luapan air', '2022-02-19 07:51:12', '2022-02-19 07:55:34'),
(9, 'Pohon Tumbang', '2022-02-19 07:51:25', '2022-02-19 07:51:25'),
(10, 'Kebakaran', '2022-02-19 07:57:57', '2022-02-19 07:57:57'),
(11, 'Rumah Roboh', '2022-02-19 07:59:01', '2022-02-19 07:59:01');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatans`
--

CREATE TABLE `kecamatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kecamatans`
--

INSERT INTO `kecamatans` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Binong', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(2, 'Blanakan', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(3, 'Ciasem', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(4, 'Ciater', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(5, 'Cibogo', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(6, 'Cijambe', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(7, 'Cikaum', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(8, 'Cipeundeuy', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(9, 'Cipunagara', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(10, 'Cisalak', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(11, 'Compreng', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(12, 'Dawuan', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(13, 'Jalancagak', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(14, 'Kalijati', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(15, 'Kasomalang', '2022-02-18 07:19:08', '2022-02-19 06:53:58'),
(16, 'Legon Kulon', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(17, 'Mayangan ', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(18, 'Pabuaran', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(19, 'Pagaden', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(20, 'Pagaden ', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(21, 'Pagaden Barat', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(22, 'Pamanukan', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(23, 'Purwadadi', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(24, 'Sagalaherang', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(25, 'Serangpanjang', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(26, 'Subang', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(27, 'Sukasari', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(28, 'Tambak Dahan ', '2022-02-18 07:19:08', '2022-02-18 07:19:08'),
(29, 'Tanjungsiang', '2022-02-18 07:19:08', '2022-02-18 07:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `lokasis`
--

CREATE TABLE `lokasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_01_26_030030_create_categories_table', 1),
(6, '2021_01_26_030051_create_articles_table', 1),
(7, '2021_01_26_030342_create_agendas_table', 1),
(8, '2021_01_26_030401_create_announcements_table', 1),
(9, '2021_01_26_032946_create_news_table', 1),
(10, '2021_01_26_033020_create_profiles_table', 1),
(11, '2021_01_26_033052_create_tags_table', 1),
(12, '2021_01_26_033118_create_inboxes_table', 1),
(13, '2021_01_26_033204_create_albums_table', 1),
(14, '2021_01_26_033219_create_fotos_table', 1),
(15, '2021_01_26_033231_create_videos_table', 1),
(16, '2021_01_26_033358_create_comments_table', 1),
(17, '2021_01_26_033419_create_sliders_table', 1),
(18, '2021_01_26_033744_create_info_graphics_table', 1),
(19, '2021_01_26_040406_create_article_tags_table', 1),
(20, '2021_01_26_060224_create_visitors_table', 1),
(21, '2021_02_15_050020_create_permission_tables', 1),
(22, '2021_02_24_131525_create_website_table', 1),
(23, '2021_02_24_132420_create_social_media_table', 1),
(24, '2021_02_27_001708_create_fields_table', 1),
(25, '2021_02_28_010019_create_staff_table', 1),
(26, '2022_02_14_095319_create_lokasis_table', 2),
(27, '2022_02_14_095954_create_kecamatans_table', 2),
(28, '2022_02_14_100022_create_desas_table', 2),
(29, '2022_02_14_104051_create_jenis_bencanas_table', 2),
(30, '2022_02_14_104131_create_bencanas_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manipulate-master-settings', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49'),
(2, 'manipulate-master-datas', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49'),
(3, 'manipulate-master-roles', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49'),
(4, 'manipulate-master-users', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49'),
(5, 'manipulate-content', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `title`, `slug`, `img`, `file`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Sejarah', 'sejarah', NULL, '27012022-(sejarah).pdf', '<p>Isi Sejarah</p>', 'Super Admin Website', 'Super Admin Website', 'show', '2022-01-24 02:13:55', '2022-01-27 10:50:11'),
(3, 'Struktur Organisasi', 'struktur-organisasi', NULL, '24012022-(struktur-organisasi).pdf', '<p>STRUKTUR ORGANISASI&nbsp;</p>', 'Super Admin Website', 'Super Admin Website', 'show', '2022-01-24 02:18:13', '2022-01-26 02:45:42'),
(4, 'Visi Misi', 'visi-misi', NULL, NULL, '<p>visi &amp; misi</p>', 'Super Admin Website', 'Super Admin Website', 'show', '2022-01-25 05:18:40', '2022-01-26 02:46:38'),
(5, 'profile perangkat daerah', 'profile-perangkat-daerah', '07022022-(profile-perangkat-daerah).PNG', '07022022-(profile-perangkat-daerah).docx', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'Super Admin Website', NULL, 'show', '2022-02-07 02:57:39', '2022-02-07 02:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'operator', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49'),
(2, 'admin', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49'),
(3, 'super-admin', 'web', '2022-01-20 10:55:49', '2022-01-20 10:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 1),
(5, 1),
(1, 2),
(2, 2),
(4, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `description`, `img`, `uploaded_by`, `status`, `created_at`, `updated_at`) VALUES
(11, 'baner', '<p>baner</p>', 'xvmZG0Zn0TsA4tyWkL4eM3tyJIo2ShZ0sD1ZjOyI.jpg', 'Super Admin Website', 'show', '2022-02-08 07:16:45', '2022-02-08 07:16:45');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthplace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `golongan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kadis` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `kategori` enum('guru','non-guru') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'berita', 'berita', 'Super Admin Website', NULL, 'show', '2022-02-07 03:41:43', '2022-02-07 03:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin Website', 'suadmin', 'suadmin@gmail.com', NULL, '$2y$10$Pj.RNEkh79XisLYTKalGguYcbNa6SQT8J0Wt7VuL.PF9AgoqXDFI.', NULL, NULL, NULL, '2022-01-20 10:55:50', '2022-01-20 10:55:50'),
(2, 'Admin Website', 'admin', 'admin@gmail.com', NULL, '$2y$10$QMZI6ksIPPYSi9xbgVY/u.Ficew2j3x5iL6ZM8oZwdwMSAA7E9rCS', NULL, NULL, NULL, '2022-01-20 10:55:50', '2022-01-20 10:55:50'),
(3, 'Operator Admin Website', 'operator', 'operator@gmail.com', NULL, '$2y$10$J7/oqrZI4qzLq9qvW.SB.uuiw7z.Bysk2zIqgwq7xW.HfqlBp1NQi', NULL, NULL, NULL, '2022-01-20 10:55:50', '2022-01-20 10:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` bigint(20) NOT NULL,
  `online` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `date`, `ip`, `hit`, `online`, `created_at`, `updated_at`) VALUES
(1, '2022-01-20', '127.0.0.1', 125, '1642683408', NULL, '2022-01-20 12:56:48'),
(2, '2022-01-21', '127.0.0.1', 46, '1642750904', NULL, '2022-01-21 07:41:44'),
(3, '2022-01-24', '127.0.0.1', 34, '1643012032', NULL, '2022-01-24 08:13:52'),
(4, '2022-01-25', '127.0.0.1', 145, '1643088716', NULL, '2022-01-25 05:31:56'),
(5, '2022-01-26', '127.0.0.1', 107, '1643186645', NULL, '2022-01-26 08:44:05'),
(6, '2022-01-27', '127.0.0.1', 55, '1643281958', NULL, '2022-01-27 11:12:38'),
(7, '2022-01-28', '127.0.0.1', 33, '1643311142', NULL, '2022-01-27 19:19:02'),
(8, '2022-02-07', '103.156.88.45', 241, '1644222670', NULL, '2022-02-07 08:31:10'),
(9, '2022-02-07', '169.60.172.122', 1, '1644204461', NULL, NULL),
(10, '2022-02-07', '51.81.167.146', 1, '1644224442', NULL, NULL),
(11, '2022-02-07', '162.142.125.221', 1, '1644224493', NULL, NULL),
(12, '2022-02-07', '133.242.174.119', 2, '1644231686', NULL, '2022-02-07 11:01:26'),
(13, '2022-02-07', '133.242.140.127', 2, '1644231686', NULL, '2022-02-07 11:01:26'),
(14, '2022-02-07', '54.221.27.173', 1, '1644232773', NULL, NULL),
(15, '2022-02-07', '114.124.216.89', 24, '1644242303', NULL, '2022-02-07 13:58:23'),
(16, '2022-02-07', '114.124.217.89', 33, '1644242088', NULL, '2022-02-07 13:54:48'),
(17, '2022-02-07', '114.124.193.9', 22, '1644242026', NULL, '2022-02-07 13:53:46'),
(18, '2022-02-07', '114.124.195.73', 2, '1644247015', NULL, '2022-02-07 15:16:55'),
(19, '2022-02-07', '114.124.195.137', 3, '1644247036', NULL, '2022-02-07 15:17:16'),
(20, '2022-02-07', '114.124.195.9', 2, '1644248419', NULL, '2022-02-07 15:40:19'),
(21, '2022-02-08', '176.113.42.191', 1, '1644256292', NULL, NULL),
(22, '2022-02-08', '179.43.169.181', 1, '1644270057', NULL, NULL),
(23, '2022-02-08', '103.156.88.45', 35, '1644308063', NULL, '2022-02-08 08:14:23'),
(24, '2022-02-08', '18.206.55.48', 6, '1644304382', NULL, '2022-02-08 07:13:02'),
(25, '2022-02-08', '169.60.172.116', 1, '1644305223', NULL, NULL),
(26, '2022-02-08', '100.26.52.66', 2, '1644318626', NULL, '2022-02-08 11:10:26'),
(27, '2022-02-08', '114.124.131.79', 14, '1644332047', NULL, '2022-02-08 14:54:07'),
(28, '2022-02-08', '114.124.131.15', 9, '1644332027', NULL, '2022-02-08 14:53:47'),
(29, '2022-02-08', '114.124.130.15', 13, '1644331847', NULL, '2022-02-08 14:50:47'),
(30, '2022-02-08', '176.113.43.89', 1, '1644338721', NULL, NULL),
(31, '2022-02-09', '114.124.131.103', 1, '1644344765', NULL, NULL),
(32, '2022-02-09', '114.124.163.119', 1, '1644344766', NULL, NULL),
(33, '2022-02-09', '103.156.88.45', 22, '1644394022', NULL, '2022-02-09 08:07:02'),
(34, '2022-02-09', '18.206.55.48', 6, '1644383494', NULL, '2022-02-09 05:11:34'),
(35, '2022-02-09', '100.26.52.66', 2, '1644388018', NULL, '2022-02-09 06:26:58'),
(36, '2022-02-09', '149.154.161.8', 1, '1644409262', NULL, NULL),
(37, '2022-02-09', '36.74.44.111', 1, '1644409282', NULL, NULL),
(38, '2022-02-10', '103.156.88.45', 11, '1644463084', NULL, '2022-02-10 03:18:04'),
(39, '2022-02-11', '61.164.47.194', 1, '1644537419', NULL, NULL),
(40, '2022-02-11', '103.156.88.45', 4, '1644545448', NULL, '2022-02-11 02:10:48'),
(41, '2022-02-11', '18.206.55.48', 3, '1644549104', NULL, '2022-02-11 03:11:44'),
(42, '2022-02-11', '100.26.52.66', 1, '1644570018', NULL, NULL),
(43, '2022-02-12', '18.206.55.48', 3, '1644675280', NULL, '2022-02-12 14:14:40'),
(44, '2022-02-13', '100.26.52.66', 1, '1644685891', NULL, NULL),
(45, '2022-02-14', '127.0.0.1', 11, '1644856631', NULL, '2022-02-14 16:37:11'),
(46, '2022-02-15', '127.0.0.1', 2, '1644936807', NULL, '2022-02-15 14:53:27'),
(47, '2022-02-17', '127.0.0.1', 1, '1645111182', NULL, NULL),
(48, '2022-02-18', '127.0.0.1', 145, '1645168873', NULL, '2022-02-18 07:21:13'),
(49, '2022-02-19', '127.0.0.1', 372, '1645284472', NULL, '2022-02-19 15:27:52'),
(50, '2022-02-20', '127.0.0.1', 130, '1645374372', NULL, '2022-02-20 16:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`id`, `name`, `phone`, `fax`, `email`, `logo`, `favicon`, `description`, `address`, `tagline`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Badan Penanggulangan  Bencana Daerah Kabupaten Subang', '(0260) 4113251 / 421910', 'ok', 'admin@gmail.com', 'qQdEAcjOmoMXxqyFFciE7ndu3jy2KPc0KLSUPzIG.png', 'lO9LWqyqeX1uKvV3vmP1dg4XQAFVAmwkAmgnNYm4.png', 'Badan Penanggulangan \r\nBencana Daerah', 'Jln.', 'ok', 'Super Admin Website', '2022-01-20 11:01:27', '2022-02-08 14:51:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Indexes for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bencanas`
--
ALTER TABLE `bencanas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desas`
--
ALTER TABLE `desas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fotos_album_id_foreign` (`album_id`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_graphics`
--
ALTER TABLE `info_graphics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_bencanas`
--
ALTER TABLE `jenis_bencanas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kecamatans`
--
ALTER TABLE `kecamatans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasis`
--
ALTER TABLE `lokasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_nip_unique` (`nip`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `article_tag`
--
ALTER TABLE `article_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bencanas`
--
ALTER TABLE `bencanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `desas`
--
ALTER TABLE `desas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_graphics`
--
ALTER TABLE `info_graphics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_bencanas`
--
ALTER TABLE `jenis_bencanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kecamatans`
--
ALTER TABLE `kecamatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `lokasis`
--
ALTER TABLE `lokasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
