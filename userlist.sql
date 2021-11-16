-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2021 at 07:34 PM
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
(166, '2014_10_12_000000_create_users_table', 1),
(167, '2014_10_12_100000_create_password_resets_table', 1),
(168, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(169, '2019_08_19_000000_create_failed_jobs_table', 1),
(170, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(171, '2021_11_06_195400_create_roles_table', 1),
(172, '2021_11_07_164431_create_role_user_table', 1),
(173, '2021_11_09_080059_create_posts_table', 1),
(174, '2021_11_09_080455_create_post_user_table', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Nisi voluptates reprehenderit ipsum nostrum rem natus pariatur.', 'Distinctio unde qui neque vel repudiandae excepturi velit. Non amet omnis et suscipit. Consectetur quasi odit exercitationem aut praesentium eum iusto. Sunt dolorem libero sint rem ea.', 'https://via.placeholder.com/640x480.png/004455?text=doloremque', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(2, 'Dignissimos atque maiores voluptatibus ea fugiat sunt.', 'Ut exercitationem et repellendus veritatis aut. Est eveniet sit fuga consectetur id consequatur. Sunt ab sit mollitia amet pariatur eligendi culpa. Velit atque excepturi ex sunt rerum quia.', 'https://via.placeholder.com/640x480.png/00cccc?text=eos', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(3, 'Est incidunt nulla nulla.', 'Omnis ut ex dicta est cumque. Consequatur fuga ad voluptatem quaerat ipsum. Laborum beatae earum dolor adipisci. Enim odio aut ut deleniti.', 'https://via.placeholder.com/640x480.png/00aaee?text=a', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(4, 'Ab repellendus aspernatur est rem unde aut veniam.', 'Vel non velit quas et consectetur in at omnis. Est quo laudantium est veniam. Id est aliquam voluptatem repudiandae nam est ea aut. Unde provident dolores suscipit consequatur sunt delectus perferendis aut.', 'https://via.placeholder.com/640x480.png/003311?text=sint', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(5, 'Ex ut molestiae hic autem qui dolores temporibus illo.', 'Vero pariatur laborum repellendus veritatis et et doloribus. Aut quo voluptas dolore deleniti ullam. Repellendus neque quidem minima accusamus. Adipisci expedita nesciunt labore est illum unde perferendis.', 'https://via.placeholder.com/640x480.png/009933?text=quibusdam', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(6, 'Error non odio minus vitae exercitationem excepturi illum voluptas.', 'Rerum distinctio tenetur accusamus recusandae alias. Inventore exercitationem accusamus voluptate consequatur recusandae. Maxime saepe est quo qui. Sunt autem et ipsum deserunt molestiae autem.', 'https://via.placeholder.com/640x480.png/00aaff?text=quia', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(8, 'Ut officia est repudiandae nostrum sequi atque.', 'Recusandae distinctio maiores dignissimos ab vero nemo rerum. Molestiae nemo praesentium quis qui distinctio atque omnis laboriosam. Architecto exercitationem perspiciatis ut non dolore. Ut quidem est quod eum.', 'https://via.placeholder.com/640x480.png/0088ee?text=eum', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(9, 'Debitis accusamus totam at vel soluta totam aspernatur.', 'Reprehenderit maxime accusamus repellendus ipsam ut voluptatem eum numquam. Pariatur velit at laudantium ipsa repudiandae consequuntur rem. Ducimus porro incidunt rerum aut.', 'https://via.placeholder.com/640x480.png/0022cc?text=odio', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(10, 'Sunt voluptas quidem similique non officiis.', 'Ipsum reiciendis provident voluptas reprehenderit sed. Dolores atque expedita iusto sunt molestiae occaecati. Assumenda minima numquam consequatur eaque maxime cumque odit nesciunt.', 'https://via.placeholder.com/640x480.png/006666?text=est', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(11, 'dfrgthygtnfredmswswmkdefrngt', 'qwertyuioiuytrewawergtyhjukiolikjuyhgtrfdeswdefrgthyjukiolkijuhygtfredwsdefrgthyjuikjuhygtfredfrgthyjujhygtfrdes', 'C:\\xampp\\xampp\\tmp\\phpAC8C.tmp', '2021-11-16 14:26:36', '2021-11-16 14:26:36'),
(12, '4610215155', '12345679984511515111448', 'C:\\xampp\\xampp\\tmp\\phpF984.tmp', '2021-11-16 14:26:56', '2021-11-16 14:26:56');

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
(1, 9, 1, NULL, NULL),
(2, 10, 2, NULL, NULL),
(4, 9, 4, NULL, NULL),
(5, 5, 5, NULL, NULL),
(6, 8, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 9, 8, NULL, NULL),
(9, 8, 9, NULL, NULL),
(10, 9, 10, NULL, NULL);

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
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 1, 2),
(3, NULL, NULL, 1, 3),
(4, NULL, NULL, 1, 4),
(5, NULL, NULL, 2, 5),
(6, NULL, NULL, 2, 6),
(7, NULL, NULL, 2, 7),
(8, NULL, NULL, 2, 8),
(9, NULL, NULL, 2, 9),
(10, NULL, NULL, 2, 10),
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
(1, 'Prof. Eliezer Dibbert Sr.', 'twilkinson@example.org', '2021-11-16 14:18:53', '$2y$10$rR0qKeCzqgiDr4lgD5uoq.2TnvZj1x7Cvu1wpmIxGyQyMv435FU5a', NULL, NULL, 'dHQh5UYO2XhWqcPwNa4DVlEX2MxAtplzw8J557o2z8ZfY4Xvy55iEW9KnAWJ', '2021-11-16 14:18:53', '2021-11-16 14:20:14'),
(2, 'Mrs. Jermaine Zemlak II', 'robin.bogan@example.org', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'F2HTEFVzZ8', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(3, 'Lucile Casper', 'nkuhn@example.com', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'T4cpKmr3pe', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(4, 'Earlene Schimmel', 'deanna25@example.com', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'PjCiRCkw0a', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(5, 'Miss Elyssa Kuhlman', 'feeney.zetta@example.net', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'EA05ebcwMM', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(6, 'Sandra Lebsack I', 'eleanora.beatty@example.net', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'CLnnPN0tTm', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(7, 'Jazmyne Bradtke II', 'mgoldner@example.net', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'NKAcp3fxu1', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(8, 'Antwon Gusikowski', 'kariane.pacocha@example.org', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '6dHticZkG2', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(9, 'Prof. Sylvester Gaylord DVM', 'clare04@example.com', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'W8sPG4PEHk', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(10, 'Prof. Anika Kris', 'samara.witting@example.net', '2021-11-16 14:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2dCQuIjVy2', '2021-11-16 14:18:53', '2021-11-16 14:18:53'),
(11, 'Norayr Isahakyan', 'norayrisahakyan@gmail.com', '2021-11-16 14:23:18', '$2y$10$c5NpFseZgwKKi9DB35Pt0.kwete3D6enwxtav/XyMLDU7Ir8xpQCG', NULL, NULL, '4N7al0wIUpTIGNiCJruI3PKbu0H3bAKp9n6dYi7iiYRmd3xQpq3wJ7hJ0MD5', '2021-11-16 14:21:19', '2021-11-16 14:23:18'),
(12, 'Test 1', 'test1@fol.ui', '2021-11-16 14:24:42', '$2y$10$Be01FRPi6rJ1ENwhrN691OlmGdfiwsGz2m4HkDU49nk7h3r9/wvIi', NULL, NULL, 'Q5qvPEst6ixw1rcP6INh96b5uD2wyklWvqWaFrm4FGdSNTVkTuaOl7ZMqxw9', '2021-11-16 14:21:51', '2021-11-16 14:24:42'),
(13, 'Test 2', 'tetst@gmail.com', '2021-11-16 14:26:15', '$2y$10$zuPXivx1Wubvc0tWY0mHb.6bMuZVMXIGqKvkMlDPKFkqHUfilJUGC', NULL, NULL, 't4LxIm1vMFYNc7KKSoy7lvrkt9cq9oRSmwd5kXsRhK9eVNpVBySWEMTKgwCg', '2021-11-16 14:22:26', '2021-11-16 14:26:15');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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