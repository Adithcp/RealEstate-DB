-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 12, 2023 at 04:31 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'caXr5MveXMkr8L9FKDqsqvaNjvsPnEcQ', 1, '2023-07-18 23:45:17', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 2, 'YJUn93BbQM0nTzyt6LdPbWH0C6EMa5ll', 1, '2023-07-18 23:45:17', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `module` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint UNSIGNED NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/117.0', '10.0.0.2', 0, 1, 'Demo Test', 'info', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(2, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/117.0', '10.0.0.2', 0, 1, 'Demo Test', 'info', '2023-11-10 15:27:55', '2023-11-10 15:27:55'),
(3, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/117.0', '10.0.0.2', 0, 1, 'Demo Test', 'info', '2023-11-12 08:56:09', '2023-11-12 08:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint UNSIGNED NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Design', 0, 'Dormouse, not choosing to notice this question, but hurriedly went on, \'\"--found it advisable to go after that into a pig,\' Alice quietly said, just as I was a table, with a sigh: \'it\'s always.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'Lifestyle', 0, 'Dormouse was sitting on a crimson velvet cushion; and, last of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was very nearly getting up and to stand on their hands and feet, to.', 'published', 2, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'Travel Tips', 0, 'Queen. \'Their heads are gone, if it thought that SOMEBODY ought to be no doubt that it made Alice quite jumped; but she could do, lying down on one side, to look through into the sky. Twinkle.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Healthy', 0, 'I suppose?\' \'Yes,\' said Alice, \'but I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Cat again, sitting on a little girl or a worm. The question is, what did the Dormouse fell asleep.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'Travel Tips', 0, 'I\'m doubtful about the temper of your flamingo. Shall I try the first position in dancing.\' Alice said; but was dreadfully puzzled by the fire, and at once took up the other, looking uneasily at the.', 'published', 2, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'Hotel', 0, 'Dormouse went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was beginning to grow up any more if you\'d like it put more simply--\"Never imagine yourself not to.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'Nature', 0, 'Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to its children, \'Come away, my dears! It\'s high time you were or might have been was not going to.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `record_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `state_id`, `country_id`, `record_id`, `order`, `image`, `is_default`, `status`, `created_at`, `updated_at`, `is_featured`) VALUES
(1, 'Paris', 'paris', 1, 1, NULL, 0, 'cities/location-1.jpg', 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 1),
(2, 'London', 'london', 2, 2, NULL, 0, 'cities/location-2.jpg', 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 1),
(3, 'New York', 'new-york', 3, 3, NULL, 0, 'cities/location-3.jpg', 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 1),
(4, 'Copenhagen', 'copenhagen', 4, 4, NULL, 0, 'cities/location-4.jpg', 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 1),
(5, 'Berlin', 'berlin', 5, 5, NULL, 0, 'cities/location-5.jpg', 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities_translations`
--

CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `nationality`, `order`, `is_default`, `status`, `created_at`, `updated_at`, `code`) VALUES
(1, 'France', 'French', 0, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 'FRA'),
(2, 'England', 'English', 0, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 'UK'),
(3, 'USA', 'Americans', 0, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 'US'),
(4, 'Holland', 'Dutch', 0, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 'HL'),
(5, 'Denmark', 'Danish', 0, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 'DN'),
(6, 'Germany', 'Danish', 0, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17', 'DN');

-- --------------------------------------------------------

--
-- Table structure for table `countries_translations`
--

CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_1', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(2, 'widget_total_2', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(3, 'widget_total_themes', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(4, 'widget_total_3', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(5, 'widget_total_4', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(6, 'widget_total_users', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(7, 'widget_total_pages', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(8, 'widget_total_plugins', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(9, 'widget_analytics_general', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(10, 'widget_analytics_page', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(11, 'widget_analytics_browser', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(12, 'widget_analytics_referrer', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(13, 'widget_posts_recent', '2023-11-09 17:59:58', '2023-11-09 17:59:58'),
(14, 'widget_audit_logs', '2023-11-09 17:59:58', '2023-11-09 17:59:58');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint UNSIGNED NOT NULL,
  `widget_id` bigint UNSIGNED NOT NULL,
  `order` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'How JobBox Work?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'Why do we use it?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'Where can I get some?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'Where does it come from?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(8, 'How JobBox Work?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(9, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(10, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(11, 'Why do we use it?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(12, 'Where can I get some?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(13, 'Where does it come from?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(14, 'How JobBox Work?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(15, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(16, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(17, 'Why do we use it?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(18, 'Where can I get some?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(19, 'Where does it come from?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 4, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(20, 'How JobBox Work?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 4, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(21, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 4, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(22, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 4, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(23, 'Why do we use it?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 4, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(24, 'Where can I get some?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 4, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `faqs_translations`
--

CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'Buying', 1, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'Payment', 2, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Support', 3, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories_translations`
--

CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` bigint UNSIGNED NOT NULL,
  `lang_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` bigint UNSIGNED NOT NULL,
  `lang_meta_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_meta`
--

INSERT INTO `language_meta` (`lang_meta_id`, `lang_meta_code`, `lang_meta_origin`, `reference_id`, `reference_type`) VALUES
(1, 'en_US', 'fe80a911708fcb7f60013460fd1de64f', 1, 'Botble\\Menu\\Models\\MenuLocation'),
(2, 'en_US', '06c452e08363a00846a6c916e11152fb', 1, 'Botble\\Menu\\Models\\Menu'),
(3, 'en_US', '8b7d759581088c0eeeafd1ce10f6bdb6', 2, 'Botble\\Menu\\Models\\Menu'),
(4, 'en_US', '18ca33f6cbb285269dff813e8c7b27b9', 3, 'Botble\\Menu\\Models\\Menu');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'location-1', 'location-1', 1, 'image/jpeg', 4881, 'cities/location-1.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(2, 0, 'location-2', 'location-2', 1, 'image/jpeg', 4881, 'cities/location-2.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(3, 0, 'location-3', 'location-3', 1, 'image/jpeg', 4881, 'cities/location-3.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(4, 0, 'location-4', 'location-4', 1, 'image/jpeg', 4881, 'cities/location-4.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(5, 0, 'location-5', 'location-5', 1, 'image/jpeg', 4881, 'cities/location-5.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(6, 0, '1', '1', 2, 'image/jpeg', 2165, 'accounts/1.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(7, 0, '10', '10', 2, 'image/jpeg', 2165, 'accounts/10.jpg', '[]', '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(8, 0, '2', '2', 2, 'image/jpeg', 2165, 'accounts/2.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(9, 0, '3', '3', 2, 'image/jpeg', 2165, 'accounts/3.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(10, 0, '4', '4', 2, 'image/jpeg', 2165, 'accounts/4.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(11, 0, '5', '5', 2, 'image/jpeg', 2165, 'accounts/5.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(12, 0, '6', '6', 2, 'image/jpeg', 2165, 'accounts/6.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(13, 0, '7', '7', 2, 'image/jpeg', 2165, 'accounts/7.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(14, 0, '8', '8', 2, 'image/jpeg', 2165, 'accounts/8.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(15, 0, '9', '9', 2, 'image/jpeg', 2165, 'accounts/9.jpg', '[]', '2023-07-18 23:45:18', '2023-07-18 23:45:18', NULL),
(16, 0, '01', '01', 3, 'image/jpeg', 34029, 'backgrounds/01.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(17, 0, '02', '02', 3, 'image/jpeg', 34029, 'backgrounds/02.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(18, 0, '03', '03', 3, 'image/jpeg', 34029, 'backgrounds/03.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(19, 0, '04', '04', 3, 'image/jpeg', 34029, 'backgrounds/04.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(20, 0, 'hero', 'hero', 3, 'image/jpeg', 12672, 'backgrounds/hero.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(21, 0, 'map', 'map', 3, 'image/png', 25344, 'backgrounds/map.png', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(22, 0, '01', '01', 4, 'image/jpeg', 1307, 'clients/01.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(23, 0, '02', '02', 4, 'image/jpeg', 1307, 'clients/02.jpg', '[]', '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(24, 0, '03', '03', 4, 'image/jpeg', 1307, 'clients/03.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(25, 0, '04', '04', 4, 'image/jpeg', 1307, 'clients/04.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(26, 0, '05', '05', 4, 'image/jpeg', 1307, 'clients/05.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(27, 0, '06', '06', 4, 'image/jpeg', 1307, 'clients/06.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(28, 0, '07', '07', 4, 'image/jpeg', 1307, 'clients/07.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(29, 0, '08', '08', 4, 'image/jpeg', 1307, 'clients/08.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(30, 0, 'amazon', 'amazon', 4, 'image/png', 1178, 'clients/amazon.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(31, 0, 'google', 'google', 4, 'image/png', 1178, 'clients/google.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(32, 0, 'lenovo', 'lenovo', 4, 'image/png', 1178, 'clients/lenovo.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(33, 0, 'paypal', 'paypal', 4, 'image/png', 1178, 'clients/paypal.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(34, 0, 'shopify', 'shopify', 4, 'image/png', 1178, 'clients/shopify.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(35, 0, 'spotify', 'spotify', 4, 'image/png', 1178, 'clients/spotify.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(36, 0, 'about', 'about', 5, 'image/jpeg', 11053, 'general/about.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(37, 0, 'error', 'error', 5, 'image/png', 7124, 'general/error.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(38, 0, 'favicon', 'favicon', 5, 'image/png', 6145, 'general/favicon.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(39, 0, 'logo-authentication-page', 'logo-authentication-page', 5, 'image/png', 2683, 'general/logo-authentication-page.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(40, 0, 'logo-dark', 'logo-dark', 5, 'image/png', 2597, 'general/logo-dark.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(41, 0, 'logo-light', 'logo-light', 5, 'image/png', 2626, 'general/logo-light.png', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(42, 0, '1', '1', 6, 'image/jpeg', 2165, 'properties/1.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(43, 0, '10', '10', 6, 'image/jpeg', 2165, 'properties/10.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(44, 0, '11', '11', 6, 'image/jpeg', 2165, 'properties/11.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(45, 0, '12', '12', 6, 'image/jpeg', 2165, 'properties/12.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(46, 0, '2', '2', 6, 'image/jpeg', 2165, 'properties/2.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(47, 0, '3', '3', 6, 'image/jpeg', 2165, 'properties/3.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(48, 0, '4', '4', 6, 'image/jpeg', 2165, 'properties/4.jpg', '[]', '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(49, 0, '5', '5', 6, 'image/jpeg', 2165, 'properties/5.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(50, 0, '6', '6', 6, 'image/jpeg', 2165, 'properties/6.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(51, 0, '7', '7', 6, 'image/jpeg', 2165, 'properties/7.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(52, 0, '8', '8', 6, 'image/jpeg', 2165, 'properties/8.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(53, 0, '9', '9', 6, 'image/jpeg', 2165, 'properties/9.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(54, 0, '1-1', '1-1', 6, 'image/jpeg', 2165, 'properties/1-1.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(55, 0, '2-1', '2-1', 6, 'image/jpeg', 2165, 'properties/2-1.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(56, 0, '3-1', '3-1', 6, 'image/jpeg', 2165, 'properties/3-1.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(57, 0, '4-1', '4-1', 6, 'image/jpeg', 2165, 'properties/4-1.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(58, 0, '5-1', '5-1', 6, 'image/jpeg', 2165, 'properties/5-1.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(59, 0, '1', '1', 7, 'image/jpeg', 2165, 'news/1.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(60, 0, '10', '10', 7, 'image/jpeg', 2165, 'news/10.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(61, 0, '11', '11', 7, 'image/jpeg', 2165, 'news/11.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(62, 0, '12', '12', 7, 'image/jpeg', 2165, 'news/12.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(63, 0, '13', '13', 7, 'image/jpeg', 2165, 'news/13.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(64, 0, '14', '14', 7, 'image/jpeg', 2165, 'news/14.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(65, 0, '15', '15', 7, 'image/jpeg', 2165, 'news/15.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(66, 0, '16', '16', 7, 'image/jpeg', 2165, 'news/16.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(67, 0, '2', '2', 7, 'image/jpeg', 2165, 'news/2.jpg', '[]', '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL),
(68, 0, '3', '3', 7, 'image/jpeg', 2165, 'news/3.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL),
(69, 0, '4', '4', 7, 'image/jpeg', 2165, 'news/4.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL),
(70, 0, '5', '5', 7, 'image/jpeg', 2165, 'news/5.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL),
(71, 0, '6', '6', 7, 'image/jpeg', 2165, 'news/6.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL),
(72, 0, '7', '7', 7, 'image/jpeg', 2165, 'news/7.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL),
(73, 0, '8', '8', 7, 'image/jpeg', 2165, 'news/8.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL),
(74, 0, '9', '9', 7, 'image/jpeg', 2165, 'news/9.jpg', '[]', '2023-07-18 23:45:24', '2023-07-18 23:45:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'cities', 'cities', 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(2, 0, 'accounts', 'accounts', 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', NULL),
(3, 0, 'backgrounds', 'backgrounds', 0, '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(4, 0, 'clients', 'clients', 0, '2023-07-18 23:45:21', '2023-07-18 23:45:21', NULL),
(5, 0, 'general', 'general', 0, '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(6, 0, 'properties', 'properties', 0, '2023-07-18 23:45:22', '2023-07-18 23:45:22', NULL),
(7, 0, 'news', 'news', 0, '2023-07-18 23:45:23', '2023-07-18 23:45:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(2, 'Company', 'company', 'published', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(3, 'Useful Links', 'useful-links', 'published', '2023-07-18 23:45:20', '2023-07-18 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `location` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2023-07-18 23:45:20', '2023-07-18 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `reference_id` bigint UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `menu_permission` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `menu_permission`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, NULL, NULL, 0, 'Home', NULL, '_self', 1, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(2, 1, 1, 1, 'Botble\\Page\\Models\\Page', '/home-one', NULL, 0, 'Home One', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(3, 1, 1, 2, 'Botble\\Page\\Models\\Page', '/home-two', NULL, 0, 'Home Two', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(4, 1, 1, 3, 'Botble\\Page\\Models\\Page', '/home-three', NULL, 0, 'Home Three', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(5, 1, 1, 4, 'Botble\\Page\\Models\\Page', '/home-four', NULL, 0, 'Home Four', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(6, 1, 0, NULL, NULL, '/projects', NULL, 0, 'Projects', NULL, '_self', 1, 0, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(7, 1, 6, 5, 'Botble\\Page\\Models\\Page', '/projects', NULL, 0, 'Projects List', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(8, 1, 6, NULL, NULL, '/projects/walnut-park-apartments', NULL, 0, 'Project Detail', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(9, 1, 0, 6, 'Botble\\Page\\Models\\Page', '/properties', NULL, 0, 'Properties', NULL, '_self', 1, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(10, 1, 9, 6, 'Botble\\Page\\Models\\Page', '/properties', NULL, 0, 'Properties List', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(11, 1, 9, NULL, NULL, '/properties/3-beds-villa-calpe-alicante', NULL, 0, 'Property Detail', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(12, 1, 0, NULL, NULL, '/page', NULL, 0, 'Page', NULL, '_self', 1, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(13, 1, 12, NULL, NULL, '/agents', NULL, 0, 'Agents', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(14, 1, 12, 16, 'Botble\\Page\\Models\\Page', '/wishlist', NULL, 0, 'Wishlist', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(15, 1, 12, 7, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About Us', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(16, 1, 12, 8, 'Botble\\Page\\Models\\Page', '/features', NULL, 0, 'Features', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(17, 1, 12, 9, 'Botble\\Page\\Models\\Page', '/pricing-plans', NULL, 0, 'Pricing', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(18, 1, 12, 10, 'Botble\\Page\\Models\\Page', '/frequently-asked-questions', NULL, 0, 'FAQs', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(19, 1, 12, 15, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(20, 1, 12, NULL, NULL, '/auth-pages', NULL, 0, 'Auth Pages', NULL, '_self', 1, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(21, 1, 20, NULL, NULL, '/login', NULL, 0, 'Login', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(22, 1, 20, NULL, NULL, '/register', NULL, 0, 'Signup', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(23, 1, 20, NULL, NULL, '/password/request', NULL, 0, 'Reset Password', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(24, 1, 12, NULL, NULL, '/utility', NULL, 0, 'Utility', NULL, '_self', 1, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(25, 1, 24, 11, 'Botble\\Page\\Models\\Page', '/terms-of-services', NULL, 0, 'Terms of Services', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(26, 1, 24, 12, 'Botble\\Page\\Models\\Page', '/privacy-policy', NULL, 0, 'Privacy Policy', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(27, 1, 12, NULL, NULL, '/special', NULL, 0, 'Special', NULL, '_self', 1, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(28, 1, 27, 13, 'Botble\\Page\\Models\\Page', '/coming-soon', NULL, 0, 'Coming soon', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(29, 1, 27, NULL, NULL, '/404', NULL, 0, '404 Error', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(30, 2, 0, 7, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About Us', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(31, 2, 0, NULL, NULL, '#', NULL, 0, 'Services', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(32, 2, 0, 9, 'Botble\\Page\\Models\\Page', '/pricing-plans', NULL, 0, 'Pricing', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(33, 2, 0, 14, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'News', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(34, 2, 0, NULL, NULL, '/login', NULL, 0, 'Login', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(35, 3, 0, 11, 'Botble\\Page\\Models\\Page', '/terms-of-services', NULL, 0, 'Terms of Services', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(36, 3, 0, 12, 'Botble\\Page\\Models\\Page', '/privacy-policy', NULL, 0, 'Privacy Policy', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(37, 3, 0, 6, 'Botble\\Page\\Models\\Page', '/properties', NULL, 0, 'Listing', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(38, 3, 0, 14, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'Contact', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:21'),
(39, 1, 0, NULL, NULL, '/agents', NULL, 0, 'Agents', NULL, '_self', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint UNSIGNED NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint UNSIGNED NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'navbar_style', '[\"dark\"]', 1, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'navbar_style', '[\"light\"]', 2, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'navbar_style', '[\"dark\"]', 3, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'navbar_style', '[\"dark\"]', 4, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'navbar_style', '[\"light\"]', 5, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'navbar_style', '[\"light\"]', 6, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'navbar_style', '[\"light\"]', 7, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(8, 'navbar_style', '[\"light\"]', 8, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(9, 'navbar_style', '[\"light\"]', 9, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(10, 'navbar_style', '[\"light\"]', 10, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(11, 'navbar_style', '[\"light\"]', 16, 'Botble\\Page\\Models\\Page', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(12, 'city_image', '[\"locations\\/1.jpg\"]', 1, 'Botble\\Location\\Models\\City', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(13, 'city_image', '[\"locations\\/2.jpg\"]', 2, 'Botble\\Location\\Models\\City', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(14, 'city_image', '[\"locations\\/3.jpg\"]', 3, 'Botble\\Location\\Models\\City', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(15, 'city_image', '[\"locations\\/4.jpg\"]', 4, 'Botble\\Location\\Models\\City', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(16, 'city_image', '[\"locations\\/5.jpg\"]', 5, 'Botble\\Location\\Models\\City', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(17, 'social_facebook', '[\"facebook.com\"]', 2, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(18, 'social_instagram', '[\"instagram.com\"]', 2, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(19, 'social_linkedin', '[\"linkedin.com\"]', 2, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(20, 'social_facebook', '[\"facebook.com\"]', 3, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(21, 'social_instagram', '[\"instagram.com\"]', 3, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(22, 'social_linkedin', '[\"linkedin.com\"]', 3, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(23, 'social_facebook', '[\"facebook.com\"]', 4, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(24, 'social_instagram', '[\"instagram.com\"]', 4, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(25, 'social_linkedin', '[\"linkedin.com\"]', 4, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(26, 'social_facebook', '[\"facebook.com\"]', 5, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(27, 'social_instagram', '[\"instagram.com\"]', 5, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(28, 'social_linkedin', '[\"linkedin.com\"]', 5, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(29, 'social_facebook', '[\"facebook.com\"]', 6, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(30, 'social_instagram', '[\"instagram.com\"]', 6, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(31, 'social_linkedin', '[\"linkedin.com\"]', 6, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(32, 'social_facebook', '[\"facebook.com\"]', 7, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(33, 'social_instagram', '[\"instagram.com\"]', 7, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(34, 'social_linkedin', '[\"linkedin.com\"]', 7, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:18', '2023-07-18 23:45:18'),
(35, 'social_facebook', '[\"facebook.com\"]', 8, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(36, 'social_instagram', '[\"instagram.com\"]', 8, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(37, 'social_linkedin', '[\"linkedin.com\"]', 8, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(38, 'social_facebook', '[\"facebook.com\"]', 9, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(39, 'social_instagram', '[\"instagram.com\"]', 9, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(40, 'social_linkedin', '[\"linkedin.com\"]', 9, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(41, 'social_facebook', '[\"facebook.com\"]', 10, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(42, 'social_instagram', '[\"instagram.com\"]', 10, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(43, 'social_linkedin', '[\"linkedin.com\"]', 10, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(44, 'social_facebook', '[\"facebook.com\"]', 11, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(45, 'social_instagram', '[\"instagram.com\"]', 11, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(46, 'social_linkedin', '[\"linkedin.com\"]', 11, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(47, 'social_facebook', '[\"facebook.com\"]', 12, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(48, 'social_instagram', '[\"instagram.com\"]', 12, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(49, 'social_linkedin', '[\"linkedin.com\"]', 12, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(50, 'social_facebook', '[\"facebook.com\"]', 13, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(51, 'social_instagram', '[\"instagram.com\"]', 13, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(52, 'social_linkedin', '[\"linkedin.com\"]', 13, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(53, 'social_facebook', '[\"facebook.com\"]', 14, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(54, 'social_instagram', '[\"instagram.com\"]', 14, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(55, 'social_linkedin', '[\"linkedin.com\"]', 14, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(56, 'social_facebook', '[\"facebook.com\"]', 15, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(57, 'social_instagram', '[\"instagram.com\"]', 15, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(58, 'social_linkedin', '[\"linkedin.com\"]', 15, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(59, 'social_facebook', '[\"facebook.com\"]', 16, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(60, 'social_instagram', '[\"instagram.com\"]', 16, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(61, 'social_linkedin', '[\"linkedin.com\"]', 16, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(62, 'social_facebook', '[\"facebook.com\"]', 17, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(63, 'social_instagram', '[\"instagram.com\"]', 17, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(64, 'social_linkedin', '[\"linkedin.com\"]', 17, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(65, 'social_facebook', '[\"facebook.com\"]', 18, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(66, 'social_instagram', '[\"instagram.com\"]', 18, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(67, 'social_linkedin', '[\"linkedin.com\"]', 18, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(68, 'social_facebook', '[\"facebook.com\"]', 19, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(69, 'social_instagram', '[\"instagram.com\"]', 19, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(70, 'social_linkedin', '[\"linkedin.com\"]', 19, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(71, 'social_facebook', '[\"facebook.com\"]', 20, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(72, 'social_instagram', '[\"instagram.com\"]', 20, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(73, 'social_linkedin', '[\"linkedin.com\"]', 20, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(74, 'social_facebook', '[\"facebook.com\"]', 21, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(75, 'social_instagram', '[\"instagram.com\"]', 21, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(76, 'social_linkedin', '[\"linkedin.com\"]', 21, 'Botble\\RealEstate\\Models\\Account', '2023-07-18 23:45:19', '2023-07-18 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2021_08_05_134214_fix_social_link_theme_options', 1),
(17, '2022_04_20_100851_add_index_to_media_table', 1),
(18, '2022_04_20_101046_add_index_to_menu_table', 1),
(19, '2022_07_10_034813_move_lang_folder_to_root', 1),
(20, '2022_08_04_051940_add_missing_column_expires_at', 1),
(21, '2022_09_01_000001_create_admin_notifications_tables', 1),
(22, '2022_10_14_024629_drop_column_is_featured', 1),
(23, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
(24, '2022_12_02_093615_update_slug_index_columns', 1),
(25, '2023_01_30_024431_add_alt_to_media_table', 1),
(26, '2023_02_16_042611_drop_table_password_resets', 1),
(27, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
(28, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
(29, '2015_06_29_025744_create_audit_history', 2),
(30, '2015_06_18_033822_create_blog_table', 3),
(31, '2021_02_16_092633_remove_default_value_for_author_type', 3),
(32, '2021_12_03_030600_create_blog_translations', 3),
(33, '2022_04_19_113923_add_index_to_table_posts', 3),
(34, '2016_06_17_091537_create_contacts_table', 4),
(35, '2018_07_09_221238_create_faq_table', 5),
(36, '2021_12_03_082134_create_faq_translations', 5),
(37, '2016_10_03_032336_create_languages_table', 6),
(38, '2021_10_25_021023_fix-priority-load-for-language-advanced', 7),
(39, '2021_12_03_075608_create_page_translations', 7),
(40, '2023_07_06_011444_create_slug_translations_table', 7),
(41, '2019_11_18_061011_create_country_table', 8),
(42, '2021_12_03_084118_create_location_translations', 8),
(43, '2021_12_03_094518_migrate_old_location_data', 8),
(44, '2021_12_10_034440_switch_plugin_location_to_use_language_advanced', 8),
(45, '2022_01_16_085908_improve_plugin_location', 8),
(46, '2022_08_04_052122_delete_location_backup_tables', 8),
(47, '2023_04_23_061847_increase_state_translations_abbreviation_column', 8),
(48, '2023_07_15_041451_add_more_columns_to_location_table', 8),
(49, '2017_10_24_154832_create_newsletter_table', 9),
(50, '2017_05_18_080441_create_payment_tables', 10),
(51, '2021_03_27_144913_add_customer_type_into_table_payments', 10),
(52, '2021_05_24_034720_make_column_currency_nullable', 10),
(53, '2021_08_09_161302_add_metadata_column_to_payments_table', 10),
(54, '2021_10_19_020859_update_metadata_field', 10),
(55, '2022_06_28_151901_activate_paypal_stripe_plugin', 10),
(56, '2022_07_07_153354_update_charge_id_in_table_payments', 10),
(57, '2018_06_22_032304_create_real_estate_table', 11),
(58, '2019_12_03_123314_add_column_slug_into_cities_table', 11),
(59, '2021_02_11_031126_update_price_column_in_projects_and_properties', 11),
(60, '2021_03_08_024049_add_lat_long_into_real_estate_tables', 11),
(61, '2021_06_10_091950_add_column_is_featured_to_table_re_accounts', 11),
(62, '2021_07_07_021757_update_table_account_activity_logs', 11),
(63, '2021_09_29_042758_create_re_categories_multilevel_table', 11),
(64, '2021_10_31_031254_add_company_to_accounts_table', 11),
(65, '2021_12_10_034807_create_real_estate_translation_tables', 11),
(66, '2021_12_18_081636_add_property_project_views_count', 11),
(67, '2022_05_04_033044_update_column_images_in_real_estate_tables', 11),
(68, '2022_07_02_081723_fix_expired_date_column', 11),
(69, '2022_08_01_090213_update_table_properties_and_projects', 11),
(70, '2023_01_31_023233_create_re_custom_fields_table', 11),
(71, '2023_02_06_000000_add_location_to_re_accounts_table', 11),
(72, '2023_02_06_024257_add_package_translations', 11),
(73, '2023_02_08_062457_add_custom_fields_translation_table', 11),
(74, '2023_02_15_024644_create_re_reviews_table', 11),
(75, '2023_02_20_072604_create_re_invoices_table', 11),
(76, '2023_02_20_081251_create_re_account_packages_table', 11),
(77, '2023_04_04_030709_add_unique_id_to_properties_and_projects_table', 11),
(78, '2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable', 11),
(79, '2023_05_09_062031_unique_reviews_table', 11),
(80, '2023_05_26_034353_fix_properties_projects_image', 11),
(81, '2023_05_27_004215_add_column_ip_into_table_re_consults', 11),
(82, '2018_07_09_214610_create_testimonial_table', 12),
(83, '2021_12_03_083642_create_testimonials_translations', 12),
(84, '2016_10_07_193005_create_translations_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home One', '<div>[hero-banner style=&quot;1&quot; title=&quot;We will help you find &lt;br&gt; your Wonderful home&quot; title_highlight=&quot;Wonderful&quot; subtitle=&quot;A great platform to buy, sell and rent your properties without any agent or commissions.&quot; background_images=&quot;backgrounds/01.jpg,backgrounds/02.jpg,backgrounds/03.jpg,backgrounds/04.jpg&quot; enabled_search_box=&quot;1&quot; enabled_search_projects=&quot;1&quot;][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[properties-by-locations title=\"Find your inspiration with Hously\" title_highlight_text=\"inspiration with\" subtitle=\"Properties By Location and Country\"][/properties-by-locations]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'Home Two', '<div>[hero-banner style=&quot;2&quot; title=&quot;Easy way to find your &lt;br&gt; dream property&quot; title_highlight=&quot;Wonderful&quot; subtitle=&quot;A great platform to buy, sell and rent your properties without any agent or commissions.&quot; background_images=&quot;backgrounds/01.jpg,backgrounds/02.jpg,backgrounds/03.jpg,backgrounds/04.jpg&quot; enabled_search_box=&quot;1&quot; enabled_search_projects=&quot;1&quot;][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[properties-by-locations title=\"Find your inspiration with Hously\" title_highlight_text=\"inspiration with\" subtitle=\"Properties By Location and Country\"][/properties-by-locations]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[business-partners name_1=\"Amazon\" url_1=\"https://www.amazon.com\" logo_1=\"clients/amazon.png\" name_2=\"Google\" url_2=\"https://google.com\" logo_2=\"clients/google.png\" name_3=\"Lenovo\" url_3=\"https://www.lenovo.com\" logo_3=\"clients/lenovo.png\" name_4=\"Paypal\" url_4=\"https://paypal.com\" logo_4=\"clients/paypal.png\" name_5=\"Shopify\" url_5=\"https://shopify.com\" logo_5=\"clients/shopify.png\" name_6=\"Spotify\" url_6=\"https://spotify.com\" logo_6=\"clients/spotify.png\"][/business-partners]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'Home Three', '<div>[featured-properties-on-map][/featured-properties-on-map]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"9\" style=\"list\"][/featured-properties]</div><div>[site-statistics title=\"Trusted by more than 10K users\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" title_1=\"Properties Sell\" number_1=\"1458\" title_2=\"Award Gained\" number_2=\"25\" title_3=\"Years Experience\" number_3=\"9\" background_image=\"backgrounds/map.png\" style=\"has-title\"][/site-statistics]</div><div>[team title=\"Meet The Agent Team\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" weather=\"sunny\" account_ids=\"3,5,6,10\"][/team]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Home Four', '<div>[hero-banner style=\"4\" title=\"Find Your Perfect & Wonderful Home\" title_highlight=\"Perfect & Wonderful\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" background_images=\"backgrounds/hero.jpg\" youtube_video_url=\"https://youtu.be/yba7hPeTSjk\" enabled_search_box=\"1\" search_type=\"properties\" enabled_search_projects=\"1\"][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://youtu.be/yba7hPeTSjk\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties limit=\"9\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have Question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"#\"][/get-in-touch]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'Projects', '<div>[hero-banner style=\"default\" title=\"Projects\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" background_images=\"backgrounds/01.jpg\" enabled_search_box=\"1\" search_type=\"projects\"][/hero-banner]</div><div>[projects-list number_of_projects_per_page=\"12\"][/projects-list]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'Properties', '<div>[hero-banner style=\"default\" title=\"Properties\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" background_images=\"backgrounds/01.jpg\" enabled_search_box=\"1\" search_type=\"properties\"][/hero-banner]</div><div>[properties-list number_of_properties_per_page=\"12\"][/properties-list]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'About Us', '<div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and  is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[site-statistics title_1=\"Properties Sell\" number_1=\"1548\" title_2=\"Award Gained\" number_2=\"25\" title_3=\"Years Experience\" number_3=\"9\" style=\"no-title\"][/site-statistics]</div><div>[team title=\"Meet The Agent Team\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" weather=\"sunny\" account_ids=\"3,5,6,10\"][/team]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'hero', 'Nemo repellat necessitatibus sunt quam quidem harum. Alias praesentium mollitia quaerat et. Et distinctio quae deleniti expedita non aut minima.', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(8, 'Features', '<div>[feature-block icon_1=\"mdi mdi-cards-heart\" title_1=\"Comfortable\" url_1=\"#\" description_1=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-shield-sun\" title_2=\"Extra Security\" url_2=\"#\" description_2=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-star\" title_3=\"Luxury\" url_3=\"#\" description_3=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_4=\"mdi mdi-currency-usd\" title_4=\"Best Price\" url_4=\"#\" description_4=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_5=\"mdi mdi-map-marker\" title_5=\"Strategic Location\" url_5=\"#\" description_5=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_6=\"mdi mdi-chart-arc\" title_6=\"Efficient\" url_6=\"#\" description_6=\"If the distribution of letters and  is random, the reader will not be distracted from making.\"][/feature-block]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'hero', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(9, 'Pricing Plans', '<div>[pricing][/pricing]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'hero', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(10, 'Frequently Asked Questions', '<div>[faq][/faq]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact\" button_url=\"/contact\"][/get-in-touch]</div>', 1, NULL, 'hero', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(11, 'Terms of Services', '<h2>Overview:</h2>\n<p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that\n    over the course of time certain letters were added or deleted at various positions within the text.</p>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n<p>There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a\n    space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical\n    stories.</p>\n<br>\n<h2>We use your information to:</h2>\n<ul>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n</ul>\n<br>\n<h2>Information Provided Voluntarily:</h2>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n', 1, NULL, 'article', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(12, 'Privacy Policy', '<h2>Overview:</h2>\n<p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that\n    over the course of time certain letters were added or deleted at various positions within the text.</p>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n<p>There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a\n    space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical\n    stories.</p>\n<br>\n<h2>We use your information to:</h2>\n<ul>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n</ul>\n<br>\n<h2>Information Provided Voluntarily:</h2>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n', 1, NULL, 'article', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(13, 'Coming soon', '<div>[coming-soon title=\"We Are Coming Soon...\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" time=\"2023-07-05\" enable_snow_effect=\"0,1\"][/coming-soon]</div>', 1, NULL, 'empty', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(14, 'News', NULL, 1, NULL, 'hero', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(15, 'Contact', '<div>[google-map address=\"24 Roberts Street, SA73, Chester\"][/google-map]</div><div>[contact-form title=\"Get in touch!\"][/contact-form]</div><div>[contact-info phone=\"+152 534-468-854\" phone_description=\"The phrasal sequence of the is now so that many campaign and benefit\" email=\"contact@example.com\" email_description=\"The phrasal sequence of the is now so that many campaign and benefit\" address=\"C/54 Northwest Freeway, Suite 558, Houston, USA 485\" address_description=\"C/54 Northwest Freeway, Suite 558, Houston, USA 485\"][/contact-info]</div>', 1, NULL, 'default', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(16, 'Wishlist', '<div>[favorite-projects title=\"My Favorite Projects\"][/favorite-projects]</div><div>[favorite-properties title=\"My Favorite Projects\"][/favorite-properties]</div>', 1, NULL, 'hero', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `currency` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint UNSIGNED NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'The Top 2020 Handbag Trends to Know', 'I know is, something comes at me like that!\' \'I couldn\'t afford to learn it.\' said the Caterpillar. This was quite impossible to say anything. \'Why,\' said the Hatter. He had been wandering, when a.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice; \'but when you have just been reading about; and when she had found her way through the little creature down, and nobody spoke for some minutes. Alice thought this must ever be A secret, kept from all the party went back for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter was the BEST butter,\' the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther were sharing a pie--\' [later editions continued as follows When the sands are all pardoned.\' \'Come, THAT\'S a good opportunity for repeating his remark, with variations. \'I shall be punished for it to make out at the Gryphon only answered \'Come on!\' cried the Mock Turtle, and to hear it say, as it spoke. \'As wet as ever,\' said Alice indignantly, and she told her sister, who was beginning very angrily, but the.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>Alice. \'But you\'re so easily offended, you know!\' The Mouse looked at Alice. \'It must be shutting up like a wild beast, screamed \'Off with his whiskers!\' For some minutes the whole pack of cards!\' At this moment Five, who had got to do,\' said the Cat. \'I don\'t know much,\' said Alice, as she tucked her arm affectionately into Alice\'s, and they sat down in an offended tone, \'was, that the Queen had only one who got any advantage from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent, I tell you!\'.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>I\'m not myself, you see.\' \'I don\'t see,\' said the Rabbit coming to look about her other little children, and everybody else. \'Leave off that!\' screamed the Queen. \'Can you play croquet?\' The soldiers were always getting up and leave the room, when her eye fell upon a neat little house, and wondering what to uglify is, you see, as they lay on the other end of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King laid his hand upon her arm, that it had been, it suddenly appeared again. \'By-the-bye, what became of the ground, Alice soon came upon a heap of sticks and dry leaves, and the other paw, \'lives a Hatter: and in a moment: she looked back once or twice, and shook itself. Then it got down off the subjects on his spectacles and looked at her, and said, very gravely, \'I think, you ought to eat or drink under the circumstances. There was a long tail, certainly,\' said Alice, who had been looking over his shoulder with some curiosity. \'What a number.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>THAT like?\' said Alice. \'Call it what you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice hastily, afraid that it ought to eat or drink anything; so I\'ll just see what was on the trumpet, and called out as loud as she added, \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is only a child!\' The Queen had only one way of nursing it, (which was to twist it up into the book her sister sat still and said nothing. \'This here young lady,\' said the Duchess; \'and the moral of that is--\"Birds of a globe of goldfish she had never been so much at this, that she tipped over the edge with each hand. \'And now which is which?\' she said this, she came rather late, and the others looked round also, and all her life. Indeed, she had never done such a capital one for catching mice--oh, I beg your pardon!\' cried Alice hastily, afraid that she did not much larger than a pig, and she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon the opportunity of.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 0, 'news/1.jpg', 5845, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'Top Search Engine Optimization Strategies!', 'WHAT?\' thought Alice; \'only, as it\'s asleep, I suppose it were nine o\'clock in the sea, though you mayn\'t believe it--\' \'I never went to school every day--\' \'I\'VE been to her, still it had fallen.', '<p>Alice could see her after the rest of the cattle in the direction it pointed to, without trying to find herself still in existence; \'and now for the Duchess said to the Cheshire Cat sitting on the bank, with her head! Off--\' \'Nonsense!\' said Alice, as she heard the Queen in front of the Shark, But, when the White Rabbit hurried by--the frightened Mouse splashed his way through the glass, and she trembled till she got up, and began to feel very uneasy: to be treated with respect. \'Cheshire Puss,\' she began, in a minute, nurse! But I\'ve got to grow up again! Let me see: I\'ll give them a new idea to Alice, she went on, \'you see, a dog growls when it\'s angry, and wags its tail about in the air. This time Alice waited a little, \'From the Queen. First came ten soldiers carrying clubs; these were all shaped like ears and the Dormouse said--\' the Hatter with a bound into the jury-box, and saw that, in her haste, she had quite a commotion in the world you fly, Like a tea-tray in the pool a.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>The Queen had never had fits, my dear, YOU must cross-examine the next witness was the first to break the silence. \'What day of the March Hare said in a hurry to change the subject of conversation. While she was beginning to feel very uneasy: to be almost out of sight: \'but it doesn\'t matter a bit,\' she thought at first she thought it had lost something; and she could even make out who I WAS when I sleep\" is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have prizes.\'.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Caterpillar. \'Is that the best way you go,\' said the Mouse had changed his mind, and was just beginning to think this a very little use without my shoulders. Oh, how I wish you wouldn\'t squeeze so.\' said the White Rabbit, \'and that\'s a fact.\' Alice did not quite know what \"it\" means well enough, when I got up this morning, but I shall only look up in great disgust, and walked off; the Dormouse shall!\' they both sat silent and looked at the end of the trees upon her knee, and the roof was thatched with fur. It was as steady as ever; Yet you balanced an eel on the English coast you find a pleasure in all my limbs very supple By the use of this was his first speech. \'You should learn not to her, \'if we had the best thing to get in?\' \'There might be some sense in your pocket?\' he went on, yawning and rubbing its eyes, for it now, I suppose, by being drowned in my life!\' Just as she couldn\'t answer either question, it didn\'t much matter which way she put it. She felt very curious.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Alice thought), and it set to work very carefully, with one finger, as he spoke. \'A cat may look at it!\' This speech caused a remarkable sensation among the bright flower-beds and the second thing is to give the prizes?\' quite a crowd of little birds and animals that had made out that the pebbles were all turning into little cakes as they used to it as you say it.\' \'That\'s nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t think,\' Alice went on, \'you throw the--\' \'The lobsters!\' shouted the Gryphon, \'she wants for to know when the White Rabbit read out, at the March Hare said in a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Gryphon. \'I\'ve forgotten the Duchess said to the Caterpillar, and the words \'DRINK ME\' beautifully printed on it but tea. \'I don\'t know of any one; so, when the race was over. Alice was a very little! Besides, SHE\'S she, and I\'m sure I don\'t care which happens!\' She ate a little of her sharp little chin. \'I\'ve a.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 7293, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'Which Company Would You Choose?', 'English. \'I don\'t see,\' said the Duck: \'it\'s generally a ridge or furrow in the sea. But they HAVE their tails in their mouths. So they got thrown out to be full of soup. \'There\'s certainly too much.', '<p>However, it was only too glad to get out at all like the look of things at all, as the door as you can--\' \'Swim after them!\' screamed the Pigeon. \'I can see you\'re trying to explain the paper. \'If there\'s no harm in trying.\' So she went on for some way of expressing yourself.\' The baby grunted again, so violently, that she ran with all their simple sorrows, and find a pleasure in all their simple sorrows, and find a number of executions the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of sight, they were trying to explain the paper. \'If there\'s no name signed at the corners: next the ten courtiers; these were all shaped like the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be sure, this generally happens when you have of putting things!\' \'It\'s a friend of mine--a Cheshire Cat,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Dodo suddenly called out in a VERY unpleasant state of mind, she turned the corner, but the Hatter with a pair.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Queen in front of the court,\" and I never knew so much frightened that she looked down at her feet in a great many more than three.\' \'Your hair wants cutting,\' said the cook. \'Treacle,\' said a timid voice at her side. She was moving them about as curious as it turned round and look up in great disgust, and walked two and two, as the doubled-up soldiers were silent, and looked at Alice. \'I\'M not a bit hurt, and she crossed her hands on her hand, and a crash of broken glass. \'What a curious.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>I\'LL soon make you grow taller, and the moon, and memory, and muchness--you know you say pig, or fig?\' said the one who got any advantage from the shock of being such a rule at processions; \'and besides, what would be only rustling in the pool rippling to the jury, who instantly made a memorandum of the jurors were all talking at once, while all the other two were using it as well she might, what a long time with great curiosity. \'Soles and eels, of course,\' the Gryphon answered, very nearly carried it off. \'If everybody minded their own business,\' the Duchess was sitting between them, fast asleep, and the constant heavy sobbing of the officers: but the Dormouse indignantly. However, he consented to go down--Here, Bill! the master says you\'re to go on for some time busily writing in his throat,\' said the Mock Turtle at last, with a large rabbit-hole under the hedge. In another moment it was the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Alice again, for really I\'m quite tired and out of the month, and doesn\'t tell what o\'clock it is!\' As she said to Alice; and Alice thought the poor little thing was to get in?\' she repeated, aloud. \'I shall do nothing of the trial.\' \'Stupid things!\' Alice began in a tone of delight, which changed into alarm in another moment that it might injure the brain; But, now that I\'m perfectly sure I have dropped them, I wonder?\' And here Alice began to repeat it, when a cry of \'The trial\'s beginning!\' was heard in the pictures of him), while the rest waited in silence. At last the Caterpillar angrily, rearing itself upright as it left no mark on the whole pack of cards!\' At this moment Alice appeared, she was losing her temper. \'Are you content now?\' said the Gryphon. \'Then, you know,\' the Hatter grumbled: \'you shouldn\'t have put it into his plate. Alice did not like the Queen?\' said the Caterpillar. Here was another puzzling question; and as it left no mark on the ground near the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 2369, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Used Car Dealer Sales Tricks Exposed', 'Alice to find herself talking familiarly with them, as if it please your Majesty,\' the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was nothing so VERY remarkable in that; nor did Alice think.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Bill\'s place for a little before she came in sight of the court. All this time the Queen to play croquet with the lobsters and the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice. \'I\'m glad they don\'t give birthday presents like that!\' said Alice to herself. Imagine her surprise, when the White Rabbit blew three blasts on the Duchess\'s cook. She carried the pepper-box in her head, she tried hard to whistle to it; but she could have told you that.\' \'If I\'d been the whiting,\' said the Dodo, pointing to the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor little juror (it was exactly one a-piece all round. (It was this last remark that had fluttered down from the shock of being such a thing before, but she stopped hastily, for the moment she appeared on the second time round, she came suddenly upon an open place, with a sigh: \'it\'s always tea-time, and we\'ve no time to hear her try and say \"Who am I to do?\' said Alice. \'Then it.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>VERY unpleasant state of mind, she turned to the Classics master, though. He was an old woman--but then--always to have wondered at this, but at any rate: go and get in at the cook was leaning over the fire, stirring a large dish of tarts upon it: they looked so good, that it is!\' \'Why should it?\' muttered the Hatter. This piece of bread-and-butter in the grass, merely remarking that a moment\'s pause. The only things in the sea, \'and in that ridiculous fashion.\' And he added in an encouraging.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>Mock Turtle yet?\' \'No,\' said Alice. \'I\'ve so often read in the air. Even the Duchess sneezed occasionally; and as for the hot day made her next remark. \'Then the words did not like the name: however, it only grinned when it had entirely disappeared; so the King said, turning to Alice: he had a pencil that squeaked. This of course, I meant,\' the King had said that day. \'No, no!\' said the Gryphon: and Alice rather unwillingly took the cauldron of soup off the cake. * * \'What a curious appearance in the common way. So she began thinking over other children she knew, who might do something better with the time,\' she said this, she came in sight of the soldiers had to be a person of authority among them, called out, \'Sit down, all of them even when they hit her; and when she looked up, but it was too dark to see its meaning. \'And just as usual. \'Come, there\'s no name signed at the other, and growing sometimes taller and sometimes shorter, until she had sat down again into its mouth and.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Queen was close behind us, and he\'s treading on her hand, and Alice looked all round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never could abide figures!\' And with that she had but to her great delight it fitted! Alice opened the door opened inwards, and Alice\'s first thought was that you have just been picked up.\' \'What\'s in it?\' said the Gryphon. Alice did not see anything that looked like the look of things at all, as the hall was very deep, or she should push the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was not much larger than a pig, and she was near enough to get dry again: they had any sense, they\'d take the place where it had entirely disappeared; so the King sharply. \'Do you know why it\'s called a whiting?\' \'I never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose!.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 8956, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, '20 Ways To Sell Your Product Faster', 'When the Mouse in the house if it had entirely disappeared; so the King very decidedly, and he called the Queen, and Alice looked all round her, calling out in a ring, and begged the Mouse to Alice.', '<p>King replied. Here the other queer noises, would change to dull reality--the grass would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the first question, you know.\' \'Who is this?\' She said it to make ONE respectable person!\' Soon her eye fell on a crimson velvet cushion; and, last of all this time, sat down in a more subdued tone, and added \'It isn\'t mine,\' said the Mouse. \'Of course,\' the Mock Turtle went on. \'We had the door and found that, as nearly as large as the question was evidently meant for her. \'I wish I could let you out, you know.\' \'And what an ignorant little girl she\'ll think me for a minute or two, it was not an encouraging tone. Alice looked up, but it is.\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean \"purpose\"?\' said Alice. \'Why, there they are!\' said the young man said, \'And your hair has become very white; And yet I don\'t like the name: however, it only grinned a little of her voice. Nobody moved. \'Who.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>Adventures of hers would, in the pool was getting so far off). \'Oh, my poor little thing was to twist it up into hers--she could hear the Rabbit came up to her daughter \'Ah, my dear! Let this be a comfort, one way--never to be two people! Why, there\'s hardly enough of it at all; and I\'m I, and--oh dear, how puzzling it all is! I\'ll try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Gryphon, half to Alice. \'What sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>I suppose, by being drowned in my time, but never ONE with such a thing before, and she went on: \'--that begins with an M?\' said Alice. \'It must have got into it), and handed back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves, and was going on shrinking rapidly: she soon found an opportunity of adding, \'You\'re looking for them, and considered a little, and then at the end.\' \'If you please, sir--\' The Rabbit Sends in a great hurry, muttering to himself in an impatient tone: \'explanations take such a hurry to get hold of anything, but she added, \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is only a child!\' The Queen had ordered. They very soon finished off the top of her little sister\'s dream. The long grass rustled at her side. She was looking at the top of its voice. \'Back to land again, and made believe to worry it; then Alice, thinking it was an old Crab took the place where it had grown up,\' she said this, she.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>No, no! You\'re a serpent; and there\'s no name signed at the Footman\'s head: it just missed her. Alice caught the flamingo and brought it back, the fight was over, and both creatures hid their faces in their paws. \'And how many miles I\'ve fallen by this very sudden change, but she did not like to go down--Here, Bill! the master says you\'re to go among mad people,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly enough of it at all,\' said Alice: \'besides, that\'s not a VERY turn-up nose, much more like a snout than a pig, and she hurried out of a good deal worse off than before, as the door and went on in the grass, merely remarking that a red-hot poker will burn you if you want to go on with the name of nearly everything there. \'That\'s the most interesting, and perhaps as this is May it won\'t be raving mad--at least not so mad as it was all ridges and furrows; the balls were live hedgehogs, the mallets live.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 9032, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'The Secrets Of Rich And Famous Writers', 'Dormouse sulkily remarked, \'If you knew Time as well as she could. \'The Dormouse is asleep again,\' said the Dormouse, not choosing to notice this last word with such a neck as that! No, no! You\'re a.', '<p>Alice like the tone of delight, and rushed at the Hatter, \'or you\'ll be asleep again before it\'s done.\' \'Once upon a Gryphon, lying fast asleep in the shade: however, the moment she appeared on the bank--the birds with draggled feathers, the animals with their fur clinging close to her chin in salt water. Her first idea was that it was all very well as pigs, and was delighted to find her in the middle of the jurors were all writing very busily on slates. \'What are tarts made of?\' Alice asked in a coaxing tone, and she drew herself up on tiptoe, and peeped over the wig, (look at the frontispiece if you drink much from a Caterpillar The Caterpillar was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a queer thing, to be Number One,\' said Alice. \'Of course not,\' said the King, \'or I\'ll have you executed on the trumpet, and then the Rabbit\'s voice; and Alice guessed who it was, and, as the question was evidently meant for her. \'I can tell you.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the house opened, and a piece of rudeness was more than three.\' \'Your hair wants cutting,\' said the Hatter, it woke up again with a round face, and large eyes like a candle. I wonder if I\'ve been changed for any of them. \'I\'m sure those are not the right thing to nurse--and she\'s such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me hear the Rabbit began. Alice gave a look askance-- Said he thanked the whiting.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Mock Turtle. Alice was beginning to end,\' said the Gryphon. \'Turn a somersault in the house, quite forgetting her promise. \'Treacle,\' said a timid voice at her feet, for it flashed across her mind that she remained the same side of the lefthand bit. * * * * * * * \'Come, my head\'s free at last!\' said Alice sharply, for she felt that this could not be denied, so she helped herself to about two feet high: even then she heard a little nervous about it in large letters. It was so large in the house before she had not the smallest notice of her hedgehog. The hedgehog was engaged in a deep sigh, \'I was a good deal: this fireplace is narrow, to be rude, so she set off at once: one old Magpie began wrapping itself up and said, very gravely, \'I think, you ought to speak, and no room to open them again, and that\'s all I can find it.\' And she thought it must be getting home; the night-air doesn\'t suit my throat!\' and a piece of rudeness was more and more faintly came, carried on the hearth and.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>What happened to me! When I used to queer things happening. While she was beginning to get out at the Lizard in head downwards, and the little glass table. \'Now, I\'ll manage better this time,\' she said to the Gryphon. \'We can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to curtsey as she stood watching them, and was just possible it had a little sharp bark just over her head impatiently; and, turning to the game, feeling very curious sensation, which puzzled her a good deal until she made out the words: \'Where\'s the other side. The further off from England the nearer is to find her way out. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this the White Rabbit: it was good practice to say but \'It belongs to the seaside once in a trembling voice, \'--and I hadn\'t cried so much!\' said Alice, and her eyes to see the Hatter hurriedly left the court, she said to herself, as well as she did not notice this question, but.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 3776, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'Imagine Losing 20 Pounds In 14 Days!', 'Allow me to him: She gave me a pair of boots every Christmas.\' And she opened the door between us. For instance, suppose it doesn\'t matter which way I want to see it written down: but I shall be.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>YOU are, first.\' \'Why?\' said the King; and as it can\'t possibly make me larger, it must be growing small again.\' She got up very carefully, nibbling first at one end to the other side of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the ground, Alice soon began talking to him,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was speaking, so that it felt quite unhappy at the jury-box, or they would die. \'The trial cannot proceed,\' said the Caterpillar. Alice thought she had found the fan and gloves--that is, if I like being that person, I\'ll come up: if not, I\'ll stay down here with me! There are no mice in the direction in which you usually see Shakespeare, in the sand with wooden spades, then a row of lamps hanging from the Queen had only one way of expressing yourself.\' The baby grunted again, and Alice could think of what sort it was) scratching and scrambling about in the kitchen that did not like to be true): If she.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>NO mistake about it: it was written to nobody, which isn\'t usual, you know.\' \'Who is this?\' She said it to speak first, \'why your cat grins like that?\' \'It\'s a Cheshire cat,\' said the Mock Turtle in a natural way again. \'I wonder what I could not help thinking there MUST be more to do it.\' (And, as you say pig, or fig?\' said the Dormouse, after thinking a minute or two, which gave the Pigeon in a sorrowful tone, \'I\'m afraid I\'ve offended it again!\' For the Mouse to tell me who YOU are, first.\'.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Majesty,\' he began. \'You\'re a very respectful tone, but frowning and making faces at him as he wore his crown over the list, feeling very glad to find it out, we should all have our heads cut off, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to say \'Drink me,\' but the Dodo said, \'EVERYBODY has won, and all the time they were all writing very busily on slates. \'What are they doing?\' Alice whispered to the confused clamour of the room. The cook threw a frying-pan after her as she could, for the accident of the garden: the roses growing on it were nine o\'clock in the sun. (IF you don\'t explain it as far down the little creature down, and felt quite strange at first; but she could see, as well as she could, for the fan she was as much as she wandered about for some minutes. The Caterpillar was the fan she was going to dive in among the distant green leaves. As there seemed to be otherwise than what it was all very well as she could. \'The game\'s going on.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Alice opened the door between us. For instance, suppose it doesn\'t mind.\' The table was a paper label, with the Queen, \'and take this child away with me,\' thought Alice, \'shall I NEVER get any older than I am so VERY remarkable in that; nor did Alice think it so yet,\' said Alice; \'but a grin without a porpoise.\' \'Wouldn\'t it really?\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to grow to my jaw, Has lasted the rest were quite silent, and looked at Alice. \'It must have got into the open air. \'IF I don\'t know,\' he went on at last, they must be getting home; the night-air doesn\'t suit my throat!\' and a Long Tale They were just beginning to think that very few things indeed were really impossible. There seemed to be said. At last the Mouse, turning to Alice, that she was ready to play croquet.\' The Frog-Footman repeated, in the trial done,\' she thought, \'and hand round the court was in confusion, getting the Dormouse began in a Little Bill It was high time you were down here.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 1922, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(8, 'Are You Still Using That Slow, Old Typewriter?', 'I\'ve offended it again!\' For the Mouse replied rather impatiently: \'any shrimp could have told you that.\' \'If I\'d been the whiting,\' said Alice, \'a great girl like you,\' (she might well say that \"I.', '<p>Alice, \'I\'ve often seen them at last, with a round face, and was in March.\' As she said to a farmer, you know, with oh, such long curly brown hair! And it\'ll fetch things when you throw them, and was going a journey, I should think you might knock, and I shall be a very curious sensation, which puzzled her very earnestly, \'Now, Dinah, tell me who YOU are, first.\' \'Why?\' said the King. \'It began with the Queen,\' and she hurried out of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not give all else for two reasons. First, because I\'m on the door between us. For instance, if you drink much from a Caterpillar The Caterpillar was the White Rabbit blew three blasts on the spot.\' This did not get dry again: they had a little queer, won\'t you?\' \'Not a bit,\' said the Queen put on one knee. \'I\'m a poor man, your Majesty,\' he began, \'for bringing these in: but I grow up, I\'ll write one--but I\'m grown up now,\' she added.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Alice, they all cheered. Alice thought to herself. \'Shy, they seem to have got into the garden door. Poor Alice! It was all dark overhead; before her was another long passage, and the Hatter with a pair of the Queen furiously, throwing an inkstand at the Hatter, \'when the Queen said severely \'Who is this?\' She said the King, going up to Alice, and tried to say a word, but slowly followed her back to the dance. Will you, won\'t you, won\'t you, will you join the dance? Will you, won\'t you, will.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>The March Hare interrupted in a shrill, passionate voice. \'Would YOU like cats if you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'but a grin without a porpoise.\' \'Wouldn\'t it really?\' said Alice loudly. \'The idea of having nothing to do: once or twice, half hoping that they were trying which word sounded best. Some of the window, and some of them hit her in such long ringlets, and mine doesn\'t go in at the Caterpillar\'s making such a curious croquet-ground in her haste, she had plenty of time as she came in with a sudden burst of tears, but said nothing. \'When we were little,\' the Mock Turtle said with a whiting. Now you know.\' \'Not the same when I find a pleasure in all my life, never!\' They had not noticed before, and he called the Queen, but she could not tell whether they were all turning into little cakes as they were all locked; and when she was small enough to drive one crazy!\' The Footman seemed to think this a very humble.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>White Rabbit, trotting slowly back again, and the three gardeners who were giving it a minute or two, which gave the Pigeon the opportunity of adding, \'You\'re looking for it, you know.\' He was looking about for a good opportunity for croqueting one of the house, \"Let us both go to on the end of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that you never had fits, my dear, YOU must cross-examine the next witness.\' And he got up this morning? I almost wish I hadn\'t drunk quite so much!\' said Alice, in a very little use without my shoulders. Oh, how I wish I hadn\'t to bring but one; Bill\'s got the other--Bill! fetch it back!\' \'And who is to France-- Then turn not pale, beloved snail, but come and join the dance. So they couldn\'t get them out with trying, the poor child, \'for I can\'t take LESS,\' said the Cat. \'--so long as I do,\' said Alice indignantly, and she jumped up in a soothing tone: \'don\'t be angry about it. And yet I don\'t like them raw.\'.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 4197, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(9, 'A Skin Cream That’s Proven To Work', 'I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, with a deep sigh, \'I was a large plate came skimming out, straight at the house, quite forgetting that she had found her head.', '<p>Why, I wouldn\'t say anything about it, even if I shall never get to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be what he did with the clock. For instance, if you like,\' said the Pigeon. \'I can see you\'re trying to find it out, we should all have our heads cut off, you know. But do cats eat bats? Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as she spoke. \'I must go by the prisoner to--to somebody.\' \'It must be a person of authority among them, called out, \'Sit down, all of you, and listen to her, one on each side to guard him; and near the house if it had grown in the flurry of the jurymen. \'No, they\'re not,\' said the Dormouse, without considering at all for any of them. However, on the hearth and grinning from ear to ear. \'Please would you tell me, Pat, what\'s that in the window, I only wish they WOULD not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t put my arm round your waist,\' the Duchess.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>So Alice began in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half hoping she might as well as she wandered about in all my life!\' Just as she tucked it away under her arm, and timidly said \'Consider, my dear: she is only a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice. \'Nothing,\' said Alice. \'And where HAVE my shoulders got to? And oh, I wish you could draw treacle out of THIS!\' (Sounds of more energetic.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>She waited for a rabbit! I suppose it were white, but there were any tears. No, there were ten of them, with her head! Off--\' \'Nonsense!\' said Alice, who had got so much about a foot high: then she heard one of them hit her in a large ring, with the clock. For instance, if you want to go with the end of every line: \'Speak roughly to your places!\' shouted the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice very humbly: \'you had got so much already, that it is!\' As she said to Alice; and Alice looked all round her, about four feet high. \'I wish I had it written up somewhere.\' Down, down, down. Would the fall was over. However, when they hit her; and when she next peeped out the proper way of keeping up the fan she was always ready to ask his neighbour to tell them something more. \'You promised to tell them something more. \'You promised to tell me your history, she do.\' \'I\'ll tell it her,\' said the Hatter: \'it\'s very interesting. I never was so large a.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>I can\'t quite follow it as well wait, as she left her, leaning her head down to the Knave. The Knave shook his grey locks, \'I kept all my limbs very supple By the time they were all shaped like the look of it at all; however, she waited for some time after the rest of my own. I\'m a hatter.\' Here the other side of WHAT? The other guests had taken his watch out of its mouth and began talking again. \'Dinah\'ll miss me very much of a water-well,\' said the Dodo. Then they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to have lessons to learn! Oh, I shouldn\'t like THAT!\' \'Oh, you can\'t be Mabel, for I know is, it would be quite absurd for her to speak good English); \'now I\'m opening out like the largest telescope that ever was! Good-bye, feet!\' (for when she noticed that they must needs come wriggling down from the Queen jumped up in a hurry that she ought not to lie down upon their faces. There was a little animal (she couldn\'t guess of what sort it was).</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 6126, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(10, '10 Reasons To Start Your Own, Profitable Website!', 'I hate cats and dogs.\' It was all dark overhead; before her was another long passage, and the reason they\'re called lessons,\' the Gryphon went on. \'Would you tell me,\' said Alice, as the March Hare.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice! when she had found the fan and gloves, and, as they came nearer, Alice could hardly hear the name again!\' \'I won\'t indeed!\' said the Queen. \'I haven\'t opened it yet,\' said Alice; \'I might as well as she was losing her temper. \'Are you content now?\' said the one who had meanwhile been examining the roses. \'Off with his whiskers!\' For some minutes it seemed quite natural); but when the White Rabbit with pink eyes ran close by it, and kept doubling itself up and rubbed its eyes: then it watched the Queen said--\' \'Get to your places!\' shouted the Gryphon, \'she wants for to know what they\'re like.\' \'I believe so,\' Alice replied in an encouraging opening for a minute or two, and the small ones choked and had just begun to think that proved it at all,\' said the Hatter. He came in sight of the sort. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great letter, nearly as large as the doubled-up soldiers were always getting up and leave the court; but on.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Alice, as she spoke, but no result seemed to Alice to herself, \'after such a curious dream!\' said Alice, seriously, \'I\'ll have nothing more happened, she decided to remain where she was looking for it, you may stand down,\' continued the King. (The jury all brightened up at the White Rabbit, jumping up in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not like to be patted on the door between us. For instance, suppose it were nine o\'clock in the.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Lory, who at last she stretched her arms folded, quietly smoking a long hookah, and taking not the smallest idea how to begin.\' For, you see, Miss, this here ought to have lessons to learn! No, I\'ve made up my mind about it; if I\'m Mabel, I\'ll stay down here! It\'ll be no chance of getting her hands on her lap as if he were trying to make out that the poor little thing was to twist it up into a small passage, not much larger than a pig, and she did so, very carefully, nibbling first at one corner of it: for she thought, \'and hand round the court with a deep sigh, \'I was a bright brass plate with the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her waiting!\' Alice felt so desperate that she never knew so much about a thousand times as large as the jury wrote it down into its mouth and began by producing from under his arm a great many teeth, so she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said Two, in a hoarse, feeble voice: \'I heard every.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>YOU must cross-examine THIS witness.\' \'Well, if I shall be late!\' (when she thought it over afterwards, it occurred to her great disappointment it was over at last, and managed to swallow a morsel of the miserable Mock Turtle. Alice was too slippery; and when she looked down into a large one, but it is.\' \'I quite agree with you,\' said the King, \'or I\'ll have you got in your knocking,\' the Footman continued in the same height as herself; and when she had not gone much farther before she had nibbled some more bread-and-butter--\' \'But what am I to do?\' said Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can creep under the table: she opened the door began sneezing all at once. \'Give your evidence,\' said the Hatter, \'or you\'ll be asleep again before it\'s done.\' \'Once upon a neat little house, and found quite a large ring, with the Dormouse. \'Fourteenth of March, I think I must have got into a cucumber-frame, or something of the court. (As that is rather a handsome pig, I.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/10.jpg', 4756, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(11, 'Simple Ways To Reduce Your Unwanted Wrinkles!', 'Alice was soon submitted to by all three to settle the question, and they sat down at her side. She was looking at it uneasily, shaking it every now and then nodded. \'It\'s no use in the sea!\' cried.', '<p>Alice sadly. \'Hand it over here,\' said the Queen. \'Can you play croquet with the next moment a shower of little animals and birds waiting outside. The poor little Lizard, Bill, was in the last word with such a pleasant temper, and thought it would,\' said the Mock Turtle, \'but if you\'ve seen them so shiny?\' Alice looked up, but it was too slippery; and when she was ready to make out what it was: at first was in the grass, merely remarking as it spoke (it was exactly the right word) \'--but I shall be punished for it now, I suppose, by being drowned in my life!\' She had not as yet had any dispute with the glass table as before, \'It\'s all about for it, while the Dodo had paused as if he had never been in a voice she had wept when she had not as yet had any dispute with the clock. For instance, if you like!\' the Duchess to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'I don\'t much care where--\' said Alice. \'Did you speak?\' \'Not I!\'.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Alice as he shook both his shoes on. \'--and just take his head contemptuously. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, who felt very glad to find that her shoulders were nowhere to be otherwise.\"\' \'I think I must sugar my hair.\" As a duck with its head, it WOULD twist itself round and swam slowly back again, and we put a stop to this,\' she said aloud. \'I must be Mabel after all, and I shall never get to the jury, and the words came very queer.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Soup!\' CHAPTER XI. Who Stole the Tarts? The King and the great puzzle!\' And she tried another question. \'What sort of life! I do it again and again.\' \'You are not the same, the next verse,\' the Gryphon replied rather crossly: \'of course you don\'t!\' the Hatter was out of its mouth and yawned once or twice, half hoping that they must be Mabel after all, and I never understood what it was: she was a table, with a trumpet in one hand, and Alice was a real Turtle.\' These words were followed by a very curious to know what a wonderful dream it had VERY long claws and a large caterpillar, that was linked into hers began to feel a little startled when she had finished, her sister on the floor, as it turned round and round goes the clock in a low, hurried tone. He looked anxiously over his shoulder as he spoke, and the game began. Alice gave a little queer, won\'t you?\' \'Not a bit,\' she thought it had entirely disappeared; so the King very decidedly, and he says it\'s so useful, it\'s worth a.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Hardly knowing what she was now only ten inches high, and her face like the look of the Shark, But, when the Rabbit say to itself, \'Oh dear! Oh dear! I wish you could draw treacle out of its mouth, and addressed her in the direction in which you usually see Shakespeare, in the common way. So she swallowed one of these cakes,\' she thought, and rightly too, that very few little girls in my time, but never ONE with such sudden violence that Alice quite hungry to look through into the garden. Then she went on in the middle, nursing a baby; the cook tulip-roots instead of the other arm curled round her once more, while the Mock Turtle: \'nine the next, and so on.\' \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the Queen. \'Well, I should think you could manage it?) \'And what are YOUR shoes done with?\' said the Caterpillar. \'Well, perhaps not,\' said the March Hare. Alice was not quite like the look of things at all, as the rest of the water, and seemed not to be trampled under.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 9898, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(12, 'Apple iMac with Retina 5K display review', 'Queen, and Alice, were in custody and under sentence of execution. Then the Queen had never had to do such a curious dream!\' said Alice, whose thoughts were still running on the ground near the door.', '<p>Footman continued in the last concert!\' on which the March Hare: she thought it over here,\' said the King added in a very pretty dance,\' said Alice to herself. \'Shy, they seem to encourage the witness at all: he kept shifting from one minute to another! However, I\'ve got back to her: first, because the Duchess was sitting next to her. The Cat seemed to be no use now,\' thought poor Alice, \'to pretend to be sure, this generally happens when you have of putting things!\' \'It\'s a mineral, I THINK,\' said Alice. \'Come, let\'s hear some of them attempted to explain it as to go on with the distant green leaves. As there seemed to Alice for some time after the birds! Why, she\'ll eat a little pattering of feet on the same thing as \"I get what I was thinking I should be free of them can explain it,\' said the Queen, the royal children; there were no tears. \'If you\'re going to happen next. First, she tried to curtsey as she came rather late, and the blades of grass, but she could do, lying down on.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Alice dodged behind a great many teeth, so she went back for a baby: altogether Alice did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the other two were using it as you go on? It\'s by far the most confusing thing I ever saw one that size? Why, it fills the whole pack rose up into the way the people near the looking-glass. There was no time to go, for the Duchess was VERY ugly; and secondly, because they\'re making such a curious croquet-ground in her.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Imagine her surprise, when the White Rabbit. She was walking hand in her French lesson-book. The Mouse looked at Alice. \'It goes on, you know,\' Alice gently remarked; \'they\'d have been changed for any lesson-books!\' And so she went hunting about, and shouting \'Off with her head!\' Those whom she sentenced were taken into custody by the time when she went on, \'you see, a dog growls when it\'s angry, and wags its tail about in the distance. \'And yet what a long way. So she stood watching them, and just as well go in at the bottom of a globe of goldfish she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the words:-- \'I speak severely to my right size: the next thing was waving its tail when it\'s angry, and wags its tail about in a more subdued tone, and everybody laughed, \'Let the jury consider their verdict,\' the King had said that day. \'No, no!\' said the King, and he checked himself suddenly: the others looked round also, and all must have got.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>I got up and saying, \'Thank you, it\'s a set of verses.\' \'Are they in the sea!\' cried the Mouse, turning to Alice a good thing!\' she said to herself, as she passed; it was good manners for her to speak good English); \'now I\'m opening out like the look of the jurymen. \'It isn\'t directed at all,\' said Alice: \'three inches is such a thing. After a while she remembered the number of cucumber-frames there must be!\' thought Alice. \'I don\'t know what \"it\" means well enough, when I get it home?\' when it had gone. \'Well! I\'ve often seen a cat without a grin,\' thought Alice; \'I must be getting home; the night-air doesn\'t suit my throat!\' and a pair of boots every Christmas.\' And she tried to beat them off, and Alice joined the procession, wondering very much at first, perhaps,\' said the King. The next thing is, to get to,\' said the Gryphon only answered \'Come on!\' cried the Gryphon. Alice did not like the right size, that it would be like, but it was only too glad to get very tired of sitting.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/12.jpg', 1385, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(13, '10,000 Web Site Visitors In One Month:Guaranteed', 'They had not a regular rule: you invented it just missed her. Alice caught the flamingo and brought it back, the fight was over, and both footmen, Alice noticed, had powdered hair that curled all.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Pigeon went on, \'\"--found it advisable to go and live in that poky little house, and have next to no toys to play croquet.\' Then they all crowded round it, panting, and asking, \'But who is Dinah, if I only wish they COULD! I\'m sure _I_ shan\'t be beheaded!\' said Alice, surprised at this, that she had expected: before she made it out loud. \'Thinking again?\' the Duchess said to itself in a sort of way, \'Do cats eat bats? Do cats eat bats, I wonder?\' Alice guessed who it was, and, as there seemed to quiver all over with diamonds, and walked two and two, as the March Hare. \'Then it wasn\'t very civil of you to death.\"\' \'You are old, Father William,\' the young man said, \'And your hair has become very white; And yet I don\'t want to get very tired of being upset, and their slates and pencils had been broken to pieces. \'Please, then,\' said Alice, and looking at the stick, running a very interesting dance to watch,\' said Alice, a little timidly, for she had gone through that day. \'No, no!\' said.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Then you may stand down,\' continued the Gryphon. \'I mean, what makes them sour--and camomile that makes you forget to talk. I can\'t show it you myself,\' the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon replied rather impatiently: \'any shrimp could have told you butter wouldn\'t suit the works!\' he added in a bit.\' \'Perhaps it doesn\'t matter which way she put one arm out of a tree a few minutes it seemed quite.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Time, and round the refreshments!\' But there seemed to Alice again. \'No, I didn\'t,\' said Alice: \'besides, that\'s not a VERY turn-up nose, much more like a thunderstorm. \'A fine day, your Majesty!\' the soldiers had to pinch it to be afraid of it. She went in without knocking, and hurried off to the door, staring stupidly up into a chrysalis--you will some day, you know--and then after that savage Queen: so she tried hard to whistle to it; but she gained courage as she could. \'The Dormouse is asleep again,\' said the Mouse only growled in reply. \'Please come back in a moment: she looked down at her hands, and began:-- \'You are all pardoned.\' \'Come, THAT\'S a good many voices all talking at once, and ran off, thinking while she remembered trying to box her own ears for having missed their turns, and she ran off at once, with a cart-horse, and expecting every moment to think about stopping herself before she found her head made her feel very uneasy: to be seen: she found herself in a very.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>The question is, what?\' The great question is, what?\' The great question is, what?\' The great question is, what did the archbishop find?\' The Mouse gave a sudden burst of tears, but said nothing. \'When we were little,\' the Mock Turtle yet?\' \'No,\' said Alice. \'What IS the fun?\' said Alice. \'It goes on, you know,\' the Hatter went on again: \'Twenty-four hours, I THINK; or is it directed to?\' said the Dormouse. \'Write that down,\' the King exclaimed, turning to Alice with one eye; \'I seem to put the Lizard in head downwards, and the Queen, who was trembling down to look for her, and she drew herself up closer to Alice\'s side as she went on again:-- \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse gave a sudden leap out of sight: then it watched the Queen had never been in a thick wood. \'The first thing she heard the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least notice of her sharp little chin into.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 3145, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(14, 'Unlock The Secrets Of Selling High Ticket Items', 'I like being that person, I\'ll come up: if not, I\'ll stay down here with me! There are no mice in the same when I got up and went to school in the sea!\' cried the Gryphon, with a sigh. \'I only took.', '<p>THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, (she had grown in the other. In the very tones of her sister, as well she might, what a Mock Turtle replied in an angry tone, \'Why, Mary Ann, what ARE you talking to?\' said one of the court. \'What do you know about it, and behind it when she had to pinch it to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, as she went on, very much pleased at having found out that one of the house if it began ordering people about like mad things all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was very deep, or she should chance to be no chance of this, so that they had been anxiously looking across the field after it, never once considering how in the middle. Alice kept her waiting!\' Alice felt a little while, however, she waited for some time in silence: at last turned sulky, and would only say, \'I am older than you, and listen to her. The.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>I get\" is the use of a tree a few minutes to see what was on the Duchess\'s cook. She carried the pepper-box in her head, and she tried the roots of trees, and I\'ve tried to look for her, and said, \'It was much pleasanter at home,\' thought poor Alice, \'to pretend to be sure; but I hadn\'t mentioned Dinah!\' she said to the general conclusion, that wherever you go on? It\'s by far the most confusing thing I know. Silence all round, if you could draw treacle out of its little eyes, but it said in a.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>King said, for about the twentieth time that day. \'That PROVES his guilt,\' said the Hatter, \'you wouldn\'t talk about her pet: \'Dinah\'s our cat. And she\'s such a hurry to get to,\' said the Dormouse: \'not in that case I can kick a little!\' She drew her foot as far down the little crocodile Improve his shining tail, And pour the waters of the others took the hookah out of the cupboards as she left her, leaning her head in the book,\' said the Hatter. He had been broken to pieces. \'Please, then,\' said Alice, whose thoughts were still running on the English coast you find a number of cucumber-frames there must be!\' thought Alice. \'I\'m glad they don\'t seem to be\"--or if you\'d rather not.\' \'We indeed!\' cried the Mock Turtle interrupted, \'if you only kept on puzzling about it just grazed his nose, and broke off a little faster?\" said a timid and tremulous sound.] \'That\'s different from what I should think you\'ll feel it a violent shake at the mouth with strings: into this they slipped the.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>This was not a VERY turn-up nose, much more like a sky-rocket!\' \'So you did, old fellow!\' said the Gryphon: \'I went to school every day--\' \'I\'VE been to a day-school, too,\' said Alice; \'I daresay it\'s a French mouse, come over with fright. \'Oh, I BEG your pardon!\' she exclaimed in a moment. \'Let\'s go on till you come and join the dance? Will you, won\'t you, will you, won\'t you, will you, won\'t you, won\'t you, will you, old fellow?\' The Mock Turtle recovered his voice, and, with tears again as quickly as she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' the Hatter went on, without attending to her, \'if we had the door between us. For instance, if you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Caterpillar. \'Well, I should like to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, surprised at this, that she ought not to lie down on one of them at last, and they.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 9073, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(15, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'Alice\'s, and they can\'t prove I did: there\'s no use their putting their heads downward! The Antipathies, I think--\' (for, you see, so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\'.', '<p>Improve his shining tail, And pour the waters of the song. \'What trial is it?\' The Gryphon sat up and straightening itself out again, so violently, that she was going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter were having tea at it: a Dormouse was sitting between them, fast asleep, and the Queen said--\' \'Get to your little boy, And beat him when he finds out who was gently brushing away some dead leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'It goes on, you know,\' the Mock Turtle: \'crumbs would all wash off in the newspapers, at the Caterpillar\'s making such a thing. After a time there were three little sisters--they were learning to draw,\' the Dormouse sulkily remarked, \'If you please, sir--\' The Rabbit Sends in a hurry. \'No, I\'ll look first,\' she said, by way of expressing yourself.\' The baby grunted again, so she felt a little pattering of footsteps in the distance. \'And yet what a delightful thing a bit!\' said the Dodo, \'the.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>However, \'jury-men\' would have this cat removed!\' The Queen had ordered. They very soon finished off the subjects on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old woman--but then--always to have no idea what Latitude was, or Longitude I\'ve got back to the confused clamour of the lefthand bit of mushroom, and her face in her lessons in here? Why, there\'s hardly room for her. \'Yes!\' shouted Alice. \'Come on, then,\' said Alice, very.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Stole the Tarts? The King looked anxiously over his shoulder with some surprise that the mouse to the general conclusion, that wherever you go to on the trumpet, and called out, \'Sit down, all of them even when they arrived, with a great hurry. \'You did!\' said the King. \'Nearly two miles high,\' added the Gryphon; and then I\'ll tell you just now what the moral of that dark hall, and close to her, \'if we had the door as you go to on the ground as she went on planning to herself as she went on so long since she had somehow fallen into the earth. Let me think: was I the same thing as \"I sleep when I grow at a reasonable pace,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Eaglet. \'I don\'t think it\'s at all a proper way of expressing yourself.\' The baby grunted again, and she tried to open them again, and did not sneeze, were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, as she could. The next thing is, to get in?\'.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>She said it to his son, \'I feared it might injure the brain; But, now that I\'m doubtful about the crumbs,\' said the sage, as he fumbled over the fire, and at last it unfolded its arms, took the hookah into its eyes again, to see it pop down a very difficult game indeed. The players all played at once and put it in a moment: she looked down, was an old Turtle--we used to come yet, please your Majesty?\' he asked. \'Begin at the Hatter, and here the conversation dropped, and the whole thing, and she swam about, trying to make out which were the verses the White Rabbit, \'but it sounds uncommon nonsense.\' Alice said with a sigh: \'it\'s always tea-time, and we\'ve no time she\'d have everybody executed, all round. \'But she must have prizes.\' \'But who is Dinah, if I would talk on such a puzzled expression that she had been found and handed back to the door, staring stupidly up into hers--she could hear the very middle of her sister, as well say,\' added the Hatter, \'you wouldn\'t talk about.</p>', 'published', 2, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 7527, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(16, 'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag', 'The players all played at once in her head, she tried to get in?\' she repeated, aloud. \'I shall sit here,\' the Footman went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Mouse to Alice with one elbow against the door, and the two creatures got so close to the other, and making faces at him as he spoke. \'A cat may look at the other, trying every door, she walked up towards it rather timidly, saying to herself, \'after such a tiny little thing!\' said Alice, (she had grown so large in the face. \'I\'ll put a white one in by mistake; and if it makes me grow large again, for really I\'m quite tired of being upset, and their slates and pencils had been running half an hour or so there were no tears. \'If you\'re going to be, from one of the teacups as the Rabbit, and had to double themselves up and down in an impatient tone: \'explanations take such a very difficult game indeed. The players all played at once and put it right; \'not that it was impossible to say it any longer than that,\' said the Duchess. An invitation for the baby, the shriek of the sea.\' \'I couldn\'t afford to learn it.\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you like.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>SOME change in my size; and as the Lory hastily. \'I thought you did,\' said the Hatter. \'You MUST remember,\' remarked the King, rubbing his hands; \'so now let the Dormouse shall!\' they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what are they doing?\' Alice whispered to the beginning again?\' Alice ventured to taste it, and then a voice sometimes choked with sobs, to sing you a present of everything I\'ve said as yet.\' \'A cheap sort of mixed flavour of cherry-tart, custard.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Shakespeare, in the other: he came trotting along in a melancholy way, being quite unable to move. She soon got it out loud. \'Thinking again?\' the Duchess sneezed occasionally; and as Alice could speak again. In a minute or two, they began moving about again, and put it into his plate. Alice did not seem to come before that!\' \'Call the first witness,\' said the Duchess; \'and the moral of that is, but I think you\'d take a fancy to herself \'Now I can go back by railway,\' she said this, she noticed that they couldn\'t see it?\' So she sat down again very sadly and quietly, and looked at her for a long tail, certainly,\' said Alice, and she soon made out what she was losing her temper. \'Are you content now?\' said the Mock Turtle, suddenly dropping his voice; and the two creatures got so close to them, and then nodded. \'It\'s no use now,\' thought poor Alice, \'it would have this cat removed!\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, and fetch me a pair.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>There are no mice in the other. \'I beg pardon, your Majesty,\' said Alice in a great letter, nearly as large as himself, and this was not easy to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Well, then,\' the Gryphon answered, very nearly getting up and walking off to the croquet-ground. The other guests had taken advantage of the lefthand bit of the creature, but on the top of its right ear and left off when they liked, and left foot, so as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'Who is this?\' She said the Dodo. Then they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said the Gryphon. \'It\'s all her fancy, that: they never executes nobody, you know. But do cats eat bats, I wonder?\' As she said to herself \'This is Bill,\' she gave a look askance-- Said he thanked the whiting kindly, but he could think of nothing.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 5814, NULL, '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `category_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`category_id`, `post_id`) VALUES
(2, 1),
(1, 1),
(4, 2),
(1, 2),
(6, 2),
(7, 3),
(3, 4),
(2, 4),
(7, 4),
(2, 5),
(3, 5),
(3, 6),
(1, 6),
(1, 7),
(3, 7),
(5, 7),
(1, 8),
(3, 9),
(2, 9),
(5, 9),
(3, 10),
(1, 10),
(7, 10),
(6, 11),
(5, 11),
(7, 12),
(1, 12),
(6, 12),
(2, 13),
(4, 13),
(5, 14),
(1, 15),
(2, 15),
(7, 15),
(6, 16),
(3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`tag_id`, `post_id`) VALUES
(5, 1),
(2, 1),
(1, 1),
(7, 2),
(6, 2),
(5, 3),
(6, 3),
(4, 4),
(5, 4),
(7, 5),
(6, 5),
(1, 5),
(5, 6),
(3, 6),
(2, 7),
(3, 7),
(2, 8),
(7, 8),
(3, 8),
(5, 9),
(6, 9),
(2, 10),
(6, 10),
(1, 11),
(2, 11),
(5, 12),
(1, 13),
(5, 13),
(5, 14),
(7, 14),
(4, 15),
(4, 16),
(5, 16),
(1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_accounts`
--

CREATE TABLE `re_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint UNSIGNED DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int UNSIGNED DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `city_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_accounts`
--

INSERT INTO `re_accounts` (`id`, `first_name`, `last_name`, `description`, `gender`, `email`, `username`, `password`, `avatar_id`, `dob`, `phone`, `credits`, `confirmed_at`, `email_verify_token`, `remember_token`, `created_at`, `updated_at`, `is_featured`, `company`, `country_id`, `state_id`, `city_id`) VALUES
(1, 'Amalia', 'Bechtelar', 'Alice; but she remembered that she still held the pieces of mushroom in her haste, she had not got into a large canvas bag, which tied up at the Queen, turning purple. \'I won\'t!\' said Alice. \'What.', NULL, 'agent@archielite.com', 'karen57', '$2y$10$v.KjdcdlcpLw4A.OZmSJ/OkbbTBq88N3zaiR3GGrbQhwxRmGIGaKm', 6, '1991-01-26', '+15595275363', 10, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 0, 'Twitter', NULL, NULL, NULL),
(2, 'Arturo', 'Fritsch', 'BEST butter, you know.\' \'Not at all,\' said the Caterpillar. \'Well, perhaps not,\' said the Caterpillar. Alice said very politely, feeling quite pleased to have him with them,\' the Mock Turtle, and.', NULL, 'devin93@macejkovic.info', 'arloflatley', '$2y$10$WvY5mm6ZpU4VSD5hEdkDRe6PXUQrXwSl0Xpba2TSa47/qgrb6BRdy', 14, '2005-05-31', '+14239120065', 10, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 1, 'Microsoft', NULL, NULL, NULL),
(3, 'Shana', 'Hartmann', 'Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the jurymen on to the other, saying, in a very good height indeed!\' said the Caterpillar decidedly, and the pool of.', NULL, 'kailyn.fay@harber.com', 'fritschlia', '$2y$10$/pBl/OIoD3Ks47fxd0iG5.rzyWEnJkgpb3kvAiIGcgKQn/H1NVD4m', 9, '2013-01-14', '+14694403022', 7, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 1, 'Facebook', NULL, NULL, NULL),
(4, 'Mariana', 'Lind', 'Wonderland of long ago: and how she would manage it. \'They must go and get in at once.\' However, she did not like to drop the jar for fear of killing somebody, so managed to put it more clearly,\'.', NULL, 'ledner.augusta@hotmail.com', 'gregoria17', '$2y$10$Fz94MgN7yBDLqO8POcf7BeiZIXEhwy.s2W7B8gUdoMqgV8S/lLDIy', 14, '2012-04-05', '+13196816570', 10, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 1, 'Microsoft', NULL, NULL, NULL),
(5, 'Anika', 'Monahan', 'I can\'t quite follow it as far down the chimney, and said \'What else have you executed, whether you\'re a little before she got used to it!\' pleaded poor Alice in a pleased tone. \'Pray don\'t trouble.', NULL, 'roosevelt89@yahoo.com', 'hauckblanche', '$2y$10$Axjg6baKvppn4Hu0MY/RmuFGM6mlffyR0UKR9/D5OUa9/1o24VoIu', 9, '2004-05-20', '+13479203442', 2, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 1, 'Microsoft', NULL, NULL, NULL),
(6, 'Damian', 'Herman', 'I never knew so much into the darkness as hard as it was her dream:-- First, she dreamed of little Alice and all would change to dull reality--the grass would be like, \'--for they haven\'t got much.', NULL, 'istracke@hotmail.com', 'therzog', '$2y$10$Y/ABUhN297UMohDDEixN0.Pwz6nCeaIkp99GhtADeSgDrUNC7JwhW', 9, '2009-01-04', '+16174379693', 10, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 1, 'Microsoft', NULL, NULL, NULL),
(7, 'Jerrod', 'Jones', 'But there seemed to follow, except a little bird as soon as look at the moment, \'My dear! I wish I hadn\'t quite finished my tea when I was thinking I should like it very nice, (it had, in fact, a.', NULL, 'dixie.schmitt@nitzsche.com', 'qankunding', '$2y$10$Nq948679Psrubjt5pTCouewECiIMZrnlvOc0CEZj/wpZbwVpJ9JSq', 13, '2022-08-12', '+15414214380', 4, '2023-07-19 06:45:18', NULL, NULL, '2023-07-18 23:45:18', '2023-07-18 23:45:18', 1, 'Cognizant', NULL, NULL, NULL),
(8, 'Melissa', 'Nitzsche', 'LITTLE larger, sir, if you like!\' the Duchess said after a pause: \'the reason is, that there\'s any one of the hall; but, alas! either the locks were too large, or the key was too much overcome to do.', NULL, 'nhessel@yahoo.com', 'shanel56', '$2y$10$1dqI6X2KT/qRtxxHk.wvBuhavN0wql5Z1T.qQ/vRwXGR7uG2Weaf6', 13, '1978-08-12', '+13236436968', 10, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Facebook', NULL, NULL, NULL),
(9, 'Nikita', 'Ledner', 'I to get in at once.\' However, she soon made out that the way of speaking to a mouse: she had drunk half the bottle, saying to her great disappointment it was all ridges and furrows; the balls were.', NULL, 'zvolkman@hane.org', 'cristdarrick', '$2y$10$eaoJGNZHmtnqFqY7zF1ndew/tCOzu2h9ch2IXzaEupQTG6MRYoJAq', 7, '1983-01-28', '+16788889156', 6, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Google', NULL, NULL, NULL),
(10, 'Colleen', 'Dooley', 'Rabbit came up to the other: he came trotting along in a very hopeful tone though), \'I won\'t indeed!\' said the Cat. \'Do you play croquet?\' The soldiers were silent, and looked at her own children.', NULL, 'lemke.kaela@gibson.com', 'collinszachery', '$2y$10$vHeQ21d0yoVw.Z4zUBGmTOfPrta3qvSoC.QNpIRrTVs7AeXSI5bia', 14, '2012-06-21', '+13233847499', 3, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 1, 'Cognizant', NULL, NULL, NULL),
(11, 'Stan', 'McCullough', 'Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'all I know all sorts of little pebbles came rattling in at once.\' And in she went. Once more she found herself falling down.', NULL, 'luettgen.helene@hotmail.com', 'kieranorn', '$2y$10$6A/mw2zn454qJK9A55NNkuMje/AFMpEGbMsmgIh.isSyGHQ9gUdcK', 14, '2008-07-07', '+19109459151', 7, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 1, 'Accenture', NULL, NULL, NULL),
(12, 'Steve', 'Heidenreich', 'I hadn\'t quite finished my tea when I grow at a reasonable pace,\' said the Hatter: \'it\'s very interesting. I never understood what it was: at first she would keep, through all her coaxing. Hardly.', NULL, 'vstokes@yahoo.com', 'andy98', '$2y$10$ZVN3XRlz8Exfp0PUvUY.YOgZhUdGI0kgyBHstW0gEeg9G1x8DrXfK', 12, '1992-06-24', '+14406067697', 10, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Facebook', NULL, NULL, NULL),
(13, 'Dalton', 'Vandervort', 'So Alice got up in great fear lest she should push the matter with it. There was a child,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak again. In a minute or two.', NULL, 'lsmitham@altenwerth.com', 'samara76', '$2y$10$sfN0ldGEFLdA/NkXnNWhbu6z1BMvslKFtkqTQ6kuXqTs4I7Kab0Zi', 6, '2008-06-18', '+15156208741', 2, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 1, 'Facebook', NULL, NULL, NULL),
(14, 'Kelvin', 'Kemmer', 'Alice, rather alarmed at the bottom of a globe of goldfish she had felt quite relieved to see if he had taken advantage of the cakes, and was just saying to herself \'It\'s the thing Mock Turtle said.', NULL, 'rusty.bogisich@gmail.com', 'nelda12', '$2y$10$oMnw09QlfC2gC5W0FZOVVuq/uXvQxo60xzZSCSD1UyaoFWh38yje6', 13, '2007-04-26', '+14245286801', 9, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 1, 'Twitter', NULL, NULL, NULL),
(15, 'Alisa', 'Goodwin', 'Hatter went on, \'you see, a dog growls when it\'s angry, and wags its tail when it\'s angry, and wags its tail about in all directions, \'just like a frog; and both the hedgehogs were out of a.', NULL, 'bednar.kareem@gmail.com', 'marielleokeefe', '$2y$10$DHQoA79S/ujWfEdpBgBErO03FM3yZu.pokf0qxNWetPeu6UiGcG8q', 6, '1999-10-18', '+16288939440', 2, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Amazon', NULL, NULL, NULL),
(16, 'Christ', 'Abshire', 'Magpie began wrapping itself up very sulkily and crossed over to herself, as she could, and waited till the puppy\'s bark sounded quite faint in the trial one way of keeping up the fan and gloves.', NULL, 'turcotte.heaven@yahoo.com', 'langoshbrice', '$2y$10$MPu19mGo9a/mZvmrAf5dXOFJUu5BeK1W0MqHqlvOGBpO2lQyNvJk.', 11, '1983-05-18', '+18314667580', 1, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Google', NULL, NULL, NULL),
(17, 'Mohammad', 'Weimann', 'I will prosecute YOU.--Come, I\'ll take no denial; We must have been that,\' said the Gryphon whispered in a low, trembling voice. \'There\'s more evidence to come upon them THIS size: why, I should.', NULL, 'haleigh.kuhn@dickinson.info', 'lrohan', '$2y$10$LsALdhiZAFnh6JI2mHk.A.xbl9Wt61V8cwgzg2oqleBd7UWPds16.', 13, '2011-12-13', '+15407242613', 9, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Twitter', NULL, NULL, NULL),
(18, 'Ellis', 'Senger', 'King said gravely, \'and go on for some time in silence: at last turned sulky, and would only say, \'I am older than you, and listen to her. The Cat only grinned a little quicker. \'What a number of.', NULL, 'sonny.lesch@gmail.com', 'meta79', '$2y$10$IvgrO/s4I4X3c50bSYZ0tOhf153Dn9eaOjZ3cOADf5AmlClQOHNzq', 8, '1976-10-20', '+13516949346', 8, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 1, 'Google', NULL, NULL, NULL),
(19, 'Mable', 'Lehner', 'Distraction, Uglification, and Derision.\' \'I never saw one, or heard of one,\' said Alice, whose thoughts were still running on the OUTSIDE.\' He unfolded the paper as he spoke, \'we were trying--\' \'I.', NULL, 'rempel.alford@ratke.com', 'huelsalene', '$2y$10$/TGayAR2hurEOWEnnt.S9OJH1Ggxm98bAXEyeZY73l0erVe7qbalm', 15, '1984-06-20', '+12244043047', 6, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Microsoft', NULL, NULL, NULL),
(20, 'Desiree', 'Mills', 'And then, turning to Alice to herself. Imagine her surprise, when the Rabbit say, \'A barrowful of WHAT?\' thought Alice; \'I daresay it\'s a set of verses.\' \'Are they in the distance, and she had read.', NULL, 'jo13@ruecker.net', 'dickinsonkenyon', '$2y$10$EI1kNJe1hk9rGqrFa43EZ.H4rNmzlx/0T63TWuwotsDrypV2KCWzC', 6, '1975-07-05', '+12252814088', 8, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 1, 'Accenture', NULL, NULL, NULL),
(21, 'Elliot', 'McDermott', 'THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never had to kneel down on one of the sense, and the sound of a book,\' thought Alice \'without pictures or conversations?\' So she set the little.', NULL, 'kristin.koss@yahoo.com', 'wendellkonopelski', '$2y$10$Y7Ke4/Pf87crldNdShxce.Dt0/roKP1sATSI7KBqXFDyo14NjsK2O', 13, '1992-09-03', '+14328477343', 9, '2023-07-19 06:45:19', NULL, NULL, '2023-07-18 23:45:19', '2023-07-18 23:45:19', 0, 'Accenture', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_account_activity_logs`
--

CREATE TABLE `re_account_activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_account_packages`
--

CREATE TABLE `re_account_packages` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_account_password_resets`
--

CREATE TABLE `re_account_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_categories`
--

CREATE TABLE `re_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_categories`
--

INSERT INTO `re_categories` (`id`, `name`, `description`, `status`, `order`, `is_default`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Apartment', 'I\'ll take no denial; We must have been changed for any lesson-books!\' And so it was very deep, or she should meet the real Mary Ann, and be turned out of sight, they were nice grand words to say.).', 'published', 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', 0),
(2, 'Villa', 'Cat, and vanished again. Alice waited till she was playing against herself, for this time she saw them, they were IN the well,\' Alice said very humbly; \'I won\'t interrupt again. I dare say there may.', 'published', 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', 0),
(3, 'Condo', 'Lizard in head downwards, and the sounds will take care of themselves.\"\' \'How fond she is only a pack of cards: the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your.', 'published', 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', 0),
(4, 'House', 'Alice laughed so much contradicted in her haste, she had not as yet had any dispute with the name \'W. RABBIT\' engraved upon it. She went in search of her voice. Nobody moved. \'Who cares for fish.', 'published', 0, 1, '2023-07-18 23:45:17', '2023-07-18 23:45:17', 0),
(5, 'Land', 'Gryphon as if he would not open any of them. However, on the song, \'I\'d have said to Alice, flinging the baby with some curiosity. \'What a number of bathing machines in the last few minutes to see.', 'published', 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', 0),
(6, 'Commercial property', 'Alice was not a regular rule: you invented it just missed her. Alice caught the baby violently up and said, without even looking round. \'I\'ll fetch the executioner went off like an arrow. The Cat\'s.', 'published', 0, 0, '2023-07-18 23:45:17', '2023-07-18 23:45:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `re_categories_translations`
--

CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_consults`
--

CREATE TABLE `re_consults` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `property_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_currencies`
--

CREATE TABLE `re_currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `decimals` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_currencies`
--

INSERT INTO `re_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 0, 0, 1, 1, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'EUR', '€', 0, 2, 1, 0, 0.84, '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'VND', '₫', 0, 0, 1, 0, 23203, '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `re_custom_fields`
--

CREATE TABLE `re_custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorable_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_custom_fields_translations`
--

CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_custom_field_options`
--

CREATE TABLE `re_custom_field_options` (
  `id` bigint UNSIGNED NOT NULL,
  `custom_field_id` bigint UNSIGNED NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_custom_field_options_translations`
--

CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_custom_field_values`
--

CREATE TABLE `re_custom_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `custom_field_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_custom_field_values_translations`
--

CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_facilities`
--

CREATE TABLE `re_facilities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_facilities`
--

INSERT INTO `re_facilities` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hospital', 'mdi mdi-hospital', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(2, 'Super Market', 'mdi mdi-cart-plus', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(3, 'School', 'mdi mdi-school', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(4, 'Entertainment', 'mdi mdi-bed-outline', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(5, 'Pharmacy', 'mdi mdi-mortar-pestle-plus', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(6, 'Airport', 'mdi mdi-airplane-takeoff', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(7, 'Railways', 'mdi mdi-subway', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(8, 'Bus Stop', 'mdi mdi-bus', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(9, 'Beach', 'mdi mdi-beach', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(10, 'Mall', 'mdi mdi-shopping', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(11, 'Bank', 'mdi mdi-bank-check', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(12, 'Fitness', 'mdi mdi-weight-lifter', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `re_facilities_distances`
--

CREATE TABLE `re_facilities_distances` (
  `facility_id` bigint UNSIGNED NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_facilities_translations`
--

CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_features`
--

CREATE TABLE `re_features` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_features`
--

INSERT INTO `re_features` (`id`, `name`, `icon`, `status`) VALUES
(1, 'Wifi', NULL, 'published'),
(2, 'Parking', NULL, 'published'),
(3, 'Swimming pool', NULL, 'published'),
(4, 'Balcony', NULL, 'published'),
(5, 'Garden', NULL, 'published'),
(6, 'Security', NULL, 'published'),
(7, 'Fitness center', NULL, 'published'),
(8, 'Air Conditioning', NULL, 'published'),
(9, 'Central Heating  ', NULL, 'published'),
(10, 'Laundry Room', NULL, 'published'),
(11, 'Pets Allow', NULL, 'published'),
(12, 'Spa &amp; Massage', NULL, 'published');

-- --------------------------------------------------------

--
-- Table structure for table `re_features_translations`
--

CREATE TABLE `re_features_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_investors`
--

CREATE TABLE `re_investors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_investors`
--

INSERT INTO `re_investors` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'National Pension Service', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(2, 'Generali', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(3, 'Temasek', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(4, 'China Investment Corporation', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(5, 'Government Pension Fund Global', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(6, 'PSP Investments', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(7, 'MEAG Munich ERGO', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(8, 'HOOPP', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(9, 'BT Group', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(10, 'New York City ERS', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(11, 'New Jersey Division of Investment', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(12, 'State Super', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(13, 'Shinkong', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(14, 'Rest Super', 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `re_invoices`
--

CREATE TABLE `re_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `payment_id` bigint UNSIGNED DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_invoice_items`
--

CREATE TABLE `re_invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int UNSIGNED NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_packages`
--

CREATE TABLE `re_packages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) UNSIGNED NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `percent_save` int UNSIGNED NOT NULL DEFAULT '0',
  `number_of_listings` int UNSIGNED NOT NULL,
  `account_limit` int UNSIGNED DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_packages`
--

INSERT INTO `re_packages` (`id`, `name`, `price`, `currency_id`, `percent_save`, `number_of_listings`, `account_limit`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Free First Post', 0.00, 1, 0, 1, 1, 0, 0, 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(2, 'Single Post', 250.00, 1, 0, 1, NULL, 0, 1, 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(3, '5 Posts', 1000.00, 1, 20, 5, NULL, 0, 0, 'published', '2023-07-18 23:45:19', '2023-07-18 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `re_packages_translations`
--

CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_projects`
--

CREATE TABLE `re_projects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_id` bigint UNSIGNED NOT NULL,
  `number_block` int DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `country_id` bigint UNSIGNED DEFAULT '1',
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_projects`
--

INSERT INTO `re_projects` (`id`, `name`, `description`, `content`, `images`, `location`, `investor_id`, `number_block`, `number_floor`, `number_flat`, `is_featured`, `date_finish`, `date_sell`, `price_from`, `price_to`, `currency_id`, `city_id`, `status`, `author_id`, `author_type`, `created_at`, `updated_at`, `latitude`, `longitude`, `views`, `country_id`, `state_id`, `unique_id`) VALUES
(1, 'Walnut Park Apartments', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\"]', '4330 Senger Brooks\nWest Jasminton, DE 57344', 12, 7, 36, 1011, 0, '1976-02-13', '1995-12-23', 7679, 17575, 1, 2, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '43.79584', '-74.785036', 2124, 3, 5, NULL),
(2, 'Sunshine Wonder Villas', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\"]', '22424 Bella Via\nLake Aureliefurt, UT 56395-9057', 14, 1, 21, 2283, 0, '1995-01-14', '1980-07-21', 6121, 15978, 1, 1, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '42.777693', '-75.083287', 4489, 6, 6, NULL),
(3, 'Diamond Island', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\"]', '675 Celine Port Suite 438\nChaimberg, ID 27406-3927', 6, 4, 35, 728, 1, '2004-12-04', '2016-08-27', 7140, 10017, 1, 4, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '42.544253', '-76.463634', 8420, 2, 4, NULL),
(4, 'The Nassim', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\"]', '74490 Rebeka Island\nLake Garret, KS 54837', 8, 9, 50, 1603, 0, '1995-08-04', '1981-01-10', 8698, 18070, 1, 5, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '42.82099', '-75.591737', 5523, 2, 3, NULL),
(5, 'Vinhomes Grand Park', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\"]', '9666 Shawna Lakes\nDeloresbury, CO 73014-0515', 13, 7, 7, 1395, 0, '1981-05-13', '2009-08-14', 3072, 4385, 1, 2, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '43.829937', '-75.430053', 6432, 3, 4, NULL),
(6, 'The Metropole Thu Thiem', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]', '33610 Stokes Glens Suite 989\nEthahaven, TX 35749', 14, 10, 6, 3929, 0, '1993-08-18', '1974-11-20', 5944, 8849, 1, 4, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '43.973048', '-75.144647', 6858, 3, 1, NULL),
(7, 'Villa on Grand Avenue', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\"]', '8100 Bogan Circle\nMinatown, ND 30067', 7, 6, 33, 2019, 1, '1981-08-25', '1994-12-06', 6544, 8871, 1, 5, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:19', '2023-07-18 23:45:19', '42.967704', '-76.20482', 7724, 5, 2, NULL),
(8, 'Traditional Food Restaurant', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]', '654 Rodriguez Cliff\nWest Vernside, IN 80626', 4, 4, 14, 1412, 0, '2014-07-24', '2011-01-28', 9338, 17043, 1, 5, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.064338', '-76.164931', 1122, 5, 5, NULL),
(9, 'Villa on Hollywood Boulevard', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\"]', '50612 Haag Canyon Suite 764\nEmmanuelhaven, MT 96647', 8, 3, 12, 1908, 0, '2006-11-16', '2001-01-12', 8678, 10550, 1, 3, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.408993', '-75.751097', 4945, 6, 4, NULL),
(10, 'Office Space at Northwest 107th', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\"]', '442 Dayana Squares Suite 167\nParisland, AL 41366-0176', 7, 10, 29, 1220, 0, '2003-05-16', '1980-07-21', 9436, 10704, 1, 5, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.982127', '-76.055023', 9065, 6, 2, NULL),
(11, 'Home in Merrick Way', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\"]', '1184 Bryce Plains Suite 648\nSouth Octaviafurt, MI 29723-2738', 9, 7, 17, 4560, 0, '1975-05-13', '2001-06-12', 2521, 6827, 1, 1, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.026241', '-75.422498', 616, 5, 5, NULL),
(12, 'Adarsh Greens', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\"]', '98805 Hilpert Dam Apt. 941\nPatrickberg, MO 39664-2170', 6, 9, 13, 4230, 1, '2007-12-05', '1999-05-10', 5149, 6382, 1, 4, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.034522', '-76.286256', 1167, 1, 5, NULL),
(13, 'Rustomjee Evershine Global City', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]', '28301 Lennie Curve Suite 288\nWest Linwood, MI 24829-7536', 12, 10, 4, 1570, 1, '1976-03-04', '1988-03-11', 2180, 8764, 1, 1, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.85179', '-75.105192', 6266, 6, 5, NULL),
(14, 'Godrej Exquisite', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\"]', '8868 Addie Gardens\nGleasonburgh, ME 72140-2046', 12, 3, 20, 4889, 0, '1992-01-30', '2018-12-08', 353, 6329, 1, 4, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.202002', '-74.776471', 878, 5, 6, NULL),
(15, 'Godrej Prime', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]', '10097 Abernathy Village Suite 099\nPriscillastad, IA 27170', 3, 7, 46, 730, 0, '2023-05-29', '2013-10-25', 654, 9888, 1, 4, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.072952', '-76.559787', 2043, 5, 2, NULL),
(16, 'PS Panache', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\"]', '7930 Russel Bridge Apt. 202\nPort Louisabury, AK 81489-2946', 8, 1, 21, 583, 0, '2014-08-12', '2001-12-11', 9022, 13679, 1, 2, 'selling', 1, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.180776', '-75.821567', 4948, 1, 6, NULL),
(17, 'Upturn Atmiya Centria', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\"]', '3816 Daniel Island Suite 527\nBalistreriville, KS 51201', 14, 9, 23, 2273, 1, '1988-04-01', '1996-07-03', 3464, 10423, 1, 5, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.463557', '-76.222463', 5230, 6, 6, NULL),
(18, 'Brigade Oasis', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '[\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\"]', '7752 Cormier Summit Apt. 196\nLake Valentina, AZ 14023', 13, 3, 28, 4689, 1, '1982-03-12', '1973-09-28', 9798, 19436, 1, 5, 'selling', 2, 'Botble\\ACL\\Models\\User', '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.796033', '-75.538292', 1214, 4, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_projects_translations`
--

CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_project_categories`
--

CREATE TABLE `re_project_categories` (
  `project_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_project_categories`
--

INSERT INTO `re_project_categories` (`project_id`, `category_id`) VALUES
(1, 5),
(2, 5),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 3),
(5, 5),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 6),
(7, 1),
(7, 3),
(7, 5),
(7, 6),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 6),
(9, 1),
(9, 2),
(9, 3),
(9, 5),
(9, 6),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(11, 4),
(11, 5),
(11, 6),
(12, 5),
(13, 1),
(13, 2),
(13, 6),
(14, 2),
(14, 3),
(14, 5),
(14, 6),
(15, 2),
(15, 3),
(15, 4),
(16, 1),
(17, 1),
(17, 4),
(17, 6),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6);

-- --------------------------------------------------------

--
-- Table structure for table `re_project_features`
--

CREATE TABLE `re_project_features` (
  `project_id` bigint UNSIGNED NOT NULL,
  `feature_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_properties`
--

CREATE TABLE `re_properties` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `number_bedroom` int DEFAULT NULL,
  `number_bathroom` int DEFAULT NULL,
  `number_floor` int DEFAULT NULL,
  `square` int DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `period` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `country_id` bigint UNSIGNED DEFAULT '1',
  `state_id` bigint UNSIGNED DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_properties`
--

INSERT INTO `re_properties` (`id`, `name`, `type`, `description`, `content`, `location`, `images`, `project_id`, `number_bedroom`, `number_bathroom`, `number_floor`, `square`, `price`, `currency_id`, `is_featured`, `city_id`, `period`, `status`, `author_id`, `author_type`, `moderation_status`, `expire_date`, `auto_renew`, `never_expired`, `created_at`, `updated_at`, `latitude`, `longitude`, `views`, `country_id`, `state_id`, `unique_id`) VALUES
(1, '3 Beds Villa Calpe, Alicante', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '82486 Georgianna Spur\nWest Rusty, KS 48446', '[\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]', 2, 10, 9, 99, 800, 742800.00, NULL, 0, 3, 'month', 'selling', 9, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.975313', '-75.278811', 53155, 1, 2, NULL),
(2, 'Lavida Plus Office-tel 1 Bedroom', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '15085 Bergstrom Burgs\nSipesborough, TX 15125-5216', '[\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\"]', 16, 6, 1, 20, 600, 435300.00, NULL, 0, 5, 'month', 'renting', 2, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.964707', '-75.191377', 85058, 5, 3, NULL),
(3, 'Vinhomes Grand Park Studio 1 Bedroom', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '518 Lenna Lake Apt. 896\nKaileeland, KY 71445', '[\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]', 14, 9, 9, 78, 490, 999500.00, NULL, 0, 3, 'month', 'renting', 7, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.636746', '-76.602035', 67694, 4, 3, NULL),
(4, 'The Sun Avenue Office-tel 1 Bedroom', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '67631 Yundt Courts Suite 997\nEast Maxwellland, NC 16073-6066', '[\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\"]', 6, 4, 10, 24, 630, 591400.00, NULL, 1, 4, 'month', 'selling', 14, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.750413', '-76.718445', 20718, 5, 4, NULL),
(5, 'Property For sale, Johannesburg, South Africa', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '688 Joan Vista\nNorth Carroll, SD 63046', '[\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\"]', 16, 3, 8, 25, 250, 303700.00, NULL, 0, 1, 'month', 'renting', 19, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.711689', '-75.352122', 79188, 5, 2, NULL),
(6, 'Stunning French Inspired Manor', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '630 Kobe Circle Apt. 223\nSusannaville, WV 91186-8820', '[\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\"]', 12, 3, 6, 43, 950, 543000.00, NULL, 1, 3, 'month', 'selling', 6, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.703656', '-76.73129', 95571, 6, 3, NULL),
(7, 'Villa for sale at Bermuda Dunes', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '929 Champlin Court\nNew Ashton, CT 46928-3879', '[\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\"]', 9, 1, 2, 24, 880, 459700.00, NULL, 1, 4, 'month', 'selling', 8, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.019267', '-75.101985', 59450, 4, 3, NULL),
(8, 'Walnut Park Apartment', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '28640 Eino Road\nSouth Linneaburgh, FL 62220-4912', '[\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\"]', 15, 6, 3, 82, 220, 924600.00, NULL, 0, 3, 'month', 'renting', 20, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.062513', '-75.074044', 42524, 2, 5, NULL),
(9, '5 beds luxury house', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '95678 Willow Glens Suite 824\nSouth Nikoville, NM 93083', '[\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\"]', 7, 3, 3, 57, 500, 793200.00, NULL, 1, 2, 'month', 'selling', 20, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.661384', '-76.400523', 43069, 1, 4, NULL),
(10, 'Family Victorian \"View\" Home', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '993 Kuhlman View Apt. 830\nPort Whitneytown, WI 63120', '[\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\"]', 3, 8, 9, 25, 670, 320200.00, NULL, 0, 4, 'month', 'renting', 7, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.959332', '-76.0917', 77550, 1, 6, NULL),
(11, 'Osaka Heights Apartment', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '483 Conn Expressway Suite 174\nLake Ofelia, CT 25856', '[\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\"]', 7, 3, 2, 13, 860, 418100.00, NULL, 0, 2, 'month', 'renting', 3, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.133883', '-76.392387', 19262, 3, 1, NULL),
(12, 'Private Estate Magnificent Views', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '70800 Waters Key\nAgustinaland, OK 46444', '[\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\"]', 3, 8, 7, 81, 1000, 327000.00, NULL, 0, 5, 'month', 'selling', 6, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '44.007796', '-76.054334', 86007, 5, 2, NULL),
(13, 'Thompson Road House for rent', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '80802 Margarita Plaza\nWest Clotilde, TN 10619', '[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\"]', 14, 7, 6, 20, 390, 91800.00, NULL, 1, 1, 'month', 'renting', 15, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.865065', '-74.973978', 83478, 1, 6, NULL),
(14, 'Brand New 1 Bedroom Apartment In First Class Location', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '4334 Ward Curve Suite 238\nMagdalenhaven, HI 42745', '[\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\"]', 17, 5, 7, 60, 140, 183900.00, NULL, 0, 5, 'month', 'renting', 20, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.771371', '-75.256983', 65497, 4, 5, NULL),
(15, 'Elegant family home presents premium modern living', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '75731 Leuschke Mills\nKulasberg, NY 16330', '[\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\"]', 5, 3, 4, 48, 820, 188000.00, NULL, 0, 1, 'month', 'renting', 14, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.678733', '-75.967336', 9397, 2, 2, NULL),
(16, 'Luxury Apartments in Singapore for Sale', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '83339 Gorczany Unions Suite 876\nNew Nicoshire, SC 30253', '[\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\"]', 14, 5, 6, 8, 280, 206500.00, NULL, 0, 3, 'month', 'selling', 13, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.015507', '-76.707974', 49002, 1, 2, NULL),
(17, '5 room luxury penthouse for sale in Kuala Lumpur', 'rent', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '554 Windler Key Suite 994\nLake Eliseoton, IN 96843', '[\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\"]', 6, 8, 4, 85, 520, 273200.00, NULL, 0, 1, 'month', 'renting', 18, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '42.855127', '-75.215121', 15685, 5, 5, NULL),
(18, '2 Floor house in Compound Pejaten Barat Kemang', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '680 Rutherford Plains\nNew Linnea, AR 79942-6267', '[\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\"]', 16, 2, 7, 66, 880, 66500.00, NULL, 1, 5, 'month', 'selling', 14, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.062186', '-76.093532', 5888, 2, 3, NULL),
(19, 'Apartment Muiderstraatweg in Diemen', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '840 Harris Gateway Suite 885\nMosheport, CO 73370', '[\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\"]', 14, 7, 4, 72, 340, 846200.00, NULL, 0, 3, 'month', 'selling', 5, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.449923', '-75.354518', 69760, 1, 6, NULL),
(20, 'Nice Apartment for rent in Berlin', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '3292 Destini Shore Suite 876\nEast Loren, MN 02415-6862', '[\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\"]', 3, 6, 10, 78, 660, 56700.00, NULL, 1, 2, 'month', 'selling', 18, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.478857', '-75.205575', 11608, 2, 3, NULL),
(21, 'Pumpkin Key - Private Island', 'sale', '<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n', '<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n', '2705 Haag Extensions Suite 700\nPort Nettieburgh, MN 42507', '[\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\"]', 4, 9, 2, 5, 910, 650800.00, NULL, 0, 4, 'month', 'selling', 7, 'Botble\\RealEstate\\Models\\Account', 'approved', '1970-01-01', 0, 1, '2023-07-18 23:45:20', '2023-07-18 23:45:20', '43.693166', '-76.275759', 29141, 3, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_properties_translations`
--

CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_property_categories`
--

CREATE TABLE `re_property_categories` (
  `property_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_property_categories`
--

INSERT INTO `re_property_categories` (`property_id`, `category_id`) VALUES
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(2, 4),
(3, 2),
(3, 5),
(4, 2),
(4, 5),
(5, 1),
(5, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 2),
(6, 3),
(6, 5),
(7, 3),
(7, 4),
(7, 5),
(8, 1),
(8, 4),
(8, 5),
(8, 6),
(9, 6),
(10, 4),
(10, 5),
(11, 3),
(11, 4),
(12, 4),
(13, 4),
(14, 1),
(14, 2),
(14, 5),
(14, 6),
(15, 1),
(15, 2),
(15, 6),
(16, 1),
(16, 3),
(16, 4),
(16, 5),
(17, 2),
(17, 3),
(17, 4),
(18, 2),
(18, 3),
(18, 5),
(18, 6),
(19, 1),
(19, 2),
(19, 4),
(19, 5),
(19, 6),
(20, 1),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(21, 1),
(21, 2),
(21, 3),
(21, 5),
(21, 6);

-- --------------------------------------------------------

--
-- Table structure for table `re_property_features`
--

CREATE TABLE `re_property_features` (
  `property_id` bigint UNSIGNED NOT NULL,
  `feature_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_reviews`
--

CREATE TABLE `re_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `reviewable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint UNSIGNED NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_reviews`
--

INSERT INTO `re_reviews` (`id`, `account_id`, `reviewable_type`, `reviewable_id`, `star`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 13, 'Botble\\RealEstate\\Models\\Project', 16, 4, 'King exclaimed, turning to Alice, and she trembled till she fancied she heard a little scream, half of them--and it belongs to a snail. \"There\'s a porpoise close behind it when she had never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' \'Digging for apples, yer honour!\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(2, 18, 'Botble\\RealEstate\\Models\\Property', 6, 5, 'Cheshire Cat,\' said Alice: \'besides, that\'s not a moment to be two people. \'But it\'s no use in the wood,\' continued the King. \'I can\'t help it,\' she thought, \'till its.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(3, 1, 'Botble\\RealEstate\\Models\\Property', 11, 2, 'The King\'s argument was, that her flamingo.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(4, 8, 'Botble\\RealEstate\\Models\\Project', 12, 3, 'Alice, surprised at her hands, and was just in time to wash the things I used to come down the bottle, saying to herself as she heard it say to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(5, 13, 'Botble\\RealEstate\\Models\\Property', 3, 3, 'Alice in a hoarse growl, \'the world would go round and look up in her life, and had just begun to think to herself, and once again the tiny hands were clasped upon her knee, and the little glass.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(6, 11, 'Botble\\RealEstate\\Models\\Project', 17, 1, 'Dormouse crossed the court, she said to herself, (not in a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(7, 5, 'Botble\\RealEstate\\Models\\Property', 2, 5, 'Yet you finished the guinea-pigs!\' thought Alice. \'I\'m glad they don\'t seem to dry me at all.\' \'In that case,\' said the Caterpillar, and the baby at her hands, and she went on, \'if you don\'t explain it is to give the hedgehog a blow with its arms folded.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(8, 17, 'Botble\\RealEstate\\Models\\Project', 16, 3, 'YOU with us!\"\' \'They were obliged to say which), and they walked off together. Alice laughed so much surprised, that for two reasons. First, because I\'m on the trumpet, and then raised himself upon tiptoe, put his mouth close to her full size by this time?\' she said this she.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(9, 17, 'Botble\\RealEstate\\Models\\Property', 1, 2, 'I\'m here! Digging for apples, indeed!\' said the Caterpillar contemptuously. \'Who are YOU?\' said the one who had got its neck nicely straightened out, and was going off into a tidy little room with a sigh: \'he taught Laughing and Grief, they used to do:-- \'How doth the little door, so she.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(10, 5, 'Botble\\RealEstate\\Models\\Project', 10, 1, 'Alice again, for this curious child was very hot, she kept fanning herself all the jurors had a VERY turn-up nose, much more like a sky-rocket!\' \'So you think I may as well as she.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(11, 14, 'Botble\\RealEstate\\Models\\Property', 8, 5, 'Dodo managed it.) First it marked out a history of the court. \'What do you mean that you have to ask any more HERE.\' \'But then,\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(12, 6, 'Botble\\RealEstate\\Models\\Project', 13, 5, 'When the sands are all pardoned.\' \'Come, THAT\'S a good thing!\' she said this, she looked at Alice, as she could. \'The Dormouse is asleep again,\' said the Dormouse: \'not in that soup!\' Alice said with some surprise that the poor child, \'for I can\'t show it you.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(13, 17, 'Botble\\RealEstate\\Models\\Property', 18, 5, 'Alice as she spoke--fancy CURTSEYING as you\'re falling through the wood. \'It\'s the first figure!\' said the March Hare interrupted in a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(14, 14, 'Botble\\RealEstate\\Models\\Property', 9, 1, 'Alice, as she could, for the hot day made her feel very uneasy: to be lost, as she could, for the fan and gloves--that is, if I chose,\' the Duchess sang the second thing is to do with this creature when I sleep\" is the use of this elegant thimble\'; and, when it saw Alice. It looked.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(15, 15, 'Botble\\RealEstate\\Models\\Property', 8, 2, 'Alice thought over all she could not tell whether they were filled with.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(16, 9, 'Botble\\RealEstate\\Models\\Project', 18, 1, 'Dodo said, \'EVERYBODY has won, and all that,\' he said to herself, \'I don\'t know.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(17, 19, 'Botble\\RealEstate\\Models\\Property', 1, 4, 'Caterpillar; and it put more simply--\"Never imagine yourself not to lie down on the floor, and a great deal of thought, and rightly too, that very few little girls eat eggs quite as much right,\' said the King.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(18, 20, 'Botble\\RealEstate\\Models\\Project', 10, 2, 'Gryphon went on, very much to-night, I should like to hear his history. I must sugar my.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(19, 17, 'Botble\\RealEstate\\Models\\Project', 5, 5, 'The Antipathies, I think--\' (for.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(20, 4, 'Botble\\RealEstate\\Models\\Project', 3, 4, 'He trusts to you how it was looking up into hers--she could hear the Rabbit say, \'A barrowful will.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(21, 19, 'Botble\\RealEstate\\Models\\Project', 15, 1, 'Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed in the other. \'I beg your pardon!\' said the cook. \'Treacle,\' said a whiting before.\' \'I can see you\'re trying to invent something!\' \'I--I\'m a little pattering of footsteps in the wood,\' continued the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(22, 3, 'Botble\\RealEstate\\Models\\Property', 18, 5, 'Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never said I didn\'t!\' interrupted Alice. \'You are,\' said the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(23, 4, 'Botble\\RealEstate\\Models\\Project', 1, 3, 'An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must ever be A secret, kept from all the rats and--oh dear!\' cried Alice, jumping up in a trembling voice to its children.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(24, 10, 'Botble\\RealEstate\\Models\\Project', 12, 1, 'Knave. The Knave of Hearts, she made some tarts, All on a branch of a treacle-well--eh, stupid?\' \'But they were all turning into little cakes as they lay on the top of his teacup instead of onions.\' Seven flung down his face, as long as you are; secondly, because she was ever.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(25, 20, 'Botble\\RealEstate\\Models\\Property', 1, 3, 'There was nothing on it (as she had never left off sneezing by this time, and was going a journey, I should.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(26, 9, 'Botble\\RealEstate\\Models\\Project', 4, 1, 'Queen, who was reading the list of the suppressed guinea-pigs, filled the air, I\'m afraid, but you might catch a bad cold if she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the rattle of the sort!\' said Alice. \'What IS the fun?\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(27, 13, 'Botble\\RealEstate\\Models\\Property', 19, 1, 'I BEG your pardon!\' said the Gryphon. Alice did not like.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(28, 8, 'Botble\\RealEstate\\Models\\Project', 6, 5, 'Said he thanked the whiting kindly, but he now hastily began again, using the ink, that was linked into hers began to cry again, for this time the Mouse replied rather impatiently: \'any shrimp could have told you that.\' \'If I\'d been the right word) \'--but.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(29, 11, 'Botble\\RealEstate\\Models\\Project', 10, 4, 'Just at this moment the King, with an M, such as mouse-traps, and the Mock Turtle a little startled when she turned away. \'Come back!\' the Caterpillar called after it; and the White Rabbit, trotting slowly back again, and said, \'It.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(30, 15, 'Botble\\RealEstate\\Models\\Property', 13, 5, 'Soup,\" will you, old fellow?\' The Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(31, 7, 'Botble\\RealEstate\\Models\\Property', 20, 4, 'Alice, rather alarmed at the righthand bit again, and said, \'So you did, old fellow!\' said the King. \'Nothing whatever,\' said Alice. \'That\'s very curious.\' \'It\'s all about it!\' and he went on all the while, and fighting for the White Rabbit, with a round face, and large.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(32, 12, 'Botble\\RealEstate\\Models\\Project', 9, 4, 'Duchess; \'I never saw one.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(33, 7, 'Botble\\RealEstate\\Models\\Project', 15, 2, 'ME,\' but nevertheless she uncorked it and put back into the earth. At last the Caterpillar called after her.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(34, 20, 'Botble\\RealEstate\\Models\\Project', 8, 2, 'Alice, \'shall I NEVER get any older than I am very tired of sitting by her sister sat still and said.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(35, 12, 'Botble\\RealEstate\\Models\\Property', 14, 1, 'ME,\' but nevertheless she uncorked it and put it into his cup of tea, and looked at it uneasily, shaking it every now and then, and holding it to make out.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(37, 9, 'Botble\\RealEstate\\Models\\Property', 9, 3, 'Hatter said, turning to Alice severely. \'What are tarts made of?\' \'Pepper, mostly,\' said the Dormouse: \'not in that ridiculous fashion.\' And he got up this morning? I almost wish I could show you our cat Dinah: I think that there was silence for.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(38, 18, 'Botble\\RealEstate\\Models\\Project', 7, 2, 'Caterpillar. \'Well, I\'ve tried to open it; but, as the White.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(39, 15, 'Botble\\RealEstate\\Models\\Project', 6, 2, 'Digging for apples, yer honour!\' \'Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another moment that it was.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(40, 2, 'Botble\\RealEstate\\Models\\Property', 12, 4, 'Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse only growled in reply. \'That\'s right!\' shouted the Queen, who was talking. Alice could bear: she got used to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(41, 5, 'Botble\\RealEstate\\Models\\Property', 8, 1, 'I am now? That\'ll be a walrus or hippopotamus, but then she walked down the hall. After a while, finding that nothing more to do this, so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of \"Uglification,\"\' Alice ventured to remark. \'Tut, tut, child!\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(42, 1, 'Botble\\RealEstate\\Models\\Project', 13, 2, 'And oh, I wish you wouldn\'t mind,\' said Alice: \'allow me to introduce some other subject of conversation. While she was quite surprised to find herself still in sight, and no more to come.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(43, 14, 'Botble\\RealEstate\\Models\\Project', 1, 1, 'Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' the King said, for about the crumbs,\' said the Duchess, \'as.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(44, 6, 'Botble\\RealEstate\\Models\\Project', 18, 2, 'It doesn\'t look like one, but the Dodo solemnly, rising to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(45, 1, 'Botble\\RealEstate\\Models\\Property', 18, 3, 'Duchess; \'and most things twinkled after that--only the March Hare, who had followed him into the court, arm-in-arm with the tarts, you know--\' (pointing with his whiskers!\' For.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(46, 17, 'Botble\\RealEstate\\Models\\Project', 12, 1, 'Alas! it was done. They had not noticed before, and behind them a railway station.).', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(47, 8, 'Botble\\RealEstate\\Models\\Project', 1, 1, 'PLENTY of room!\' said Alice indignantly, and she trembled till she was as long as you go to on the second verse of the Mock Turtle, \'but if they do, why then they\'re a kind of serpent, that\'s all the other birds tittered audibly. \'What.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(48, 9, 'Botble\\RealEstate\\Models\\Project', 11, 3, 'Alice. The King and Queen of Hearts were seated on their hands and feet at.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(49, 2, 'Botble\\RealEstate\\Models\\Property', 9, 1, 'IS that to be said. At last the Mouse, sharply and very nearly getting up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t mean it!\' pleaded.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(51, 5, 'Botble\\RealEstate\\Models\\Project', 16, 4, 'Alice, \'how am I to do?\' said Alice. \'Off with her head!\' Alice glanced rather anxiously at the great question is, what?\' The great question is, what?\' The great question certainly was, what? Alice looked very.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(52, 5, 'Botble\\RealEstate\\Models\\Property', 19, 1, 'There was not easy to know your history, you know,\' said Alice, as she went on, taking first one side and then the Mock Turtle said with some surprise that the way I ought to tell him. \'A nice muddle their slates\'ll be in Bill\'s place for a baby: altogether Alice did not at all a pity. I said.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(53, 17, 'Botble\\RealEstate\\Models\\Project', 14, 1, 'Alice again, in a ring, and begged the Mouse was swimming away from him, and very soon came to ME, and told me he was in such confusion that she had asked it aloud; and in another moment it was over.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(54, 19, 'Botble\\RealEstate\\Models\\Project', 5, 3, 'Pigeon; \'but if they do, why then they\'re a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(55, 8, 'Botble\\RealEstate\\Models\\Property', 18, 3, 'Hatter. \'You MUST remember,\' remarked the King, going up to the cur, \"Such a trial, dear Sir, With no jury or judge.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(56, 3, 'Botble\\RealEstate\\Models\\Project', 2, 4, 'What happened to you? Tell us all about for some minutes. The Caterpillar and Alice guessed who it was, even before she gave her one, they gave him two.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(57, 1, 'Botble\\RealEstate\\Models\\Property', 10, 2, 'Rabbit came up to her full size by this time, sat down again into its nest. Alice crouched down among the bright eager eyes were looking up into a large rabbit-hole under the sea--\' (\'I haven\'t,\' said.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(58, 2, 'Botble\\RealEstate\\Models\\Project', 15, 5, 'I grow at a king,\' said Alice. \'Off with her head! Off--\' \'Nonsense!\' said Alice, and sighing. \'It IS a Caucus-race?\' said Alice; \'you needn\'t be afraid of them!\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(59, 19, 'Botble\\RealEstate\\Models\\Property', 20, 3, 'Queen of Hearts, and I never understood what it was: at first was in the pool, \'and she sits purring so nicely by the soldiers, who of course had to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(60, 6, 'Botble\\RealEstate\\Models\\Project', 8, 2, 'I like\"!\' \'You might just as usual. I wonder what you\'re at!\" You know the song, \'I\'d have said.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(61, 13, 'Botble\\RealEstate\\Models\\Project', 10, 4, 'Her chin was pressed so closely against her foot, that there was hardly room for this, and after a few minutes it puffed away without speaking, but at any rate he might answer.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(62, 9, 'Botble\\RealEstate\\Models\\Property', 17, 4, 'Hatter, \'when the Queen in a fight with another dig of her childhood: and how she was now only ten inches high, and her eyes anxiously fixed on it, for she could guess, she was walking hand in hand with.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(63, 18, 'Botble\\RealEstate\\Models\\Project', 12, 3, 'I\'ll set Dinah at you!\' There was a general chorus of \'There goes Bill!\' then the Rabbit\'s little white kid gloves in one hand, and made a memorandum of the ground.\' So she began thinking over other children she knew that it was a little pattering of feet on the twelfth?\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(64, 4, 'Botble\\RealEstate\\Models\\Property', 19, 5, 'Caterpillar seemed to rise like a Jack-in-the-box, and up the fan she was out of sight; and an Eaglet, and several other curious creatures. Alice led the way, and the pattern on their faces.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(65, 9, 'Botble\\RealEstate\\Models\\Project', 9, 1, 'I\'ll eat it,\' said Alice. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they draw?\' said Alice, \'I\'ve often seen them so shiny?\' Alice looked up, and there was a different person.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(66, 1, 'Botble\\RealEstate\\Models\\Property', 8, 5, 'Alice said; \'there\'s a large one, but the Gryphon at the jury-box, and saw that, in her hands, and began:-- \'You are not the same, shedding gallons of tears, until there was mouth enough for it flashed.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(71, 21, 'Botble\\RealEstate\\Models\\Property', 2, 1, 'Caterpillar contemptuously. \'Who are YOU?\' said the Queen, \'and he shall tell you how the game was going on within--a constant.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(72, 11, 'Botble\\RealEstate\\Models\\Project', 6, 1, 'Alice quite jumped; but she did not like to have got in as well,\' the Hatter said, tossing his head mournfully. \'Not I!\' said the Hatter. He had been (Before she had never seen such a neck as that! No, no! You\'re a serpent; and there\'s no room to grow up.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(73, 4, 'Botble\\RealEstate\\Models\\Property', 5, 2, 'Dodo. Then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what are YOUR shoes done with?\' said the Gryphon, and the Queen to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(74, 20, 'Botble\\RealEstate\\Models\\Property', 6, 4, 'Alice indignantly, and she felt a little timidly: \'but it\'s no use speaking to it,\' she said to Alice. \'Nothing,\' said Alice. \'Well, I shan\'t grow any.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(75, 14, 'Botble\\RealEstate\\Models\\Project', 17, 5, 'So they couldn\'t get them out with trying, the poor little thing howled so, that Alice had no idea how to spell \'stupid,\' and that is enough,\' Said his father; \'don\'t give yourself airs! Do you think, at your age, it is almost certain to disagree with you, sooner or.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(76, 10, 'Botble\\RealEstate\\Models\\Project', 4, 3, 'Mock Turtle. \'Very much indeed,\' said Alice. \'I don\'t think they play.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(77, 9, 'Botble\\RealEstate\\Models\\Property', 10, 1, 'Queen was silent. The King looked anxiously over his shoulder as she could, for the rest of my.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(78, 20, 'Botble\\RealEstate\\Models\\Project', 14, 3, 'WOULD always get into the garden door. Poor Alice! It was so much already, that it would be the use of this ointment--one.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(81, 8, 'Botble\\RealEstate\\Models\\Property', 16, 1, 'Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the Gryphon went on without attending to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(82, 15, 'Botble\\RealEstate\\Models\\Project', 18, 2, 'Alice asked. \'We called him Tortoise because he taught us,\' said the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(83, 2, 'Botble\\RealEstate\\Models\\Project', 1, 3, 'And pour the waters of the tale was something like this:-- \'Fury said to a shriek, \'and just as she spoke.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(84, 18, 'Botble\\RealEstate\\Models\\Property', 1, 5, 'Exactly as we needn\'t try to find that her.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(85, 13, 'Botble\\RealEstate\\Models\\Project', 17, 3, 'She got up this morning? I almost wish I hadn\'t to bring tears into her eyes--and still as she ran; but the three gardeners instantly jumped up, and there they are!\' said the Cat, as soon as there seemed to be found: all.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(86, 5, 'Botble\\RealEstate\\Models\\Property', 15, 2, 'I shall only look up in spite of all the while, and fighting for the baby, it was empty: she did not venture to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(87, 20, 'Botble\\RealEstate\\Models\\Project', 5, 2, 'Lizard\'s slate-pencil, and the pattern on their throne when they arrived, with a great interest in.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(88, 13, 'Botble\\RealEstate\\Models\\Project', 1, 1, 'She pitied him deeply. \'What is his sorrow?\' she asked the Gryphon, and the small ones choked and had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(89, 14, 'Botble\\RealEstate\\Models\\Project', 4, 2, 'It was the BEST butter,\' the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(90, 14, 'Botble\\RealEstate\\Models\\Project', 18, 4, 'The jury all brightened up again.) \'Please.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(91, 18, 'Botble\\RealEstate\\Models\\Project', 6, 2, 'Alice. \'Then it wasn\'t very civil of you to leave it behind?\' She said the Dormouse, after thinking a minute or two to think that there was a little scream.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(92, 17, 'Botble\\RealEstate\\Models\\Property', 8, 4, 'I\'LL soon make you dry enough!\' They all sat down and looked along the passage into the air. She did it so quickly.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(93, 5, 'Botble\\RealEstate\\Models\\Project', 1, 3, 'Rabbit whispered in reply, \'for fear they should forget them before the trial\'s over!\' thought Alice. \'Now we shall get on better.\' \'I\'d rather not,\' the Cat went on, \'that they\'d let Dinah stop in the act of crawling away: besides all this, there was the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(94, 3, 'Botble\\RealEstate\\Models\\Project', 14, 5, 'I don\'t think,\' Alice went timidly up to.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(95, 14, 'Botble\\RealEstate\\Models\\Project', 13, 4, 'I can kick a little!\' She drew her foot as far as they used to say.\' \'So he did, so he did,\' said the Caterpillar. Alice thought decidedly uncivil. \'But perhaps he can\'t help it,\' said Alice, \'a great girl like you,\' (she might well say.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(96, 13, 'Botble\\RealEstate\\Models\\Property', 17, 4, 'For really this morning I\'ve.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(97, 19, 'Botble\\RealEstate\\Models\\Project', 18, 1, 'CHAPTER VIII. The Queen\'s argument was, that anything that had slipped in like herself. \'Would it be murder to leave it behind?\' She said this she looked back once or twice she had plenty of time as she tucked her arm affectionately into Alice\'s, and they went up to her to wink.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(98, 1, 'Botble\\RealEstate\\Models\\Property', 1, 1, 'I must have been was not a VERY turn-up nose, much more like a candle. I wonder what was going off into a tree. By the time they were all turning into little cakes as they would die. \'The trial cannot.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(99, 11, 'Botble\\RealEstate\\Models\\Property', 20, 3, 'King, the Queen, \'and he shall tell you more than three.\' \'Your hair wants cutting,\' said the Footman, and began smoking again. This time there.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(100, 20, 'Botble\\RealEstate\\Models\\Project', 3, 1, 'I should think you\'ll feel it a minute or two, and the Panther received knife and fork with a little scream of laughter. \'Oh, hush!\' the Rabbit whispered in.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(101, 14, 'Botble\\RealEstate\\Models\\Property', 11, 4, 'Dormouse fell asleep instantly, and Alice was more hopeless than ever: she sat.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(102, 14, 'Botble\\RealEstate\\Models\\Property', 10, 1, 'CURTSEYING as you\'re falling through the wood. \'If it had a pencil that.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(103, 1, 'Botble\\RealEstate\\Models\\Property', 14, 2, 'She did not see anything that had made her look up in her life before, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(104, 18, 'Botble\\RealEstate\\Models\\Property', 11, 4, 'Laughing and Grief, they used to say \'I once tasted--\' but checked herself hastily, and said to herself, \'if one only knew the right way to fly up into the teapot. \'At any rate I\'ll never go THERE again!\' said Alice in a moment to be no chance of getting her hands up to Alice, flinging the baby.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(105, 2, 'Botble\\RealEstate\\Models\\Project', 16, 3, 'Alice, and sighing. \'It IS the same height as herself; and when she looked up eagerly, half hoping that the mouse to the Classics master, though.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(106, 12, 'Botble\\RealEstate\\Models\\Property', 6, 2, 'Footman continued in the pictures of him), while the Dodo had paused as if a fish came to the beginning again?\' Alice ventured to ask. \'Suppose we change the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(108, 11, 'Botble\\RealEstate\\Models\\Property', 16, 5, 'Alice. \'That\'s the first sentence in her life; it was getting quite crowded with the Gryphon. \'--you advance twice--\' \'Each with a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(109, 15, 'Botble\\RealEstate\\Models\\Property', 2, 4, 'I can\'t remember,\' said the Gryphon, with a shiver. \'I beg pardon, your Majesty,\' said the Hatter. \'You MUST remember,\' remarked the King, looking round the table, but it just missed her. Alice caught the baby was howling so much contradicted in her life before, and she.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(110, 4, 'Botble\\RealEstate\\Models\\Property', 3, 2, 'Pigeon. \'I\'m NOT a serpent!\' said Alice hastily; \'but I\'m not particular as to go with Edgar Atheling to meet.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(111, 10, 'Botble\\RealEstate\\Models\\Project', 5, 3, 'I needn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I know is, something comes at me like a wild beast, screamed \'Off with her face in some alarm. This time there could be no doubt that it ought to be rude, so she.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(112, 10, 'Botble\\RealEstate\\Models\\Project', 11, 1, 'Soup, so rich and green, Waiting in a deep voice, \'are done with blacking, I believe.\' \'Boots and shoes under the table: she opened it, and then treading on my tail. See how eagerly the lobsters and the procession came opposite to Alice, and tried to fancy to herself what such.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(113, 7, 'Botble\\RealEstate\\Models\\Project', 10, 5, 'Alice after it, never once considering how in the act of crawling away: besides all this, there was enough of it now in sight, and no more of it in time,\' said the Mock Turtle sighed deeply, and began.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(114, 13, 'Botble\\RealEstate\\Models\\Property', 1, 4, 'However, it was addressed to the shore. CHAPTER III. A Caucus-Race and a scroll of parchment in the wood, \'is to grow up any more if you\'d rather not.\' \'We indeed!\' cried the Gryphon. Alice did not seem to see the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(115, 13, 'Botble\\RealEstate\\Models\\Property', 15, 4, 'For really this morning I\'ve nothing to do: once or twice she had put on his spectacles. \'Where shall I begin, please.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(116, 12, 'Botble\\RealEstate\\Models\\Project', 3, 3, 'It\'s high time you were or might have been changed in the shade: however, the moment how large she had never before seen a good opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this moment.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(117, 5, 'Botble\\RealEstate\\Models\\Project', 13, 2, 'Mock Turtle; \'but it doesn\'t matter a bit,\' she thought to herself, rather sharply; \'I advise you to learn?\' \'Well, there was room for this, and Alice heard it muttering to himself as he shook both his shoes on. \'--and just.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(118, 15, 'Botble\\RealEstate\\Models\\Project', 7, 1, 'They are waiting on the stairs. Alice knew it was out of the tale was something like it,\' said Alice, a little startled when she found it so VERY tired of being upset, and their curls got.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(119, 9, 'Botble\\RealEstate\\Models\\Property', 2, 4, 'But, now that I\'m doubtful about the same thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter replied. \'Of course it was,\' said the Hatter.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(120, 15, 'Botble\\RealEstate\\Models\\Project', 12, 5, 'I am so VERY nearly at the top of his great wig.\' The judge, by the pope, was soon left alone. \'I wish I could show you our cat Dinah: I.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(121, 17, 'Botble\\RealEstate\\Models\\Property', 9, 2, 'The door led right into a large flower-pot that stood near. The three soldiers wandered about for some minutes. The Caterpillar was the White Rabbit: it was.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(122, 10, 'Botble\\RealEstate\\Models\\Property', 8, 1, 'Mock Turtle recovered his voice, and, with tears again as she went down on one of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King laid his hand upon her arm, with.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(123, 7, 'Botble\\RealEstate\\Models\\Project', 3, 4, 'Alice ventured to remark. \'Tut, tut, child!\' said the Dodo managed it.) First it marked out a history of the sort. Next came the royal children; there were a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(124, 20, 'Botble\\RealEstate\\Models\\Project', 9, 3, 'The players all played at once set to work at once to eat or drink under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you haven\'t found it very hard indeed to make SOME change in my time, but never ONE with such a dear little puppy.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(125, 14, 'Botble\\RealEstate\\Models\\Property', 3, 5, 'Alice went on in a large fan in the pool rippling to the seaside once in her life before, and she tried to get in at the time they were filled with cupboards and book-shelves; here.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(126, 9, 'Botble\\RealEstate\\Models\\Property', 3, 1, 'Alice!\' she answered herself.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(127, 5, 'Botble\\RealEstate\\Models\\Property', 1, 5, 'The Panther took pie-crust, and gravy, and meat, While the Duchess said.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(128, 12, 'Botble\\RealEstate\\Models\\Property', 12, 3, 'BEST butter,\' the March Hare, \'that \"I like what I could say if I must, I must,\' the King in a very deep well. Either the well was very hot, she kept on puzzling about it while the Mouse to tell me who.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(129, 16, 'Botble\\RealEstate\\Models\\Property', 4, 3, 'King, rubbing his hands; \'so now let the jury--\' \'If any one of the fact. \'I keep them to sell,\' the Hatter was out of the Nile On every golden scale! \'How cheerfully he seems to suit them!\' \'I haven\'t opened it yet,\' said the Mock Turtle to sing.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(130, 20, 'Botble\\RealEstate\\Models\\Project', 18, 3, 'Hatter. \'Does YOUR watch tell you my adventures--beginning from this morning,\' said Alice timidly. \'Would you tell me,\' said Alice, very loudly and decidedly, and there was Mystery,\' the Mock Turtle. \'She can\'t explain it,\' said Alice. \'You must be,\' said the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(131, 4, 'Botble\\RealEstate\\Models\\Project', 13, 3, 'King added in a coaxing tone, and she had peeped into the garden, where Alice could not join the dance? \"You can really have no answers.\' \'If you didn\'t.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(133, 2, 'Botble\\RealEstate\\Models\\Property', 10, 4, 'Mouse, who was trembling down to nine inches high. CHAPTER VI. Pig and Pepper For a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(134, 9, 'Botble\\RealEstate\\Models\\Project', 17, 1, 'Alice very politely; but she saw in another minute the whole.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(135, 4, 'Botble\\RealEstate\\Models\\Property', 7, 3, 'Now, if you could draw treacle out of their.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(136, 6, 'Botble\\RealEstate\\Models\\Project', 1, 4, 'I eat or drink anything; so I\'ll just see what I see\"!\' \'You might just as I\'d taken the highest tree in front of them, with her arms round it as a last resource, she put it. She went on again.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(137, 19, 'Botble\\RealEstate\\Models\\Project', 13, 4, 'I know all the party sat silent for a minute or two. \'They couldn\'t have wanted it much,\' said the Mouse, in a deep voice, \'What are tarts made of?\' Alice asked in a tone of great surprise. \'Of course you know I\'m mad?\' said Alice. \'Why, SHE,\' said the King: \'however, it may kiss my.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(138, 16, 'Botble\\RealEstate\\Models\\Project', 12, 3, 'What happened to you? Tell us all about as curious as it can be,\' said the Mock Turtle, \'but if they do, why then they\'re a kind of thing that would happen: \'\"Miss Alice! Come here directly, and get ready to sink into the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(139, 20, 'Botble\\RealEstate\\Models\\Project', 2, 2, 'Alice\'s shoulder, and it was the White Rabbit, who said in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject. \'Go on with the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(140, 20, 'Botble\\RealEstate\\Models\\Property', 15, 4, 'Alice said very politely, \'if I had our Dinah here, I know I do!\' said Alice to herself. \'I dare say you\'re wondering why I don\'t want to go with Edgar Atheling to meet William and offer.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(141, 20, 'Botble\\RealEstate\\Models\\Property', 20, 5, 'I chose,\' the Duchess said after a minute or two, they began running when they hit her; and.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(142, 6, 'Botble\\RealEstate\\Models\\Property', 13, 1, 'He says it kills all the first verse,\' said the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(144, 15, 'Botble\\RealEstate\\Models\\Property', 11, 3, 'Queen jumped up on tiptoe, and peeped over the list, feeling very glad she had caught the flamingo and brought it back, the fight was over, and both creatures hid their faces in their mouths; and the Queen, who was beginning to get.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(145, 20, 'Botble\\RealEstate\\Models\\Project', 7, 2, 'Alice could see her after the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(146, 12, 'Botble\\RealEstate\\Models\\Property', 20, 1, 'YOUR adventures.\' \'I could tell you just now what the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is of yours.\"\' \'Oh, I know!\' exclaimed Alice, who always took a great hurry, muttering to himself in an impatient tone: \'explanations take such a thing as a drawing of a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(147, 18, 'Botble\\RealEstate\\Models\\Project', 4, 5, 'I can find them.\' As she said to herself; \'his eyes are so VERY remarkable in that; nor did Alice think it so quickly that the pebbles were all turning into little cakes as they were nice grand words to say.) Presently she began very.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(148, 2, 'Botble\\RealEstate\\Models\\Property', 6, 3, 'The Antipathies, I think--\' (for, you see, because some of YOUR adventures.\' \'I could tell you more than Alice could hear him sighing as if she meant to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Did you speak?\' \'Not I!\' said the Mock Turtle.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(149, 13, 'Botble\\RealEstate\\Models\\Property', 10, 5, 'Alice had learnt several things of this elegant.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(150, 2, 'Botble\\RealEstate\\Models\\Property', 20, 4, 'The Antipathies, I think--\' (she was rather glad there WAS no one could possibly hear you.\' And certainly there was nothing else to do, and perhaps as this is May it won\'t be raving mad after all! I almost wish I\'d gone to see.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(151, 10, 'Botble\\RealEstate\\Models\\Property', 9, 5, 'THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never to lose YOUR temper!\' \'Hold your tongue!\' said the Duchess; \'I never saw one, or heard.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(152, 21, 'Botble\\RealEstate\\Models\\Property', 10, 1, 'Hatter. \'I deny it!\' said the Dodo, pointing to Alice a good many little girls eat eggs quite.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(153, 5, 'Botble\\RealEstate\\Models\\Property', 16, 5, 'March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister sat still and said \'What else had you to offer it,\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(154, 15, 'Botble\\RealEstate\\Models\\Property', 6, 2, 'Alice was beginning to think that there ought! And when I get it home?\' when it grunted again, and made believe to worry it; then Alice, thinking it was the Cat said, waving its right paw round, \'lives a Hatter: and in another moment down went Alice after it, never once considering how in the.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(155, 4, 'Botble\\RealEstate\\Models\\Property', 2, 2, 'Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not venture to go down the middle, wondering how she would keep, through all her riper years, the simple and loving heart of her age knew the name \'Alice!\' CHAPTER XII.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(156, 1, 'Botble\\RealEstate\\Models\\Property', 4, 1, 'She soon got it out into the wood for fear of their wits!\' So she began fancying.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(157, 21, 'Botble\\RealEstate\\Models\\Project', 2, 1, 'Just then she noticed a curious dream!\' said Alice, \'but I must be off, and had to ask them what the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is only a pack of cards!\' At this the whole pack rose up into the air, I\'m afraid, sir\' said Alice, a little bit of mushroom.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(159, 4, 'Botble\\RealEstate\\Models\\Property', 9, 2, 'Bill, I fancy--Who\'s to go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would feel with all their.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(161, 21, 'Botble\\RealEstate\\Models\\Property', 19, 1, 'It was, no doubt: only Alice did not get dry again: they had at the Duchess asked.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(162, 8, 'Botble\\RealEstate\\Models\\Project', 11, 4, 'March Hare said to the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(163, 2, 'Botble\\RealEstate\\Models\\Property', 1, 1, 'Dormouse say?\' one of them even when they liked, so that it signifies much,\' she.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(164, 9, 'Botble\\RealEstate\\Models\\Project', 2, 5, 'Bill,\' thought Alice,) \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(167, 2, 'Botble\\RealEstate\\Models\\Property', 14, 2, 'You gave us three or more; They all returned from him to be patted on the spot.\' This did not quite sure whether it would all come wrong, and she went.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(168, 5, 'Botble\\RealEstate\\Models\\Project', 6, 4, 'Alice; \'I can\'t explain MYSELF, I\'m afraid, sir\' said Alice, \'we learned French and.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(169, 17, 'Botble\\RealEstate\\Models\\Property', 12, 2, 'I can kick a little!\' She drew her foot as.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(170, 13, 'Botble\\RealEstate\\Models\\Property', 4, 3, 'HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took her choice, and was gone in a.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(171, 11, 'Botble\\RealEstate\\Models\\Project', 14, 1, 'You see the earth takes twenty-four hours to turn into a line along the sea-shore--\' \'Two lines!\' cried the Gryphon, with a growl, And concluded the banquet--] \'What IS the fun?\' said Alice. \'Did you.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(172, 5, 'Botble\\RealEstate\\Models\\Property', 13, 1, 'And she\'s such a rule at processions; \'and besides, what would happen next. \'It\'s--it\'s a very pretty dance,\' said Alice to herself, and once again the tiny hands were.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(174, 8, 'Botble\\RealEstate\\Models\\Project', 5, 1, 'Cheshire Cat,\' said Alice: \'besides, that\'s not a VERY good opportunity.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(175, 8, 'Botble\\RealEstate\\Models\\Project', 16, 2, 'Alice, and, after waiting till she shook the house, \"Let us both go to on the end of trials, \"There was some attempts at applause, which was the King; and the little glass box.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(176, 17, 'Botble\\RealEstate\\Models\\Property', 19, 4, 'Queen, \'Really, my dear, YOU must cross-examine THIS.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(177, 16, 'Botble\\RealEstate\\Models\\Property', 8, 4, 'Knave was standing before them, in chains, with a table in the air. This time Alice waited a little, and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(178, 8, 'Botble\\RealEstate\\Models\\Property', 4, 5, 'CHAPTER VI. Pig and Pepper For a minute or two the Caterpillar decidedly, and the little dears came jumping.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(179, 12, 'Botble\\RealEstate\\Models\\Property', 21, 1, 'King, \'that saves a world of trouble, you know, this sort of a dance is it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'it\'ll never do to ask: perhaps I shall.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(180, 18, 'Botble\\RealEstate\\Models\\Property', 18, 5, 'Alice replied very readily: \'but that\'s because it stays the same height as herself; and when she was near enough to try the first sentence in her.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(181, 4, 'Botble\\RealEstate\\Models\\Project', 16, 1, 'The long grass rustled at her feet in.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(182, 9, 'Botble\\RealEstate\\Models\\Property', 1, 5, 'I don\'t put my arm round your waist,\' the Duchess sneezed occasionally; and as it can\'t possibly make me giddy.\' And then, turning to the rose-tree, she went on, looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall sit here,\' he said.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(183, 18, 'Botble\\RealEstate\\Models\\Project', 1, 1, 'King: \'however, it may kiss my hand if it makes rather a handsome pig, I think.\' And she opened it, and burning with curiosity, she ran out of the sea.\' \'I couldn\'t help it,\' she said this, she came up to the table to measure.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(184, 1, 'Botble\\RealEstate\\Models\\Project', 4, 5, 'Mock Turtle went on eagerly: \'There is such a curious dream.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(185, 19, 'Botble\\RealEstate\\Models\\Project', 17, 1, 'Bill,\' thought Alice,) \'Well, I never understood what it was: at first she would get up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the White Rabbit blew three blasts on the floor: in another moment down.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(186, 15, 'Botble\\RealEstate\\Models\\Property', 18, 3, 'Queen: so she went on, turning to Alice, and she tried her best to climb up one of them attempted to explain the paper. \'If there\'s no meaning in it,\' but none of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' By this time she went on, \'and.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(187, 11, 'Botble\\RealEstate\\Models\\Project', 2, 2, 'Pigeon had finished. \'As if I must, I must,\' the King said to herself; \'the March Hare was said to herself in a hurry to change the subject.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(188, 15, 'Botble\\RealEstate\\Models\\Project', 8, 3, 'I can guess that,\' she added in an impatient tone: \'explanations take such a tiny little thing!\' It did so indeed, and much sooner than she had never done such a nice little dog near our house I should have croqueted the Queen\'s voice in the flurry of.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(189, 16, 'Botble\\RealEstate\\Models\\Project', 9, 5, 'There\'s no pleasing them!\' Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a low trembling voice.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(190, 11, 'Botble\\RealEstate\\Models\\Project', 18, 1, 'Cat, \'or you wouldn\'t mind,\' said Alice: \'three inches is such a dear quiet thing,\' Alice went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you talking to?\' said one of the birds and animals.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(193, 16, 'Botble\\RealEstate\\Models\\Project', 15, 1, 'I got up and ran the faster, while.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(195, 8, 'Botble\\RealEstate\\Models\\Property', 12, 2, 'I--\' \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know the meaning of it at last, with a sigh: \'it\'s always tea-time, and we\'ve no time to hear her try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the King. On this the whole thing very absurd, but they all.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20');
INSERT INTO `re_reviews` (`id`, `account_id`, `reviewable_type`, `reviewable_id`, `star`, `content`, `status`, `created_at`, `updated_at`) VALUES
(196, 16, 'Botble\\RealEstate\\Models\\Property', 13, 3, 'Only I don\'t understand. Where did they live at the stick, running a very truthful child; \'but little girls in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that makes.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(197, 14, 'Botble\\RealEstate\\Models\\Property', 17, 5, 'IN the well,\' Alice said nothing: she had expected: before she gave one sharp kick, and waited to see the Mock Turtle Soup is made from,\' said the Mock Turtle, and to wonder what I say--that\'s the same thing as \"I get what I see\"!\' \'You might just as she went on, \'and most of \'em do.\' \'I.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(198, 5, 'Botble\\RealEstate\\Models\\Project', 5, 4, 'After a time there could be no use now,\' thought Alice, \'they\'re sure to happen,\'.', 'approved', '2023-07-18 23:45:20', '2023-07-18 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"api.settings\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.create\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"export-properties.index\":true,\"import-projects.index\":true,\"export-projects.index\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}', 'Admin users role', 1, 1, 1, '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'activated_plugins', '[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]', NULL, '2023-07-18 23:45:17'),
(3, 'api_enabled', '0', NULL, '2023-07-18 23:45:17'),
(4, 'show_admin_bar', '1', NULL, '2023-07-18 23:45:17'),
(5, 'theme', 'hously', NULL, '2023-07-18 23:45:17'),
(6, 'language_hide_default', '1', NULL, NULL),
(7, 'language_switcher_display', 'list', NULL, NULL),
(8, 'language_display', 'all', NULL, NULL),
(9, 'language_hide_languages', '[]', NULL, NULL),
(10, 'media_random_hash', 'edafb3cddbd2303cbb018c8ac6ad146c', NULL, NULL),
(11, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(12, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(13, 'real_estate_display_views_count_in_detail_page', '1', NULL, NULL),
(14, 'payment_cod_status', '1', NULL, NULL),
(15, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, NULL),
(16, 'payment_bank_transfer_status', '1', NULL, NULL),
(17, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 9913 3821 19.', NULL, NULL),
(18, 'payment_stripe_payment_type', 'stripe_checkout', NULL, NULL),
(19, 'show_shortcode_edit_link', '1', NULL, NULL),
(20, 'admin_logo', 'general/logo-light.png', NULL, NULL),
(21, 'admin_favicon', 'general/favicon.png', NULL, NULL),
(23, 'cookie_consent_message', 'Your experience on this site will be improved by allowing cookies', NULL, NULL),
(24, 'cookie_consent_learn_more_url', 'https://hously.test/cookie-policy', NULL, NULL),
(25, 'cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(26, 'real_estate_enable_review_feature', '1', NULL, NULL),
(27, 'real_estate_reviews_per_page', '10', NULL, NULL),
(28, 'theme-hously-site_title', 'Hously', NULL, NULL),
(29, 'theme-hously-seo_title', 'Find your favorite homes at Hously', NULL, NULL),
(30, 'theme-hously-site_description', 'A great platform to buy, sell and rent your properties without any agent or commissions.', NULL, NULL),
(31, 'theme-hously-seo_description', 'A great platform to buy, sell and rent your properties without any agent or commissions.', NULL, NULL),
(32, 'theme-hously-copyright', '© 2023 Archi Elite JSC. All right reserved.', NULL, NULL),
(33, 'theme-hously-favicon', 'general/favicon.png', NULL, NULL),
(34, 'theme-hously-logo', 'general/logo-light.png', NULL, NULL),
(35, 'theme-hously-logo_dark', 'general/logo-dark.png', NULL, NULL),
(36, 'theme-hously-404_page_image', 'general/error.png', NULL, NULL),
(37, 'theme-hously-primary_font', 'League Spartan', NULL, NULL),
(38, 'theme-hously-primary_color', '#16a34a', NULL, NULL),
(39, 'theme-hously-secondary_color', '#15803D', NULL, NULL),
(40, 'theme-hously-homepage_id', '1', NULL, NULL),
(41, 'theme-hously-authentication_enable_snowfall_effect', '1', NULL, NULL),
(42, 'theme-hously-authentication_background_image', 'backgrounds/01.jpg', NULL, NULL),
(43, 'theme-hously-categories_background_image', 'backgrounds/01.jpg', NULL, NULL),
(44, 'theme-hously-logo_authentication_page', 'general/logo-authentication-page.png', NULL, NULL),
(45, 'theme-hously-default_page_cover_image', 'backgrounds/01.jpg', NULL, NULL),
(46, 'theme-hously-projects_list_page_id', '5', NULL, NULL),
(47, 'theme-hously-properties_list_page_id', '6', NULL, NULL),
(48, 'theme-hously-blog_page_id', '14', NULL, NULL),
(49, 'theme-hously-projects_list_layout', 'grid', NULL, NULL),
(50, 'theme-hously-properties_list_layout', 'grid', NULL, NULL),
(51, 'theme-hously-number_of_related_properties', '6', NULL, NULL),
(52, 'theme-hously-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-facebook\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-instagram\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-twitter\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"LinkedIn\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-linkedin\"},{\"key\":\"social-url\",\"value\":\"#\"}]]', NULL, NULL),
(53, 'theme-hously-enabled_toggle_theme_mode', '1', NULL, NULL),
(54, 'theme-hously-default_theme_mode', 'system', NULL, NULL),
(55, 'theme-hously-show_whatsapp_button_on_consult_form', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'apartment', 1, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'villa', 2, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'condo', 3, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'house', 4, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'land', 5, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'commercial-property', 6, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'home-one', 1, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(8, 'home-two', 2, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(9, 'home-three', 3, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(10, 'home-four', 4, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(11, 'projects', 5, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(12, 'properties', 6, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(13, 'about-us', 7, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(14, 'features', 8, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(15, 'pricing-plans', 9, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(16, 'frequently-asked-questions', 10, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(17, 'terms-of-services', 11, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(18, 'privacy-policy', 12, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(19, 'coming-soon', 13, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(20, 'news', 14, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(21, 'contact', 15, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(22, 'wishlist', 16, 'Botble\\Page\\Models\\Page', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(23, 'design', 1, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(24, 'lifestyle', 2, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(25, 'travel-tips', 3, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(26, 'healthy', 4, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(27, 'travel-tips', 5, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(28, 'hotel', 6, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(29, 'nature', 7, 'Botble\\Blog\\Models\\Category', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(30, 'new', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(31, 'event', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(32, 'villa', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(33, 'apartment', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(34, 'condo', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(35, 'luxury-villa', 6, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(36, 'family-home', 7, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(37, 'the-top-2020-handbag-trends-to-know', 1, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(38, 'top-search-engine-optimization-strategies', 2, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(39, 'which-company-would-you-choose', 3, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(40, 'used-car-dealer-sales-tricks-exposed', 4, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(41, '20-ways-to-sell-your-product-faster', 5, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(42, 'the-secrets-of-rich-and-famous-writers', 6, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(43, 'imagine-losing-20-pounds-in-14-days', 7, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(44, 'are-you-still-using-that-slow-old-typewriter', 8, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(45, 'a-skin-cream-thats-proven-to-work', 9, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(46, '10-reasons-to-start-your-own-profitable-website', 10, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(47, 'simple-ways-to-reduce-your-unwanted-wrinkles', 11, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(48, 'apple-imac-with-retina-5k-display-review', 12, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(49, '10000-web-site-visitors-in-one-monthguaranteed', 13, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(50, 'unlock-the-secrets-of-selling-high-ticket-items', 14, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(51, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 15, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(52, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 16, 'Botble\\Blog\\Models\\Post', '', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(53, 'walnut-park-apartments', 1, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(54, 'sunshine-wonder-villas', 2, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(55, 'diamond-island', 3, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(56, 'the-nassim', 4, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(57, 'vinhomes-grand-park', 5, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(58, 'the-metropole-thu-thiem', 6, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(59, 'villa-on-grand-avenue', 7, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:19', '2023-07-18 23:45:19'),
(60, 'traditional-food-restaurant', 8, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(61, 'villa-on-hollywood-boulevard', 9, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(62, 'office-space-at-northwest-107th', 10, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(63, 'home-in-merrick-way', 11, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(64, 'adarsh-greens', 12, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(65, 'rustomjee-evershine-global-city', 13, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(66, 'godrej-exquisite', 14, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(67, 'godrej-prime', 15, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(68, 'ps-panache', 16, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(69, 'upturn-atmiya-centria', 17, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(70, 'brigade-oasis', 18, 'Botble\\RealEstate\\Models\\Project', 'projects', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(71, '3-beds-villa-calpe-alicante', 1, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(72, 'lavida-plus-office-tel-1-bedroom', 2, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(73, 'vinhomes-grand-park-studio-1-bedroom', 3, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(74, 'the-sun-avenue-office-tel-1-bedroom', 4, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(75, 'property-for-sale-johannesburg-south-africa', 5, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(76, 'stunning-french-inspired-manor', 6, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(77, 'villa-for-sale-at-bermuda-dunes', 7, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(78, 'walnut-park-apartment', 8, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(79, '5-beds-luxury-house', 9, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(80, 'family-victorian-view-home', 10, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(81, 'osaka-heights-apartment', 11, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(82, 'private-estate-magnificent-views', 12, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(83, 'thompson-road-house-for-rent', 13, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(84, 'brand-new-1-bedroom-apartment-in-first-class-location', 14, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(85, 'elegant-family-home-presents-premium-modern-living', 15, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(86, 'luxury-apartments-in-singapore-for-sale', 16, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(87, '5-room-luxury-penthouse-for-sale-in-kuala-lumpur', 17, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(88, '2-floor-house-in-compound-pejaten-barat-kemang', 18, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(89, 'apartment-muiderstraatweg-in-diemen', 19, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(90, 'nice-apartment-for-rent-in-berlin', 20, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20'),
(91, 'pumpkin-key-private-island', 21, 'Botble\\RealEstate\\Models\\Property', 'properties', '2023-07-18 23:45:20', '2023-07-18 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `slugs_translations`
--

CREATE TABLE `slugs_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `slug`, `abbreviation`, `country_id`, `order`, `image`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'France', 'france', 'FR', 1, 0, NULL, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'England', 'england', 'EN', 2, 0, NULL, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'New York', 'new-york', 'NY', 1, 0, NULL, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Holland', 'holland', 'HL', 4, 0, NULL, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'Denmark', 'denmark', 'DN', 5, 0, NULL, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'Germany', 'germany', 'GER', 1, 0, NULL, 0, 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `states_translations`
--

CREATE TABLE `states_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'Event', 2, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'Villa', 2, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Apartment', 2, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'Condo', 2, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'Luxury villa', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'Family home', 2, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `content`, `image`, `company`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Christa Smith', 'WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was in March.\' As she said to herself, \'Which way? Which way?\', holding her hand again, and that\'s.', 'clients/01.jpg', 'Manager', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'John Smith', 'I used--and I don\'t like them raw.\' \'Well, be off, then!\' said the Duchess, \'chop off her unfortunate guests to execution--once more the shriek of the thing Mock Turtle to sing this:-- \'Beautiful.', 'clients/02.jpg', 'Product designer', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'Sayen Ahmod', 'I THINK; or is it I can\'t remember,\' said the Hatter: \'I\'m on the top of the jury had a large arm-chair at one end to the door. \'Call the first minute or two she walked off, leaving Alice alone with.', 'clients/03.jpg', 'Developer', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'Tayla Swef', 'WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she thought there was a good opportunity for showing off a little of her hedgehog. The hedgehog was.', 'clients/04.jpg', 'Graphic designer', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'Christa Smith', 'White Rabbit, who was gently brushing away some dead leaves that had made the whole she thought it would,\' said the Hatter, \'when the Queen had only one way of speaking to a lobster--\' (Alice began.', 'clients/05.jpg', 'Graphic designer', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'James Garden', 'I shall never get to the heads of the ground--and I should be raving mad--at least not so mad as it is.\' \'I quite agree with you,\' said Alice, \'we learned French and music.\' \'And washing?\' said the.', 'clients/06.jpg', 'Web Developer', 'published', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials_translations`
--

CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `credits` int UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(12, 1, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(13, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(14, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(15, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(16, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(17, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(18, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(19, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(20, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(21, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(22, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(23, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(24, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(25, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(26, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(27, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(28, 1, 'en', 'validation', 'current_password', 'The password is incorrect.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(29, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(30, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(31, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(32, 1, 'en', 'validation', 'declined', 'The :attribute must be declined.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(33, 1, 'en', 'validation', 'declined_if', 'The :attribute must be declined when :other is :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(34, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(35, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(36, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(37, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(38, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(39, 1, 'en', 'validation', 'doesnt_start_with', 'The :attribute may not start with one of the following: :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(40, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(41, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(42, 1, 'en', 'validation', 'enum', 'The selected :attribute is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(43, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(44, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(45, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(46, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(47, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(48, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(49, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(50, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(51, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal to :value kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(52, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal to :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(53, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal to :value characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(54, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(55, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(56, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(57, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(58, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(59, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(60, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(61, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(62, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(63, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(64, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(65, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(66, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(67, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal to :value kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(68, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal to :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(69, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal to :value characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(70, 1, 'en', 'validation', 'mac_address', 'The :attribute must be a valid MAC address.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(71, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(72, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(73, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(74, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(75, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(76, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(77, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(78, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(79, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(80, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(81, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(82, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(83, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(84, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(85, 1, 'en', 'validation', 'password.letters', 'The :attribute must contain at least one letter.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(86, 1, 'en', 'validation', 'password.mixed', 'The :attribute must contain at least one uppercase and one lowercase letter.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(87, 1, 'en', 'validation', 'password.numbers', 'The :attribute must contain at least one number.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(88, 1, 'en', 'validation', 'password.symbols', 'The :attribute must contain at least one symbol.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(89, 1, 'en', 'validation', 'password.uncompromised', 'The given :attribute has appeared in a data leak. Please choose a different :attribute.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(90, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(91, 1, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(92, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(93, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(94, 1, 'en', 'validation', 'prohibits', 'The :attribute field prohibits :other from being present.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(95, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(96, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(97, 1, 'en', 'validation', 'required_array_keys', 'The :attribute field must contain entries for: :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(98, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(99, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(100, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(101, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(102, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(103, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(104, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(105, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(106, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(107, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(108, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(109, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(110, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(111, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(112, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(113, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(114, 1, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(115, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(116, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(117, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(118, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(119, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(120, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(121, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(122, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(123, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(124, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(125, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(126, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(127, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(128, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(129, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(130, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(131, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(132, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(133, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(134, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(135, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(136, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(137, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(138, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(139, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(140, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(141, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(142, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(143, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(144, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(145, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(146, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(147, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(148, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(149, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(150, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(151, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(152, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(153, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(154, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(155, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(156, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(157, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(158, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(159, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(160, 1, 'en', 'core/acl/auth', 'settings.email.title', 'ACL', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(161, 1, 'en', 'core/acl/auth', 'settings.email.description', 'ACL email configuration', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(162, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(163, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(164, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(165, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(166, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(167, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(168, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(169, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(170, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(171, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(172, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(173, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(174, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(175, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(176, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(177, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(178, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(179, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(180, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(181, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(182, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(183, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(184, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(185, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(186, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(187, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(188, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(189, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(190, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(191, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(192, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(193, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(194, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(195, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(196, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(197, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(198, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(199, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(200, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(201, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(202, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(203, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(204, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(205, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(206, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(207, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(208, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(209, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(210, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(211, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(212, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(213, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(214, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(215, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(216, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(217, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(218, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(219, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(220, 1, 'en', 'core/acl/users', 'email', 'Email', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(221, 1, 'en', 'core/acl/users', 'role', 'Role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(222, 1, 'en', 'core/acl/users', 'username', 'Username', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(223, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(224, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(225, 1, 'en', 'core/acl/users', 'message', 'Message', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(226, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(227, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(228, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(229, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(230, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(231, 1, 'en', 'core/acl/users', 'password', 'Password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(232, 1, 'en', 'core/acl/users', 'save', 'Save', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(233, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(234, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(235, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(236, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(237, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(238, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(239, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(240, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(241, 1, 'en', 'core/acl/users', 'close', 'Close', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(242, 1, 'en', 'core/acl/users', 'update', 'Update', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(243, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(244, 1, 'en', 'core/acl/users', 'users', 'Users', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(245, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(246, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(247, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(248, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(249, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(250, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(251, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(252, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(253, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(254, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(255, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(256, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(257, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(258, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(259, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(260, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(261, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(262, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(263, 1, 'en', 'core/base/base', 'yes', 'Yes', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(264, 1, 'en', 'core/base/base', 'no', 'No', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(265, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(266, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(267, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(268, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(269, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(270, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(271, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(272, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(273, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(274, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(275, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(276, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(277, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(278, 1, 'en', 'core/base/base', 'image', 'Image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(279, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(280, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(281, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(282, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(283, 1, 'en', 'core/base/base', 'tools', 'Tools', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(284, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(285, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(286, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(287, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(288, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(289, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(290, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(291, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(292, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(293, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(294, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(295, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(296, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(297, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(298, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(299, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(300, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(301, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(302, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(303, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(304, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(305, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(306, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(307, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(308, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(309, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(310, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(311, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\":link\">clicking here</a>.', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(312, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(313, 1, 'en', 'core/base/errors', 'results_not_found', 'Results not found!', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(314, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(315, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(316, 1, 'en', 'core/base/forms', 'save', 'Save & Exit', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(317, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(318, 1, 'en', 'core/base/forms', 'image', 'Image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(319, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(320, 1, 'en', 'core/base/forms', 'create', 'Create', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(321, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(322, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(323, 1, 'en', 'core/base/forms', 'ok', 'OK', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(324, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(325, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(326, 1, 'en', 'core/base/forms', 'template', 'Template', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(327, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(328, 1, 'en', 'core/base/forms', 'file', 'File', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(329, 1, 'en', 'core/base/forms', 'content', 'Content', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(330, 1, 'en', 'core/base/forms', 'description', 'Description', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(331, 1, 'en', 'core/base/forms', 'name', 'Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(332, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(333, 1, 'en', 'core/base/forms', 'title', 'Title', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(334, 1, 'en', 'core/base/forms', 'value', 'Value', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(335, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(336, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(337, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(338, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(339, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(340, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(341, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(342, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(343, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(344, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(345, 1, 'en', 'core/base/forms', 'update', 'Update', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(346, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(347, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(348, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(349, 1, 'en', 'core/base/forms', 'order', 'Order', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(350, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(351, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(352, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(353, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(354, 1, 'en', 'core/base/forms', 'add', 'Add', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(355, 1, 'en', 'core/base/forms', 'link', 'Link', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(356, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(357, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(358, 1, 'en', 'core/base/forms', 'expand_all', 'Expand all', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(359, 1, 'en', 'core/base/forms', 'collapse_all', 'Collapse all', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(360, 1, 'en', 'core/base/forms', 'view_new_tab', 'Open in new tab', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(361, 1, 'en', 'core/base/forms', 'view_preview_image', 'View preview image', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(362, 1, 'en', 'core/base/forms', 'edit_item', 'Edit \":name\"', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(363, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(364, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(365, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(366, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(367, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(368, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(369, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(370, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(371, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2023-07-18 23:45:24', '2023-07-18 23:45:24'),
(372, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(373, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(374, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(375, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(376, 1, 'en', 'core/base/layouts', 'home', 'Home', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(377, 1, 'en', 'core/base/layouts', 'search', 'Search', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(378, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(379, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(380, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(381, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(382, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(383, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(384, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(385, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2023-07-18 23:45:25', '2023-07-18 23:45:25');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(386, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(387, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(388, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(389, 1, 'en', 'core/base/notices', 'error', 'Error!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(390, 1, 'en', 'core/base/notices', 'success', 'Success!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(391, 1, 'en', 'core/base/notices', 'info', 'Info!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(392, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(393, 1, 'en', 'core/base/notifications', 'notifications', 'Notifications', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(394, 1, 'en', 'core/base/notifications', 'mark_as_read', 'Mark as read', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(395, 1, 'en', 'core/base/notifications', 'clear', 'Clear', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(396, 1, 'en', 'core/base/notifications', 'no_notification_here', 'No notifications here', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(397, 1, 'en', 'core/base/notifications', 'please_check_again_later', 'Please check again later', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(398, 1, 'en', 'core/base/notifications', 'view_more', 'View more...', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(399, 1, 'en', 'core/base/notifications', 'view', 'View', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(400, 1, 'en', 'core/base/notifications', 'show_more', 'Show more', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(401, 1, 'en', 'core/base/notifications', 'show_less', 'Show less', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(402, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(403, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(404, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(405, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(406, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(407, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(408, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(409, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(410, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(411, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(412, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(413, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(414, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(415, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(416, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(417, 1, 'en', 'core/base/system', 'user.email', 'Email', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(418, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(419, 1, 'en', 'core/base/system', 'user.username', 'Username', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(420, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(421, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(422, 1, 'en', 'core/base/system', 'user.create', 'Create', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(423, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(424, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(425, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(426, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(427, 1, 'en', 'core/base/system', 'options.info', 'System information', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(428, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(429, 1, 'en', 'core/base/system', 'info.title', 'System information', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(430, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(431, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(432, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(433, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(434, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(435, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(436, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(437, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(438, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(439, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(440, 1, 'en', 'core/base/system', 'debug_mode_off', 'Debug Mode Off', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(441, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(442, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(443, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(444, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(445, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(446, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(447, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(448, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(449, 1, 'en', 'core/base/system', 'database', 'Database', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(450, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(451, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(452, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(453, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(454, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(455, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(456, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(457, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(458, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(459, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(460, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(461, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(462, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(463, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(464, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(465, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(466, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(467, 1, 'en', 'core/base/system', 'version', 'Version', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(468, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(469, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(470, 1, 'en', 'core/base/system', 'updater', 'System Updater', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(471, 1, 'en', 'core/base/system', 'zip', 'Zip Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(472, 1, 'en', 'core/base/system', 'iconv', 'Iconv Ext', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(473, 1, 'en', 'core/base/system', 'memory_limit', 'Memory limit', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(474, 1, 'en', 'core/base/system', 'max_execution_time', 'Max execution time (s)', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(475, 1, 'en', 'core/base/system', 'allow_url_fopen_enabled', 'allow_url_fopen enabled', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(476, 1, 'en', 'core/base/system', 'cleanup.title', 'Cleanup System', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(477, 1, 'en', 'core/base/system', 'cleanup.table.name', 'Table Name', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(478, 1, 'en', 'core/base/system', 'cleanup.table.count', 'Records', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(479, 1, 'en', 'core/base/system', 'cleanup.backup_alert', 'Please backup your database and script files before cleanup, it will clear your data in database.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(480, 1, 'en', 'core/base/system', 'cleanup.messenger_choose_without_table', 'Please choose to ignore tables that do not want to be cleaned', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(481, 1, 'en', 'core/base/system', 'cleanup.messenger_confirm_cleanup', 'Are you sure you want to database cleanup action, it will clear your data in database?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(482, 1, 'en', 'core/base/system', 'cleanup.submit_button', 'Cleanup', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(483, 1, 'en', 'core/base/system', 'cleanup.success_message', 'Cleaned data successfully', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(484, 1, 'en', 'core/base/system', 'cleanup.not_enabled_yet', 'This featured is not enabled yet. <br />Please add into .env: <code>CMS_ENABLED_CLEANUP_DATABASE=true</code> to enable this feature!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(485, 1, 'en', 'core/base/tables', 'id', 'ID', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(486, 1, 'en', 'core/base/tables', 'name', 'Name', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(487, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(488, 1, 'en', 'core/base/tables', 'title', 'Title', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(489, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(490, 1, 'en', 'core/base/tables', 'order', 'Order', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(491, 1, 'en', 'core/base/tables', 'status', 'Status', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(492, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(493, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(494, 1, 'en', 'core/base/tables', 'description', 'Description', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(495, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(496, 1, 'en', 'core/base/tables', 'url', 'URL', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(497, 1, 'en', 'core/base/tables', 'author', 'Author', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(498, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(499, 1, 'en', 'core/base/tables', 'column', 'Column', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(500, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(501, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(502, 1, 'en', 'core/base/tables', 'views', 'Views', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(503, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(504, 1, 'en', 'core/base/tables', 'session', 'Session', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(505, 1, 'en', 'core/base/tables', 'activated', 'activated', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(506, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(507, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(508, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(509, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(510, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(511, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(512, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(513, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(514, 1, 'en', 'core/base/tables', 'export', 'Export', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(515, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(516, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(517, 1, 'en', 'core/base/tables', 'print', 'Print', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(518, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(519, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(520, 1, 'en', 'core/base/tables', 'display', 'Display', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(521, 1, 'en', 'core/base/tables', 'all', 'All', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(522, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(523, 1, 'en', 'core/base/tables', 'action', 'Actions', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(524, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(525, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(526, 1, 'en', 'core/base/tables', 'save', 'Save', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(527, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(528, 1, 'en', 'core/base/tables', 'to', 'to', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(529, 1, 'en', 'core/base/tables', 'in', 'in', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(530, 1, 'en', 'core/base/tables', 'records', 'records', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(531, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(532, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(533, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(534, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(535, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(536, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(537, 1, 'en', 'core/base/tables', 'template', 'Template', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(538, 1, 'en', 'core/base/tables', 'email', 'Email', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(539, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(540, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(541, 1, 'en', 'core/base/tables', 'image', 'Image', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(542, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(543, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(544, 1, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(545, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(546, 1, 'en', 'core/base/tabs', 'file', 'Files', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(547, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(548, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(549, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(550, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(551, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(552, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(553, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(554, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(555, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(556, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(557, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(558, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(559, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(560, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(561, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(562, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(563, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.today', 'Today', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(564, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.yesterday', 'Yesterday', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(565, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_week', 'This Week', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(566, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_7_days', 'Last 7 Days', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(567, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_month', 'This Month', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(568, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_30_days', 'Last 30 Days', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(569, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_year', 'This Year', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(570, 1, 'en', 'core/media/media', 'filter', 'Filter', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(571, 1, 'en', 'core/media/media', 'everything', 'Everything', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(572, 1, 'en', 'core/media/media', 'image', 'Image', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(573, 1, 'en', 'core/media/media', 'video', 'Video', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(574, 1, 'en', 'core/media/media', 'document', 'Document', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(575, 1, 'en', 'core/media/media', 'view_in', 'View in', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(576, 1, 'en', 'core/media/media', 'all_media', 'All media', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(577, 1, 'en', 'core/media/media', 'trash', 'Trash', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(578, 1, 'en', 'core/media/media', 'recent', 'Recent', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(579, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(580, 1, 'en', 'core/media/media', 'upload', 'Upload', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(581, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(582, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(583, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(584, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search in current folder', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(585, 1, 'en', 'core/media/media', 'sort', 'Sort', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(586, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(587, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(588, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(589, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(590, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(591, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(592, 1, 'en', 'core/media/media', 'actions', 'Actions', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(593, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(594, 1, 'en', 'core/media/media', 'insert', 'Insert', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(595, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(596, 1, 'en', 'core/media/media', 'create', 'Create', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(597, 1, 'en', 'core/media/media', 'rename', 'Rename', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(598, 1, 'en', 'core/media/media', 'crop', 'Crop', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(599, 1, 'en', 'core/media/media', 'close', 'Close', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(600, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(601, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(602, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(603, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(604, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(605, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(606, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(607, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(608, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(609, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(610, 1, 'en', 'core/media/media', 'alt_text', 'Alt text', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(611, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(612, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(613, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(614, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(615, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(616, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(617, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(618, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(619, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(620, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(621, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(622, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(623, 1, 'en', 'core/media/media', 'crop_success', 'Crop image successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(624, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(625, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(626, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(627, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(628, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(629, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(630, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(631, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(632, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(633, 1, 'en', 'core/media/media', 'file_too_big_readable_size', 'File too big. Max file upload is :size.', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(634, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(635, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(636, 1, 'en', 'core/media/media', 'failed_to_crop_image', 'The file cropping must be image type', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(637, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(638, 1, 'en', 'core/media/media', 'add', 'Add media', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(639, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(640, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(641, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(642, 1, 'en', 'core/media/media', 'javascript.alt', 'Alt text', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(643, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(644, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2023-07-18 23:45:25', '2023-07-18 23:45:25'),
(645, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(646, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(647, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(648, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(649, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(650, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(651, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(652, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(653, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(654, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(655, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(656, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(657, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(658, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(659, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(660, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(661, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(662, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(663, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(664, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links have been copied to clipboard', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(665, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(666, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(667, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(668, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(669, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.crop', 'Crop', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(670, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(671, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(672, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(673, 1, 'en', 'core/media/media', 'javascript.actions_list.file.alt_text', 'ALT text', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(674, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(675, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(676, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(677, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(678, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(679, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(680, 1, 'en', 'core/media/media', 'javascript.change_image', 'Change image', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(681, 1, 'en', 'core/media/media', 'javascript.delete_image', 'Delete image', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(682, 1, 'en', 'core/media/media', 'javascript.choose_image', 'Choose image', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(683, 1, 'en', 'core/media/media', 'javascript.preview_image', 'Preview image', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(684, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(685, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(686, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(687, 1, 'en', 'core/media/media', 'download_link', 'Download', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(688, 1, 'en', 'core/media/media', 'url', 'URL', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(689, 1, 'en', 'core/media/media', 'download_explain', 'Enter one URL per line.', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(690, 1, 'en', 'core/media/media', 'downloading', 'Downloading...', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(691, 1, 'en', 'core/media/media', 'prepare_file_to_download', 'Preparing file to download...', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(692, 1, 'en', 'core/media/media', 'update_alt_text_success', 'Update alt text successfully!', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(693, 1, 'en', 'core/media/media', 'cropper.height', 'Height', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(694, 1, 'en', 'core/media/media', 'cropper.width', 'Width', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(695, 1, 'en', 'core/media/media', 'cropper.aspect_ratio', 'Aspect ratio?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(696, 1, 'en', 'core/media/media', 'unable_to_write', 'Unable to write file. Please chmod folder \":folder\" to make it writeable!', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(697, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(698, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(699, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(700, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(701, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(702, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(703, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(704, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(705, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(706, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(707, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(708, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(709, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(710, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(711, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(712, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(713, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(714, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(715, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(716, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(717, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(718, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(719, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(720, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(721, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(722, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(723, 1, 'en', 'core/setting/setting', 'general.disable_cache_in_the_admin_panel', 'Disable cache in the admin panel?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(724, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(725, 1, 'en', 'core/setting/setting', 'general.enable_cache_site_map', 'Enable cache site map?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(726, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map (minutes)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(727, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(728, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(729, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(730, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(731, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(732, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(733, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(734, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(735, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(736, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(737, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(738, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(739, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(740, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(741, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(742, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(743, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Front site language direction', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(744, 1, 'en', 'core/setting/setting', 'general.admin_locale_direction', 'Admin language direction', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(745, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(746, 1, 'en', 'core/setting/setting', 'general.minutes', 'minutes', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(747, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(748, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(749, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(750, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(751, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(752, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(753, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(754, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(755, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(756, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(757, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(758, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(759, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(760, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(761, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(762, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(763, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(764, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(765, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(766, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(767, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(768, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(769, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(770, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(771, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(772, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(773, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(774, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(775, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(776, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(777, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(778, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(779, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(780, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(781, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(782, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(783, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(784, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(785, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2023-07-18 23:45:26', '2023-07-18 23:45:26');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(786, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(787, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(788, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(789, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(790, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(791, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(792, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(793, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(794, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(795, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(796, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(797, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(798, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(799, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(800, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(801, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(802, 1, 'en', 'core/setting/setting', 'media.aws_endpoint', 'AWS Endpoint (Optional)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(803, 1, 'en', 'core/setting/setting', 'media.r2_access_key_id', 'R2 Access Key ID', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(804, 1, 'en', 'core/setting/setting', 'media.r2_secret_key', 'R2 Secret Key', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(805, 1, 'en', 'core/setting/setting', 'media.r2_bucket', 'R2 Bucket', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(806, 1, 'en', 'core/setting/setting', 'media.r2_url', 'R2 URL', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(807, 1, 'en', 'core/setting/setting', 'media.r2_endpoint', 'R2 Endpoint', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(808, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(809, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(810, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(811, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(812, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(813, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(814, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(815, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(816, 1, 'en', 'core/setting/setting', 'media.wasabi_access_key_id', 'Wasabi Access Key ID', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(817, 1, 'en', 'core/setting/setting', 'media.wasabi_secret_key', 'Wasabi Secret Key', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(818, 1, 'en', 'core/setting/setting', 'media.wasabi_default_region', 'Wasabi Default Region', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(819, 1, 'en', 'core/setting/setting', 'media.wasabi_bucket', 'Wasabi Bucket', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(820, 1, 'en', 'core/setting/setting', 'media.wasabi_root', 'Wasabi Root', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(821, 1, 'en', 'core/setting/setting', 'media.default_placeholder_image', 'Default placeholder image', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(822, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(823, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(824, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(825, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(826, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(827, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(828, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(829, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(830, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(831, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(832, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(833, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(834, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(835, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(836, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(837, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(838, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(839, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(840, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(841, 1, 'en', 'core/setting/setting', 'media.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(842, 1, 'en', 'core/setting/setting', 'media.bunnycdn_hostname', 'Hostname', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(843, 1, 'en', 'core/setting/setting', 'media.bunnycdn_zone', 'Zone Name (The name of your storage zone)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(844, 1, 'en', 'core/setting/setting', 'media.bunnycdn_key', 'FTP & API Access Password (The storage zone API Access Password)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(845, 1, 'en', 'core/setting/setting', 'media.bunnycdn_region', 'Region (The storage zone region)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(846, 1, 'en', 'core/setting/setting', 'media.optional', 'Optional', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(847, 1, 'en', 'core/setting/setting', 'media.sizes', 'Media thumbnails sizes', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(848, 1, 'en', 'core/setting/setting', 'media.media_sizes_helper', 'Set width or height to 0 if you just want to crop by width or height. Need to click on \"Generate thumbnails\" to apply changes.', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(849, 1, 'en', 'core/setting/setting', 'media.width', 'Width', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(850, 1, 'en', 'core/setting/setting', 'media.height', 'Height', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(851, 1, 'en', 'core/setting/setting', 'media.default_size_value', 'Default: :size', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(852, 1, 'en', 'core/setting/setting', 'media.all', 'All', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(853, 1, 'en', 'core/setting/setting', 'media.media_folders_can_add_watermark', 'Add watermark for images in folders:', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(854, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize', 'Max upload filesize (MB)', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(855, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_placeholder', 'Default: :size, must less than :size.', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(856, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_helper', 'Your server allows to upload files maximum :size, you can change this value to limit upload filesize.', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(857, 1, 'en', 'core/setting/setting', 'media.image_processing_library', 'Image processing library', '2023-07-18 23:45:26', '2023-07-18 23:45:26'),
(858, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(859, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(860, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(861, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(862, 1, 'en', 'core/setting/setting', 'template', 'Template', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(863, 1, 'en', 'core/setting/setting', 'description', 'Description', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(864, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(865, 1, 'en', 'core/setting/setting', 'send', 'Send', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(866, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(867, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(868, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(869, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(870, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(871, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(872, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(873, 1, 'en', 'core/setting/setting', 'saving', 'Saving...', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(874, 1, 'en', 'core/setting/setting', 'emails_warning', 'You can add up to :count emails', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(875, 1, 'en', 'core/setting/setting', 'email_add_more', 'Add more', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(876, 1, 'en', 'core/setting/setting', 'generate', 'Generate', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(877, 1, 'en', 'core/setting/setting', 'generate_thumbnails', 'Generate thumbnails', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(878, 1, 'en', 'core/setting/setting', 'generate_thumbnails_success', 'Generate thumbnails successfully. :count files are generated!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(879, 1, 'en', 'core/setting/setting', 'generate_thumbnails_error', 'We are unable to regenerate thumbnail for these files :count files!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(880, 1, 'en', 'core/setting/setting', 'generate_thumbnails_description', 'Are you sure you want to re-generate thumbnails for all images? It will take time so please DO NOT leave this page, wait until it is finished.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(881, 1, 'en', 'core/setting/setting', 'enable_chunk_description', 'Chunk size upload is used to upload large file size.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(882, 1, 'en', 'core/setting/setting', 'watermark_description', 'WARNING: Watermark is just added to new uploaded images, it won\'t be added to existing images. Disable watermark won\'t remove watermark from existing images.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(883, 1, 'en', 'core/setting/setting', 'submit', 'Submit', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(884, 1, 'en', 'core/setting/setting', 'back', 'Back', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(885, 1, 'en', 'core/setting/setting', 'enter_sample_value', 'Enter sample values for testing', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(886, 1, 'en', 'core/setting/setting', 'preview', 'Preview', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(887, 1, 'en', 'core/setting/setting', 'media_size_width', ':size size width must be greater than 0', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(888, 1, 'en', 'core/setting/setting', 'media_size_height', ':size size height must be greater than 0', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(889, 1, 'en', 'core/setting/setting', 'cronjob.name', 'Cronjob', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(890, 1, 'en', 'core/setting/setting', 'cronjob.description', 'Cronjob allow you to automate certain commands or scripts on your site.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(891, 1, 'en', 'core/setting/setting', 'cronjob.is_not_ready', 'To run the cronjob, follow the instructions below.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(892, 1, 'en', 'core/setting/setting', 'cronjob.is_working', 'Congratulations! Your cronjob is running.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(893, 1, 'en', 'core/setting/setting', 'cronjob.is_not_working', 'Your cronjob is not running. Please check your server\'s cronjob.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(894, 1, 'en', 'core/setting/setting', 'cronjob.last_checked', 'Last checked at :time.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(895, 1, 'en', 'core/setting/setting', 'cronjob.copy_button', 'Copy', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(896, 1, 'en', 'core/setting/setting', 'cronjob.setup.name', 'Setting up the Cronjob', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(897, 1, 'en', 'core/setting/setting', 'cronjob.setup.connect_to_server', 'Connect to your server via SSH or any preferred method.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(898, 1, 'en', 'core/setting/setting', 'cronjob.setup.open_crontab', 'Open the crontab file using a text editor (e.g., `crontab -e`).', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(899, 1, 'en', 'core/setting/setting', 'cronjob.setup.add_cronjob', 'Add the above command to the crontab file and save it.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(900, 1, 'en', 'core/setting/setting', 'cronjob.setup.done', 'The cronjob will now run at every minute and execute the specified command.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(901, 1, 'en', 'core/setting/setting', 'cronjob.setup.learn_more', 'You can learn more about cronjob from the Laravel :documentation', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(902, 1, 'en', 'core/setting/setting', 'cronjob.setup.documentation', 'documentation', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(903, 1, 'en', 'core/setting/setting', 'cronjob.setup.copied', 'Copied', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(904, 1, 'en', 'core/table/table', 'operations', 'Operations', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(905, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(906, 1, 'en', 'core/table/table', 'display', 'Display', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(907, 1, 'en', 'core/table/table', 'all', 'All', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(908, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(909, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(910, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(911, 1, 'en', 'core/table/table', 'to', 'to', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(912, 1, 'en', 'core/table/table', 'in', 'in', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(913, 1, 'en', 'core/table/table', 'records', 'records', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(914, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(915, 1, 'en', 'core/table/table', 'no_record', 'No record', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(916, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(917, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(918, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(919, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(920, 1, 'en', 'core/table/table', 'delete', 'Delete', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(921, 1, 'en', 'core/table/table', 'close', 'Close', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(922, 1, 'en', 'core/table/table', 'contains', 'Contains', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(923, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(924, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(925, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(926, 1, 'en', 'core/table/table', 'value', 'Value', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(927, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(928, 1, 'en', 'core/table/table', 'reset', 'Reset', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(929, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(930, 1, 'en', 'core/table/table', 'apply', 'Apply', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(931, 1, 'en', 'core/table/table', 'filters', 'Filters', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(932, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(933, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(934, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(935, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(936, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(937, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(938, 1, 'en', 'core/table/table', 'search', 'Search...', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(939, 1, 'en', 'packages/api/api', 'settings', 'API Settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(940, 1, 'en', 'packages/api/api', 'save_settings', 'Save settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(941, 1, 'en', 'packages/api/api', 'setting_title', 'API settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(942, 1, 'en', 'packages/api/api', 'setting_description', 'Settings for API', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(943, 1, 'en', 'packages/api/api', 'api_enabled', 'API enabled?', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(944, 1, 'en', 'packages/get-started/get-started', 'welcome_title', 'Welcome to your admin dashboard!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(945, 1, 'en', 'packages/get-started/get-started', 'welcome_description', 'In a few short steps, you can have your new dashboard up and running!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(946, 1, 'en', 'packages/get-started/get-started', 'get_started', 'Get Started!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(947, 1, 'en', 'packages/get-started/get-started', 'customize_branding_title', 'Customize branding', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(948, 1, 'en', 'packages/get-started/get-started', 'customize_branding_description', 'Customize your site with colors, logo and subdomain to match your business unique branding and identity.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(949, 1, 'en', 'packages/get-started/get-started', 'colors', 'Colors', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(950, 1, 'en', 'packages/get-started/get-started', 'fonts', 'Fonts', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(951, 1, 'en', 'packages/get-started/get-started', 'primary_color', 'Primary color', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(952, 1, 'en', 'packages/get-started/get-started', 'primary_font', 'Primary font', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(953, 1, 'en', 'packages/get-started/get-started', 'setup_wizard_button', ':link to finish Quick setup Wizard!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(954, 1, 'en', 'packages/get-started/get-started', 'click_here', 'Click here', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(955, 1, 'en', 'packages/get-started/get-started', 'site_title', 'Site title', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(956, 1, 'en', 'packages/get-started/get-started', 'identify', 'Identify', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(957, 1, 'en', 'packages/get-started/get-started', 'logo', 'Logo', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(958, 1, 'en', 'packages/get-started/get-started', 'admin_logo', 'Admin logo', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(959, 1, 'en', 'packages/get-started/get-started', 'favicon', 'Favicon', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(960, 1, 'en', 'packages/get-started/get-started', 'admin_favicon', 'Admin favicon', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(961, 1, 'en', 'packages/get-started/get-started', 'next_step', 'Next step', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(962, 1, 'en', 'packages/get-started/get-started', 'site_ready_title', 'Your site is ready!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(963, 1, 'en', 'packages/get-started/get-started', 'site_ready_description', 'Welcome to your new site! Your website has been created and populated with sample data. You are in the admin area of your site where you can set up everything else needed to complete your site.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(964, 1, 'en', 'packages/get-started/get-started', 'finish', 'Finish', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(965, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_title', 'Are you sure you want to exit the Quick Setup Wizard?', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(966, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_confirm', 'Yes, I\'ll finish it later', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(967, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_cancel', 'No, take me back to the wizard', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(968, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_title', 'Change default account info', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(969, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_description', 'The default account is using a weak password. You need to change it to a complex password for better security.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(970, 1, 'en', 'packages/get-started/get-started', 'username', 'Username', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(971, 1, 'en', 'packages/get-started/get-started', 'email', 'Email', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(972, 1, 'en', 'packages/get-started/get-started', 'password', 'Password', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(973, 1, 'en', 'packages/get-started/get-started', 'password_confirmation', 'Password confirmation', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(974, 1, 'en', 'packages/installer/installer', 'title', 'Installer', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(975, 1, 'en', 'packages/installer/installer', 'next', 'Next Step', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(976, 1, 'en', 'packages/installer/installer', 'back', 'Previous', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(977, 1, 'en', 'packages/installer/installer', 'finish', 'Install', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(978, 1, 'en', 'packages/installer/installer', 'installation', 'Installation', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(979, 1, 'en', 'packages/installer/installer', 'forms.errorTitle', 'The following errors occurred:', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(980, 1, 'en', 'packages/installer/installer', 'welcome.templateTitle', 'Welcome', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(981, 1, 'en', 'packages/installer/installer', 'welcome.title', 'Welcome', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(982, 1, 'en', 'packages/installer/installer', 'welcome.message', 'Before getting started, we need some information on the database. You will need to know the following items before proceeding.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(983, 1, 'en', 'packages/installer/installer', 'welcome.next', 'Let\'s go', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(984, 1, 'en', 'packages/installer/installer', 'requirements.templateTitle', 'Step 1 | Server Requirements', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(985, 1, 'en', 'packages/installer/installer', 'requirements.title', 'Server Requirements', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(986, 1, 'en', 'packages/installer/installer', 'requirements.next', 'Check Permissions', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(987, 1, 'en', 'packages/installer/installer', 'permissions.templateTitle', 'Step 2 | Permissions', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(988, 1, 'en', 'packages/installer/installer', 'permissions.title', 'Permissions', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(989, 1, 'en', 'packages/installer/installer', 'permissions.next', 'Configure Environment', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(990, 1, 'en', 'packages/installer/installer', 'environment.wizard.templateTitle', 'Environment Settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(991, 1, 'en', 'packages/installer/installer', 'environment.wizard.title', 'Environment Settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(992, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.name_required', 'An environment name is required.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(993, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_label', 'Site title', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(994, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_placeholder', 'Site title', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(995, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_label', 'URL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(996, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_placeholder', 'URL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(997, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label', 'Database Connection', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(998, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_mysql', 'MySQL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(999, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_sqlite', 'SQLite', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1000, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_pgsql', 'PostgreSQL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1001, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_label', 'Database host', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1002, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_placeholder', 'Database host', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1003, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_label', 'Database port', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1004, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_placeholder', 'Database port', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1005, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_label', 'Database name', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1006, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_placeholder', 'Database name', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1007, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_label', 'Database username', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1008, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_placeholder', 'Database username', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1009, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_label', 'Database password', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1010, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_placeholder', 'Database password', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1011, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.buttons.install', 'Install', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1012, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_helper', 'If you use Laravel Sail, just change DB_HOST to DB_HOST=mysql. On some hosting DB_HOST can be localhost instead of 127.0.0.1', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1013, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.mysql', 'MySQL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1014, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.sqlite', 'SQLite', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1015, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.pgsql', 'PostgreSQL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1016, 1, 'en', 'packages/installer/installer', 'environment.success', 'Your .env file settings have been saved.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1017, 1, 'en', 'packages/installer/installer', 'environment.errors', 'Unable to save the .env file, Please create it manually.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1018, 1, 'en', 'packages/installer/installer', 'install', 'Install', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1019, 1, 'en', 'packages/installer/installer', 'final.title', 'Installation Finished', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1020, 1, 'en', 'packages/installer/installer', 'final.templateTitle', 'Installation Finished', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1021, 1, 'en', 'packages/installer/installer', 'final.finished', 'Application has been successfully installed.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1022, 1, 'en', 'packages/installer/installer', 'final.exit', 'Click here to exit', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1023, 1, 'en', 'packages/installer/installer', 'create_account', 'Create account', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1024, 1, 'en', 'packages/installer/installer', 'first_name', 'First name', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1025, 1, 'en', 'packages/installer/installer', 'last_name', 'Last name', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1026, 1, 'en', 'packages/installer/installer', 'username', 'Username', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1027, 1, 'en', 'packages/installer/installer', 'email', 'Email', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1028, 1, 'en', 'packages/installer/installer', 'password', 'Password', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1029, 1, 'en', 'packages/installer/installer', 'password_confirmation', 'Password confirmation', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1030, 1, 'en', 'packages/installer/installer', 'create', 'Create', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1031, 1, 'en', 'packages/installer/installer', 'install_success', 'Installed successfully!', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1032, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1033, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1034, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1035, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1036, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1037, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1038, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1039, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1040, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1041, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1042, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1043, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1044, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1045, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1046, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1047, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1048, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1049, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1050, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1051, 1, 'en', 'packages/menu/menu', 'title_placeholder', 'Title', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1052, 1, 'en', 'packages/menu/menu', 'icon_placeholder', 'Icon', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1053, 1, 'en', 'packages/menu/menu', 'url_placeholder', 'URL', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1054, 1, 'en', 'packages/menu/menu', 'css_class_placeholder', 'CSS class', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1055, 1, 'en', 'packages/menu/menu', 'menu_id', 'Menu ID', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1056, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1057, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1058, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1059, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space', 'Collapse white space', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1060, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space_description', 'This filter reduces bytes transmitted in an HTML file by removing unnecessary whitespace.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1061, 1, 'en', 'packages/optimize/optimize', 'elide_attributes', 'Elide attributes', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1062, 1, 'en', 'packages/optimize/optimize', 'elide_attributes_description', 'This filter reduces the transfer size of HTML files by removing attributes from tags when the specified value is equal to the default value for that attribute. This can save a modest number of bytes, and may make the document more compressible by canonicalizing the affected tags.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1063, 1, 'en', 'packages/optimize/optimize', 'inline_css', 'Inline CSS', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1064, 1, 'en', 'packages/optimize/optimize', 'inline_css_description', 'This filter transforms the inline \"style\" attribute of tags into classes by moving the CSS to the header.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1065, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch', 'Insert DNS prefetch', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1066, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch_description', 'This filter injects tags in the HEAD to enable the browser to do DNS prefetching.', '2023-07-18 23:45:27', '2023-07-18 23:45:27'),
(1067, 1, 'en', 'packages/optimize/optimize', 'remove_comments', 'Remove comments', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1068, 1, 'en', 'packages/optimize/optimize', 'remove_comments_description', 'This filter eliminates HTML, JS and CSS comments. The filter reduces the transfer size of HTML files by removing the comments. Depending on the HTML file, this filter can significantly reduce the number of bytes transmitted on the network.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1069, 1, 'en', 'packages/optimize/optimize', 'remove_quotes', 'Remove quotes', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1070, 1, 'en', 'packages/optimize/optimize', 'remove_quotes_description', 'This filter eliminates unnecessary quotation marks from HTML attributes. While required by the various HTML specifications, browsers permit their omission when the value of an attribute is composed of a certain subset of characters (alphanumerics and some punctuation characters).', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1071, 1, 'en', 'packages/optimize/optimize', 'defer_javascript', 'Defer javascript', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1072, 1, 'en', 'packages/optimize/optimize', 'defer_javascript_description', 'Defers the execution of javascript in the HTML. If necessary cancel deferring in some script, use data-pagespeed-no-defer as script attribute to cancel deferring.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1073, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1074, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1075, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1076, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1077, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1078, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1079, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1080, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1081, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1082, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1083, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1084, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1085, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1086, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1087, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1088, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1089, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1090, 1, 'en', 'packages/plugin-management/marketplace', 'previous', '&laquo; Previous', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1091, 1, 'en', 'packages/plugin-management/marketplace', 'next', 'Next &raquo;', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1092, 1, 'en', 'packages/plugin-management/marketplace', 'showing', 'Showing', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1093, 1, 'en', 'packages/plugin-management/marketplace', 'to', 'to', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1094, 1, 'en', 'packages/plugin-management/marketplace', 'of', 'of', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1095, 1, 'en', 'packages/plugin-management/marketplace', 'results', 'results', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1096, 1, 'en', 'packages/plugin-management/marketplace', 'add_new', 'Add new', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1097, 1, 'en', 'packages/plugin-management/marketplace', 'installed', 'Installed', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1098, 1, 'en', 'packages/plugin-management/marketplace', 'install_now', 'Install now', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1099, 1, 'en', 'packages/plugin-management/marketplace', 'installing', 'Installing...', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1100, 1, 'en', 'packages/plugin-management/marketplace', 'detail', 'Details', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1101, 1, 'en', 'packages/plugin-management/marketplace', 'version', 'Version', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1102, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version', 'Minimum core version', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1103, 1, 'en', 'packages/plugin-management/marketplace', 'last_update', 'Last update', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1104, 1, 'en', 'packages/plugin-management/marketplace', 'compatible_version', 'Compatible with your version', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1105, 1, 'en', 'packages/plugin-management/marketplace', 'incompatible_version', 'Incompatible with your version', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1106, 1, 'en', 'packages/plugin-management/marketplace', 'deactivate', 'Deactivate', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1107, 1, 'en', 'packages/plugin-management/marketplace', 'activate', 'Activate', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1108, 1, 'en', 'packages/plugin-management/marketplace', 'activating', 'Activating...', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1109, 1, 'en', 'packages/plugin-management/marketplace', 'activated', 'Activated', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1110, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted', 'Connection Aborted', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1111, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted_description', 'Connection Aborted Description', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1112, 1, 'en', 'packages/plugin-management/marketplace', 'api_connect_error', 'Connect to Marketplace API Error, please contact support', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1113, 1, 'en', 'packages/plugin-management/marketplace', 'keyword', 'Keyword', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1114, 1, 'en', 'packages/plugin-management/marketplace', 'search', 'Search', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1115, 1, 'en', 'packages/plugin-management/marketplace', 'all', 'All', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1116, 1, 'en', 'packages/plugin-management/marketplace', 'featured', 'Featured', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1117, 1, 'en', 'packages/plugin-management/marketplace', 'popular', 'Popular', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1118, 1, 'en', 'packages/plugin-management/marketplace', 'top_rated', 'Top Rated', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1119, 1, 'en', 'packages/plugin-management/marketplace', 'install_plugin', 'Install plugin', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1120, 1, 'en', 'packages/plugin-management/marketplace', 'cancel', 'Cancel', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1121, 1, 'en', 'packages/plugin-management/marketplace', 'yes_install', ' Yes! Install', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1122, 1, 'en', 'packages/plugin-management/marketplace', 'message_alert', 'Are you sure you want to install this plugin?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1123, 1, 'en', 'packages/plugin-management/marketplace', 'folder_permissions', 'Folder does not have permission to write file or the update file path could not be resolved, please contact support', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1124, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_failed', 'Unzip extraction failed', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1125, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_success', 'Download file extracted', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1126, 1, 'en', 'packages/plugin-management/marketplace', 'install_success', 'Installed plugin successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1127, 1, 'en', 'packages/plugin-management/marketplace', 'update_success', 'Updated plugin successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1128, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version_error', 'Cannot install this plugin. Minimum core version is :version.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1129, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1130, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1131, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1132, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1133, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1134, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1135, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1136, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1137, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1138, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1139, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1140, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1141, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1142, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1143, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1144, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2023-07-18 23:45:28', '2023-07-18 23:45:28');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1145, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1146, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1147, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1148, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1149, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1150, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1151, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1152, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1153, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1154, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1155, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1156, 1, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1157, 1, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1158, 1, 'en', 'packages/plugin-management/plugin', 'plugins_installed', 'Installed Plugins', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1159, 1, 'en', 'packages/plugin-management/plugin', 'plugins_add_new', 'Add new', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1160, 1, 'en', 'packages/plugin-management/plugin', 'update', 'Update', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1161, 1, 'en', 'packages/plugin-management/plugin', 'requirement_not_met', 'Plugin :plugin requires plugin(s): :required_plugins. Do you want to install them and activate :plugin now?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1162, 1, 'en', 'packages/plugin-management/plugin', 'install', 'Install now', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1163, 1, 'en', 'packages/plugin-management/plugin', 'install_plugin', 'Install Plugin', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1164, 1, 'en', 'packages/plugin-management/plugin', 'minimum_core_version_not_met', 'Plugin :plugin requires :minimum_core_version version of core, but your core version is :current_core_version. Please upgrade your core to use this plugin!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1165, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1166, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1167, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1168, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1169, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1170, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1171, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1172, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1173, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1174, 1, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1175, 1, 'en', 'packages/slug/slug', 'settings.available_variables', 'Available variables', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1176, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1177, 1, 'en', 'packages/slug/slug', 'prefix_for', 'Prefix for :name', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1178, 1, 'en', 'packages/slug/slug', 'public_single_ending_url', 'Postfix for single page URL', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1179, 1, 'en', 'packages/slug/slug', 'current_year', 'Current year', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1180, 1, 'en', 'packages/slug/slug', 'current_month', 'Current month', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1181, 1, 'en', 'packages/slug/slug', 'current_day', 'Current day', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1182, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1183, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1184, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1185, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1186, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1187, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1188, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1189, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1190, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1191, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1192, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1193, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1194, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1195, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1196, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1197, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1198, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1199, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1200, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1201, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1202, 1, 'en', 'packages/theme/theme', 'custom_html', 'Custom HTML', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1203, 1, 'en', 'packages/theme/theme', 'custom_header_html', 'Header HTML', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1204, 1, 'en', 'packages/theme/theme', 'custom_header_html_placeholder', 'HTML in header of page, no special tags: script, style, iframe...', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1205, 1, 'en', 'packages/theme/theme', 'custom_body_html', 'Body HTML', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1206, 1, 'en', 'packages/theme/theme', 'custom_body_html_placeholder', 'HTML in body of page, no special tags: script, style, iframe...', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1207, 1, 'en', 'packages/theme/theme', 'custom_footer_html', 'Footer HTML', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1208, 1, 'en', 'packages/theme/theme', 'custom_footer_html_placeholder', 'HTML in footer of page, no special tags: script, style, iframe...', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1209, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1210, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1211, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1212, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1213, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1214, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1215, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1216, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1217, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1218, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1219, 1, 'en', 'packages/theme/theme', 'settings.redirect_404_to_homepage', 'Redirect all not found requests to homepage?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1220, 1, 'en', 'packages/theme/theme', 'settings.show_guidelines', 'Show guidelines?', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1221, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1222, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1223, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1224, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1225, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1226, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1227, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1228, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1229, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1230, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1231, 1, 'en', 'packages/theme/theme', 'update_custom_html_success', 'Update custom HTML successfully!', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1232, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1233, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1234, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1235, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1236, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2023-07-18 23:45:28', '2023-07-18 23:45:28'),
(1237, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1238, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1239, 1, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1240, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1241, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1242, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1243, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1244, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1245, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1246, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1247, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1248, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1249, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1250, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1251, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1252, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1253, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1254, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1255, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1256, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1257, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1258, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1259, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1260, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1261, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1262, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1263, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1264, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1265, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1266, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1267, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1268, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1269, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1270, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1271, 1, 'en', 'plugins/analytics/analytics', 'property_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1272, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1273, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1274, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a Google Analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1275, 1, 'en', 'plugins/analytics/analytics', 'property_id_is_invalid', 'Property ID is invalid. Check this: https://developers.google.com/analytics/devguides/reporting/data/v1/property-id', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1276, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1277, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1278, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id', 'Google tag ID', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1279, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id_placeholder', 'Example: G-76NX8HY29D', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1280, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id', 'Property ID for GA4', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1281, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id_description', 'Google Analytics Property ID (GA4)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1282, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1283, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1284, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1285, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1286, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1287, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1288, 1, 'en', 'plugins/analytics/analytics', 'missing_library_warning', 'Analytics plugin error: Missing third-party libraries, please run \"composer update\" to install them.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1289, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1290, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1291, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1292, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1293, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1294, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1295, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1296, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1297, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1298, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1299, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1300, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1301, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1302, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1303, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1304, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1305, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1306, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1307, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1308, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1309, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1310, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1311, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1312, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1313, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1314, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1315, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1316, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1317, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1318, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1319, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1320, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1321, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1322, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1323, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1324, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1325, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1326, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1327, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1328, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1329, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1330, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1331, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1332, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1333, 1, 'en', 'plugins/backup/backup', 'proc_open_disabled_error', 'Function <strong>proc_open()</strong> has been disabled so the system cannot backup the database. Please contact your hosting provider to enable it.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1334, 1, 'en', 'plugins/backup/backup', 'database_backup_not_existed', 'Backup database is not existed!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1335, 1, 'en', 'plugins/backup/backup', 'uploads_folder_backup_not_existed', 'Backup uploads folder is not existed!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1336, 1, 'en', 'plugins/backup/backup', 'important_message1', 'This is a simple backup feature, it is a solution for you if your site has < 1GB data and can be used for quickly backup your site.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1337, 1, 'en', 'plugins/backup/backup', 'important_message2', 'If you have more than 1GB images/files in local storage, you should use backup feature of your hosting or VPS.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1338, 1, 'en', 'plugins/backup/backup', 'important_message3', 'To backup your database, function <strong>proc_open()</strong> or <strong>system()</strong> must be enabled. Contact your hosting provider to enable it if it is disabled.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1339, 1, 'en', 'plugins/backup/backup', 'important_message4', 'It is not a full backup, it is just back up uploaded files and your database.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1340, 1, 'en', 'plugins/backup/backup', 'cannot_restore_database', 'Cannot restore database. The database backup is missing!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1341, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1342, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1343, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1344, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1345, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1346, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1347, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1348, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1349, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1350, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1351, 1, 'en', 'plugins/blog/base', 'settings.title', 'Blog', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1352, 1, 'en', 'plugins/blog/base', 'settings.description', 'Settings for Blog', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1353, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema', 'Enable Blog Post Schema?', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1354, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema_description', 'Learn more: https://schema.org/Article', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1355, 1, 'en', 'plugins/blog/base', 'settings.schema_type', 'Schema type', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1356, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1357, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1358, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1359, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1360, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1361, 1, 'en', 'plugins/blog/categories', 'total_posts', 'Total posts: :total', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1362, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1363, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1364, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1365, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1366, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1367, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1368, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1369, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1370, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1371, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1372, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1373, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1374, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1375, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1376, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1377, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1378, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1379, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1380, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1381, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1382, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1383, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1384, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1385, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1386, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1387, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1388, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1389, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1390, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1391, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1392, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1393, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1394, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1395, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1396, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1397, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1398, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1399, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1400, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1401, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1402, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1403, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1404, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1405, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1406, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1407, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1408, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1409, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1410, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1411, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1412, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1413, 1, 'en', 'plugins/captcha/captcha', 'numbers.0', 'Zero', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1414, 1, 'en', 'plugins/captcha/captcha', 'numbers.1', 'One', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1415, 1, 'en', 'plugins/captcha/captcha', 'numbers.2', 'Two', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1416, 1, 'en', 'plugins/captcha/captcha', 'numbers.3', 'Three', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1417, 1, 'en', 'plugins/captcha/captcha', 'numbers.4', 'Four', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1418, 1, 'en', 'plugins/captcha/captcha', 'numbers.5', 'Five', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1419, 1, 'en', 'plugins/captcha/captcha', 'numbers.6', 'Six', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1420, 1, 'en', 'plugins/captcha/captcha', 'numbers.7', 'Seven', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1421, 1, 'en', 'plugins/captcha/captcha', 'numbers.8', 'Eight', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1422, 1, 'en', 'plugins/captcha/captcha', 'numbers.9', 'Nine', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1423, 1, 'en', 'plugins/captcha/captcha', 'numbers.10', 'Ten', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1424, 1, 'en', 'plugins/captcha/captcha', 'numbers.11', 'Eleven', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1425, 1, 'en', 'plugins/captcha/captcha', 'numbers.12', 'Twelve', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1426, 1, 'en', 'plugins/captcha/captcha', 'operands.+', 'plus', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1427, 1, 'en', 'plugins/captcha/captcha', 'operands.-', 'minus', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1428, 1, 'en', 'plugins/captcha/captcha', 'operands.*', 'times', '2023-07-18 23:45:29', '2023-07-18 23:45:29'),
(1429, 1, 'en', 'plugins/captcha/captcha', 'operands./', 'divided by', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1430, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1431, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1432, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1433, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1434, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1435, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1436, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1437, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1438, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1439, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1440, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1441, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1442, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1443, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1444, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1445, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1446, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1447, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1448, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1449, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1450, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1451, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1452, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1453, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1454, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1455, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1456, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1457, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1458, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1459, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1460, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1461, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1462, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1463, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1464, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1465, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1466, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1467, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1468, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1469, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1470, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1471, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1472, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1473, 1, 'en', 'plugins/contact/contact', 'settings.title', 'Contact', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1474, 1, 'en', 'plugins/contact/contact', 'settings.description', 'Settings for contact plugin', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1475, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords', 'Blacklist keywords', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1476, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_placeholder', 'keywords...', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1477, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_helper', 'Blacklist contact requests if it includes those keywords in the content field (separate by comma).', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1478, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains', 'Blacklist email domains', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1479, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_placeholder', 'domain...', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1480, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_helper', 'Blacklist contact requests if the email domain is in blacklist domains (separate by comma).', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1481, 1, 'en', 'plugins/contact/contact', 'settings.enable_math_captcha', 'Enable math captcha?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1482, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1483, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1484, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1485, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1486, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1487, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1488, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1489, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1490, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1491, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1492, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1493, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1494, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1495, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1496, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1497, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1498, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1499, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.style', 'Style', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1500, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.full_width', 'Full width', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1501, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.minimal', 'Minimal', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1502, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1503, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1504, 1, 'en', 'plugins/faq/faq-category', 'name', 'Categories', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1505, 1, 'en', 'plugins/faq/faq-category', 'create', 'New category', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1506, 1, 'en', 'plugins/faq/faq', 'name', 'FAQ', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1507, 1, 'en', 'plugins/faq/faq', 'create', 'New faq', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1508, 1, 'en', 'plugins/faq/faq', 'question', 'Question', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1509, 1, 'en', 'plugins/faq/faq', 'answer', 'Answer', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1510, 1, 'en', 'plugins/faq/faq', 'category', 'Category', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1511, 1, 'en', 'plugins/faq/faq', 'all', 'All', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1512, 1, 'en', 'plugins/faq/faq', 'faq_schema_config', 'FAQ schema configuration (:link)', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1513, 1, 'en', 'plugins/faq/faq', 'learn_more', 'Learn more', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1514, 1, 'en', 'plugins/faq/faq', 'settings.title', 'FAQ', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1515, 1, 'en', 'plugins/faq/faq', 'settings.description', 'Settings for FAQ', '2023-07-18 23:45:30', '2023-07-18 23:45:30');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1516, 1, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema', 'Enable FAQ Schema?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1517, 1, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema_description', 'Learn more: https://developers.google.com/search/docs/data-types/faqpage', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1518, 1, 'en', 'plugins/faq/faq', 'select_category', 'Select a category', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1519, 1, 'en', 'plugins/faq/faq', 'add_item', 'Add item', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1520, 1, 'en', 'plugins/language/language', 'name', 'Languages', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1521, 1, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1522, 1, 'en', 'plugins/language/language', 'select_language', 'Select language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1523, 1, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1524, 1, 'en', 'plugins/language/language', 'language_name', 'Language name', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1525, 1, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1526, 1, 'en', 'plugins/language/language', 'locale', 'Locale', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1527, 1, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1528, 1, 'en', 'plugins/language/language', 'language_code', 'Language code', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1529, 1, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1530, 1, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1531, 1, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1532, 1, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1533, 1, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1534, 1, 'en', 'plugins/language/language', 'flag', 'Flag', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1535, 1, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1536, 1, 'en', 'plugins/language/language', 'order', 'Order', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1537, 1, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1538, 1, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1539, 1, 'en', 'plugins/language/language', 'code', 'Code', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1540, 1, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1541, 1, 'en', 'plugins/language/language', 'actions', 'Actions', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1542, 1, 'en', 'plugins/language/language', 'translations', 'Translations', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1543, 1, 'en', 'plugins/language/language', 'edit', 'Edit', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1544, 1, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1545, 1, 'en', 'plugins/language/language', 'delete', 'Delete', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1546, 1, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1547, 1, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1548, 1, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1549, 1, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1550, 1, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1551, 1, 'en', 'plugins/language/language', 'settings', 'Settings', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1552, 1, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1553, 1, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1554, 1, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1555, 1, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1556, 1, 'en', 'plugins/language/language', 'language_display', 'Language display', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1557, 1, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1558, 1, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1559, 1, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1560, 1, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1561, 1, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1562, 1, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1563, 1, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1564, 1, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1565, 1, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1566, 1, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1567, 1, 'en', 'plugins/language/language', 'show_all', 'Show all', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1568, 1, 'en', 'plugins/language/language', 'change_language', 'Language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1569, 1, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1570, 1, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1571, 1, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1572, 1, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1573, 1, 'en', 'plugins/language/language', 'language_auto_detect_user_language', 'Auto detect user language?', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1574, 1, 'en', 'plugins/location/bulk-import', 'name', 'Bulk Import', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1575, 1, 'en', 'plugins/location/bulk-import', 'loading_text', 'Importing', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1576, 1, 'en', 'plugins/location/bulk-import', 'imported_successfully', 'Imported successfully.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1577, 1, 'en', 'plugins/location/bulk-import', 'please_choose_the_file_mime', 'Please choose the file mime :types', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1578, 1, 'en', 'plugins/location/bulk-import', 'please_choose_the_file', 'Please choose the file', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1579, 1, 'en', 'plugins/location/bulk-import', 'start_import', 'Start Import', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1580, 1, 'en', 'plugins/location/bulk-import', 'note', 'Note!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1581, 1, 'en', 'plugins/location/bulk-import', 'warning_before_importing', 'If this is your first time using this feature, please read the documentation or contact the Administrator for access to the correct functionality!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1582, 1, 'en', 'plugins/location/bulk-import', 'results', 'Result: :success successes, :failed failures', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1583, 1, 'en', 'plugins/location/bulk-import', 'failures', 'Failures', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1584, 1, 'en', 'plugins/location/bulk-import', 'tables.import', 'Import', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1585, 1, 'en', 'plugins/location/bulk-import', 'template', 'Template', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1586, 1, 'en', 'plugins/location/bulk-import', 'rules', 'Rules', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1587, 1, 'en', 'plugins/location/bulk-import', 'choose_file_with_mime', 'Choose file with mime: (:types)', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1588, 1, 'en', 'plugins/location/bulk-import', 'choose_file', 'Choose file', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1589, 1, 'en', 'plugins/location/bulk-import', 'menu', 'Import locations', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1590, 1, 'en', 'plugins/location/bulk-import', 'download-csv-file', 'Download CSV template', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1591, 1, 'en', 'plugins/location/bulk-import', 'download-excel-file', 'Download Excel template', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1592, 1, 'en', 'plugins/location/bulk-import', 'downloading', 'Downloading...', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1593, 1, 'en', 'plugins/location/bulk-import', 'export.template.input_error', 'Input error', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1594, 1, 'en', 'plugins/location/bulk-import', 'export.template.number_not_allowed', 'Number is not allowed!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1595, 1, 'en', 'plugins/location/bulk-import', 'export.template.allowed_input', 'Allowed input', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1596, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_decimal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1597, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_whole_number', 'Only numbers are accepted and greater than or equal to :min.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1598, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_list', 'Please pick a value from the drop-down list.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1599, 1, 'en', 'plugins/location/bulk-import', 'export.template.pick_from_list', 'Pick from list', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1600, 1, 'en', 'plugins/location/bulk-import', 'export.template.value_not_in_list', 'Value is not in list.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1601, 1, 'en', 'plugins/location/bulk-import', 'export.template.max_text_length', 'Max text length', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1602, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_max_text_length', 'Only accept text with length less than or equal to :max.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1603, 1, 'en', 'plugins/location/bulk-import', 'import_failed_description', 'Import failed, please check the errors below!', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1604, 1, 'en', 'plugins/location/bulk-import', 'available_enable_multi_language', 'Only available when you enable \"Is Multi Language?\"', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1605, 1, 'en', 'plugins/location/bulk-import', 'import_type_required_if', 'The :attribute field is required when \"Import Type\" is :value.', '2023-07-18 23:45:30', '2023-07-18 23:45:30'),
(1606, 1, 'en', 'plugins/location/bulk-import', 'import_available_data', 'Import available data', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1607, 1, 'en', 'plugins/location/bulk-import', 'import', 'Import', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1608, 1, 'en', 'plugins/location/bulk-import', 'import_available_data_confirmation', 'Import available data confirmation', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1609, 1, 'en', 'plugins/location/bulk-import', 'import_available_data_confirmation_content', 'Do you really want to import states/cities for this country?', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1610, 1, 'en', 'plugins/location/city', 'name', 'Cities', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1611, 1, 'en', 'plugins/location/city', 'create', 'New city', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1612, 1, 'en', 'plugins/location/city', 'state', 'State', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1613, 1, 'en', 'plugins/location/city', 'select_state', 'Select state...', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1614, 1, 'en', 'plugins/location/city', 'select_city', 'Select city...', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1615, 1, 'en', 'plugins/location/city', 'country', 'Country', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1616, 1, 'en', 'plugins/location/city', 'select_country', 'Select country...', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1617, 1, 'en', 'plugins/location/city', 'city', 'City', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1618, 1, 'en', 'plugins/location/country', 'name', 'Countries', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1619, 1, 'en', 'plugins/location/country', 'create', 'New country', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1620, 1, 'en', 'plugins/location/country', 'nationality', 'Nationality', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1621, 1, 'en', 'plugins/location/country', 'code', 'Country ISO code', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1622, 1, 'en', 'plugins/location/country', 'code_placeholder', 'ISO country code, uppercase. Ex: US.', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1623, 1, 'en', 'plugins/location/country', 'code_helper', 'Find country ISO code from here: https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1624, 1, 'en', 'plugins/location/location', 'name', 'Locations', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1625, 1, 'en', 'plugins/location/location', 'all_states', 'All states', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1626, 1, 'en', 'plugins/location/location', 'abbreviation', 'Abbreviation', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1627, 1, 'en', 'plugins/location/location', 'abbreviation_placeholder', 'E.g: CA', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1628, 1, 'en', 'plugins/location/location', 'exporting', 'Exporting', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1629, 1, 'en', 'plugins/location/location', 'total_country', 'Total countries', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1630, 1, 'en', 'plugins/location/location', 'total_state', 'Total states', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1631, 1, 'en', 'plugins/location/location', 'total_city', 'Total cities', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1632, 1, 'en', 'plugins/location/location', 'export_location', 'Export location', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1633, 1, 'en', 'plugins/location/location', 'start_export', 'Start exporting', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1634, 1, 'en', 'plugins/location/state', 'name', 'States', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1635, 1, 'en', 'plugins/location/state', 'create', 'New state', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1636, 1, 'en', 'plugins/location/state', 'country', 'Country', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1637, 1, 'en', 'plugins/location/state', 'select_country', 'Select a country...', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1638, 1, 'en', 'plugins/location/state', 'state', 'State', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1639, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1640, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1641, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1642, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1643, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1644, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1645, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1646, 1, 'en', 'plugins/newsletter/newsletter', 'settings.title', 'Newsletter', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1647, 1, 'en', 'plugins/newsletter/newsletter', 'settings.description', 'Settings for newsletter (auto send newsletter email to SendGrid, Mailchimp... when someone register newsletter on website).', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1648, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_api_key', 'Mailchimp API Key', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1649, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list_id', 'Mailchimp List ID', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1650, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list', 'Mailchimp List', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1651, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_api_key', 'Sendgrid API Key', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1652, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list_id', 'Sendgrid List ID', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1653, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list', 'Sendgrid List', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1654, 1, 'en', 'plugins/newsletter/newsletter', 'settings.enable_newsletter_contacts_list_api', 'Enable newsletter contacts list API?', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1655, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1656, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1657, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1658, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1659, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1660, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1661, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1662, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1663, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1664, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1665, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1666, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1667, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1668, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1669, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1670, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Fast and safe online payment via PayPal.', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1671, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1672, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1673, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1674, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1675, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1676, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1677, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1678, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1679, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1680, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1681, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1682, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1683, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1684, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1685, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1686, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1687, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1688, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1689, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1690, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1691, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1692, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1693, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1694, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1695, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1696, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1697, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1698, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1699, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1700, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1701, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1702, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1703, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1704, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1705, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1706, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1707, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1708, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1709, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1710, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1711, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1712, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1713, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1714, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1715, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1716, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1717, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1718, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1719, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1720, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1721, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1722, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1723, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1724, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1725, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1726, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1727, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1728, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1729, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1730, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1731, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1732, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1733, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1734, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1735, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1736, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1737, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1738, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1739, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1740, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1741, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1742, 1, 'en', 'plugins/payment/payment', 'refunds.title', 'Refunds', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1743, 1, 'en', 'plugins/payment/payment', 'refunds.id', 'ID', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1744, 1, 'en', 'plugins/payment/payment', 'refunds.breakdowns', 'Breakdowns', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1745, 1, 'en', 'plugins/payment/payment', 'refunds.gross_amount', 'Gross amount', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1746, 1, 'en', 'plugins/payment/payment', 'refunds.paypal_fee', 'PayPal fee', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1747, 1, 'en', 'plugins/payment/payment', 'refunds.net_amount', 'Net amount', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1748, 1, 'en', 'plugins/payment/payment', 'refunds.total_refunded_amount', 'Total refunded amount', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1749, 1, 'en', 'plugins/payment/payment', 'refunds.create_time', 'Create time', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1750, 1, 'en', 'plugins/payment/payment', 'refunds.update_time', 'Update time', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1751, 1, 'en', 'plugins/payment/payment', 'refunds.status', 'Status', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1752, 1, 'en', 'plugins/payment/payment', 'refunds.description', 'Description', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1753, 1, 'en', 'plugins/payment/payment', 'refunds.refunded_at', 'Refunded at', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1754, 1, 'en', 'plugins/payment/payment', 'refunds.error_message', 'Error message', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1755, 1, 'en', 'plugins/payment/payment', 'view_response_source', 'View response source', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1756, 1, 'en', 'plugins/payment/payment', 'status_is_not_completed', 'Status is not COMPLETED', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1757, 1, 'en', 'plugins/payment/payment', 'cannot_found_capture_id', 'Can not found capture id with payment detail', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1758, 1, 'en', 'plugins/payment/payment', 'amount_refunded', 'Amount refunded', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1759, 1, 'en', 'plugins/payment/payment', 'amount_remaining', 'Amount remaining', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1760, 1, 'en', 'plugins/payment/payment', 'paid_at', 'Paid At', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1761, 1, 'en', 'plugins/payment/payment', 'invalid_settings', 'Settings for :name are invalid!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1762, 1, 'en', 'plugins/payment/payment', 'view_transaction', 'Transaction \":charge_id\"', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1763, 1, 'en', 'plugins/payment/payment', 'payment_description', 'Pay for your order #:order_id at :site_url', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1764, 1, 'en', 'plugins/real-estate/account-property', 'draft_properties', 'Draft Properties', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1765, 1, 'en', 'plugins/real-estate/account-property', 'pending_properties', 'Pending Properties', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1766, 1, 'en', 'plugins/real-estate/account-property', 'published_properties', 'Published Properties', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1767, 1, 'en', 'plugins/real-estate/account-property', 'properties', 'Properties', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1768, 1, 'en', 'plugins/real-estate/account-property', 'write_property', 'Write a property', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1769, 1, 'en', 'plugins/real-estate/account-property', 'images', 'Images (maximum :max images)', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1770, 1, 'en', 'plugins/real-estate/account', 'create', 'New account', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1771, 1, 'en', 'plugins/real-estate/account', 'edit', 'Edit account \":name\"', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1772, 1, 'en', 'plugins/real-estate/account', 'name', 'Accounts', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1773, 1, 'en', 'plugins/real-estate/account', 'form.email', 'Email', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1774, 1, 'en', 'plugins/real-estate/account', 'form.password', 'Password', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1775, 1, 'en', 'plugins/real-estate/account', 'form.password_confirmation', 'Password confirmation', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1776, 1, 'en', 'plugins/real-estate/account', 'form.change_password', 'Change password?', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1777, 1, 'en', 'plugins/real-estate/account', 'forgot_password', 'Forgot password', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1778, 1, 'en', 'plugins/real-estate/account', 'login', 'Login', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1779, 1, 'en', 'plugins/real-estate/account', 'buy_credits', 'Buy credits', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1780, 1, 'en', 'plugins/real-estate/account', 'credits', 'credits', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1781, 1, 'en', 'plugins/real-estate/account', 'account_settings', 'Account settings', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1782, 1, 'en', 'plugins/real-estate/account', 'update_profile_success', 'Update profile successfully!', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1783, 1, 'en', 'plugins/real-estate/account', 'security', 'Security', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1784, 1, 'en', 'plugins/real-estate/account', 'packages', 'Packages', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1785, 1, 'en', 'plugins/real-estate/account', 'transactions', 'Transactions', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1786, 1, 'en', 'plugins/real-estate/account', 'subscribe_package', 'Subscribe package \":name\"', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1787, 1, 'en', 'plugins/real-estate/account', 'description', 'Description', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1788, 1, 'en', 'plugins/real-estate/account', 'first_name', 'First Name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1789, 1, 'en', 'plugins/real-estate/account', 'last_name', 'Last Name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1790, 1, 'en', 'plugins/real-estate/account', 'username', 'Username', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1791, 1, 'en', 'plugins/real-estate/account', 'username_placeholder', 'Ex: john_smith', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1792, 1, 'en', 'plugins/real-estate/account', 'company', 'Company Name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1793, 1, 'en', 'plugins/real-estate/account', 'company_placeholder', 'Company Name', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1794, 1, 'en', 'plugins/real-estate/account', 'phone', 'Phone', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1795, 1, 'en', 'plugins/real-estate/account', 'phone_placeholder', 'Phone', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1796, 1, 'en', 'plugins/real-estate/account', 'email_placeholder', 'Ex: example@gmail.com', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1797, 1, 'en', 'plugins/real-estate/account', 'dob', 'Date of birth', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1798, 1, 'en', 'plugins/real-estate/account', 'number_of_properties', 'Number of properties', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1799, 1, 'en', 'plugins/real-estate/account', 'agents', 'Agents', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1800, 1, 'en', 'plugins/real-estate/category', 'name', 'Categories', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1801, 1, 'en', 'plugins/real-estate/category', 'create', 'New category', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1802, 1, 'en', 'plugins/real-estate/category', 'edit', 'Edit category', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1803, 1, 'en', 'plugins/real-estate/category', 'menu', 'Property categories', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1804, 1, 'en', 'plugins/real-estate/category', 'none', 'None', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1805, 1, 'en', 'plugins/real-estate/category', 'total_properties', 'Total properties', '2023-07-18 23:45:31', '2023-07-18 23:45:31'),
(1806, 1, 'en', 'plugins/real-estate/category', 'total_projects', 'Total projects', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1807, 1, 'en', 'plugins/real-estate/category', 'is_default', 'Is default', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1808, 1, 'en', 'plugins/real-estate/consult', 'name', 'Consults', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1809, 1, 'en', 'plugins/real-estate/consult', 'edit', 'View consult', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1810, 1, 'en', 'plugins/real-estate/consult', 'statuses.read', 'Read', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1811, 1, 'en', 'plugins/real-estate/consult', 'statuses.unread', 'Unread', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1812, 1, 'en', 'plugins/real-estate/consult', 'phone', 'Phone', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1813, 1, 'en', 'plugins/real-estate/consult', 'ip_address', 'IP address', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1814, 1, 'en', 'plugins/real-estate/consult', 'content', 'Details', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1815, 1, 'en', 'plugins/real-estate/consult', 'consult_information', 'Consult information', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1816, 1, 'en', 'plugins/real-estate/consult', 'email.header', 'Email', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1817, 1, 'en', 'plugins/real-estate/consult', 'email.title', 'New consult from your site', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1818, 1, 'en', 'plugins/real-estate/consult', 'email.success', 'Send consult successfully!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1819, 1, 'en', 'plugins/real-estate/consult', 'email.failed', 'Can\'t send request on this time, please try again later!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1820, 1, 'en', 'plugins/real-estate/consult', 'form.name.required', 'Name is required', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1821, 1, 'en', 'plugins/real-estate/consult', 'form.email.required', 'Email is required', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1822, 1, 'en', 'plugins/real-estate/consult', 'form.email.email', 'The email address is not valid', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1823, 1, 'en', 'plugins/real-estate/consult', 'form.content.required', 'Message is required', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1824, 1, 'en', 'plugins/real-estate/consult', 'consult_sent_from', 'This consult information sent from', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1825, 1, 'en', 'plugins/real-estate/consult', 'time', 'Time', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1826, 1, 'en', 'plugins/real-estate/consult', 'consult_id', 'Consult ID', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1827, 1, 'en', 'plugins/real-estate/consult', 'form_name', 'Name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1828, 1, 'en', 'plugins/real-estate/consult', 'form_email', 'Email', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1829, 1, 'en', 'plugins/real-estate/consult', 'form_phone', 'Phone', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1830, 1, 'en', 'plugins/real-estate/consult', 'mark_as_read', 'Mark as read', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1831, 1, 'en', 'plugins/real-estate/consult', 'mark_as_unread', 'Mark as unread', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1832, 1, 'en', 'plugins/real-estate/consult', 'new_consult_notice', 'You have <span class=\"bold\">:count</span> New Consults', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1833, 1, 'en', 'plugins/real-estate/consult', 'view_all', 'View all', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1834, 1, 'en', 'plugins/real-estate/consult', 'project', 'Project', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1835, 1, 'en', 'plugins/real-estate/consult', 'property', 'Property', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1836, 1, 'en', 'plugins/real-estate/currency', 'currencies', 'Currencies', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1837, 1, 'en', 'plugins/real-estate/currency', 'setting_description', 'List of currencies using on website', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1838, 1, 'en', 'plugins/real-estate/currency', 'name', 'Name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1839, 1, 'en', 'plugins/real-estate/currency', 'symbol', 'Symbol', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1840, 1, 'en', 'plugins/real-estate/currency', 'number_of_decimals', 'Number of decimals', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1841, 1, 'en', 'plugins/real-estate/currency', 'exchange_rate', 'Exchange rate', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1842, 1, 'en', 'plugins/real-estate/currency', 'is_prefix_symbol', 'Position of symbol', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1843, 1, 'en', 'plugins/real-estate/currency', 'is_default', 'Is default?', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1844, 1, 'en', 'plugins/real-estate/currency', 'remove', 'Remove', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1845, 1, 'en', 'plugins/real-estate/currency', 'new_currency', 'Add a new currency', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1846, 1, 'en', 'plugins/real-estate/currency', 'save_settings', 'Save settings', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1847, 1, 'en', 'plugins/real-estate/currency', 'before_number', 'Before number', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1848, 1, 'en', 'plugins/real-estate/currency', 'after_number', 'After number', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1849, 1, 'en', 'plugins/real-estate/currency', 'require_at_least_one_currency', 'The system requires at least one currency!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1850, 1, 'en', 'plugins/real-estate/currency', 'enable_auto_detect_visitor_currency', 'Enable auto-detect visitor currency?', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1851, 1, 'en', 'plugins/real-estate/currency', 'auto_detect_visitor_currency_description', 'It detects visitor currency based on browser language. It will override default currency selection.', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1852, 1, 'en', 'plugins/real-estate/currency', 'add_space_between_price_and_currency', 'Add a space between price and currency?', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1853, 1, 'en', 'plugins/real-estate/currency', 'invalid_currency_name', 'Invalid currency code, it must be in :currencies.', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1854, 1, 'en', 'plugins/real-estate/currency', 'instruction', 'Please check list currency code here: https://en.wikipedia.org/wiki/ISO_4217', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1855, 1, 'en', 'plugins/real-estate/currency', 'code', 'Code', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1856, 1, 'en', 'plugins/real-estate/custom-fields', 'name', 'Custom Fields', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1857, 1, 'en', 'plugins/real-estate/custom-fields', 'create', 'Create', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1858, 1, 'en', 'plugins/real-estate/custom-fields', 'edit', 'Edit :name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1859, 1, 'en', 'plugins/real-estate/custom-fields', 'type', 'Type', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1860, 1, 'en', 'plugins/real-estate/custom-fields', 'options', 'Options', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1861, 1, 'en', 'plugins/real-estate/custom-fields', 'option.label', 'Label', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1862, 1, 'en', 'plugins/real-estate/custom-fields', 'option.value', 'Value', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1863, 1, 'en', 'plugins/real-estate/custom-fields', 'option.add_row', 'Add new row', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1864, 1, 'en', 'plugins/real-estate/custom-fields', 'option.add_from_global', 'Add global custom field', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1865, 1, 'en', 'plugins/real-estate/custom-fields', 'modal.heading', 'Add new custom field', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1866, 1, 'en', 'plugins/real-estate/custom-fields', 'modal.select_field', 'Select field', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1867, 1, 'en', 'plugins/real-estate/custom-fields', 'modal.button', 'Add new', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1868, 1, 'en', 'plugins/real-estate/custom-fields', 'enums.fields.text', 'Text', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1869, 1, 'en', 'plugins/real-estate/custom-fields', 'enums.fields.dropdown', 'Dropdown', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1870, 1, 'en', 'plugins/real-estate/custom-fields', 'ask_for_select', 'Please select a custom field', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1871, 1, 'en', 'plugins/real-estate/custom-fields', 'add_a_new_custom_field', 'Add a new custom field', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1872, 1, 'en', 'plugins/real-estate/dashboard', 'joined_on', 'Joined :date', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1873, 1, 'en', 'plugins/real-estate/dashboard', 'dob', 'Born :date', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1874, 1, 'en', 'plugins/real-estate/dashboard', 'email', 'Email', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1875, 1, 'en', 'plugins/real-estate/dashboard', 'username', 'Username', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1876, 1, 'en', 'plugins/real-estate/dashboard', 'email_or_username', 'Email/Username', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1877, 1, 'en', 'plugins/real-estate/dashboard', 'password', 'Password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1878, 1, 'en', 'plugins/real-estate/dashboard', 'password-confirmation', 'Confirm Password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1879, 1, 'en', 'plugins/real-estate/dashboard', 'remember-me', 'Remember Me', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1880, 1, 'en', 'plugins/real-estate/dashboard', 'login-title', 'Login', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1881, 1, 'en', 'plugins/real-estate/dashboard', 'login-cta', 'Login', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1882, 1, 'en', 'plugins/real-estate/dashboard', 'register-title', 'Register', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1883, 1, 'en', 'plugins/real-estate/dashboard', 'register-cta', 'Register', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1884, 1, 'en', 'plugins/real-estate/dashboard', 'forgot-password-cta', 'Forgot Your Password?', '2023-07-18 23:45:32', '2023-07-18 23:45:32');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1885, 1, 'en', 'plugins/real-estate/dashboard', 'name', 'Name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1886, 1, 'en', 'plugins/real-estate/dashboard', 'reset-password-title', 'Reset Password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1887, 1, 'en', 'plugins/real-estate/dashboard', 'reset-password-cta', 'Reset Password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1888, 1, 'en', 'plugins/real-estate/dashboard', 'cancel-link', 'Cancel', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1889, 1, 'en', 'plugins/real-estate/dashboard', 'logout-cta', 'Logout', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1890, 1, 'en', 'plugins/real-estate/dashboard', 'header_profile_link', 'Profile', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1891, 1, 'en', 'plugins/real-estate/dashboard', 'header_settings_link', 'Settings', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1892, 1, 'en', 'plugins/real-estate/dashboard', 'header_logout_link', 'Logout', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1893, 1, 'en', 'plugins/real-estate/dashboard', 'unknown_state', 'Unknown', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1894, 1, 'en', 'plugins/real-estate/dashboard', 'close', 'Close', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1895, 1, 'en', 'plugins/real-estate/dashboard', 'save', 'Save', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1896, 1, 'en', 'plugins/real-estate/dashboard', 'loading', 'Loading...', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1897, 1, 'en', 'plugins/real-estate/dashboard', 'new_image', 'New image', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1898, 1, 'en', 'plugins/real-estate/dashboard', 'change_profile_image', 'Change avatar', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1899, 1, 'en', 'plugins/real-estate/dashboard', 'save_cropped_image_failed', 'Save cropped image failed!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1900, 1, 'en', 'plugins/real-estate/dashboard', 'failed_to_crop_image', 'Failed to crop image', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1901, 1, 'en', 'plugins/real-estate/dashboard', 'failed_to_load_data', 'Failed to load data', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1902, 1, 'en', 'plugins/real-estate/dashboard', 'read_image_failed', 'Read image failed', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1903, 1, 'en', 'plugins/real-estate/dashboard', 'update_avatar_success', 'Update avatar successfully!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1904, 1, 'en', 'plugins/real-estate/dashboard', 'change_avatar_description', 'Click on image to change avatar', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1905, 1, 'en', 'plugins/real-estate/dashboard', 'notices.error', 'Error!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1906, 1, 'en', 'plugins/real-estate/dashboard', 'notices.success', 'Success!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1907, 1, 'en', 'plugins/real-estate/dashboard', 'sidebar_title', 'Personal settings', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1908, 1, 'en', 'plugins/real-estate/dashboard', 'sidebar_information', 'Account Information', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1909, 1, 'en', 'plugins/real-estate/dashboard', 'sidebar_security', 'Security', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1910, 1, 'en', 'plugins/real-estate/dashboard', 'sidebar_packages', 'Packages', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1911, 1, 'en', 'plugins/real-estate/dashboard', 'sidebar_transactions', 'Transactions', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1912, 1, 'en', 'plugins/real-estate/dashboard', 'account_field_title', 'Account Information', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1913, 1, 'en', 'plugins/real-estate/dashboard', 'profile-picture', 'Profile picture', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1914, 1, 'en', 'plugins/real-estate/dashboard', 'uploading', 'Uploading...', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1915, 1, 'en', 'plugins/real-estate/dashboard', 'company', 'Company Name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1916, 1, 'en', 'plugins/real-estate/dashboard', 'phone', 'Phone', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1917, 1, 'en', 'plugins/real-estate/dashboard', 'first_name', 'First name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1918, 1, 'en', 'plugins/real-estate/dashboard', 'last_name', 'Last name', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1919, 1, 'en', 'plugins/real-estate/dashboard', 'description', 'Short description', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1920, 1, 'en', 'plugins/real-estate/dashboard', 'description_placeholder', 'Tell something about yourself...', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1921, 1, 'en', 'plugins/real-estate/dashboard', 'verified', 'Verified', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1922, 1, 'en', 'plugins/real-estate/dashboard', 'verify_require_desc', 'Please verify email by link we sent to you.', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1923, 1, 'en', 'plugins/real-estate/dashboard', 'birthday', 'Birthday', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1924, 1, 'en', 'plugins/real-estate/dashboard', 'year_lc', 'year', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1925, 1, 'en', 'plugins/real-estate/dashboard', 'month_lc', 'month', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1926, 1, 'en', 'plugins/real-estate/dashboard', 'day_lc', 'day', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1927, 1, 'en', 'plugins/real-estate/dashboard', 'gender', 'Gender', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1928, 1, 'en', 'plugins/real-estate/dashboard', 'gender_male', 'Male', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1929, 1, 'en', 'plugins/real-estate/dashboard', 'gender_female', 'Female', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1930, 1, 'en', 'plugins/real-estate/dashboard', 'gender_other', 'Other', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1931, 1, 'en', 'plugins/real-estate/dashboard', 'security_title', 'Security', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1932, 1, 'en', 'plugins/real-estate/dashboard', 'packages_title', 'Packages', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1933, 1, 'en', 'plugins/real-estate/dashboard', 'transactions_title', 'Transactions', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1934, 1, 'en', 'plugins/real-estate/dashboard', 'current_password', 'Current password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1935, 1, 'en', 'plugins/real-estate/dashboard', 'password_new', 'New password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1936, 1, 'en', 'plugins/real-estate/dashboard', 'password_new_confirmation', 'Confirmation password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1937, 1, 'en', 'plugins/real-estate/dashboard', 'password_update_btn', 'Update password', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1938, 1, 'en', 'plugins/real-estate/dashboard', 'activity_logs', 'Activity Logs', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1939, 1, 'en', 'plugins/real-estate/dashboard', 'oops', 'Oops!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1940, 1, 'en', 'plugins/real-estate/dashboard', 'no_activity_logs', 'You have no activity logs yet', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1941, 1, 'en', 'plugins/real-estate/dashboard', 'actions.create_property', 'You have created property \":name\"', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1942, 1, 'en', 'plugins/real-estate/dashboard', 'actions.update_property', 'You have updated property \":name\"', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1943, 1, 'en', 'plugins/real-estate/dashboard', 'actions.delete_property', 'You have deleted property \":name\"', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1944, 1, 'en', 'plugins/real-estate/dashboard', 'actions.update_setting', 'You have updated your settings', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1945, 1, 'en', 'plugins/real-estate/dashboard', 'actions.update_security', 'You have updated your security settings', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1946, 1, 'en', 'plugins/real-estate/dashboard', 'actions.your_property_updated_by_admin', 'Your property \":name\" is updated by administrator', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1947, 1, 'en', 'plugins/real-estate/dashboard', 'actions.changed_avatar', 'You have changed your avatar', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1948, 1, 'en', 'plugins/real-estate/dashboard', 'load_more', 'Load more', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1949, 1, 'en', 'plugins/real-estate/dashboard', 'loading_more', 'Loading...', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1950, 1, 'en', 'plugins/real-estate/dashboard', 'back-to-login', 'Back to login page', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1951, 1, 'en', 'plugins/real-estate/dashboard', 'no_transactions', 'No transactions', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1952, 1, 'en', 'plugins/real-estate/dashboard', 'approved_properties', 'Approved properties', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1953, 1, 'en', 'plugins/real-estate/dashboard', 'pending_approve_properties', 'Pending approve properties', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1954, 1, 'en', 'plugins/real-estate/dashboard', 'rejected_properties', 'Rejected properties', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1955, 1, 'en', 'plugins/real-estate/dashboard', 'your_credits', 'Your Credits', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1956, 1, 'en', 'plugins/real-estate/dashboard', 'credits', 'credits', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1957, 1, 'en', 'plugins/real-estate/dashboard', 'per_post', 'per post', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1958, 1, 'en', 'plugins/real-estate/dashboard', 'free', 'Free', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1959, 1, 'en', 'plugins/real-estate/dashboard', 'posts', 'post(s)', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1960, 1, 'en', 'plugins/real-estate/dashboard', 'total', 'Total', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1961, 1, 'en', 'plugins/real-estate/dashboard', 'purchase', 'Purchase', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1962, 1, 'en', 'plugins/real-estate/dashboard', 'select_facility', 'Select facility', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1963, 1, 'en', 'plugins/real-estate/dashboard', 'distance', 'Distance (E.g: 200m, 1km...)', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1964, 1, 'en', 'plugins/real-estate/dashboard', 'add_new', 'Add new', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1965, 1, 'en', 'plugins/real-estate/dashboard', 'resend', 'Resend', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1966, 1, 'en', 'plugins/real-estate/dashboard', 'error', 'Error!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1967, 1, 'en', 'plugins/real-estate/dashboard', 'success', 'Success!', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1968, 1, 'en', 'plugins/real-estate/dashboard', 'country', 'Country', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1969, 1, 'en', 'plugins/real-estate/dashboard', 'state', 'State', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1970, 1, 'en', 'plugins/real-estate/dashboard', 'city', 'City', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1971, 1, 'en', 'plugins/real-estate/dashboard', 'sidebar_invoices', 'Invoices', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1972, 1, 'en', 'plugins/real-estate/dashboard', 'number_posts_free', 'Free :posts post(s)', '2023-07-18 23:45:32', '2023-07-18 23:45:32'),
(1973, 1, 'en', 'plugins/real-estate/dashboard', 'total_package_price', ':total Total (Save :percent%)', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1974, 1, 'en', 'plugins/real-estate/export', 'properties.name', 'Export Properties', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1975, 1, 'en', 'plugins/real-estate/export', 'properties.total_properties', 'Total Properties', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1976, 1, 'en', 'plugins/real-estate/export', 'projects.name', 'Export Projects', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1977, 1, 'en', 'plugins/real-estate/export', 'projects.total_projects', 'Total Projects', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1978, 1, 'en', 'plugins/real-estate/export', 'start_export', 'Start Export', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1979, 1, 'en', 'plugins/real-estate/export', 'exporting', 'Exporting...', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1980, 1, 'en', 'plugins/real-estate/facility', 'name', 'Facilities', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1981, 1, 'en', 'plugins/real-estate/facility', 'create', 'New facility', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1982, 1, 'en', 'plugins/real-estate/facility', 'edit', 'Edit facility', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1983, 1, 'en', 'plugins/real-estate/feature', 'name', 'Features', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1984, 1, 'en', 'plugins/real-estate/feature', 'create', 'New feature', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1985, 1, 'en', 'plugins/real-estate/feature', 'edit', 'Edit feature', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1986, 1, 'en', 'plugins/real-estate/feature', 'messages.request.name_required', 'Name is required', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1987, 1, 'en', 'plugins/real-estate/feature', 'form.help_block', 'Property feature information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1988, 1, 'en', 'plugins/real-estate/feature', 'form.name', 'Title', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1989, 1, 'en', 'plugins/real-estate/feature', 'form.icon', 'Icon', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1990, 1, 'en', 'plugins/real-estate/import', 'choose_file', 'Choose file', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1991, 1, 'en', 'plugins/real-estate/import', 'choose_file_description', 'Choose file with mimes: :types.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1992, 1, 'en', 'plugins/real-estate/import', 'import_success_message', 'Imported successfully.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1993, 1, 'en', 'plugins/real-estate/import', 'import_failed_message', 'Import failed, please check the errors below!', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1994, 1, 'en', 'plugins/real-estate/import', 'row', 'Row', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1995, 1, 'en', 'plugins/real-estate/import', 'attribute', 'Attribute', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1996, 1, 'en', 'plugins/real-estate/import', 'errors', 'Errors', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1997, 1, 'en', 'plugins/real-estate/import', 'failures', 'Failures', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1998, 1, 'en', 'plugins/real-estate/import', 'results', 'Result: :success success(es), :failed failure(s)', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(1999, 1, 'en', 'plugins/real-estate/import', 'rules', 'Rules', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2000, 1, 'en', 'plugins/real-estate/import', 'column', 'Column', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2001, 1, 'en', 'plugins/real-estate/import', 'template', 'Sample template', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2002, 1, 'en', 'plugins/real-estate/import', 'download_csv_file', 'Download CSV file', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2003, 1, 'en', 'plugins/real-estate/import', 'download_excel_file', 'Download Excel file', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2004, 1, 'en', 'plugins/real-estate/import', 'downloading', 'Downloading', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2005, 1, 'en', 'plugins/real-estate/investor', 'name', 'Investors', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2006, 1, 'en', 'plugins/real-estate/investor', 'create', 'New investor', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2007, 1, 'en', 'plugins/real-estate/investor', 'edit', 'Edit investor', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2008, 1, 'en', 'plugins/real-estate/invoice', 'name', 'Invoices', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2009, 1, 'en', 'plugins/real-estate/invoice', 'amount', 'Amount', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2010, 1, 'en', 'plugins/real-estate/invoice', 'code', 'Code', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2011, 1, 'en', 'plugins/real-estate/invoice', 'show', 'Invoice :code', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2012, 1, 'en', 'plugins/real-estate/invoice', 'print', 'Print Invoice', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2013, 1, 'en', 'plugins/real-estate/invoice', 'download', 'Download Invoice', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2014, 1, 'en', 'plugins/real-estate/invoice', 'heading', 'Invoice', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2015, 1, 'en', 'plugins/real-estate/invoice', 'purchase_at', 'Purchase at', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2016, 1, 'en', 'plugins/real-estate/invoice', 'sub_total', 'Sub total', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2017, 1, 'en', 'plugins/real-estate/invoice', 'tax_amount', 'Tax amount', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2018, 1, 'en', 'plugins/real-estate/invoice', 'discount_amount', 'Discount amount', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2019, 1, 'en', 'plugins/real-estate/invoice', 'total_amount', 'Total amount', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2020, 1, 'en', 'plugins/real-estate/invoice', 'status', 'Status', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2021, 1, 'en', 'plugins/real-estate/invoice', 'account', 'Account', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2022, 1, 'en', 'plugins/real-estate/invoice', 'payment_info', 'Payment Information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2023, 1, 'en', 'plugins/real-estate/invoice', 'payment_method', 'Payment method', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2024, 1, 'en', 'plugins/real-estate/invoice', 'payment_status', 'Payment status', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2025, 1, 'en', 'plugins/real-estate/invoice', 'item.name', 'Name', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2026, 1, 'en', 'plugins/real-estate/invoice', 'item.qty', 'Quantity', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2027, 1, 'en', 'plugins/real-estate/invoice', 'item.description', 'Description', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2028, 1, 'en', 'plugins/real-estate/invoice', 'statuses.pending', 'Pending', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2029, 1, 'en', 'plugins/real-estate/invoice', 'statuses.processing', 'Processing', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2030, 1, 'en', 'plugins/real-estate/invoice', 'statuses.completed', 'Completed', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2031, 1, 'en', 'plugins/real-estate/invoice', 'statuses.canceled', 'Canceled', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2032, 1, 'en', 'plugins/real-estate/invoice', 'template.name', 'Invoice Template', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2033, 1, 'en', 'plugins/real-estate/invoice', 'template.setting', 'Invoice Settings', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2034, 1, 'en', 'plugins/real-estate/invoice', 'template.setting_description', 'Settings for Invoice template', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2035, 1, 'en', 'plugins/real-estate/invoice', 'template.setting_content', 'Content', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2036, 1, 'en', 'plugins/real-estate/invoice', 'template.preview', 'Preview', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2037, 1, 'en', 'plugins/real-estate/invoice', 'template.preview_heading', 'Preview Invoice template', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2038, 1, 'en', 'plugins/real-estate/package', 'name', 'Packages', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2039, 1, 'en', 'plugins/real-estate/package', 'create', 'New package', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2040, 1, 'en', 'plugins/real-estate/package', 'edit', 'Edit package', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2041, 1, 'en', 'plugins/real-estate/package', 'price', 'Price', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2042, 1, 'en', 'plugins/real-estate/package', 'currency', 'Currency', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2043, 1, 'en', 'plugins/real-estate/package', 'percent_save', 'Percent save', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2044, 1, 'en', 'plugins/real-estate/package', 'number_of_listings', 'Number of listings', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2045, 1, 'en', 'plugins/real-estate/package', 'add_credit_success', 'Add credit successfully!', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2046, 1, 'en', 'plugins/real-estate/package', 'setup_payment_methods', 'Please setup payment methods (PayPal, Stripe, COD, Bank transfer)', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2047, 1, 'en', 'plugins/real-estate/package', 'add_credit_warning', 'Please add your credit to create your own posts here:', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2048, 1, 'en', 'plugins/real-estate/package', 'add_credit', 'Add credit', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2049, 1, 'en', 'plugins/real-estate/package', 'account_limit', 'Limit purchase by account', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2050, 1, 'en', 'plugins/real-estate/package', 'account_limit_placeholder', 'An account can purchase x times', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2051, 1, 'en', 'plugins/real-estate/package', 'subscribe_package', 'Subscribe package', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2052, 1, 'en', 'plugins/real-estate/package', 'add_credit_alert', 'Please add your credit to create your own posts.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2053, 1, 'en', 'plugins/real-estate/project', 'name', 'Projects', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2054, 1, 'en', 'plugins/real-estate/project', 'create', 'New project', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2055, 1, 'en', 'plugins/real-estate/project', 'edit', 'Edit project', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2056, 1, 'en', 'plugins/real-estate/project', 'form.general_info', 'General information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2057, 1, 'en', 'plugins/real-estate/project', 'form.name', 'Name', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2058, 1, 'en', 'plugins/real-estate/project', 'form.description', 'Description', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2059, 1, 'en', 'plugins/real-estate/project', 'form.basic_info', 'Basic information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2060, 1, 'en', 'plugins/real-estate/project', 'form.location', 'Location', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2061, 1, 'en', 'plugins/real-estate/project', 'form.investor', 'Investor', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2062, 1, 'en', 'plugins/real-estate/project', 'form.number_block', 'Number blocks', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2063, 1, 'en', 'plugins/real-estate/project', 'form.number_floor', 'Number floors', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2064, 1, 'en', 'plugins/real-estate/project', 'form.number_flat', 'Number flats', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2065, 1, 'en', 'plugins/real-estate/project', 'form.date_finish', 'Finish date', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2066, 1, 'en', 'plugins/real-estate/project', 'form.date_sell', 'Open sell date', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2067, 1, 'en', 'plugins/real-estate/project', 'form.images', 'Images', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2068, 1, 'en', 'plugins/real-estate/project', 'form.price_from', 'Lowest price', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2069, 1, 'en', 'plugins/real-estate/project', 'form.price_to', 'Max price', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2070, 1, 'en', 'plugins/real-estate/project', 'form.currency', 'Currency', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2071, 1, 'en', 'plugins/real-estate/project', 'form.city', 'City', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2072, 1, 'en', 'plugins/real-estate/project', 'form.category', 'Category', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2073, 1, 'en', 'plugins/real-estate/project', 'form.latitude', 'Latitude', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2074, 1, 'en', 'plugins/real-estate/project', 'form.latitude_helper', 'Go here to get Latitude from address.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2075, 1, 'en', 'plugins/real-estate/project', 'form.longitude', 'Longitude', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2076, 1, 'en', 'plugins/real-estate/project', 'form.longitude_helper', 'Go here to get Longitude from address.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2077, 1, 'en', 'plugins/real-estate/project', 'form.categories', 'Categories', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2078, 1, 'en', 'plugins/real-estate/project', 'statuses.not_available', 'Not available', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2079, 1, 'en', 'plugins/real-estate/project', 'statuses.pre_sale', 'Preparing selling', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2080, 1, 'en', 'plugins/real-estate/project', 'statuses.selling', 'Selling', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2081, 1, 'en', 'plugins/real-estate/project', 'statuses.sold', 'Sold', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2082, 1, 'en', 'plugins/real-estate/project', 'statuses.building', 'Building', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2083, 1, 'en', 'plugins/real-estate/project', 'distance_key', 'Distance key between facilities', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2084, 1, 'en', 'plugins/real-estate/project', 'select_investor', 'Select an investor...', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2085, 1, 'en', 'plugins/real-estate/project', 'import_projects', 'Import Projects', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2086, 1, 'en', 'plugins/real-estate/project', 'export_projects', 'Export Projects', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2087, 1, 'en', 'plugins/real-estate/project', 'views', 'Views', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2088, 1, 'en', 'plugins/real-estate/project', 'unique_id', 'Unique ID', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2089, 1, 'en', 'plugins/real-estate/property', 'name', 'Properties', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2090, 1, 'en', 'plugins/real-estate/property', 'create', 'New property', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2091, 1, 'en', 'plugins/real-estate/property', 'edit', 'Edit property', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2092, 1, 'en', 'plugins/real-estate/property', 'form.main_info', 'General information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2093, 1, 'en', 'plugins/real-estate/property', 'form.basic_info', 'Basic information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2094, 1, 'en', 'plugins/real-estate/property', 'form.name', 'Title', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2095, 1, 'en', 'plugins/real-estate/property', 'form.type', 'Type', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2096, 1, 'en', 'plugins/real-estate/property', 'form.images', 'Images', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2097, 1, 'en', 'plugins/real-estate/property', 'form.location', 'Property location', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2098, 1, 'en', 'plugins/real-estate/property', 'form.number_bedroom', 'Number bedrooms', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2099, 1, 'en', 'plugins/real-estate/property', 'form.number_bathroom', 'Number bathrooms', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2100, 1, 'en', 'plugins/real-estate/property', 'form.number_floor', 'Number floors', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2101, 1, 'en', 'plugins/real-estate/property', 'form.square', 'Square :unit', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2102, 1, 'en', 'plugins/real-estate/property', 'form.price', 'Price', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2103, 1, 'en', 'plugins/real-estate/property', 'form.features', 'Features', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2104, 1, 'en', 'plugins/real-estate/property', 'form.project', 'Project', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2105, 1, 'en', 'plugins/real-estate/property', 'form.date', 'Date information', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2106, 1, 'en', 'plugins/real-estate/property', 'form.currency', 'Currency', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2107, 1, 'en', 'plugins/real-estate/property', 'form.city', 'City', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2108, 1, 'en', 'plugins/real-estate/property', 'form.period', 'Period', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2109, 1, 'en', 'plugins/real-estate/property', 'form.category', 'Category', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2110, 1, 'en', 'plugins/real-estate/property', 'form.latitude', 'Latitude', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2111, 1, 'en', 'plugins/real-estate/property', 'form.latitude_helper', 'Go here to get Latitude from address.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2112, 1, 'en', 'plugins/real-estate/property', 'form.longitude', 'Longitude', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2113, 1, 'en', 'plugins/real-estate/property', 'form.longitude_helper', 'Go here to get Longitude from address.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2114, 1, 'en', 'plugins/real-estate/property', 'form.categories', 'Categories', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2115, 1, 'en', 'plugins/real-estate/property', 'form.images_upload_placeholder', 'Drop files here or click to upload.', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2116, 1, 'en', 'plugins/real-estate/property', 'statuses.not_available', 'Not available', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2117, 1, 'en', 'plugins/real-estate/property', 'statuses.pre_sale', 'Preparing selling', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2118, 1, 'en', 'plugins/real-estate/property', 'statuses.selling', 'Selling', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2119, 1, 'en', 'plugins/real-estate/property', 'statuses.sold', 'Sold', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2120, 1, 'en', 'plugins/real-estate/property', 'statuses.renting', 'Renting', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2121, 1, 'en', 'plugins/real-estate/property', 'statuses.rented', 'Rented', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2122, 1, 'en', 'plugins/real-estate/property', 'statuses.building', 'Building', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2123, 1, 'en', 'plugins/real-estate/property', 'types.sale', 'Sale', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2124, 1, 'en', 'plugins/real-estate/property', 'types.rent', 'Rent', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2125, 1, 'en', 'plugins/real-estate/property', 'periods.day', 'Day', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2126, 1, 'en', 'plugins/real-estate/property', 'periods.month', 'Month', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2127, 1, 'en', 'plugins/real-estate/property', 'periods.year', 'Year', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2128, 1, 'en', 'plugins/real-estate/property', 'moderation_status', 'Moderation status', '2023-07-18 23:45:33', '2023-07-18 23:45:33'),
(2129, 1, 'en', 'plugins/real-estate/property', 'moderation-statuses.pending', 'Pending', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2130, 1, 'en', 'plugins/real-estate/property', 'moderation-statuses.approved', 'Approved', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2131, 1, 'en', 'plugins/real-estate/property', 'moderation-statuses.rejected', 'Rejected', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2132, 1, 'en', 'plugins/real-estate/property', 'renew_notice', 'Renew automatically (you will be charged again in :days days)?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2133, 1, 'en', 'plugins/real-estate/property', 'distance_key', 'Distance key between facilities', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2134, 1, 'en', 'plugins/real-estate/property', 'never_expired', 'Never expired?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2135, 1, 'en', 'plugins/real-estate/property', 'select_project', 'Select a project...', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2136, 1, 'en', 'plugins/real-estate/property', 'account', 'Account', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2137, 1, 'en', 'plugins/real-estate/property', 'select_account', 'Select an account..', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2138, 1, 'en', 'plugins/real-estate/property', 'expire_date', 'Expire date', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2139, 1, 'en', 'plugins/real-estate/property', 'never_expired_label', 'Never expired', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2140, 1, 'en', 'plugins/real-estate/property', 'active_properties', 'Active properties', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2141, 1, 'en', 'plugins/real-estate/property', 'pending_properties', 'Pending properties', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2142, 1, 'en', 'plugins/real-estate/property', 'expired_properties', 'Expired properties', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2143, 1, 'en', 'plugins/real-estate/property', 'import_properties', 'Import Properties', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2144, 1, 'en', 'plugins/real-estate/property', 'export_properties', 'Export Properties', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2145, 1, 'en', 'plugins/real-estate/property', 'duplicate_property_successfully', 'Duplicated property successfully!', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2146, 1, 'en', 'plugins/real-estate/property', 'duplicate', 'Duplicate', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2147, 1, 'en', 'plugins/real-estate/property', 'views', 'Views', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2148, 1, 'en', 'plugins/real-estate/property', 'unique_id', 'Unique ID', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2149, 1, 'en', 'plugins/real-estate/real-estate', 'name', 'Real Estate', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2150, 1, 'en', 'plugins/real-estate/real-estate', 'settings', 'Settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2151, 1, 'en', 'plugins/real-estate/review', 'name', 'Reviews', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2152, 1, 'en', 'plugins/real-estate/review', 'author', 'Author', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2153, 1, 'en', 'plugins/real-estate/review', 'star', 'Star', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2154, 1, 'en', 'plugins/real-estate/review', 'content', 'Content', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2155, 1, 'en', 'plugins/real-estate/review', 'reviewable', 'Reviewable', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2156, 1, 'en', 'plugins/real-estate/review', 'moderation-statuses.pending', 'Pending', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2157, 1, 'en', 'plugins/real-estate/review', 'moderation-statuses.approved', 'Approved', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2158, 1, 'en', 'plugins/real-estate/review', 'moderation-statuses.rejected', 'Rejected', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2159, 1, 'en', 'plugins/real-estate/settings', 'title', 'Accounts', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2160, 1, 'en', 'plugins/real-estate/settings', 'description', 'Settings for members', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2161, 1, 'en', 'plugins/real-estate/settings', 'verify_account_email', 'Verify account\'s email?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2162, 1, 'en', 'plugins/real-estate/settings', 'square_unit', 'Unit of square', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2163, 1, 'en', 'plugins/real-estate/settings', 'square_unit_none', 'None', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2164, 1, 'en', 'plugins/real-estate/settings', 'square_unit_meter', 'Square Meter(m²)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2165, 1, 'en', 'plugins/real-estate/settings', 'square_unit_feet', 'Square Feet(ft2)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2166, 1, 'en', 'plugins/real-estate/settings', 'square_unit_yard', 'Square Yard (yd2)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2167, 1, 'en', 'plugins/real-estate/settings', 'general', 'General settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2168, 1, 'en', 'plugins/real-estate/settings', 'general_description', 'Basic settings for Real Estate', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2169, 1, 'en', 'plugins/real-estate/settings', 'real_estate_convert_money_to_text_enabled', 'Convert money to text if it is too big?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2170, 1, 'en', 'plugins/real-estate/settings', 'thousands_separator', 'Thousands separator', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2171, 1, 'en', 'plugins/real-estate/settings', 'decimal_separator', 'Decimal separator', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2172, 1, 'en', 'plugins/real-estate/settings', 'separator_period', 'Period (.)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2173, 1, 'en', 'plugins/real-estate/settings', 'separator_comma', 'Comma (,)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2174, 1, 'en', 'plugins/real-estate/settings', 'separator_space', 'Space ( )', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2175, 1, 'en', 'plugins/real-estate/settings', 'real_estate_enabled_register', 'Allow visitors to register account?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2176, 1, 'en', 'plugins/real-estate/settings', 'real_estate_enabled_login', 'Allow visitors to login?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2177, 1, 'en', 'plugins/real-estate/settings', 'email.title', 'Real Estate', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2178, 1, 'en', 'plugins/real-estate/settings', 'email.description', 'Real estate email configuration', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2179, 1, 'en', 'plugins/real-estate/settings', 'property_expired_after_days', 'Property Expired Time (days)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2180, 1, 'en', 'plugins/real-estate/settings', 'enable_post_approval', 'Enable post approval?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2181, 1, 'en', 'plugins/real-estate/settings', 'enable_credits_system', 'Enable credits system (agents need to buy credits to post their properties)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2182, 1, 'en', 'plugins/real-estate/settings', 'display_views_count_in_detail_page', 'Display views count in the detail page?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2183, 1, 'en', 'plugins/real-estate/settings', 'enable_recaptcha_in_register_page', 'Enable Recaptcha in the registration page?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2184, 1, 'en', 'plugins/real-estate/settings', 'enable_recaptcha_in_register_page_description', 'Need to setup Captcha in Admin -> Settings -> General first.', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2185, 1, 'en', 'plugins/real-estate/settings', 'hide_properties_in_statuses', 'Hide property if its status is:', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2186, 1, 'en', 'plugins/real-estate/settings', 'hide_projects_in_statuses', 'Hide project if its status is:', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2187, 1, 'en', 'plugins/real-estate/settings', 'add_space_between_price_and_currency', 'Add a space between price and currency?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2188, 1, 'en', 'plugins/real-estate/settings', 'enable_wishlist', 'Enable wishlist?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2189, 1, 'en', 'plugins/real-estate/settings', 'enable_review_feature', 'Enable review?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2190, 1, 'en', 'plugins/real-estate/settings', 'reviews_per_page', 'Number of reviews per page?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2191, 1, 'en', 'plugins/real-estate/settings', 'hide_agency_phone', 'Hide agency\'s phone number?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2192, 1, 'en', 'plugins/real-estate/settings', 'hide_agency_email', 'Hide agency\'s email address?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2193, 1, 'en', 'plugins/real-estate/settings', 'invoicing.company_name', 'Company name', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2194, 1, 'en', 'plugins/real-estate/settings', 'invoicing.company_address', 'Company address', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2195, 1, 'en', 'plugins/real-estate/settings', 'invoicing.company_email', 'Company email', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2196, 1, 'en', 'plugins/real-estate/settings', 'invoicing.company_phone', 'Company phone', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2197, 1, 'en', 'plugins/real-estate/settings', 'invoicing.company_logo', 'Company logo', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2198, 1, 'en', 'plugins/real-estate/settings', 'using_custom_font_for_invoice', 'Using custom font for invoice?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2199, 1, 'en', 'plugins/real-estate/settings', 'invoice_font_family', 'Invoice font family (Only work for Latin language)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2200, 1, 'en', 'plugins/real-estate/settings', 'enable_invoice_stamp', 'Enable invoice stamp?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2201, 1, 'en', 'plugins/real-estate/settings', 'invoice_support_arabic_language', 'Support Arabic language in invoice?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2202, 1, 'en', 'plugins/real-estate/settings', 'invoice_code_prefix', 'Invoice code prefix', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2203, 1, 'en', 'plugins/real-estate/settings', 'invoice_settings', 'Invoice Settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2204, 1, 'en', 'plugins/real-estate/settings', 'invoice_settings_description', 'Settings Invoice information for invoicing', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2205, 1, 'en', 'plugins/real-estate/settings', 'enable_custom_fields', 'Enable custom fields?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2206, 1, 'en', 'plugins/real-estate/settings', 'max_upload_filesize', 'Max upload filesize (MB)', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2207, 1, 'en', 'plugins/real-estate/settings', 'max_upload_filesize_placeholder', 'Default: 10', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2208, 1, 'en', 'plugins/real-estate/settings', 'max_property_images_upload_by_agent', 'Max number of images for each property', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2209, 1, 'en', 'plugins/real-estate/transaction', 'types.add', 'Add', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2210, 1, 'en', 'plugins/real-estate/transaction', 'types.remove', 'Remove', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2211, 1, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2212, 1, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2213, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2214, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2215, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2216, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2217, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2218, 1, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2219, 1, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2220, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2221, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2222, 1, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2223, 1, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2224, 1, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2225, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2226, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2227, 1, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2228, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2229, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2230, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2231, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2232, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2233, 1, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2234, 1, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2235, 1, 'en', 'plugins/testimonial/testimonial', 'name', 'Testimonials', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2236, 1, 'en', 'plugins/testimonial/testimonial', 'create', 'New testimonial', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2237, 1, 'en', 'plugins/testimonial/testimonial', 'company', 'Position/Company', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2238, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2239, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2240, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to lang folder. Please use \"Publish translations\" button to apply changes.', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2241, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2242, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2243, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2244, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2245, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2246, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2247, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2248, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2249, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2250, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2251, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2252, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2253, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2254, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2023-07-18 23:45:34', '2023-07-18 23:45:34');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2255, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Other translations', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2256, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2257, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2258, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2259, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2260, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2261, 1, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2262, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2263, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2264, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2265, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2266, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2267, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2268, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2269, 1, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder :lang_path is not writable. Please chmod to make it writable!', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2270, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2271, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in :lang_path!', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2272, 1, 'en', 'plugins/translation/translation', 'download', 'Download', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2273, 1, 'en', 'plugins/translation/translation', 'select_locale', 'Select locale', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2274, 1, 'en', 'plugins/translation/translation', 'theme_translations_instruction', 'Click on text to translate. Do NOT translate variables, Eg. :username, :query, :link...', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2275, 1, 'en', 'plugins/translation/translation', 'import_available_locale', 'Or import available locale from our GitHub repository', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2276, 1, 'en', 'plugins/translation/translation', 'add_new_locale', 'Add new locale', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2277, 1, 'en', 'plugins/translation/translation', 'download_locale', 'Download locale', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2278, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation', 'Download locale from GitHub', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2279, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation_content', 'Are you sure you want to download this locale? It will be downloaded into :lang_path, you can delete it later if you want.', '2023-07-18 23:45:34', '2023-07-18 23:45:34'),
(2280, 1, 'en', 'plugins/translation/translation', 'is_default', 'Is default?', '2023-07-18 23:45:34', '2023-07-18 23:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'user@user.user', NULL, '$2y$10$MFelFzIp.6d1uGChG12Z.eLoJrLvhAXu27KXH6rK5YMRZjTttD8qC', 'ScloLm7BfwytZJ3yfiKd0YokOEjSxlqgIdTwiRqjVPeIUiVAQhbECBt4wypb', '2023-11-09 17:59:48', '2023-11-09 17:59:48', 'Demo', 'Test', 'user', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint UNSIGNED NOT NULL,
  `widget_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'NewsletterWidget', 'pre_footer', 'hously', 0, '{\"name\":\"Subscribe to Newsletter.\",\"description\":\"Subscribe to get latest updates and information.\",\"title\":null,\"subtitle\":null}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(2, 'SiteInformationWidget', 'footer_menu', 'hously', 1, '{\"name\":\"Site Information\",\"logo\":\"general\\/logo-light.png\",\"url\":\"#\",\"description\":\"A great platform to buy, sell and rent your properties without any agent or commissions.\"}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(3, 'CustomMenuWidget', 'footer_menu', 'hously', 2, '{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(4, 'CustomMenuWidget', 'footer_menu', 'hously', 3, '{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(5, 'ContactInformationWidget', 'footer_menu', 'hously', 4, '{\"name\":\"Contact Details\",\"address\":\"C\\/54 Northwest Freeway, Suite 558, Houston, USA 485\",\"email\":\"contact@example.com\",\"phone\":\"+152 534-468-854\"}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(6, 'BlogSearchWidget', 'blog_sidebar', 'hously', 1, '{\"name\":\"Blog Search\"}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(7, 'BlogPopularCategoriesWidget', 'blog_sidebar', 'hously', 2, '{\"name\":\"Popular Categories\",\"limit\":5}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(8, 'BlogPostsWidget', 'blog_sidebar', 'hously', 3, '{\"name\":\"Popular Posts\",\"type\":\"popular\",\"limit\":5}', '2023-07-18 23:45:17', '2023-07-18 23:45:17'),
(9, 'BlogPopularTagsWidget', 'blog_sidebar', 'hously', 4, '{\"name\":\"Popular Tags\",\"limit\":6}', '2023-07-18 23:45:17', '2023-07-18 23:45:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_slug_unique` (`slug`);

--
-- Indexes for table `cities_translations`
--
ALTER TABLE `cities_translations`
  ADD PRIMARY KEY (`lang_code`,`cities_id`),
  ADD UNIQUE KEY `cities_translations_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries_translations`
--
ALTER TABLE `countries_translations`
  ADD PRIMARY KEY (`lang_code`,`countries_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs_translations`
--
ALTER TABLE `faqs_translations`
  ADD PRIMARY KEY (`lang_code`,`faqs_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories_translations`
--
ALTER TABLE `faq_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`faq_categories_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`),
  ADD KEY `media_files_index` (`folder_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`),
  ADD KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_type` (`reference_type`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_index` (`user_id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `status` (`status`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `author_type` (`author_type`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD KEY `post_categories_category_id_index` (`category_id`),
  ADD KEY `post_categories_post_id_index` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_tag_id_index` (`tag_id`),
  ADD KEY `post_tags_post_id_index` (`post_id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `re_accounts`
--
ALTER TABLE `re_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `re_accounts_email_unique` (`email`),
  ADD UNIQUE KEY `re_accounts_username_unique` (`username`);

--
-- Indexes for table `re_account_activity_logs`
--
ALTER TABLE `re_account_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `re_account_activity_logs_account_id_index` (`account_id`);

--
-- Indexes for table `re_account_packages`
--
ALTER TABLE `re_account_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_account_password_resets`
--
ALTER TABLE `re_account_password_resets`
  ADD KEY `re_account_password_resets_email_index` (`email`),
  ADD KEY `re_account_password_resets_token_index` (`token`);

--
-- Indexes for table `re_categories`
--
ALTER TABLE `re_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_categories_translations`
--
ALTER TABLE `re_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`re_categories_id`);

--
-- Indexes for table `re_consults`
--
ALTER TABLE `re_consults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_currencies`
--
ALTER TABLE `re_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_custom_fields`
--
ALTER TABLE `re_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `re_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`);

--
-- Indexes for table `re_custom_fields_translations`
--
ALTER TABLE `re_custom_fields_translations`
  ADD PRIMARY KEY (`lang_code`,`re_custom_fields_id`);

--
-- Indexes for table `re_custom_field_options`
--
ALTER TABLE `re_custom_field_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_custom_field_options_translations`
--
ALTER TABLE `re_custom_field_options_translations`
  ADD PRIMARY KEY (`lang_code`,`re_custom_field_options_id`);

--
-- Indexes for table `re_custom_field_values`
--
ALTER TABLE `re_custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `re_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `re_custom_field_values_translations`
--
ALTER TABLE `re_custom_field_values_translations`
  ADD PRIMARY KEY (`lang_code`,`re_custom_field_values_id`);

--
-- Indexes for table `re_facilities`
--
ALTER TABLE `re_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_facilities_distances`
--
ALTER TABLE `re_facilities_distances`
  ADD PRIMARY KEY (`facility_id`,`reference_id`);

--
-- Indexes for table `re_facilities_translations`
--
ALTER TABLE `re_facilities_translations`
  ADD PRIMARY KEY (`lang_code`,`re_facilities_id`);

--
-- Indexes for table `re_features`
--
ALTER TABLE `re_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_features_translations`
--
ALTER TABLE `re_features_translations`
  ADD PRIMARY KEY (`lang_code`,`re_features_id`);

--
-- Indexes for table `re_investors`
--
ALTER TABLE `re_investors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_invoices`
--
ALTER TABLE `re_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `re_invoices_code_unique` (`code`),
  ADD KEY `re_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `re_invoices_payment_id_index` (`payment_id`),
  ADD KEY `re_invoices_status_index` (`status`);

--
-- Indexes for table `re_invoice_items`
--
ALTER TABLE `re_invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_packages`
--
ALTER TABLE `re_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_packages_translations`
--
ALTER TABLE `re_packages_translations`
  ADD PRIMARY KEY (`lang_code`,`re_packages_id`);

--
-- Indexes for table `re_projects`
--
ALTER TABLE `re_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`);

--
-- Indexes for table `re_projects_translations`
--
ALTER TABLE `re_projects_translations`
  ADD PRIMARY KEY (`lang_code`,`re_projects_id`);

--
-- Indexes for table `re_project_categories`
--
ALTER TABLE `re_project_categories`
  ADD PRIMARY KEY (`project_id`,`category_id`);

--
-- Indexes for table `re_properties`
--
ALTER TABLE `re_properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`);

--
-- Indexes for table `re_properties_translations`
--
ALTER TABLE `re_properties_translations`
  ADD PRIMARY KEY (`lang_code`,`re_properties_id`);

--
-- Indexes for table `re_property_categories`
--
ALTER TABLE `re_property_categories`
  ADD PRIMARY KEY (`property_id`,`category_id`);

--
-- Indexes for table `re_reviews`
--
ALTER TABLE `re_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  ADD KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slugs_reference_id_index` (`reference_id`);

--
-- Indexes for table `slugs_translations`
--
ALTER TABLE `slugs_translations`
  ADD PRIMARY KEY (`lang_code`,`slugs_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `states_slug_unique` (`slug`);

--
-- Indexes for table `states_translations`
--
ALTER TABLE `states_translations`
  ADD PRIMARY KEY (`lang_code`,`states_id`),
  ADD UNIQUE KEY `states_translations_slug_unique` (`slug`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials_translations`
--
ALTER TABLE `testimonials_translations`
  ADD PRIMARY KEY (`lang_code`,`testimonials_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_accounts`
--
ALTER TABLE `re_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `re_account_activity_logs`
--
ALTER TABLE `re_account_activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_account_packages`
--
ALTER TABLE `re_account_packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_categories`
--
ALTER TABLE `re_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `re_consults`
--
ALTER TABLE `re_consults`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_currencies`
--
ALTER TABLE `re_currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `re_custom_fields`
--
ALTER TABLE `re_custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_custom_field_options`
--
ALTER TABLE `re_custom_field_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_custom_field_values`
--
ALTER TABLE `re_custom_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_facilities`
--
ALTER TABLE `re_facilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `re_features`
--
ALTER TABLE `re_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `re_investors`
--
ALTER TABLE `re_investors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `re_invoices`
--
ALTER TABLE `re_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_invoice_items`
--
ALTER TABLE `re_invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_packages`
--
ALTER TABLE `re_packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `re_projects`
--
ALTER TABLE `re_projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `re_properties`
--
ALTER TABLE `re_properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `re_reviews`
--
ALTER TABLE `re_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2281;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
