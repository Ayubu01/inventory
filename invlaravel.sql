-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 15, 2024 at 07:06 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invlaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'viatu', '2024-06-13 20:12:52', '2024-06-13 20:12:52'),
(2, 'Nguo', '2024-06-18 02:21:30', '2024-06-18 02:21:30'),
(3, 'Vyombo', '2024-06-18 02:22:15', '2024-06-18 02:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `nama`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`) VALUES
(2, 'kevin', 'upanga', 'kevinmranda042@gmail.com', '0787504956', '2024-06-18 02:14:43', '2024-06-18 02:14:43'),
(3, 'Noel Godson', 'Tabata', 'noel@gmail.com', '0765789745', '2024-06-18 02:25:37', '2024-06-18 02:25:37'),
(4, 'Juma', 'Ilala', 'juma@gmail.com', '0787598467', '2024-06-18 02:30:47', '2024-06-18 02:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_12_18_035002_create_customers_table', 1),
(4, '2018_12_18_035015_create_sales_table', 1),
(5, '2018_12_18_035038_create_suppliers_table', 1),
(6, '2018_12_18_041830_create_categories_table', 1),
(7, '2018_12_18_042809_create_products_table', 1),
(8, '2018_12_18_043146_create_product_masuk_table', 1),
(9, '2018_12_18_043233_create_product_keluar_table', 1),
(10, '2018_12_19_044911_add_field_role_to_table_users', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `nama`, `harga`, `image`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 'official shoes', 100000, '/upload/products/official-shoes.jpg', 13, '2024-06-18 01:19:44', '2024-07-15 00:32:26'),
(2, 2, 'Jeans', 20000, '/upload/products/jeans.jpg', 200, '2024-06-18 02:22:56', '2024-07-01 00:04:20'),
(3, 3, 'Masufuria', 35000, '/upload/products/masufuria.jpg', 240, '2024-06-18 02:24:43', '2024-06-18 05:45:45'),
(4, 2, 'Vitenge', 10000, '/upload/products/vitenge.jpeg', 500, '2024-07-15 01:11:00', '2024-07-15 05:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_keluar`
--

DROP TABLE IF EXISTS `product_keluar`;
CREATE TABLE IF NOT EXISTS `product_keluar` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_keluar_product_id_foreign` (`product_id`),
  KEY `product_keluar_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_keluar`
--

INSERT INTO `product_keluar` (`id`, `product_id`, `customer_id`, `qty`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 60, '2024-06-17', '2024-06-18 01:24:41', '2024-06-18 05:45:45'),
(2, 3, 2, 40, '2024-06-17', '2024-06-18 04:03:53', '2024-06-18 04:05:00'),
(3, 3, 3, 60, '2024-06-17', '2024-06-18 04:10:33', '2024-06-18 04:10:33'),
(7, 3, 4, 60, '2024-06-17', '2024-06-18 04:32:48', '2024-06-18 04:32:48'),
(10, 1, 4, 5, '2024-07-01', '2024-07-15 00:32:26', '2024-07-15 00:32:26'),
(12, 4, 2, 50, '2024-07-15', '2024-07-15 05:34:58', '2024-07-15 05:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_masuk`
--

DROP TABLE IF EXISTS `product_masuk`;
CREATE TABLE IF NOT EXISTS `product_masuk` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `supplier_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_masuk_product_id_foreign` (`product_id`),
  KEY `product_masuk_supplier_id_foreign` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_masuk`
--

INSERT INTO `product_masuk` (`id`, `product_id`, `supplier_id`, `qty`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 30, '2024-06-18', '2024-06-18 01:21:36', '2024-06-18 12:54:47'),
(2, 3, 4, 700, '2024-06-17', '2024-06-18 04:06:50', '2024-06-18 04:06:50'),
(3, 3, 4, 60, '2024-06-17', '2024-06-18 05:44:47', '2024-06-18 05:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `nama`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'Ayubu Vedastus', 'Mikocheni', 'ayubusylivester496@gmail.com', '0787695784', '2024-06-18 01:20:45', '2024-06-18 01:20:45'),
(4, 'Juma', 'Ilala', 'juma@gmail.com', '0787598467', '2024-06-18 03:31:52', '2024-06-18 03:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','staff') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'staff',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(5, 'Staff', 'staff@mail.com', '$2y$10$pje79JgDWTw20Dw9f6KHwuI3jfhlV4OYSGmo9VIXkQE7zCXszpFlO', NULL, '2024-06-18 01:33:41', NULL, 'staff'),
(6, 'hamis', 'ayubusyliveste96@gmail.com', '$2y$10$m.sSCrkFUrnr7XdVk2XwXuek9rg9O1FCyFURUhpF9iuHXRfozfHH6', 'sSuvlVXY2Iw2YkBmc5bRTRX6gCfvQGtmas6qAatySAjyXPgoApwHFR8mNCI5', '2024-06-18 02:07:42', '2024-06-18 02:07:42', 'staff'),
(4, 'Ayoub Vedastus', 'ayubusylivester496@gmail.com', '$2y$10$V4cP50oE1GDsc/Ly2bwfS.SLmneK00oYpOlyP8W4qwCBs2TaIK/rq', 'prut8sqBHZ1CBYLyr3JOXFya33u8BTM5ibF6BeIp8lHDAM15nBL6ZMhxkFnc', '2024-06-18 01:33:41', NULL, 'admin'),
(8, 'tester', 'tester@gmail.com', '$2y$10$uXmwl3rzU.8AZgU/bulRt.it722CnDv7OC2Pt7qlUUsj4eVyYcr3i', NULL, '2024-07-15 01:42:02', '2024-07-15 01:42:02', 'staff');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
