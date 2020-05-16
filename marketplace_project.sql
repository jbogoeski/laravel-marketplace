-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2020 at 12:56 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketplace_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(5, '2020_05_13_141645_create_projects_table', 2);

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
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `contractor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `skills` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `owner_id`, `contractor_id`, `title`, `description`, `skills`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 0, NULL, 'dada', 'dada', '', 0, NULL, NULL),
(23, 1, NULL, 'Blog for my website', 'Need blog for my website.', 'PHP', 1, '2020-05-14 18:47:14', '2020-05-16 08:49:43'),
(24, 1, 3, 'CMS Development', 'The website is developed on a built-from-scratch WordPress template. There are no plans to switch to an off-the-shelf theme or other CMS, however they may be open to it if the value is clear.\n\nAbout twice a year the organization has a round of updates that may include:\n\n- New content types & templates, including custom fields\n- Updates & redesigns of existing templates\n- Plugin additions & configuration\n\nFrom time to time, there may also be hosting issues that require support.\n\nCurrently, they are looking to expand on an existing content type to include a search and filter experience. This expansion has to potential to include development of a public facing \'application\' submission form that feeds into this content type.\n\nThere are additional tasks in this round of updates as well.\n\nThe person who replaces me will be:\n\n- a thoughtful visual designer\n- a detailed HTML/CSS coder\n- a handy javascript hacker (minimum)\n- a familiar and flexible WordPress developer\n- and a trusted client partner\n\nHowever, if your best friend wouldn\'t call you a visual designer, I don\'t mind continuing to work in that role along side you :)', 'PHP, WordPress', 1, '2020-05-15 16:42:31', '2020-05-16 08:49:35'),
(25, 1, NULL, 'Education website', 'Website will be for online learning and need to integrate Virtual classroom such as BrainCert,\nall pages should be in a very simple design no need for more Photos,\nall pages will be in the Arabic language, PaymentGatyw integration, Student dashboard, Teacher Dashboard plus Admin panel', 'PHP', 1, '2020-05-15 16:42:57', '2020-05-16 08:49:10'),
(28, 3, NULL, 'Website for my bussines', 'Hi everyone i need website for my bussines.', 'PHP, Laravel', 1, '2020-05-16 06:27:11', '2020-05-16 08:52:09'),
(29, 3, 1, 'Wordpress widget', 'I need widget for my wordpress e-commerce, need to show the new products.', 'Wordpress, PHP', 1, '2020-05-16 06:28:56', '2020-05-16 08:51:53'),
(30, 3, NULL, 'Need to update e-commerce site', 'We should update our website.\nMaybe you should have enough experience in PHP and  CMS development and customize it.\nIf you update it  successfully and perfectly', 'PHP', 1, '2020-05-16 06:38:47', '2020-05-16 08:52:02'),
(31, 2, NULL, 'Woo Commerce Expert', 'I am looking for an individual/agency that could provide my ongoing development and support for various Wordpress-WooCommerce projects.', 'PHP, WordPress', 1, '2020-05-16 06:41:38', '2020-05-16 08:53:11'),
(32, 2, NULL, 'PHP CMS expert needed', 'Senior developer talented in CMS development is required.\nDevelopers should have deep knowledge and 3+ years of experience in PHP.', 'PHP, Laravel', 1, '2020-05-16 06:42:28', '2020-05-16 08:53:05'),
(33, 2, NULL, 'Website design', 'I want a website like www.google.com', 'PHP, WordPress', 1, '2020-05-16 06:43:10', '2020-05-16 08:52:55'),
(34, 2, NULL, 'Game Developer needed for online card game', 'I am looking for someone who is deeply passionate about creating great multiplayer games and longs to make a career in game development.', 'PHP', 1, '2020-05-16 06:45:02', '2020-05-16 08:52:48');

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
(1, 'Jane', 'bogoeski@example.com', NULL, '$2y$10$VJlg766dcJ01bUuCNgktKuYQ/ya6n9Z5VEtZcOGhbnCXkCLBgQ36C', NULL, '2020-05-13 10:33:57', '2020-05-13 10:33:57'),
(2, 'bogoeski', 'bogoeski@test.com', NULL, '$2y$10$L7at37e5Tm7qROnrB4StLuAZoPRO5aKlpY/FaRsRvMjLnVDT73zQW', NULL, '2020-05-15 18:30:29', '2020-05-15 18:30:29'),
(3, 'Marko', 'marko@test.com', NULL, '$2y$10$V72jvVtRj/5GZSeLKRBqmOZQldrWWVPzi0gpOiZNTr9BSeiX42Ka6', NULL, '2020-05-16 06:25:58', '2020-05-16 06:25:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `projects`
--
ALTER TABLE `projects`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
