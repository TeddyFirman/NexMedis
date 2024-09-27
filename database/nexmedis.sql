-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 27, 2024 at 04:10 AM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nexmedis`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `pembuat_komen` bigint(20) UNSIGNED NOT NULL,
  `isi_komen` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `pembuat_komen`, `isi_komen`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 'ini komen ku teddyf', '2024-09-27 02:48:33', '2024-09-27 02:48:33'),
(2, 4, 2, 'ini komen ku teddyf 2', '2024-09-27 02:48:40', '2024-09-27 02:48:40'),
(3, 1, 2, 'ini komen ku teddyf 2 wkwk', '2024-09-27 02:48:55', '2024-09-27 02:48:55'),
(4, 2, 2, 'ini komen ku user', '2024-09-27 02:49:03', '2024-09-27 02:49:03'),
(5, 5, 2, 'ini komen ku user banya', '2024-09-27 02:49:10', '2024-09-27 02:49:10'),
(6, 7, 2, 'ini komen ku user banya', '2024-09-27 02:49:14', '2024-09-27 02:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_07_125550_create_permission_tables', 1),
(6, '2024_02_07_135142_create_posts_table', 1),
(7, '2024_02_07_140048_create_comments_table', 1),
(8, '2024_09_26_121857_add_file_to_posts_table', 2),
(9, '2024_09_26_132952_create_likes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '1c72d1ccfc96b3aebca6b7f543ff477b549482c9055627968e3bc5282266896f', '[\"*\"]', NULL, NULL, '2024-09-26 04:41:20', '2024-09-26 04:41:20'),
(2, 'App\\Models\\User', 3, 'auth_token', 'dec31f31eaaf949c74217445ffe0a4e671ae1fff0fe724ddff0961bb8c555665', '[\"*\"]', '2024-09-26 06:59:37', NULL, '2024-09-26 04:42:02', '2024-09-26 06:59:37'),
(3, 'App\\Models\\User', 3, 'auth_token', 'b295c9cffb71e1fdb4abec14803555d92e83fd58839e00b88ed2446a92dac340', '[\"*\"]', '2024-09-26 05:49:02', NULL, '2024-09-26 05:44:46', '2024-09-26 05:49:02'),
(4, 'App\\Models\\User', 3, 'auth_token', 'f482e371ba4da53bb08773f57f9ae5aab6b9cc6c861db7608f1f552e0f7dbeca', '[\"*\"]', '2024-09-26 05:54:48', NULL, '2024-09-26 05:49:12', '2024-09-26 05:54:48'),
(5, 'App\\Models\\User', 2, 'auth_token', '9b3e794092b3c6805735a57d79bc97dae8ca16ef296ca6e3c30dd2b5bf691f79', '[\"*\"]', '2024-09-26 05:55:27', NULL, '2024-09-26 05:55:03', '2024-09-26 05:55:27'),
(6, 'App\\Models\\User', 3, 'auth_token', '84a5b07967c0dd774ce9d3b69446565ce77e9874375372954f9e8d394964682f', '[\"*\"]', '2024-09-26 10:20:37', NULL, '2024-09-26 05:55:40', '2024-09-26 10:20:37'),
(7, 'App\\Models\\User', 4, 'auth_token', 'a2df4370368c1a0c9bc31429dda8e565e5f6759877b58a335d3d83599e7637a9', '[\"*\"]', '2024-09-26 07:05:52', NULL, '2024-09-26 07:03:44', '2024-09-26 07:05:52'),
(8, 'App\\Models\\User', 2, 'auth_token', '158002362e6a16b558bcea7fe3a75cbfff0a2a9073acfd383a2940eac0945f20', '[\"*\"]', '2024-09-26 10:21:08', NULL, '2024-09-26 08:07:16', '2024-09-26 10:21:08'),
(9, 'App\\Models\\User', 3, 'auth_token', 'f80c385751c49acfd56b00ff6010113946248b54c683a0911ccf6b8d5c29e54d', '[\"*\"]', '2024-09-26 10:24:17', NULL, '2024-09-26 10:22:08', '2024-09-26 10:24:17'),
(10, 'App\\Models\\User', 3, 'auth_token', '075bb1260f0614e32c15db27fc17a13d2f027dab29a919dd04a491adaf8c26fe', '[\"*\"]', '2024-09-26 12:54:40', NULL, '2024-09-26 11:53:50', '2024-09-26 12:54:40'),
(11, 'App\\Models\\User', 2, 'auth_token', 'e246beb0d45571c9dd3bbd3af95de5d922d7df4562a59c535b07d3988fbbbc4c', '[\"*\"]', '2024-09-27 02:49:38', NULL, '2024-09-27 02:47:49', '2024-09-27 02:49:38'),
(12, 'App\\Models\\User', 2, 'auth_token', 'd1f38ff85e3fce2c339e325929e05e24dfb582fe759ac5f1f8d65908b9a00182', '[\"*\"]', NULL, NULL, '2024-09-27 02:55:42', '2024-09-27 02:55:42'),
(13, 'App\\Models\\User', 5, 'auth_token', 'cadf70e18b9a6391f1a68f612cf65f386c1abb5814b0958397143b24e0e504b2', '[\"*\"]', NULL, NULL, '2024-09-27 02:56:29', '2024-09-27 02:56:29'),
(14, 'App\\Models\\User', 2, 'auth_token', 'ae7d68a79a37365aa09773c7b126cddf7ac35724b97e67a58af5e6f5dff2739e', '[\"*\"]', NULL, NULL, '2024-09-27 03:10:07', '2024-09-27 03:10:07'),
(15, 'App\\Models\\User', 2, 'auth_token', 'f3c4be66e7e1aa6cc31cf5de3dc0e95d1ce4277f9c6350c9c3ecb493c4bc7efb', '[\"*\"]', NULL, NULL, '2024-09-27 03:18:46', '2024-09-27 03:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judulPost` varchar(255) NOT NULL,
  `postingan` longtext NOT NULL,
  `pembuat_post` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fileImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `judulPost`, `postingan`, `pembuat_post`, `created_at`, `updated_at`, `fileImage`) VALUES
(1, 'postingan 1', 'isi postingan 1', 3, '2024-09-26 05:31:55', '2024-09-26 05:31:55', NULL),
(2, 'postingan 2 edit', 'edit isi postingan 2', 3, '2024-09-26 05:32:45', '2024-09-26 10:24:20', '1727346260.png'),
(4, 'postingan 3 dengan gambar', 'isi postingan 3', 2, '2024-09-26 09:55:32', '2024-09-26 09:55:32', '1727344532.jpeg'),
(5, 'postingan 3 dengan gambar LAMM', 'isi postingan 3 space', 3, '2024-09-26 12:05:12', '2024-09-26 12:28:30', '1727353709.png'),
(7, 'postingan 3 dengan gambar LAMM', 'isi postingan 3 space', 3, '2024-09-26 12:54:43', '2024-09-26 12:54:43', '1727355282.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-09-26 04:39:33', '2024-09-26 04:39:33'),
(2, 'user', 'web', '2024-09-26 04:39:33', '2024-09-26 04:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$zESOLJr2AijuXw6x.FEcUeC55esXBwONm1JzuWOvHhFX0zQl1WiA6', NULL, '2024-09-26 04:39:34', '2024-09-26 04:39:34'),
(2, 'User', 'user@gmail.com', NULL, '$2y$12$ega63swpV7y2fhPW8gOuZuXCUOjd/RCyNZyWPgD9TXOSjrwkexH/q', NULL, '2024-09-26 04:39:34', '2024-09-26 04:39:34'),
(3, 'lamm', 'lamm@gmail.com', NULL, '$2y$12$mtOQremwFLRllmS3e2w0be.OP31Z5YX3.t2sVMZnkCYv5NH3sd7Di', NULL, '2024-09-26 04:41:19', '2024-09-26 04:41:19'),
(4, 'ian', 'ian@gmail.com', NULL, '$2y$12$.G04QU2ptpsqrid8bTAY6.r3X/JE5O/wHDjj17Su4bQ/0TulWS36i', NULL, '2024-09-26 07:03:44', '2024-09-26 07:03:44'),
(5, 'nilamsty', 'nilamsty@gmail.com', NULL, '$2y$12$OZXCwbBxWFv80SeHUNKm4.NrAc35w1L0RTrKVyyEe1ZxkT4ifhYQ2', NULL, '2024-09-27 02:56:29', '2024-09-27 02:56:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_pembuat_komen_foreign` (`pembuat_komen`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_pembuat_post_foreign` (`pembuat_post`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_pembuat_komen_foreign` FOREIGN KEY (`pembuat_komen`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_pembuat_post_foreign` FOREIGN KEY (`pembuat_post`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
