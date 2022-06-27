-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2022 at 08:01 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apilogin`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `session_id`, `user_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, 1, 44, '2022-06-27 14:26:21', '2022-06-27 14:27:07'),
(2, '3', NULL, 1, 80, '2022-06-27 14:26:28', '2022-06-27 14:26:28'),
(3, '3', NULL, 2, 80, '2022-06-27 14:26:32', '2022-06-27 14:26:32'),
(4, '3', NULL, 2, 80, '2022-06-27 14:26:37', '2022-06-27 14:26:37'),
(5, '3', NULL, 2, 80, '2022-06-27 14:26:38', '2022-06-27 14:26:38'),
(6, '3', NULL, 2, 80, '2022-06-27 14:26:39', '2022-06-27 14:26:39'),
(7, '3', NULL, 2, 80, '2022-06-27 14:26:40', '2022-06-27 14:26:40'),
(8, '3', NULL, 2, 80, '2022-06-27 14:26:43', '2022-06-27 14:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Claudia Marquardt', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(2, 'Mrs. Alison Windler', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(3, 'Monserrat Miller', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(4, 'Layne Hodkiewicz', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(5, 'Haley Mayert', '2022-06-27 14:22:49', '2022-06-27 14:22:49'),
(6, 'Raleigh Leuschke', '2022-06-27 14:22:49', '2022-06-27 14:22:49'),
(7, 'Ibrahim Conn', '2022-06-27 14:22:49', '2022-06-27 14:22:49'),
(8, 'Miss Irma Kub', '2022-06-27 14:22:49', '2022-06-27 14:22:49'),
(9, 'Mr. Kristofer Fahey', '2022-06-27 14:22:49', '2022-06-27 14:22:49'),
(10, 'Ms. Naomi Haley', '2022-06-27 14:22:49', '2022-06-27 14:22:49');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_22_075520_create_categories_table', 1),
(6, '2022_06_22_083343_create_products_table', 1),
(7, '2022_06_22_183912_create_carts_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'API Token', 'bc900947e316a635082408d432f7de5d11abc33d07ad6b55e290b0de8cebe69a', '[\"*\"]', NULL, '2022-06-27 14:24:31', '2022-06-27 14:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category_id`, `description`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'Kiara McClure', '3.30', 7, 'Et sed id minus qui perferendis ut ut. Reiciendis assumenda dignissimos ut repudiandae. Et qui voluptatem velit corporis dolores soluta sapiente. Ducimus ipsam aut quod laborum.', 'C:\\Users\\amart\\AppData\\Local\\Temp\\php7E44.tmp', '2022-06-27 14:22:49', '2022-06-27 14:22:49'),
(2, 'Charlene West', '3.30', 3, 'Voluptate aut cum voluptas a et cupiditate voluptas. Assumenda quam sint officia reiciendis autem. Sit sit qui rem molestiae ut dolor consequuntur. Possimus aut asperiores sit totam delectus.', 'C:\\Users\\amart\\AppData\\Local\\Temp\\php7EA2.tmp', '2022-06-27 14:22:50', '2022-06-27 14:22:50'),
(3, 'Mrs. Viviane Bayer I', '3.30', 7, 'In libero sit et soluta et et. Fuga rem error sequi voluptatem odit aut. Voluptas natus corporis repellat quasi est. Dolor voluptates labore sed quas eos et tempore optio.', 'C:\\Users\\amart\\AppData\\Local\\Temp\\php7EB3.tmp', '2022-06-27 14:22:50', '2022-06-27 14:22:50'),
(4, 'Dr. SigridConnell', '3.30', 9, 'Sapiente sint sed exercitationem labore occaecati enim. Veritatis inventore ea quos in qui pariatur. Est ut reiciendis nobis laudantium reprehenderit temporibus.', 'C:\\Users\\amart\\AppData\\Local\\Temp\\php7EB4.tmp', '2022-06-27 14:22:50', '2022-06-27 14:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Oleta Ondricka I', 'mattie57@example.com', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5Jfk28GKqN', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(2, 'Cornell Casper', 'cromaguera@example.net', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UtdFA9reiK', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(3, 'Mr. Ashton Luettgen', 'monserrat.hammes@example.net', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lXSeBLmNU4', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(4, 'Tad Grady', 'dortha.gerhold@example.net', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PGFDaT8qAC', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(5, 'Dr. Pinkie Cole II', 'zondricka@example.com', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tGPNWWYfMY', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(6, 'Philip Waelchi', 'jazmyne27@example.com', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ITKtFID7ZK', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(7, 'Mrs. Bernadette Eichmann', 'brayan.schultz@example.com', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2qwSyjr8gJ', '2022-06-27 14:22:47', '2022-06-27 14:22:47'),
(8, 'Mrs. Anais Monahan', 'maria.gorczany@example.org', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'C7ntwJV7CT', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(9, 'Kaci Rohan V', 'kling.marilie@example.org', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WtWdGKzLUS', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(10, 'Leone Lebsack III', 'mwest@example.org', '2022-06-27 14:22:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WdQzIbAtB8', '2022-06-27 14:22:48', '2022-06-27 14:22:48'),
(11, 'amar', 'amar@gmail.com', NULL, '$2y$10$RkJkiCRtGv0.6rIUM3bQTeOqFxJqJjIySlulKBK8Yr..vYQ/M6WUa', NULL, '2022-06-27 14:24:31', '2022-06-27 14:24:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
