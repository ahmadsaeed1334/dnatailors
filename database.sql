-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table second.admin_orders
CREATE TABLE IF NOT EXISTS `admin_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.admin_orders: ~0 rows (approximately)

-- Dumping structure for table second.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.carts: ~0 rows (approximately)

-- Dumping structure for table second.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_order_id_foreign` (`order_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  CONSTRAINT `cart_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.cart_items: ~0 rows (approximately)

-- Dumping structure for table second.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_post_id_foreign` (`post_id`),
  CONSTRAINT `categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.categories: ~0 rows (approximately)

-- Dumping structure for table second.categorie_post
CREATE TABLE IF NOT EXISTS `categorie_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_post_categorie_id_foreign` (`categorie_id`),
  KEY `categorie_post_post_id_foreign` (`post_id`),
  CONSTRAINT `categorie_post_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorie_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.categorie_post: ~0 rows (approximately)

-- Dumping structure for table second.category_post
CREATE TABLE IF NOT EXISTS `category_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_post_category_id_foreign` (`category_id`),
  KEY `category_post_post_id_foreign` (`post_id`),
  CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.category_post: ~0 rows (approximately)

-- Dumping structure for table second.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_user_id_foreign` (`user_id`),
  CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.contacts: ~0 rows (approximately)

-- Dumping structure for table second.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.departments: ~2 rows (approximately)
INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(5, 'BScs', '2024-05-22 01:49:37', '2024-05-22 01:49:37'),
	(6, 'BSit', '2024-05-22 04:24:04', '2024-05-22 04:24:04'),
	(7, 'Joelle Oneal', '2024-05-25 03:46:33', '2024-05-25 03:46:33');

-- Dumping structure for table second.department_semester
CREATE TABLE IF NOT EXISTS `department_semester` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint unsigned NOT NULL,
  `semester_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_semester_department_id_foreign` (`department_id`),
  KEY `department_semester_semester_id_foreign` (`semester_id`),
  CONSTRAINT `department_semester_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `department_semester_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.department_semester: ~4 rows (approximately)
INSERT INTO `department_semester` (`id`, `department_id`, `semester_id`, `created_at`, `updated_at`) VALUES
	(5, 5, 5, NULL, NULL),
	(6, 6, 6, NULL, NULL),
	(7, 7, 5, NULL, NULL),
	(8, 7, 6, NULL, NULL),
	(9, 7, 7, NULL, NULL);

-- Dumping structure for table second.failed_jobs
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

-- Dumping data for table second.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table second.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.migrations: ~35 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(45, '2014_10_12_000000_create_users_table', 1),
	(46, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(47, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(48, '2019_08_19_000000_create_failed_jobs_table', 1),
	(49, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(50, '2024_01_08_153129_create_sessions_table', 1),
	(51, '2024_01_09_120926_create_products_table', 1),
	(52, '2024_01_09_121015_create_carts_table', 1),
	(53, '2024_01_10_085840_create_shopingcarts_table', 1),
	(54, '2024_01_12_095839_create_orders_table', 1),
	(55, '2024_01_13_103505_create_cart_items_table', 1),
	(56, '2024_01_14_095213_create_productscs_table', 1),
	(57, '2024_01_15_072427_create_order_items_table', 1),
	(58, '2024_01_15_073614_create_admin_orders_table', 1),
	(59, '2024_01_31_145126_create_teachers_table', 1),
	(60, '2024_01_31_145400_create_studentss_table', 1),
	(61, '2024_02_01_060920_create_contacts_table', 1),
	(62, '2024_02_01_064535_create_posts_table', 1),
	(63, '2024_02_01_071707_create_categories_table', 1),
	(64, '2024_02_01_072428_create_category_post_table', 1),
	(65, '2024_02_01_075753_create_categorie_post_table', 1),
	(66, '2024_05_18_063721_create_rooms_table', 1),
	(67, '2024_05_18_064033_create_professors_table', 2),
	(68, '2024_05_18_085614_create_schedules_table', 2),
	(69, '2024_05_18_100949_create_semesters_table', 2),
	(70, '2024_05_18_103014_create_professor_semester_table', 2),
	(71, '2024_05_18_104638_create_departments_table', 2),
	(72, '2024_05_19_064000_create_subjects_table', 2),
	(73, '2024_05_19_065130_create_professor_subject_table', 3),
	(76, '2024_05_20_063100_add_default_value_to_user_type_in_users_table', 5),
	(84, '2024_05_20_060554_add_user_type_to_users_table', 6),
	(85, '2024_05_20_081939_add_email_to_professors_table', 7),
	(86, '2024_05_21_061744_create_professor_department_table', 8),
	(88, '2024_05_22_055458_add_subject_id_to_schedules_table', 9),
	(90, '2024_05_22_072032_add_semester_id_to_subjects_table', 10),
	(91, '2024_06_03_054627_update_schedules_table', 11);

-- Dumping structure for table second.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `bill` double(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.orders: ~0 rows (approximately)

-- Dumping structure for table second.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.order_items: ~0 rows (approximately)

-- Dumping structure for table second.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table second.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table second.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.posts: ~0 rows (approximately)

-- Dumping structure for table second.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.products: ~0 rows (approximately)

-- Dumping structure for table second.productscs
CREATE TABLE IF NOT EXISTS `productscs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.productscs: ~0 rows (approximately)

-- Dumping structure for table second.professors
CREATE TABLE IF NOT EXISTS `professors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `professors_teacher_name_unique` (`teacher_name`),
  UNIQUE KEY `professors_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.professors: ~6 rows (approximately)
INSERT INTO `professors` (`id`, `teacher_name`, `email`, `created_at`, `updated_at`) VALUES
	(12, 'Ahmad Saeed', 'ahmadsaeed@gmail.com', '2024-05-22 00:29:20', '2024-05-22 00:29:20'),
	(13, 'Martin Jarvis', 'toxeje@mailinator.com', '2024-05-22 04:22:12', '2024-05-22 04:22:12'),
	(14, 'Sacha Mcmahon', 'picut@mailinator.com', '2024-05-25 03:42:28', '2024-05-25 03:42:28'),
	(15, 'Merrill Golden', 'gife@mailinator.com', '2024-05-25 03:42:41', '2024-05-25 03:42:41'),
	(16, 'Beatrice Jacobs', 'mitim@mailinator.com', '2024-05-25 03:42:55', '2024-05-25 03:42:55'),
	(17, 'Rebecca Johnson', 'robir@mailinator.com', '2024-05-25 03:43:04', '2024-05-25 03:43:04');

-- Dumping structure for table second.professor_department
CREATE TABLE IF NOT EXISTS `professor_department` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `professor_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_department_professor_id_foreign` (`professor_id`),
  KEY `professor_department_department_id_foreign` (`department_id`),
  CONSTRAINT `professor_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `professor_department_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.professor_department: ~0 rows (approximately)

-- Dumping structure for table second.professor_semester
CREATE TABLE IF NOT EXISTS `professor_semester` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `semester_id` bigint unsigned NOT NULL,
  `professor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_semester_semester_id_foreign` (`semester_id`),
  KEY `professor_semester_professor_id_foreign` (`professor_id`),
  CONSTRAINT `professor_semester_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `professor_semester_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.professor_semester: ~7 rows (approximately)
INSERT INTO `professor_semester` (`id`, `semester_id`, `professor_id`, `created_at`, `updated_at`) VALUES
	(10, 5, 12, NULL, NULL),
	(11, 6, 13, NULL, NULL),
	(12, 7, 12, NULL, NULL),
	(13, 7, 13, NULL, NULL),
	(14, 7, 14, NULL, NULL),
	(15, 7, 15, NULL, NULL),
	(16, 7, 17, NULL, NULL);

-- Dumping structure for table second.professor_subject
CREATE TABLE IF NOT EXISTS `professor_subject` (
  `professor_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned NOT NULL,
  KEY `professor_subject_professor_id_foreign` (`professor_id`),
  KEY `professor_subject_subject_id_foreign` (`subject_id`),
  CONSTRAINT `professor_subject_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `professor_subject_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.professor_subject: ~0 rows (approximately)

-- Dumping structure for table second.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_room_number_unique` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.rooms: ~7 rows (approximately)
INSERT INTO `rooms` (`id`, `room_number`, `capacity`, `created_at`, `updated_at`) VALUES
	(1, 'Room#20', 21, '2024-05-19 01:41:26', '2024-05-21 05:32:39'),
	(2, 'Room#21', 21, '2024-05-19 01:41:37', '2024-05-19 01:41:37'),
	(3, 'Room#22', 21, '2024-05-19 01:41:46', '2024-05-19 01:41:46'),
	(4, 'Room#23', 23, '2024-05-19 01:41:58', '2024-05-19 01:41:58'),
	(5, 'Room#24', 23, '2024-05-19 01:42:08', '2024-05-19 01:42:08'),
	(6, 'Room#26', 42, '2024-05-20 11:07:11', '2024-05-20 11:07:11'),
	(7, 'Room#25', 54, '2024-05-21 04:48:51', '2024-05-21 04:48:51'),
	(8, 'Room#30', 21, '2024-05-25 03:33:19', '2024-05-25 03:33:19');

-- Dumping structure for table second.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `professor_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedules_professor_id_duration_room_id_day_unique` (`professor_id`,`room_id`,`day`),
  KEY `schedules_room_id_foreign` (`room_id`),
  KEY `schedules_subject_id_foreign` (`subject_id`),
  CONSTRAINT `schedules_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.schedules: ~7 rows (approximately)
INSERT INTO `schedules` (`id`, `professor_id`, `room_id`, `subject_id`, `day`, `created_at`, `updated_at`, `start_time`, `end_time`) VALUES
	(44, 12, 1, 11, 'Monday', '2024-06-03 06:05:52', '2024-06-03 06:05:52', '09:00:00', '10:00:00'),
	(45, 13, 2, 9, 'Monday', '2024-06-03 06:06:15', '2024-06-03 06:06:15', '10:15:00', '11:15:00'),
	(46, 12, 3, 11, 'Monday', '2024-06-03 06:07:06', '2024-06-03 06:07:06', '11:30:00', '13:00:00'),
	(47, 13, 1, 9, 'Tuesday', '2024-06-03 06:07:42', '2024-06-03 06:07:42', '09:00:00', '10:00:00'),
	(48, 15, 1, 20, 'Monday', '2024-06-03 06:08:44', '2024-06-03 06:08:44', '13:15:00', '14:45:00'),
	(51, 17, 8, 19, 'Monday', '2024-06-03 06:27:07', '2024-06-03 06:27:07', '15:00:00', '16:00:00'),
	(55, 14, 5, 10, 'Monday', '2024-06-03 06:28:06', '2024-06-03 06:28:06', '09:00:00', '10:30:00');

-- Dumping structure for table second.semesters
CREATE TABLE IF NOT EXISTS `semesters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.semesters: ~1 rows (approximately)
INSERT INTO `semesters` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(5, 'BScs(2)', '2024-05-22 01:49:13', '2024-05-22 01:49:13'),
	(6, 'BSit(3)', '2024-05-22 04:23:35', '2024-05-22 04:23:43'),
	(7, 'Darrel Schultz', '2024-05-25 03:46:12', '2024-05-25 03:46:12');

-- Dumping structure for table second.semester_teacher
CREATE TABLE IF NOT EXISTS `semester_teacher` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `semester_id` bigint unsigned NOT NULL,
  `professor_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `semester_teacher_semester_id_foreign` (`semester_id`),
  KEY `semester_teacher_professor_id_foreign` (`professor_id`),
  CONSTRAINT `semester_teacher_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `semester_teacher_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.semester_teacher: ~0 rows (approximately)

-- Dumping structure for table second.sessions
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

-- Dumping data for table second.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('F3rgyk1TcSVGX3RvJtJ9URXHEEGYUNl1sDbKbxEJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTTdCUExLN21YdDBFY2NzSjlhNWFxZE9QcFkwQXo2VmtXaFdjWTBCUCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vc2Vjb25kLnRlc3Qvc2NoZWR1bGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1717414642),
	('gbZPpwSYZdPbZQtjft83HNmULk2c41wOALne3Ce2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYnJXakM1ODNyRnNHM2N3TlR6N2FIRmoyUXdvSTRoVjdtUVlhaDA2SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717411760);

-- Dumping structure for table second.shopingcarts
CREATE TABLE IF NOT EXISTS `shopingcarts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL DEFAULT '1',
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.shopingcarts: ~0 rows (approximately)

-- Dumping structure for table second.studentss
CREATE TABLE IF NOT EXISTS `studentss` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentss_email_unique` (`email`),
  KEY `studentss_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `studentss_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.studentss: ~0 rows (approximately)

-- Dumping structure for table second.subjects
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professor_id` bigint unsigned DEFAULT NULL,
  `semester_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subjects_subject_code_unique` (`subject_code`),
  UNIQUE KEY `subjects_subject_name_unique` (`subject_name`),
  KEY `subjects_professor_id_foreign` (`professor_id`),
  KEY `subjects_semester_id_foreign` (`semester_id`),
  CONSTRAINT `subjects_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subjects_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.subjects: ~11 rows (approximately)
INSERT INTO `subjects` (`id`, `subject_code`, `subject_name`, `professor_id`, `semester_id`, `created_at`, `updated_at`) VALUES
	(9, 'Repellendus Et in n', 'Lynn Fernandez', 13, NULL, '2024-05-19 02:15:32', '2024-05-22 04:22:12'),
	(10, 'Molestiae et eos de', 'Martha Howard', 14, NULL, '2024-05-19 02:15:36', '2024-05-25 03:42:28'),
	(11, 'Nostrum excepteur ex', 'Owen Parker', 12, NULL, '2024-05-19 02:15:41', '2024-05-22 00:58:47'),
	(15, 'Mollit eu modi magna', 'Clio Cash', 12, NULL, '2024-05-21 00:18:31', '2024-05-22 00:58:47'),
	(16, 'Temporibus ullamco a', 'Whilemina Chandler', 13, NULL, '2024-05-21 04:49:10', '2024-05-22 04:22:12'),
	(17, 'Dignissimos velit ne', 'Quyn Hurst', 13, NULL, '2024-05-22 02:42:03', '2024-05-22 04:22:12'),
	(18, 'Inventore in do ut v', 'Naida Kent', 14, NULL, '2024-05-22 02:45:54', '2024-05-25 03:42:28'),
	(19, 'Non voluptas eaque m', 'Jonas Shields', 17, NULL, '2024-05-25 03:33:41', '2024-05-25 03:43:04'),
	(20, 'Aut inventore dolore', 'Zelenia Kennedy', 15, NULL, '2024-05-25 03:41:41', '2024-05-25 03:42:41'),
	(21, 'Blanditiis explicabo', 'Morgan Velez', 16, NULL, '2024-05-25 03:41:51', '2024-05-25 03:42:55'),
	(22, 'Odit dicta ut nostru', 'Jemima Warren', 16, NULL, '2024-05-25 03:41:59', '2024-05-25 03:42:55');

-- Dumping structure for table second.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.teachers: ~0 rows (approximately)

-- Dumping structure for table second.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table second.users: ~12 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `user_type`) VALUES
	(1, 'System', 'ahmadsaeed@gmail.com', '2024-01-01 15:00:31', '$2y$12$6dLbG8fL/Mmr4LLfJ6GFUeZOSrzZeACUFZVLn36YYdCVIfl9R9iq2', NULL, NULL, NULL, 'khqcJkqFTfrk1mluVxnH03ItnhUW0GQU2dqnvQtS94Onq7nPdsQ8dw2JMJL6', NULL, NULL, NULL, '2024-05-20 07:20:16', -1),
	(2, 'Admin', 'admin@admin.com', NULL, '$2y$12$6dLbG8fL/Mmr4LLfJ6GFUeZOSrzZeACUFZVLn36YYdCVIfl9R9iq2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	(28, 'Abdul Holcomb', 'zamakyqo@mailinator.com', NULL, '$2y$12$WV85prc32LDtFvHZ/6uIFOclWUytRVYDCAp9OsivXb0gb297N4XVe', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:36:00', '2024-05-20 05:36:00', 2),
	(29, 'Yoshio Weaver', 'naxobo@mailinator.com', NULL, '$2y$12$XxxgbdyDB0X9XXnuqLh3muIXZybX0NL15vSLdlhmOwUWc1kR7.1SC', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:36:17', '2024-05-20 05:36:17', 2),
	(30, 'Amela Hatfield', 'wuwob@mailinator.com', NULL, '$2y$12$Bslb2A7U/48hqSz/8cIX5uZ3d2SPJkaZgO0nymq7FqUy3jijcIPNu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:36:30', '2024-05-20 05:36:30', 2),
	(31, 'Gail Gilmore', 'rypyxykuqa@mailinator.com', NULL, '$2y$12$fNL/RtPBCG1BC0BsBcfSOui0S0Uki.UhRVrSEJcGTw38i.AgLQHoG', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:36:59', '2024-05-20 05:36:59', 1),
	(32, 'Teegan Sanders', 'horyxyvuz@mailinator.com', NULL, '$2y$12$f56mtYtA3zuLkkaQtNROl.1YEWg1SvvH91TtY4XrovxxL4NwWwQdW', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:37:04', '2024-05-20 05:37:04', 1),
	(33, 'Lani Mcclure', 'fuha@mailinator.com', NULL, '$2y$12$bXtuJ0ksh/180zFLQksL5.JEH9tO3wjxQAIE2zuCkxqALDJeNa3wS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:37:07', '2024-05-20 05:37:07', 1),
	(34, 'Oscar Hardy', 'kuxum@mailinator.com', NULL, '$2y$12$GoLMkRf3mVoVJt5fpuEF1.ALFmVqnW3EkfvfxvqQN0JP9.bJsRcti', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-20 05:37:10', '2024-05-20 05:37:10', 1),
	(35, 'Chadwick Blackburn', 'civydoje@mailinator.com', NULL, '$2y$12$qGhJ/6Rkc/yOzjd3pjeKM.CDCw5CI8yfSJDkXuTBQ7bxQkf7lsAYG', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 00:37:04', '2024-05-21 00:37:04', 1),
	(36, 'Griffin Young', 'pizeqyj@mailinator.com', NULL, '$2y$12$2WR6B88A0ckNRNIIYR6Nc.O..90Cr/lG8res/jDPOt4KoR8i8HY5a', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 01:07:30', '2024-05-21 01:07:30', 2),
	(37, 'Quinlan Navarro', 'nibix@mailinator.com', NULL, '$2y$12$XQBoD7E1SNjr.9eyB8zRTueYZouBBIYZJ5t4jOCi2MsKm8GZYhui2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 01:58:05', '2024-05-22 01:58:05', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
