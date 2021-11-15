-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2021 at 10:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userlist`
--

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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
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
(288, '2014_10_12_000000_create_users_table', 1),
(289, '2014_10_12_100000_create_password_resets_table', 1),
(290, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(291, '2019_08_19_000000_create_failed_jobs_table', 1),
(292, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(293, '2021_11_06_195400_create_roles_table', 1),
(294, '2021_11_07_164431_create_role_user_table', 1),
(295, '2021_11_09_080059_create_posts_table', 1),
(296, '2021_11_09_080455_create_post_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('y@test.com', '$2y$10$jajP52Nd9yQRnWlYsnAsk..39/wBNa72kW7GnVKZQWerjExrxTfZy', '2021-11-13 06:07:31');

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

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Corrupti quia dolorem facere temporibus eos quae.', 'Architecto rerum quo commodi dolores hic atque. Repellat odit qui pariatur mollitia adipisci. Distinctio eos placeat minus optio quia vel est.', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(2, 'Voluptate earum voluptatum inventore earum dignissimos.', 'Nihil officia iste et consequatur distinctio. Molestiae minima et nostrum sit. Praesentium et eos deleniti cum molestiae', '2021-11-13 04:36:25', '2021-11-13 05:06:21'),
(3, 'Necessitatibus aut voluptas rerum.', 'Sit ratione minus consequatur et laudantium. Et incidunt fugit adipisci molestiae atque. Velit ut quibusdam omnis laborum. Et qui ut id doloribus quam sit qui. Quia sit et quae sunt porro.', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(4, 'Enim impedit et nam voluptatem optio.', 'Quis eligendi consequatur perferendis porro. Ullam pariatur aliquid ratione ut ipsa cumque. Omnis qui sit ipsa omnis.', '2021-11-13 04:36:26', '2021-11-13 04:36:26'),
(5, 'Excepturi commodi repellat iste quas ea in sed assumenda.', 'Doloremque laborum atque nihil omnis. Ex ullam neque ut beatae assumenda porro. Aut sunt sunt quam ut perspiciatis. Vero dolorum pariatur ut.', '2021-11-13 04:36:26', '2021-11-13 04:36:26'),
(6, 'Laboriosam nesciunt est aut et facilis.', 'Qui voluptatibus illo est et. Sequi facilis voluptas explicabo accusantium placeat totam ratione. Ducimus et et accusamus nemo velit.', '2021-11-13 04:36:26', '2021-11-13 04:36:26'),
(7, 'Et ut dicta et reiciendis.', 'Quia expedita tempore nihil reprehenderit voluptas dolor voluptas. Aut animi corporis dolor et doloribus. Facilis eum suscipit doloribus exercitationem in qui explicabo adipisci. Ea officia est qui voluptatem adipisci et.', '2021-11-13 04:36:26', '2021-11-13 04:36:26'),
(8, 'Pariatur dolor sit omnis dolorum fugit.', 'Sapiente a cum voluptatum nobis nam non quos. Sint officia sed corporis reiciendis illo perferendis tempore.', '2021-11-13 04:36:26', '2021-11-13 04:36:26'),
(9, 'Rerum qui soluta sunt et et labore.', 'Iste consequatur nobis quia reiciendis maxime quia. Doloremque saepe soluta dolor et. In harum architecto et tempora quae velit.', '2021-11-13 04:36:26', '2021-11-15 03:00:20'),
(10, 'Aspernatur quia nulla et nam.', 'Ut labore dolorem non iste. Asperiores asperiores fugit adipisci quis itaque ipsa.', '2021-11-13 04:36:26', '2021-11-13 05:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 1, NULL, NULL),
(2, 8, 2, NULL, NULL),
(4, 7, 4, NULL, NULL),
(5, 8, 5, NULL, NULL),
(6, 6, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `created_at`, `updated_at`, `role_id`, `user_id`) VALUES
(1, NULL, NULL, 2, 1),
(2, NULL, NULL, 1, 2),
(3, NULL, NULL, 2, 3),
(4, NULL, NULL, 1, 4),
(5, NULL, NULL, 2, 5),
(6, NULL, NULL, 1, 6),
(7, NULL, NULL, 2, 7),
(8, NULL, NULL, 1, 8),
(10, NULL, NULL, 1, 10),
(11, NULL, NULL, 1, 11),
(12, NULL, NULL, 2, 11),
(13, NULL, NULL, 2, 12),
(14, NULL, NULL, 2, 13);

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
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zackery Bernhard', 'imorar@example.net', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '0yHanwKaoO', '2021-11-13 04:36:24', '2021-11-13 04:36:24'),
(2, 'Giles Farrell MD', 'angel.ebert@example.org', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '1EDFahoe2W', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(3, 'Miss Lyda Larkin I', 'gwalsh@example.org', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'smaKoRjkgP', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(4, 'Julian Purdy II', 'yschuppe@example.net', '2021-11-13 04:36:24', '$2y$10$lltDe/7DEWOkAOf5MagWYeKqYYaDIqMf6VsK5xptizo39mSMlxtiS', NULL, NULL, 'ZWGXDFeeCFvvcCUkYXrEny5sF6NIuvJsqS8bT556Luu39A4Ih4h492Dfsq60', '2021-11-13 04:36:25', '2021-11-13 04:41:30'),
(5, 'Loren Bogisich', 'lorenza26@example.com', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '3lvzE7T6Ar', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(6, 'Trace Lynch', 'rylee27@example.net', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'wkXtSdOHz4', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(7, 'Merle Altenwerth', 'hsauer@example.net', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'KPZcdI2UY1', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(8, 'Maryam Mraz', 'ghuel@example.org', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'qZYBxgwi3Z', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(10, 'Carlee Buckridge', 'hilario.glover@example.com', '2021-11-13 04:36:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'DaHu9bCdqw', '2021-11-13 04:36:25', '2021-11-13 04:36:25'),
(11, 'Norayr Isahakyan', 'norayrisahakyan@gmail.com', '2021-11-13 04:43:21', '$2y$10$FMy9MDu6SqFukC/VHAaP2uEH9.diiHRpX2iUHJ3KmR88PwCPWF5iG', NULL, NULL, 'IIuUIpsdrUhoWA477iEicvSKbdUNcjaPtKeywREVBo9WNUFn7RzL1hPBJd2w', '2021-11-13 04:42:11', '2021-11-13 04:43:21'),
(12, 'tiop1', 'tiop@ty.ty', '2021-11-13 05:05:56', '$2y$10$Z3WsAvAbNMXqfjSYrrHCT.EcM5.4mjDNwrMi.CBv7DNnHs15hGbve', NULL, NULL, 'EsmEP7atYq3b1c1hpFqqweVA73cMzgtYR0J7Mbw0eYjJlbKBzrVQarHIX0SX', '2021-11-13 04:45:06', '2021-11-13 05:05:56'),
(13, 'your test', 'y@test.com', NULL, '34343434', NULL, NULL, NULL, '2021-11-13 06:07:31', '2021-11-13 06:07:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`),
  ADD KEY `post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
