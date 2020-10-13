-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2020 at 09:07 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s-cart-multishop`
--

-- --------------------------------------------------------

--
-- Table structure for table `activitylist`
--

CREATE TABLE `activitylist` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(250) DEFAULT NULL,
  `icon_name` varchar(250) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activitylist`
--

INSERT INTO `activitylist` (`id`, `type`, `active`, `icon`, `icon_name`, `path`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Clothes', 1, 'activity_Icon/7ecb89507fba16486ff7aae52b6df751.jpeg', NULL, 'http://127.0.0.1:8000/documents/website/', 'Clothes', '2020-03-16 06:43:58', '2020-03-28 17:48:00'),
(2, 'Mobiles&Accesciories', 1, NULL, NULL, NULL, 'Mobiles&Accesciories', '2020-03-16 06:43:58', NULL),
(3, 'Labtop&PCs', 1, 'activity_Icon/8cb1a1369a31d949aaa22a000ec2561e.jpg', NULL, 'http://127.0.0.1:8000/documents/website/ ', 'Labtop&PCs', '2020-03-16 06:43:58', '2020-03-28 17:47:01'),
(4, '2Books', 1, 'activity_Icon/814df1f8fa8c11243745d437a01d8e7b.jpg', NULL, NULL, '2Books', '2020-03-16 06:43:58', '2020-03-19 22:45:49'),
(6, 'Beauty&Health', 1, NULL, NULL, NULL, 'Beauty&Health', '2020-03-16 06:43:58', NULL),
(7, 'Food&Drink', 1, 'images/WhatsApp Image 2018-04-23 at 10.49.00 PM.jpeg', NULL, NULL, 'ood&Drinks', '2020-03-16 06:43:58', '2020-03-17 11:31:46'),
(8, 'Spare Parts Motors', 1, 'activity_Icon/521937d4c936cc207d37b827a63a9266.PNG', NULL, NULL, 'spare parts Motors', '2020-03-16 06:43:58', '2020-03-19 22:21:21'),
(9, 'All', 1, NULL, NULL, NULL, 'all Activities', '2020-03-16 06:43:58', NULL),
(10, 'test new', 1, 'activityImages/d82a6ae592539dd4716c45073d7ea884.jpg', NULL, 'http://127.0.0.1:8000/documents/website/', 'labtops1', '2020-03-28 17:52:47', '2020-03-29 01:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `active`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Index', 'fa-bar-chart', '/', NULL, 1, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', NULL, NULL, 1, NULL, '2018-12-30 02:36:54'),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, 1, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, 1, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, 1, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, 0, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, 0, NULL, NULL),
(8, 31, 27, 'Customer', 'fa-user-md', 'shop_customer', NULL, 1, '2018-01-13 08:27:55', '2019-02-09 10:33:31'),
(9, 25, 22, 'Orders', 'fa-shopping-cart', 'shop_order', NULL, 1, '2018-01-13 08:33:55', '2019-02-09 10:33:31'),
(10, 15, 15, 'All products', 'fa-file-photo-o', 'shop_product', NULL, 1, '2018-01-13 08:44:02', '2019-02-09 10:33:31'),
(11, 15, 17, 'Brand', 'fa-bank', 'shop_brand', NULL, 1, '2018-01-13 08:47:15', '2019-02-09 10:33:31'),
(13, 15, 14, 'Categories', 'fa-folder-open-o', 'shop_category', NULL, 1, '2018-01-13 08:52:17', '2019-02-09 10:33:31'),
(14, 15, 16, 'Special price', 'fa-paw', 'shop_special_price', NULL, 1, '2018-02-06 11:07:21', '2019-02-09 10:33:31'),
(15, 0, 13, 'Product Manager', 'fa-folder-open', NULL, NULL, 1, '2018-02-08 23:04:43', '2019-02-09 10:33:31'),
(18, 23, 44, 'Config info', 'fa-cog', 'config_info', NULL, 1, '2018-02-10 02:07:45', '2019-03-23 08:28:54'),
(22, 0, 8, 'Pages', 'fa-clone', 'shop_page', NULL, 0, '2018-02-10 02:19:50', '2019-02-08 09:21:24'),
(23, 0, 43, 'Settings', 'fa-cogs', NULL, NULL, 1, '2018-02-11 08:01:24', '2019-03-23 08:28:54'),
(24, 62, 39, 'Banners', 'fa-simplybuilt', 'banner', NULL, 1, '2018-03-13 13:10:22', '2019-03-23 08:28:54'),
(25, 0, 21, 'Order Manager', 'fa-cart-arrow-down', NULL, NULL, 1, '2018-05-06 07:59:14', '2019-02-09 10:33:31'),
(26, 25, 23, 'Order status', 'fa-asterisk', 'shop_order_status', NULL, 1, '2018-05-06 08:56:14', '2019-02-09 10:33:31'),
(27, 25, 24, 'Payment Status', 'fa-recycle', 'shop_payment_status', NULL, 1, '2018-05-06 08:57:12', '2019-02-09 10:33:31'),
(28, 25, 25, 'Shipping status', 'fa-ambulance', 'shop_shipping_status', NULL, 1, '2018-05-06 16:46:53', '2019-02-09 10:33:31'),
(30, 0, 29, 'Extensions', 'fa-puzzle-piece', NULL, NULL, 1, '2018-05-07 06:47:33', '2019-03-23 08:28:54'),
(31, 0, 26, 'Customer Manager', 'fa-group', NULL, NULL, 1, '2018-05-07 06:52:20', '2019-02-09 10:33:31'),
(51, 23, 45, 'Config global', 'fa-cogs', 'config_global', NULL, 1, '2018-09-19 13:51:31', '2019-03-23 08:28:54'),
(52, 56, 47, 'Config Language', 'fa-pagelines', 'language', NULL, 1, '2018-10-14 14:58:23', '2019-03-23 08:28:54'),
(53, 101, 37, 'Layout', 'fa-bars', 'layout', NULL, 1, '2018-10-16 23:16:09', '2019-03-23 08:29:13'),
(56, 23, 46, 'Localisation', 'fa-shirtsinbulk', NULL, NULL, 1, '2018-11-01 23:04:12', '2019-03-23 08:28:54'),
(57, 15, 18, 'Vendor', 'fa-user-secret', 'shop_vendor', NULL, 1, '2018-11-07 15:15:33', '2019-02-09 10:33:31'),
(58, 0, 51, 'Report & Analytics', 'fa-pie-chart', NULL, NULL, 1, '2018-11-07 22:59:47', '2019-03-23 08:28:54'),
(59, 58, 52, 'Customer', 'fa-bars', 'report/customer', NULL, 1, '2018-11-07 23:00:54', '2019-03-23 08:28:54'),
(60, 58, 53, 'Product', 'fa-bars', 'report/product', NULL, 1, '2018-11-07 23:01:21', '2019-03-23 08:28:54'),
(61, 15, 19, 'Import multi product', 'fa-save', 'process/productImport', NULL, 1, '2018-11-11 09:10:14', '2019-02-09 10:33:31'),
(62, 0, 38, 'Images manager', 'fa-image', NULL, NULL, 0, '2018-11-12 12:25:16', '2019-03-23 08:28:54'),
(63, 62, 40, 'Images', 'fa-file-image-o', 'documents', NULL, 1, '2018-11-12 12:26:13', '2019-03-23 08:28:54'),
(64, 56, 48, 'Currencies', 'fa-dollar', 'currencies', NULL, 1, '2018-12-03 23:55:44', '2019-03-23 08:28:54'),
(65, 0, 41, 'Api manager', 'fa-plug', NULL, NULL, 0, '2018-12-16 02:51:06', '2019-03-23 08:28:54'),
(66, 65, 42, 'Shop Api', 'fa-usb', 'modules/api/shop_api', NULL, 1, '2018-12-16 02:53:09', '2019-03-23 08:28:54'),
(70, 15, 20, 'Attributes group', 'fa-bars', 'shop_attribute_group', NULL, 1, '2018-12-27 15:32:39', '2019-02-09 10:33:31'),
(71, 30, 30, 'Payment', 'fa-money', 'extensions/Payment', NULL, 1, '2019-02-01 08:50:26', '2019-03-23 08:28:54'),
(72, 30, 31, 'Shipping', 'fa-ambulance', 'extensions/Shipping', NULL, 1, '2019-02-01 08:51:58', '2019-03-23 08:28:54'),
(73, 30, 32, 'Total', 'fa-cog', 'extensions/Total', NULL, 1, '2019-02-01 08:52:33', '2019-03-23 08:28:54'),
(74, 30, 33, 'Other', 'fa-circle-thin', 'extensions/Other', NULL, 1, '2019-02-01 08:53:09', '2019-03-23 08:28:54'),
(75, 0, 34, 'Modules', 'fa-codepen', NULL, NULL, 0, '2019-02-08 05:17:59', '2019-03-23 08:28:54'),
(76, 75, 35, 'Cms', 'fa-modx', 'modules/Cms', NULL, 1, '2019-02-08 05:25:13', '2019-03-23 08:28:54'),
(81, 23, 49, 'Templates manager', 'fa-columns', 'config_template', NULL, 1, '2019-02-25 03:26:36', '2019-03-23 08:28:54'),
(82, 23, 50, 'Backup & Restore', 'fa-save', 'backup_database', NULL, 1, '2019-02-25 03:32:26', '2019-03-23 08:28:54'),
(83, 31, 28, 'Subscribe manager', 'fa-user-md', 'subscribe', NULL, 1, '2019-02-27 01:39:41', '2019-03-23 08:28:54'),
(101, 0, 36, 'Design Layout', 'fa-object-ungroup', NULL, NULL, 0, '2019-03-23 08:28:31', '2019-03-23 08:28:54'),
(102, 75, 0, 'Other', 'fa-bars', 'modules/Other', NULL, 1, '2019-03-23 08:31:19', '2019-03-23 08:31:19'),
(105, 101, 0, 'URL', 'fa-chrome', 'layout_url', NULL, 1, '2019-03-31 01:45:43', '2019-03-31 01:45:43'),
(106, 31, 27, 'Customers Category', 'fa-user-md', 'shop_customer', NULL, 1, '2018-01-13 08:27:55', '2019-02-09 10:33:31'),
(107, 15, 47, 'units', 'fa fa-cog', 'item_units', NULL, 1, '2018-09-19 13:51:31', '2019-03-23 08:28:54'),
(108, 0, 54, 'companies', 'fa-building', 'company', NULL, 1, '2018-11-07 23:01:21', '2019-03-23 08:28:54'),
(110, 0, 54, 'activities', 'fa fa-cubes', 'activities', NULL, 1, '2018-11-07 23:01:21', '2019-03-23 08:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-03-31 01:58:42', '2019-03-31 01:58:42'),
(2, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-31 01:58:49', '2019-03-31 01:58:49'),
(3, NULL, 1, 'system_admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-03-31 01:58:54', '2019-03-31 01:58:54'),
(4, NULL, 1, 'system_admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"admin\",\"password_confirmation\":\"admin\",\"_token\":\"I2IMslcPFzFycSNmH70LCIF2F7DGH4CcXoQFzVim\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/demoshop.local\\/system_admin\\/layout\"}', '2019-03-31 01:59:05', '2019-03-31 01:59:05'),
(5, NULL, 1, 'system_admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-03-31 01:59:05', '2019-03-31 01:59:05'),
(6, NULL, 1, 'system_admin/backup_database', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-31 01:59:14', '2019-03-31 01:59:14'),
(7, NULL, 1, 'system_admin/backup', 'POST', '127.0.0.1', '{\"_token\":\"I2IMslcPFzFycSNmH70LCIF2F7DGH4CcXoQFzVim\"}', '2019-03-31 01:59:15', '2019-03-31 01:59:15'),
(8, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 03:51:22', '2019-04-17 03:51:22'),
(9, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 03:52:11', '2019-04-17 03:52:11'),
(10, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 03:52:15', '2019-04-17 03:52:15'),
(11, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-04-17 03:52:21', '2019-04-17 03:52:21'),
(12, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 03:52:27', '2019-04-17 03:52:27'),
(13, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 03:52:34', '2019-04-17 03:52:34'),
(14, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-17 04:15:58', '2019-04-17 04:15:58'),
(15, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 04:16:11', '2019-04-17 04:16:11'),
(16, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 04:16:38', '2019-04-17 04:16:38'),
(17, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-17 04:16:43', '2019-04-17 04:16:43'),
(18, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-04-17 04:17:02', '2019-04-17 04:17:02'),
(19, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:43:47', '2019-04-20 02:43:47'),
(20, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:44:15', '2019-04-20 02:44:15'),
(21, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:44:36', '2019-04-20 02:44:36'),
(22, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-20 02:45:04', '2019-04-20 02:45:04'),
(23, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:45:27', '2019-04-20 02:45:27'),
(24, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-20 02:46:33', '2019-04-20 02:46:33'),
(25, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:47:51', '2019-04-20 02:47:51'),
(26, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:48:01', '2019-04-20 02:48:01'),
(27, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:48:43', '2019-04-20 02:48:43'),
(28, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-20 02:54:04', '2019-04-20 02:54:04'),
(29, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-04-20 02:54:07', '2019-04-20 02:54:07'),
(30, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-20 02:54:26', '2019-04-20 02:54:26'),
(31, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-04-20 16:11:52', '2019-04-20 16:11:52'),
(32, NULL, 1, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-04-20 16:42:06', '2019-04-20 16:42:06'),
(33, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-04-26 01:43:08', '2019-04-26 01:43:08'),
(34, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-26 01:50:56', '2019-04-26 01:50:56'),
(35, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-26 01:51:20', '2019-04-26 01:51:20'),
(36, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"3\",\"_token\":\"Kifq7rpUj6HDMqonbovC1EVEo8172XQg4ZRcCj3H\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-04-26 01:51:30', '2019-04-26 01:51:30'),
(37, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-29 15:29:54', '2019-04-29 15:29:54'),
(38, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-04-29 15:30:18', '2019-04-29 15:30:18'),
(39, NULL, 1, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-04-29 15:36:21', '2019-04-29 15:36:21'),
(40, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 02:56:47', '2019-05-01 02:56:47'),
(41, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-01 03:40:26', '2019-05-01 03:40:26'),
(42, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 03:40:27', '2019-05-01 03:40:27'),
(43, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 03:40:55', '2019-05-01 03:40:55'),
(44, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-01 03:41:48', '2019-05-01 03:41:48'),
(45, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 03:42:20', '2019-05-01 03:42:20'),
(46, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 03:42:57', '2019-05-01 03:42:57'),
(47, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 13:11:04', '2019-05-01 13:11:04'),
(48, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:18:43', '2019-05-01 13:18:43'),
(49, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:34:21', '2019-05-01 13:34:21'),
(50, NULL, 1, 'system_admin/auth/users/4', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"ZK3jkdEjg0DjIJQ4WNDOmDUgKZ0rHvtuxZjpVUV6\"}', '2019-05-01 13:35:24', '2019-05-01 13:35:24'),
(51, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:35:25', '2019-05-01 13:35:25'),
(52, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 13:35:34', '2019-05-01 13:35:34'),
(53, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 14:14:29', '2019-05-01 14:14:29'),
(54, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 15:39:42', '2019-05-01 15:39:42'),
(55, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 15:39:55', '2019-05-01 15:39:55'),
(56, NULL, 1, 'system_admin/auth/users/3', 'GET', '127.0.0.1', '[]', '2019-05-01 15:40:01', '2019-05-01 15:40:01'),
(57, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 15:40:09', '2019-05-01 15:40:09'),
(58, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 15:59:31', '2019-05-01 15:59:31'),
(59, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:00:26', '2019-05-01 16:00:26'),
(60, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:02:32', '2019-05-01 16:02:32'),
(61, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 16:18:33', '2019-05-01 16:18:33'),
(62, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:18:50', '2019-05-01 16:18:50'),
(63, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:19:14', '2019-05-01 16:19:14'),
(64, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:19:29', '2019-05-01 16:19:29'),
(65, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:19:32', '2019-05-01 16:19:32'),
(66, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:47:38', '2019-05-01 16:47:38'),
(67, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:48:16', '2019-05-01 16:48:16'),
(68, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:50:02', '2019-05-01 16:50:02'),
(69, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:54:23', '2019-05-01 16:54:23'),
(70, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:55:09', '2019-05-01 16:55:09'),
(71, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:56:44', '2019-05-01 16:56:44'),
(72, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 16:56:48', '2019-05-01 16:56:48'),
(73, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 16:57:07', '2019-05-01 16:57:07'),
(74, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:02:38', '2019-05-01 17:02:38'),
(75, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:02:40', '2019-05-01 17:02:40'),
(76, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:03:45', '2019-05-01 17:03:45'),
(77, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:03:48', '2019-05-01 17:03:48'),
(78, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:04:51', '2019-05-01 17:04:51'),
(79, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:04:55', '2019-05-01 17:04:55'),
(80, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:05:30', '2019-05-01 17:05:30'),
(81, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:05:32', '2019-05-01 17:05:32'),
(82, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:00', '2019-05-01 17:06:00'),
(83, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:34', '2019-05-01 17:06:34'),
(84, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:35', '2019-05-01 17:06:35'),
(85, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:36', '2019-05-01 17:06:36'),
(86, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:41', '2019-05-01 17:06:41'),
(87, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:41', '2019-05-01 17:06:41'),
(88, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:44', '2019-05-01 17:06:44'),
(89, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:44', '2019-05-01 17:06:44'),
(90, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:06:47', '2019-05-01 17:06:47'),
(91, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:47', '2019-05-01 17:06:47'),
(92, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:06:50', '2019-05-01 17:06:50'),
(93, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:07:30', '2019-05-01 17:07:30'),
(94, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:07:33', '2019-05-01 17:07:33'),
(95, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:07:34', '2019-05-01 17:07:34'),
(96, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 17:07:37', '2019-05-01 17:07:37'),
(97, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 17:07:38', '2019-05-01 17:07:38'),
(98, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"5\"}', '2019-05-01 17:07:51', '2019-05-01 17:07:51'),
(99, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"1\"}', '2019-05-01 17:07:56', '2019-05-01 17:07:56'),
(100, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null}', '2019-05-01 17:08:00', '2019-05-01 17:08:00'),
(101, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '[]', '2019-05-01 19:17:46', '2019-05-01 19:17:46'),
(102, NULL, 1, 'system_admin/modules/Cms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:18:03', '2019-05-01 19:18:03'),
(103, NULL, 1, 'system_admin/modules/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:18:10', '2019-05-01 19:18:10'),
(104, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:18:18', '2019-05-01 19:18:18'),
(105, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:02', '2019-05-01 19:19:02'),
(106, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:08', '2019-05-01 19:19:08'),
(107, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:19', '2019-05-01 19:19:19'),
(108, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:27', '2019-05-01 19:19:27'),
(109, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:51', '2019-05-01 19:19:51'),
(110, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:58', '2019-05-01 19:19:58'),
(111, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:19:59', '2019-05-01 19:19:59'),
(112, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2019-05-01 19:20:00', '2019-05-01 19:20:00'),
(113, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:21:15', '2019-05-01 19:21:15'),
(114, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:21:36', '2019-05-01 19:21:36'),
(115, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:21:42', '2019-05-01 19:21:42'),
(116, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-01 19:21:49', '2019-05-01 19:21:49'),
(117, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:22:44', '2019-05-01 19:22:44'),
(118, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:22:47', '2019-05-01 19:22:47'),
(119, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-01 19:23:01', '2019-05-01 19:23:01'),
(120, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:13', '2019-05-01 19:23:13'),
(121, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:15', '2019-05-01 19:23:15'),
(122, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:18', '2019-05-01 19:23:18'),
(123, NULL, 1, 'system_admin/extensions/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:20', '2019-05-01 19:23:20'),
(124, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:23:28', '2019-05-01 19:23:28'),
(125, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:24:19', '2019-05-01 19:24:19'),
(126, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:24:20', '2019-05-01 19:24:20'),
(127, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:24:22', '2019-05-01 19:24:22'),
(128, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:46:45', '2019-05-01 19:46:45'),
(129, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:46:49', '2019-05-01 19:46:49'),
(130, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:46:59', '2019-05-01 19:46:59'),
(131, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:09', '2019-05-01 19:47:09'),
(132, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:23', '2019-05-01 19:47:23'),
(133, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:26', '2019-05-01 19:47:26'),
(134, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:29', '2019-05-01 19:47:29'),
(135, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:42', '2019-05-01 19:47:42'),
(136, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:47:53', '2019-05-01 19:47:53'),
(137, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:48:48', '2019-05-01 19:48:48'),
(138, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-01 19:48:52', '2019-05-01 19:48:52'),
(139, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:49:04', '2019-05-01 19:49:04'),
(140, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:49:06', '2019-05-01 19:49:06'),
(141, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:49:14', '2019-05-01 19:49:14'),
(142, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 19:49:19', '2019-05-01 19:49:19'),
(143, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 19:49:25', '2019-05-01 19:49:25'),
(144, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-01 19:49:28', '2019-05-01 19:49:28'),
(145, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:50:00', '2019-05-01 19:50:00'),
(146, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 19:55:05', '2019-05-01 19:55:05'),
(147, NULL, 1, 'system_admin/auth/users/1', 'GET', '127.0.0.1', '[]', '2019-05-01 19:55:08', '2019-05-01 19:55:08'),
(148, NULL, 1, 'system_admin/auth/users/3', 'GET', '127.0.0.1', '[]', '2019-05-01 19:55:18', '2019-05-01 19:55:18'),
(149, NULL, 1, 'system_admin/auth/users/3', 'GET', '127.0.0.1', '[]', '2019-05-01 19:55:46', '2019-05-01 19:55:46'),
(150, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 20:20:09', '2019-05-01 20:20:09'),
(151, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 20:20:12', '2019-05-01 20:20:12'),
(152, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 20:20:14', '2019-05-01 20:20:14'),
(153, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 21:05:29', '2019-05-01 21:05:29'),
(154, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:30', '2019-05-01 21:05:30'),
(155, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:30', '2019-05-01 21:05:30'),
(156, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:30', '2019-05-01 21:05:30'),
(157, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-01 21:05:31', '2019-05-01 21:05:31'),
(158, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:31', '2019-05-01 21:05:31'),
(159, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:32', '2019-05-01 21:05:32'),
(160, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:32', '2019-05-01 21:05:32'),
(161, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:32', '2019-05-01 21:05:32'),
(162, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:33', '2019-05-01 21:05:33'),
(163, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:33', '2019-05-01 21:05:33'),
(164, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:34', '2019-05-01 21:05:34'),
(165, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:34', '2019-05-01 21:05:34'),
(166, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:34', '2019-05-01 21:05:34'),
(167, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:35', '2019-05-01 21:05:35'),
(168, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:05:35', '2019-05-01 21:05:35'),
(169, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:07:45', '2019-05-01 21:07:45'),
(170, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:08:23', '2019-05-01 21:08:23'),
(171, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:25:51', '2019-05-01 21:25:51'),
(172, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:26:19', '2019-05-01 21:26:19'),
(173, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:33:18', '2019-05-01 21:33:18'),
(174, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:34:07', '2019-05-01 21:34:07'),
(175, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:34:38', '2019-05-01 21:34:38'),
(176, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:34:57', '2019-05-01 21:34:57'),
(177, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:35:35', '2019-05-01 21:35:35'),
(178, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:36:17', '2019-05-01 21:36:17'),
(179, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:55:20', '2019-05-01 21:55:20'),
(180, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:55:41', '2019-05-01 21:55:41'),
(181, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:56:09', '2019-05-01 21:56:09'),
(182, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:56:56', '2019-05-01 21:56:56'),
(183, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 21:57:33', '2019-05-01 21:57:33'),
(184, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:02:10', '2019-05-01 22:02:10'),
(185, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:02:29', '2019-05-01 22:02:29'),
(186, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:05:33', '2019-05-01 22:05:33'),
(187, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:06:17', '2019-05-01 22:06:17'),
(188, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:07:01', '2019-05-01 22:07:01'),
(189, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:08:54', '2019-05-01 22:08:54'),
(190, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:15:40', '2019-05-01 22:15:40'),
(191, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:16:02', '2019-05-01 22:16:02'),
(192, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:17:55', '2019-05-01 22:17:55'),
(193, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:19:16', '2019-05-01 22:19:16'),
(194, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:20:02', '2019-05-01 22:20:02'),
(195, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:21:18', '2019-05-01 22:21:18'),
(196, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:22:32', '2019-05-01 22:22:32'),
(197, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:23:03', '2019-05-01 22:23:03'),
(198, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:23:43', '2019-05-01 22:23:43'),
(199, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:25:01', '2019-05-01 22:25:01'),
(200, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:25:35', '2019-05-01 22:25:35'),
(201, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:25:56', '2019-05-01 22:25:56'),
(202, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-01 22:26:24', '2019-05-01 22:26:24'),
(203, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:24:43', '2019-05-02 14:24:43'),
(204, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:25:26', '2019-05-02 14:25:26'),
(205, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 14:25:37', '2019-05-02 14:25:37'),
(206, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:27:54', '2019-05-02 14:27:54'),
(207, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:28:08', '2019-05-02 14:28:08'),
(208, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:28:54', '2019-05-02 14:28:54'),
(209, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:31:39', '2019-05-02 14:31:39'),
(210, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:34:28', '2019-05-02 14:34:28'),
(211, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:36:38', '2019-05-02 14:36:38'),
(212, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 14:37:11', '2019-05-02 14:37:11'),
(213, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 15:46:31', '2019-05-02 15:46:31'),
(214, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 15:47:06', '2019-05-02 15:47:06'),
(215, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 16:05:24', '2019-05-02 16:05:24'),
(216, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 16:05:43', '2019-05-02 16:05:43'),
(217, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:41:41', '2019-05-02 17:41:41'),
(218, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:46:20', '2019-05-02 17:46:20'),
(219, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:21', '2019-05-02 17:47:21'),
(220, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:23', '2019-05-02 17:47:23'),
(221, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:36', '2019-05-02 17:47:36'),
(222, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:39', '2019-05-02 17:47:39'),
(223, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:47:43', '2019-05-02 17:47:43'),
(224, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:49:48', '2019-05-02 17:49:48'),
(225, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 17:49:51', '2019-05-02 17:49:51'),
(226, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-02 18:52:46', '2019-05-02 18:52:46'),
(227, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 18:56:43', '2019-05-02 18:56:43'),
(228, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 18:56:47', '2019-05-02 18:56:47'),
(229, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 18:56:49', '2019-05-02 18:56:49'),
(230, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:00:19', '2019-05-02 19:00:19'),
(231, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:00:30', '2019-05-02 19:00:30'),
(232, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:00:57', '2019-05-02 19:00:57'),
(233, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:06:28', '2019-05-02 19:06:28'),
(234, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:07:05', '2019-05-02 19:07:05'),
(235, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-02 19:07:13', '2019-05-02 19:07:13'),
(236, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-02 19:08:16', '2019-05-02 19:08:16'),
(237, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:08:27', '2019-05-02 19:08:27'),
(238, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:08:28', '2019-05-02 19:08:28'),
(239, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:09:53', '2019-05-02 19:09:53'),
(240, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:10:41', '2019-05-02 19:10:41'),
(241, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:10:44', '2019-05-02 19:10:44'),
(242, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:10:46', '2019-05-02 19:10:46'),
(243, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:14:12', '2019-05-02 19:14:12'),
(244, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:15:08', '2019-05-02 19:15:08'),
(245, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:16:43', '2019-05-02 19:16:43'),
(246, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:18:38', '2019-05-02 19:18:38'),
(247, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:18:52', '2019-05-02 19:18:52'),
(248, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:09', '2019-05-02 19:19:09'),
(249, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:13', '2019-05-02 19:19:13'),
(250, NULL, 1, 'system_admin/shop_special_price/create', 'GET', '127.0.0.1', '[]', '2019-05-02 19:19:28', '2019-05-02 19:19:28'),
(251, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2019-05-02 19:19:30', '2019-05-02 19:19:30'),
(252, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:51', '2019-05-02 19:19:51'),
(253, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:54', '2019-05-02 19:19:54'),
(254, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:19:57', '2019-05-02 19:19:57'),
(255, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:24:50', '2019-05-02 19:24:50'),
(256, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:26:01', '2019-05-02 19:26:01'),
(257, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:26:14', '2019-05-02 19:26:14'),
(258, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:27:46', '2019-05-02 19:27:46'),
(259, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:27:54', '2019-05-02 19:27:54'),
(260, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:27:58', '2019-05-02 19:27:58'),
(261, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:03', '2019-05-02 19:28:03'),
(262, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:05', '2019-05-02 19:28:05'),
(263, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:09', '2019-05-02 19:28:09'),
(264, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:57', '2019-05-02 19:28:57'),
(265, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:28:59', '2019-05-02 19:28:59'),
(266, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:41', '2019-05-02 19:29:41'),
(267, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:44', '2019-05-02 19:29:44'),
(268, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:53', '2019-05-02 19:29:53'),
(269, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:29:56', '2019-05-02 19:29:56'),
(270, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-02 19:30:06', '2019-05-02 19:30:06'),
(271, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-02 19:30:07', '2019-05-02 19:30:07'),
(272, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:17', '2019-05-02 19:30:17'),
(273, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:20', '2019-05-02 19:30:20'),
(274, NULL, 1, 'system_admin/modules/Cms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:29', '2019-05-02 19:30:29'),
(275, NULL, 1, 'system_admin/modules/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:33', '2019-05-02 19:30:33'),
(276, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:30:43', '2019-05-02 19:30:43'),
(277, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:31:53', '2019-05-02 19:31:53'),
(278, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:31:55', '2019-05-02 19:31:55'),
(279, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:04', '2019-05-02 19:33:04'),
(280, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:06', '2019-05-02 19:33:06'),
(281, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:09', '2019-05-02 19:33:09'),
(282, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:11', '2019-05-02 19:33:11'),
(283, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:13', '2019-05-02 19:33:13'),
(284, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:15', '2019-05-02 19:33:15'),
(285, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '[]', '2019-05-02 19:33:15', '2019-05-02 19:33:15'),
(286, NULL, 1, 'system_admin/documents/folders', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1556807596316\"}', '2019-05-02 19:33:16', '2019-05-02 19:33:16'),
(287, NULL, 1, 'system_admin/documents/errors', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1556807596317\"}', '2019-05-02 19:33:16', '2019-05-02 19:33:16'),
(288, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596318\"}', '2019-05-02 19:33:17', '2019-05-02 19:33:17'),
(289, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596319\"}', '2019-05-02 19:33:25', '2019-05-02 19:33:25'),
(290, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\\/blogs\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596320\"}', '2019-05-02 19:33:28', '2019-05-02 19:33:28'),
(291, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/website\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596321\"}', '2019-05-02 19:33:31', '2019-05-02 19:33:31'),
(292, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/website\\/banner\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1556807596322\"}', '2019-05-02 19:33:34', '2019-05-02 19:33:34'),
(293, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '[]', '2019-05-02 19:33:38', '2019-05-02 19:33:38'),
(294, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:33:43', '2019-05-02 19:33:43'),
(295, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:34:15', '2019-05-02 19:34:15'),
(296, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:34:18', '2019-05-02 19:34:18'),
(297, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:34:22', '2019-05-02 19:34:22'),
(298, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:35:11', '2019-05-02 19:35:11'),
(299, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:35:18', '2019-05-02 19:35:18'),
(300, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:07', '2019-05-02 19:36:07'),
(301, NULL, 1, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:11', '2019-05-02 19:36:11'),
(302, NULL, 1, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:14', '2019-05-02 19:36:14'),
(303, NULL, 1, 'system_admin/backup_database', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:28', '2019-05-02 19:36:28'),
(304, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:36:59', '2019-05-02 19:36:59'),
(305, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-02 19:37:05', '2019-05-02 19:37:05'),
(306, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 19:37:19', '2019-05-02 19:37:19'),
(307, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 19:37:32', '2019-05-02 19:37:32'),
(308, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-02 20:22:39', '2019-05-02 20:22:39'),
(309, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 20:22:41', '2019-05-02 20:22:41'),
(310, NULL, 1, 'system_admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"mahmoud\",\"name\":\"mahmoud\",\"password\":\"4715192\",\"password_confirmation\":\"4715192\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"Suyiy8cDvxQfgpm4PZqH7tLM1S39u81JDbsFUJkC\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/auth\\/users\"}', '2019-05-02 20:23:08', '2019-05-02 20:23:08'),
(311, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-02 20:23:09', '2019-05-02 20:23:09'),
(312, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:14:42', '2019-05-02 22:14:42'),
(313, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:16:22', '2019-05-02 22:16:22'),
(314, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:16:37', '2019-05-02 22:16:37'),
(315, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:18:48', '2019-05-02 22:18:48'),
(316, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:18:58', '2019-05-02 22:18:58'),
(317, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:21:03', '2019-05-02 22:21:03'),
(318, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:21:43', '2019-05-02 22:21:43'),
(319, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:22:00', '2019-05-02 22:22:00'),
(320, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:26:05', '2019-05-02 22:26:05'),
(321, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:37:21', '2019-05-02 22:37:21'),
(322, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:38:32', '2019-05-02 22:38:32'),
(323, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:39:05', '2019-05-02 22:39:05'),
(324, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:39:16', '2019-05-02 22:39:16'),
(325, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:39:57', '2019-05-02 22:39:57'),
(326, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:40:23', '2019-05-02 22:40:23'),
(327, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:40:52', '2019-05-02 22:40:52'),
(328, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:41:50', '2019-05-02 22:41:50'),
(329, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:48:58', '2019-05-02 22:48:58'),
(330, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 22:49:19', '2019-05-02 22:49:19'),
(331, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:30:23', '2019-05-02 23:30:23'),
(332, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:30:27', '2019-05-02 23:30:27'),
(333, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:31:53', '2019-05-02 23:31:53'),
(334, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:34:01', '2019-05-02 23:34:01'),
(335, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:40:51', '2019-05-02 23:40:51'),
(336, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:41:13', '2019-05-02 23:41:13'),
(337, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:42:48', '2019-05-02 23:42:48'),
(338, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:43:39', '2019-05-02 23:43:39'),
(339, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-02 23:43:56', '2019-05-02 23:43:56'),
(340, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 14:10:26', '2019-05-03 14:10:26'),
(341, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-03 19:20:56', '2019-05-03 19:20:56'),
(342, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-03 19:22:53', '2019-05-03 19:22:53'),
(343, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:43:23', '2019-05-03 19:43:23'),
(344, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:43:45', '2019-05-03 19:43:45'),
(345, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:44:11', '2019-05-03 19:44:11'),
(346, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:44:19', '2019-05-03 19:44:19'),
(347, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:45:42', '2019-05-03 19:45:42'),
(348, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:45:44', '2019-05-03 19:45:44'),
(349, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:45:51', '2019-05-03 19:45:51'),
(350, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:46:01', '2019-05-03 19:46:01'),
(351, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:46:38', '2019-05-03 19:46:38'),
(352, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 19:47:45', '2019-05-03 19:47:45'),
(353, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 20:12:18', '2019-05-03 20:12:18'),
(354, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-03 20:12:34', '2019-05-03 20:12:34'),
(355, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-03 20:12:49', '2019-05-03 20:12:49'),
(356, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-03 20:12:51', '2019-05-03 20:12:51'),
(357, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:12:55', '2019-05-03 20:12:55'),
(358, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:15:35', '2019-05-03 20:15:35'),
(359, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:16:44', '2019-05-03 20:16:44'),
(360, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:18:11', '2019-05-03 20:18:11'),
(361, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:19:15', '2019-05-03 20:19:15'),
(362, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:19:32', '2019-05-03 20:19:32'),
(363, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:19:52', '2019-05-03 20:19:52'),
(364, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-03 20:21:53', '2019-05-03 20:21:53'),
(365, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 21:37:31', '2019-05-04 21:37:31'),
(366, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 21:38:17', '2019-05-04 21:38:17'),
(367, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:28:10', '2019-05-04 22:28:10'),
(368, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:44:59', '2019-05-04 22:44:59'),
(369, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:53:48', '2019-05-04 22:53:48'),
(370, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:54:18', '2019-05-04 22:54:18'),
(371, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:54:57', '2019-05-04 22:54:57'),
(372, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-04 22:55:04', '2019-05-04 22:55:04'),
(373, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-04 22:55:10', '2019-05-04 22:55:10'),
(374, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 22:55:13', '2019-05-04 22:55:13'),
(375, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:30:43', '2019-05-04 23:30:43'),
(376, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:30:55', '2019-05-04 23:30:55'),
(377, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:31:11', '2019-05-04 23:31:11'),
(378, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:34:32', '2019-05-04 23:34:32'),
(379, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:34:45', '2019-05-04 23:34:45'),
(380, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:40:44', '2019-05-04 23:40:44'),
(381, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:49:26', '2019-05-04 23:49:26');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(382, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:49:41', '2019-05-04 23:49:41'),
(383, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:50:37', '2019-05-04 23:50:37'),
(384, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:50:50', '2019-05-04 23:50:50'),
(385, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:52:35', '2019-05-04 23:52:35'),
(386, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:53:01', '2019-05-04 23:53:01'),
(387, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:55:36', '2019-05-04 23:55:36'),
(388, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-04 23:55:51', '2019-05-04 23:55:51'),
(389, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-04 23:55:54', '2019-05-04 23:55:54'),
(390, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-04 23:59:40', '2019-05-04 23:59:40'),
(391, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-05 01:02:57', '2019-05-05 01:02:57'),
(392, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:03:08', '2019-05-05 01:03:08'),
(393, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:04:02', '2019-05-05 01:04:02'),
(394, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:06:46', '2019-05-05 01:06:46'),
(395, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:07:04', '2019-05-05 01:07:04'),
(396, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:07:29', '2019-05-05 01:07:29'),
(397, NULL, 1, 'system_admin/shop_category', 'POST', '127.0.0.1', '{\"en__name\":\"cat1\",\"en__keyword\":\"cat1 keyword\",\"en__description\":\"cat1 description\",\"parent\":\"0\",\"sort\":\"0\",\"top\":\"off\",\"status\":\"on\",\"_token\":\"vVH33tJFrKCj6tCflM0WSsm7aR5qSXOxKV9VPX8O\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/shop_category\"}', '2019-05-05 01:09:29', '2019-05-05 01:09:29'),
(398, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-05 01:09:31', '2019-05-05 01:09:31'),
(399, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:11:55', '2019-05-05 01:11:55'),
(400, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:11:57', '2019-05-05 01:11:57'),
(401, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"meg\",\"sku\":null}', '2019-05-05 01:12:32', '2019-05-05 01:12:32'),
(402, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null}', '2019-05-05 01:12:36', '2019-05-05 01:12:36'),
(403, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null}', '2019-05-05 01:12:48', '2019-05-05 01:12:48'),
(404, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"polo x\",\"sku\":null}', '2019-05-05 01:12:57', '2019-05-05 01:12:57'),
(405, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null}', '2019-05-05 01:13:01', '2019-05-05 01:13:01'),
(406, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:13:06', '2019-05-05 01:13:06'),
(407, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:18:26', '2019-05-05 01:18:26'),
(408, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"en__name\":\"prod1\",\"en__keyword\":\"prod1 keyword\",\"en__description\":\"prod1 desc\",\"en__content\":\"prod 1 long data\",\"category_id\":\"19\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":null,\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"vVH33tJFrKCj6tCflM0WSsm7aR5qSXOxKV9VPX8O\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/shop_product?&name=polo+&sku=\"}', '2019-05-05 01:20:30', '2019-05-05 01:20:30'),
(409, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:20:30', '2019-05-05 01:20:30'),
(410, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"en__name\":\"prod1\",\"en__keyword\":\"prod1 keyword\",\"en__description\":\"prod1 desc\",\"en__content\":\"prod 1 long data\",\"category_id\":\"19\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"vVH33tJFrKCj6tCflM0WSsm7aR5qSXOxKV9VPX8O\"}', '2019-05-05 01:20:50', '2019-05-05 01:20:50'),
(411, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2019-05-05 01:20:51', '2019-05-05 01:20:51'),
(412, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 01:22:29', '2019-05-05 01:22:29'),
(413, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-05 01:25:42', '2019-05-05 01:25:42'),
(414, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 01:25:55', '2019-05-05 01:25:55'),
(415, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 01:25:58', '2019-05-05 01:25:58'),
(416, NULL, 1, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:01:17', '2019-05-05 03:01:17'),
(417, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:01:38', '2019-05-05 03:01:38'),
(418, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:01:54', '2019-05-05 03:01:54'),
(419, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:02:01', '2019-05-05 03:02:01'),
(420, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:03:36', '2019-05-05 03:03:36'),
(421, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-05 03:04:11', '2019-05-05 03:04:11'),
(422, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:04:18', '2019-05-05 03:04:18'),
(423, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:04:31', '2019-05-05 03:04:31'),
(424, NULL, 1, 'system_admin/shop_special_price/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:04:41', '2019-05-05 03:04:41'),
(425, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2019-05-05 03:04:43', '2019-05-05 03:04:43'),
(426, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:52:23', '2019-05-05 03:52:23'),
(427, NULL, 1, 'system_admin/shop_special_price/create', 'GET', '127.0.0.1', '[]', '2019-05-05 03:52:25', '2019-05-05 03:52:25'),
(428, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2019-05-05 03:52:26', '2019-05-05 03:52:26'),
(429, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:52:39', '2019-05-05 03:52:39'),
(430, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 03:52:43', '2019-05-05 03:52:43'),
(431, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 03:52:47', '2019-05-05 03:52:47'),
(432, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:23:41', '2019-05-05 04:23:41'),
(433, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:24:24', '2019-05-05 04:24:24'),
(434, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:24:32', '2019-05-05 04:24:32'),
(435, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:32:52', '2019-05-05 04:32:52'),
(436, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:36:07', '2019-05-05 04:36:07'),
(437, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:37:08', '2019-05-05 04:37:08'),
(438, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-05 04:38:03', '2019-05-05 04:38:03'),
(439, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 04:39:15', '2019-05-05 04:39:15'),
(440, NULL, 1, 'system_admin/shop_vendor/create', 'GET', '127.0.0.1', '[]', '2019-05-05 04:39:21', '2019-05-05 04:39:21'),
(441, NULL, 1, 'system_admin/shop_vendor/create', 'GET', '127.0.0.1', '[]', '2019-05-05 04:41:46', '2019-05-05 04:41:46'),
(442, NULL, 1, 'system_admin/shop_vendor', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"phone\":\"1142931228\",\"address\":\"caru egt\",\"sort\":\"0\",\"_token\":\"kRMdQc73J6P0utcHNVWtjAB9ZN8SP9T4iWj2SuGZ\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_vendor\"}', '2019-05-05 04:42:27', '2019-05-05 04:42:27'),
(443, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '[]', '2019-05-05 04:42:28', '2019-05-05 04:42:28'),
(444, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 04:42:54', '2019-05-05 04:42:54'),
(445, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-05 05:02:43', '2019-05-05 05:02:43'),
(446, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2019-05-05 05:03:07', '2019-05-05 05:03:07'),
(447, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:07:38', '2019-05-07 02:07:38'),
(448, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:08:29', '2019-05-07 02:08:29'),
(449, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:11', '2019-05-07 02:09:11'),
(450, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:25', '2019-05-07 02:09:25'),
(451, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:28', '2019-05-07 02:09:28'),
(452, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:09:36', '2019-05-07 02:09:36'),
(453, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:19:06', '2019-05-07 02:19:06'),
(454, NULL, 1, 'system_admin/shop_attribute_group', 'POST', '127.0.0.1', '{\"name\":\"\\u062f\\u0647\\u0628\\u064a\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"radio\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_attribute_group\"}', '2019-05-07 02:21:39', '2019-05-07 02:21:39'),
(455, NULL, 1, 'system_admin/shop_attribute_group/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-07 02:21:40', '2019-05-07 02:21:40'),
(456, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:22:08', '2019-05-07 02:22:08'),
(457, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:22:30', '2019-05-07 02:22:30'),
(458, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-07 02:22:38', '2019-05-07 02:22:38'),
(459, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:24:10', '2019-05-07 02:24:10'),
(460, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:24:27', '2019-05-07 02:24:27'),
(461, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:34:45', '2019-05-07 02:34:45'),
(462, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:49:44', '2019-05-07 02:49:44'),
(463, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:50:04', '2019-05-07 02:50:04'),
(464, NULL, 1, 'system_admin/layout/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:50:09', '2019-05-07 02:50:09'),
(465, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:50:36', '2019-05-07 02:50:36'),
(466, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:51:19', '2019-05-07 02:51:19'),
(467, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:51:24', '2019-05-07 02:51:24'),
(468, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 02:51:30', '2019-05-07 02:51:30'),
(469, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 02:51:34', '2019-05-07 02:51:34'),
(470, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud customer\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":null,\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_customer\"}', '2019-05-07 03:02:14', '2019-05-07 03:02:14'),
(471, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:02:15', '2019-05-07 03:02:15'),
(472, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:10:12', '2019-05-07 03:10:12'),
(473, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":null,\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_customer\"}', '2019-05-07 03:10:17', '2019-05-07 03:10:17'),
(474, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:10:18', '2019-05-07 03:10:18'),
(475, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\".f\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:10:41', '2019-05-07 03:10:41'),
(476, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:10:42', '2019-05-07 03:10:42'),
(477, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\".f\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:13:48', '2019-05-07 03:13:48'),
(478, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:13:49', '2019-05-07 03:13:49'),
(479, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\".f\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:15:02', '2019-05-07 03:15:02'),
(480, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:15:02', '2019-05-07 03:15:02'),
(481, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\"123456\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:15:28', '2019-05-07 03:15:28'),
(482, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:15:29', '2019-05-07 03:15:29'),
(483, NULL, 1, 'system_admin/shop_customer', 'POST', '127.0.0.1', '{\"name\":\"mahmoud\",\"email\":\"ms_ms25490@yahoo.com\",\"password\":\"123456\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 03:41:09', '2019-05-07 03:41:09'),
(484, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-07 03:41:09', '2019-05-07 03:41:09'),
(485, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 03:59:08', '2019-05-07 03:59:08'),
(486, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:59:13', '2019-05-07 03:59:13'),
(487, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"new\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order_status\"}', '2019-05-07 03:59:21', '2019-05-07 03:59:21'),
(488, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 03:59:22', '2019-05-07 03:59:22'),
(489, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"new\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\"}', '2019-05-07 04:02:56', '2019-05-07 04:02:56'),
(490, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '[]', '2019-05-07 04:02:56', '2019-05-07 04:02:56'),
(491, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:03:02', '2019-05-07 04:03:02'),
(492, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"processing\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order_status\"}', '2019-05-07 04:03:11', '2019-05-07 04:03:11'),
(493, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:03:11', '2019-05-07 04:03:11'),
(494, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"done\",\"_token\":\"r9KWXM3lOpdP4WELwSE1fxyLTeldL8HMiWIJZejR\",\"after-save\":\"2\"}', '2019-05-07 04:03:15', '2019-05-07 04:03:15'),
(495, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:03:15', '2019-05-07 04:03:15'),
(496, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:04:05', '2019-05-07 04:04:05'),
(497, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:04:07', '2019-05-07 04:04:07'),
(498, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:04:19', '2019-05-07 04:04:19'),
(499, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:04:28', '2019-05-07 04:04:28'),
(500, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:04:30', '2019-05-07 04:04:30'),
(501, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:05:24', '2019-05-07 04:05:24'),
(502, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:06:33', '2019-05-07 04:06:33'),
(503, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:10:53', '2019-05-07 04:10:53'),
(504, NULL, 1, 'system_admin/get_info/userInfo', 'GET', '127.0.0.1', '{\"id\":\"1\"}', '2019-05-07 04:10:56', '2019-05-07 04:10:56'),
(505, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:17:10', '2019-05-07 04:17:10'),
(506, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:24:47', '2019-05-07 04:24:47'),
(507, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:25:14', '2019-05-07 04:25:14'),
(508, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:25:18', '2019-05-07 04:25:18'),
(509, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:25:31', '2019-05-07 04:25:31'),
(510, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Cash\"}', '2019-05-07 04:25:36', '2019-05-07 04:25:36'),
(511, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '[]', '2019-05-07 04:25:40', '2019-05-07 04:25:40'),
(512, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:25:57', '2019-05-07 04:25:57'),
(513, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingStandard\"}', '2019-05-07 04:26:09', '2019-05-07 04:26:09'),
(514, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:26:34', '2019-05-07 04:26:34'),
(515, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:26:35', '2019-05-07 04:26:35'),
(516, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:27:38', '2019-05-07 04:27:38'),
(517, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-07 04:27:39', '2019-05-07 04:27:39'),
(518, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-07 04:27:45', '2019-05-07 04:27:45'),
(519, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-08 01:24:39', '2019-05-08 01:24:39'),
(520, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 01:25:18', '2019-05-08 01:25:18'),
(521, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:25:22', '2019-05-08 01:25:22'),
(522, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:31:10', '2019-05-08 01:31:10'),
(523, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-08 01:32:07', '2019-05-08 01:32:07'),
(524, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 01:32:11', '2019-05-08 01:32:11'),
(525, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-08 01:32:45', '2019-05-08 01:32:45'),
(526, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 01:33:03', '2019-05-08 01:33:03'),
(527, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:41:01', '2019-05-08 01:41:01'),
(528, NULL, 1, 'system_admin/get_info/userInfo', 'GET', '127.0.0.1', '{\"id\":\"1\"}', '2019-05-08 01:41:07', '2019-05-08 01:41:07'),
(529, NULL, 1, 'system_admin/shop_order', 'POST', '127.0.0.1', '{\"user_id\":\"1\",\"toname\":\"mahmoud\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228_\",\"currency\":\"EGP\",\"exchange_rate\":\"1\",\"comment\":null,\"status\":\"6\",\"email\":null,\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order\"}', '2019-05-08 01:41:22', '2019-05-08 01:41:22'),
(530, NULL, 1, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2019-05-08 01:41:22', '2019-05-08 01:41:22'),
(531, NULL, 1, 'system_admin/shop_order', 'POST', '127.0.0.1', '{\"user_id\":\"1\",\"toname\":\"mahmoud\",\"address1\":\"caru egt\",\"address2\":null,\"phone\":\"1142931228_\",\"currency\":\"EGP\",\"exchange_rate\":\"1\",\"comment\":null,\"status\":\"6\",\"email\":null,\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\"}', '2019-05-08 01:43:09', '2019-05-08 01:43:09'),
(532, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 01:43:10', '2019-05-08 01:43:10'),
(533, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:43:21', '2019-05-08 01:43:21'),
(534, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:53:10', '2019-05-08 01:53:10'),
(535, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:54:41', '2019-05-08 01:54:41'),
(536, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 01:55:40', '2019-05-08 01:55:40'),
(537, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:12:33', '2019-05-08 02:12:33'),
(538, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:14:12', '2019-05-08 02:14:12'),
(539, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:14:44', '2019-05-08 02:14:44'),
(540, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:19:29', '2019-05-08 02:19:29'),
(541, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:19:52', '2019-05-08 02:19:52'),
(542, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:20:17', '2019-05-08 02:20:17'),
(543, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:20:40', '2019-05-08 02:20:40'),
(544, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:21:20', '2019-05-08 02:21:20'),
(545, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"7\",\"pk\":\"4\",\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-08 02:21:25', '2019-05-08 02:21:25'),
(546, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:21:34', '2019-05-08 02:21:34'),
(547, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:21:51', '2019-05-08 02:21:51'),
(548, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:04', '2019-05-08 02:22:04'),
(549, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:13', '2019-05-08 02:22:13'),
(550, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:22:18', '2019-05-08 02:22:18'),
(551, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:21', '2019-05-08 02:22:21'),
(552, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:26', '2019-05-08 02:22:26'),
(553, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-08 02:22:44', '2019-05-08 02:22:44'),
(554, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:22:50', '2019-05-08 02:22:50'),
(555, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:24:30', '2019-05-08 02:24:30'),
(556, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_columns_\":\"id,email,subtotal,shipping,discount,total,received,payment_method,currency,exchange_rate,created_at\",\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:24:53', '2019-05-08 02:24:53'),
(557, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:25:00', '2019-05-08 02:25:00'),
(558, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:25:23', '2019-05-08 02:25:23'),
(559, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:25:52', '2019-05-08 02:25:52'),
(560, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:26:14', '2019-05-08 02:26:14'),
(561, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 02:26:41', '2019-05-08 02:26:41'),
(562, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:26:44', '2019-05-08 02:26:44'),
(563, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:27:58', '2019-05-08 02:27:58'),
(564, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:29:06', '2019-05-08 02:29:06'),
(565, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:29:51', '2019-05-08 02:29:51'),
(566, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-08 02:30:20', '2019-05-08 02:30:20'),
(567, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-08 02:32:06', '2019-05-08 02:32:06'),
(568, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:32:17', '2019-05-08 02:32:17'),
(569, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:35:46', '2019-05-08 02:35:46'),
(570, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:46:49', '2019-05-08 02:46:49'),
(571, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"50\"}', '2019-05-08 02:46:59', '2019-05-08 02:46:59'),
(572, NULL, 1, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"add_order\":\"4\",\"add_id\":\"50\",\"add_qty\":\"1\",\"add_price\":\"200\"}', '2019-05-08 02:47:00', '2019-05-08 02:47:00'),
(573, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 02:47:05', '2019-05-08 02:47:05'),
(574, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"3\"}', '2019-05-08 02:47:25', '2019-05-08 02:47:25'),
(575, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:47:38', '2019-05-08 02:47:38'),
(576, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 02:47:41', '2019-05-08 02:47:41'),
(577, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:05:19', '2019-05-08 03:05:19'),
(578, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:05:48', '2019-05-08 03:05:48'),
(579, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:03', '2019-05-08 03:06:03'),
(580, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:26', '2019-05-08 03:06:26'),
(581, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:33', '2019-05-08 03:06:33'),
(582, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:50', '2019-05-08 03:06:50'),
(583, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:55', '2019-05-08 03:06:55'),
(584, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:06:58', '2019-05-08 03:06:58'),
(585, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:07:13', '2019-05-08 03:07:13'),
(586, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:07:26', '2019-05-08 03:07:26'),
(587, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:07:42', '2019-05-08 03:07:42'),
(588, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:08:52', '2019-05-08 03:08:52'),
(589, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 03:09:03', '2019-05-08 03:09:03'),
(590, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-08 03:09:05', '2019-05-08 03:09:05'),
(591, NULL, 1, 'system_admin/shop_order_status', 'POST', '127.0.0.1', '{\"name\":\"Hold\",\"_token\":\"aITYGUhf5qeumJ88EWXJOk4P0VLKQbmA7kv1saXI\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_order_status\"}', '2019-05-08 03:09:13', '2019-05-08 03:09:13'),
(592, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '[]', '2019-05-08 03:09:13', '2019-05-08 03:09:13'),
(593, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-08 03:09:40', '2019-05-08 03:09:40'),
(594, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:09:44', '2019-05-08 03:09:44'),
(595, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:00', '2019-05-08 03:10:00'),
(596, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:09', '2019-05-08 03:10:09'),
(597, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:17', '2019-05-08 03:10:17'),
(598, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:28', '2019-05-08 03:10:28'),
(599, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-08 03:10:38', '2019-05-08 03:10:38'),
(600, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:14:13', '2019-05-08 03:14:13'),
(601, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-08 03:15:11', '2019-05-08 03:15:11'),
(602, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-09 01:11:21', '2019-05-09 01:11:21'),
(603, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"6\",\"pk\":\"4\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 01:58:14', '2019-05-09 01:58:14'),
(604, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:21', '2019-05-09 01:58:21'),
(605, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:21', '2019-05-09 01:58:21'),
(606, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:26', '2019-05-09 01:58:26'),
(607, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:36', '2019-05-09 01:58:36'),
(608, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 01:58:46', '2019-05-09 01:58:46'),
(609, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 01:58:54', '2019-05-09 01:58:54'),
(610, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-09 01:59:09', '2019-05-09 01:59:09'),
(611, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"7\",\"pk\":\"4\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 01:59:16', '2019-05-09 01:59:16'),
(612, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 01:59:17', '2019-05-09 01:59:17'),
(613, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 01:59:44', '2019-05-09 01:59:44'),
(614, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 01:59:57', '2019-05-09 01:59:57'),
(615, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-09 01:59:59', '2019-05-09 01:59:59'),
(616, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"9\",\"pk\":\"4\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 02:00:07', '2019-05-09 02:00:07'),
(617, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 02:00:09', '2019-05-09 02:00:09'),
(618, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:00:21', '2019-05-09 02:00:21'),
(619, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-09 02:00:24', '2019-05-09 02:00:24'),
(620, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:01:06', '2019-05-09 02:01:06'),
(621, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:10:50', '2019-05-09 02:10:50'),
(622, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:10:58', '2019-05-09 02:10:58'),
(623, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 02:11:12', '2019-05-09 02:11:12'),
(624, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:13:48', '2019-05-09 02:13:48'),
(625, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:14:00', '2019-05-09 02:14:00'),
(626, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-05-09 02:14:16', '2019-05-09 02:14:16'),
(627, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-05-09 02:14:18', '2019-05-09 02:14:18'),
(628, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"desc\"}}', '2019-05-09 02:14:24', '2019-05-09 02:14:24'),
(629, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-05-09 02:14:27', '2019-05-09 02:14:27'),
(630, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-05-09 02:14:33', '2019-05-09 02:14:33'),
(631, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:14:59', '2019-05-09 02:14:59'),
(632, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:15:37', '2019-05-09 02:15:37'),
(633, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:15:43', '2019-05-09 02:15:43'),
(634, NULL, 1, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2019-05-09 02:15:48', '2019-05-09 02:15:48'),
(635, NULL, 1, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"shipping_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"tE9ogdXpwi0Qvj6pyC4qfFExITDyfjOapRDgL6hf\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2019-05-09 02:17:09', '2019-05-09 02:17:09'),
(636, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-09 02:17:11', '2019-05-09 02:17:11'),
(637, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:06', '2019-05-09 02:19:06'),
(638, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-09 02:19:11', '2019-05-09 02:19:11'),
(639, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:18', '2019-05-09 02:19:18'),
(640, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:34', '2019-05-09 02:19:34'),
(641, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:35', '2019-05-09 02:19:35'),
(642, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:37', '2019-05-09 02:19:37'),
(643, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:19:47', '2019-05-09 02:19:47'),
(644, NULL, 1, 'system_admin/modules/api/shop_api/create', 'GET', '127.0.0.1', '[]', '2019-05-09 02:19:59', '2019-05-09 02:19:59'),
(645, NULL, 1, 'system_admin/modules/api/shop_api', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 02:21:13', '2019-05-09 02:21:13'),
(646, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-10 23:03:47', '2019-05-10 23:03:47'),
(647, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-05-11 02:11:25', '2019-05-11 02:11:25'),
(648, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:11:32', '2019-05-11 02:11:32'),
(649, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:11:35', '2019-05-11 02:11:35'),
(650, NULL, 1, 'system_admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-05-11 02:11:39', '2019-05-11 02:11:39'),
(651, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:12:06', '2019-05-11 02:12:06'),
(652, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-11 02:12:22', '2019-05-11 02:12:22'),
(653, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:18:05', '2019-05-11 02:18:05'),
(654, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:18:24', '2019-05-11 02:18:24'),
(655, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-11 02:18:27', '2019-05-11 02:18:27'),
(656, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 02:19:09', '2019-05-11 02:19:09'),
(657, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 02:19:13', '2019-05-11 02:19:13'),
(658, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:24:01', '2019-05-11 04:24:01'),
(659, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:27:04', '2019-05-11 04:27:04'),
(660, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:37:00', '2019-05-11 04:37:00'),
(661, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:39:02', '2019-05-11 04:39:02'),
(662, NULL, 1, 'system_admin/shop_customer/create', 'GET', '127.0.0.1', '[]', '2019-05-11 04:40:45', '2019-05-11 04:40:45'),
(663, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 22:06:03', '2019-05-11 22:06:03'),
(664, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:06:29', '2019-05-11 22:06:29'),
(665, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-11 22:44:01', '2019-05-11 22:44:01'),
(666, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:44:06', '2019-05-11 22:44:06'),
(667, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:04', '2019-05-11 22:47:04'),
(668, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:29', '2019-05-11 22:47:29'),
(669, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:52', '2019-05-11 22:47:52'),
(670, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:47:53', '2019-05-11 22:47:53'),
(671, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:48:09', '2019-05-11 22:48:09'),
(672, NULL, 1, 'system_admin/language/create', 'GET', '127.0.0.1', '[]', '2019-05-11 22:48:11', '2019-05-11 22:48:11'),
(673, NULL, 1, 'system_admin/language', 'POST', '127.0.0.1', '{\"name\":\"arabic\",\"code\":\"ar\",\"status\":\"on\",\"sort\":\"1\",\"_token\":\"i6VpF8ovuC9azurxYg7seuszVboE8YldseOoGjXS\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/language\"}', '2019-05-11 22:48:54', '2019-05-11 22:48:54'),
(674, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '[]', '2019-05-11 22:48:55', '2019-05-11 22:48:55'),
(675, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:49:16', '2019-05-11 22:49:16'),
(676, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:49:20', '2019-05-11 22:49:20'),
(677, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:49:55', '2019-05-11 22:49:55'),
(678, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:50:11', '2019-05-11 22:50:11'),
(679, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:50:16', '2019-05-11 22:50:16'),
(680, NULL, 1, 'system_admin/language/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-11 22:50:27', '2019-05-11 22:50:27'),
(681, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:50:52', '2019-05-11 22:50:52'),
(682, NULL, 1, 'system_admin/language/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-11 22:50:56', '2019-05-11 22:50:56'),
(683, NULL, 1, 'system_admin/language/3', 'PUT', '127.0.0.1', '{\"name\":\"arabic\",\"code\":\"ar\",\"status\":\"on\",\"sort\":\"2\",\"_token\":\"i6VpF8ovuC9azurxYg7seuszVboE8YldseOoGjXS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/language\"}', '2019-05-11 22:51:07', '2019-05-11 22:51:07'),
(684, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '[]', '2019-05-11 22:51:07', '2019-05-11 22:51:07'),
(685, NULL, 1, 'system_admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-05-11 22:51:18', '2019-05-11 22:51:18'),
(686, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:51:43', '2019-05-11 22:51:43'),
(687, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:52:22', '2019-05-11 22:52:22'),
(688, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:52:42', '2019-05-11 22:52:42'),
(689, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:56:36', '2019-05-11 22:56:36'),
(690, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-11 22:57:05', '2019-05-11 22:57:05'),
(691, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"en__title\":\"souqVIS\",\"en__keyword\":null,\"en__description\":\"easy to sell and buy\",\"vi__title\":\"souqVIS\",\"vi__keyword\":null,\"vi__description\":\"easy to sell\",\"ar__title\":\"Souq\",\"ar__keyword\":\"ar\",\"ar__description\":null,\"phone\":\"0123456789\",\"long_phone\":\"Support: 0987654321\",\"time_active\":null,\"address\":\"123st - abc - xyz\",\"email\":\"admin@admin.com\",\"locale\":\"ar\",\"currency\":\"EGP\",\"_token\":\"i6VpF8ovuC9azurxYg7seuszVboE8YldseOoGjXS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/config_global\"}', '2019-05-11 22:58:05', '2019-05-11 22:58:05'),
(692, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2019-05-11 22:58:07', '2019-05-11 22:58:07'),
(693, NULL, 1, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:58:38', '2019-05-11 22:58:38'),
(694, NULL, 1, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-11 22:59:08', '2019-05-11 22:59:08'),
(695, NULL, 1, 'system_admin/currencies', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:00', '2019-05-11 23:05:00'),
(696, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:19', '2019-05-11 23:05:19'),
(697, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:31', '2019-05-11 23:05:31'),
(698, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:31', '2019-05-11 23:05:31'),
(699, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-11 23:05:43', '2019-05-11 23:05:43'),
(700, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-12 03:29:03', '2019-05-12 03:29:03'),
(701, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-12 03:29:04', '2019-05-12 03:29:04'),
(702, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:29:04', '2019-05-12 03:29:04'),
(703, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:41:36', '2019-05-12 03:41:36'),
(704, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:43:06', '2019-05-12 03:43:06'),
(705, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 03:51:58', '2019-05-12 03:51:58'),
(706, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:24:45', '2019-05-12 04:24:45'),
(707, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:25:24', '2019-05-12 04:25:24'),
(708, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:25:43', '2019-05-12 04:25:43'),
(709, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:27:07', '2019-05-12 04:27:07'),
(710, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:27:25', '2019-05-12 04:27:25'),
(711, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:27:46', '2019-05-12 04:27:46'),
(712, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:52:02', '2019-05-12 04:52:02'),
(713, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:55:37', '2019-05-12 04:55:37'),
(714, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:56:44', '2019-05-12 04:56:44'),
(715, NULL, 1, 'system_admin/locale/en', 'GET', '127.0.0.1', '[]', '2019-05-12 04:56:51', '2019-05-12 04:56:51'),
(716, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:56:51', '2019-05-12 04:56:51'),
(717, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:57:09', '2019-05-12 04:57:09'),
(718, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 04:59:37', '2019-05-12 04:59:37'),
(719, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:03:37', '2019-05-12 05:03:37');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(720, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:04:35', '2019-05-12 05:04:35'),
(721, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:05:46', '2019-05-12 05:05:46'),
(722, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-12 05:06:11', '2019-05-12 05:06:11'),
(723, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:05:37', '2019-05-13 03:05:37'),
(724, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:06:21', '2019-05-13 03:06:21'),
(725, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:06:25', '2019-05-13 03:06:25'),
(726, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:06:44', '2019-05-13 03:06:44'),
(727, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:07:47', '2019-05-13 03:07:47'),
(728, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:25:22', '2019-05-13 03:25:22'),
(729, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-13 03:26:07', '2019-05-13 03:26:07'),
(730, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-17 19:43:58', '2019-05-17 19:43:58'),
(731, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-17 19:44:38', '2019-05-17 19:44:38'),
(732, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-17 19:45:04', '2019-05-17 19:45:04'),
(733, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 02:42:06', '2019-05-18 02:42:06'),
(734, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:42:25', '2019-05-18 02:42:25'),
(735, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:42:31', '2019-05-18 02:42:31'),
(736, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:42:40', '2019-05-18 02:42:40'),
(737, NULL, 1, 'system_admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2019-05-18 02:43:04', '2019-05-18 02:43:04'),
(738, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:43:29', '2019-05-18 02:43:29'),
(739, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:43:31', '2019-05-18 02:43:31'),
(740, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:43:37', '2019-05-18 02:43:37'),
(741, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 02:44:37', '2019-05-18 02:44:37'),
(742, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 02:45:30', '2019-05-18 02:45:30'),
(743, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 02:47:12', '2019-05-18 02:47:12'),
(744, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:47:50', '2019-05-18 02:47:50'),
(745, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:47:52', '2019-05-18 02:47:52'),
(746, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:47:58', '2019-05-18 02:47:58'),
(747, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 02:48:03', '2019-05-18 02:48:03'),
(748, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:31:01', '2019-05-18 04:31:01'),
(749, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:31:15', '2019-05-18 04:31:15'),
(750, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:31:22', '2019-05-18 04:31:22'),
(751, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:32:07', '2019-05-18 04:32:07'),
(752, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:48:21', '2019-05-18 04:48:21'),
(753, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 04:48:26', '2019-05-18 04:48:26'),
(754, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 05:01:36', '2019-05-18 05:01:36'),
(755, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 05:01:45', '2019-05-18 05:01:45'),
(756, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-18 13:46:50', '2019-05-18 13:46:50'),
(757, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:35', '2019-05-18 14:32:35'),
(758, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:38', '2019-05-18 14:32:38'),
(759, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:51', '2019-05-18 14:32:51'),
(760, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:55', '2019-05-18 14:32:55'),
(761, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 14:32:58', '2019-05-18 14:32:58'),
(762, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 14:39:54', '2019-05-18 14:39:54'),
(763, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:38:17', '2019-05-18 15:38:17'),
(764, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:39:19', '2019-05-18 15:39:19'),
(765, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:39:22', '2019-05-18 15:39:22'),
(766, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:42:51', '2019-05-18 15:42:51'),
(767, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:44:51', '2019-05-18 15:44:51'),
(768, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:45:28', '2019-05-18 15:45:28'),
(769, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:45:51', '2019-05-18 15:45:51'),
(770, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:54:45', '2019-05-18 15:54:45'),
(771, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:55:40', '2019-05-18 15:55:40'),
(772, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:56:19', '2019-05-18 15:56:19'),
(773, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:56:25', '2019-05-18 15:56:25'),
(774, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:56:54', '2019-05-18 15:56:54'),
(775, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:57:30', '2019-05-18 15:57:30'),
(776, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 15:59:55', '2019-05-18 15:59:55'),
(777, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:00:10', '2019-05-18 16:00:10'),
(778, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:03:46', '2019-05-18 16:03:46'),
(779, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:05:55', '2019-05-18 16:05:55'),
(780, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:05:58', '2019-05-18 16:05:58'),
(781, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:07:35', '2019-05-18 16:07:35'),
(782, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:08:12', '2019-05-18 16:08:12'),
(783, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:12:54', '2019-05-18 16:12:54'),
(784, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:14:53', '2019-05-18 16:14:53'),
(785, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:15:32', '2019-05-18 16:15:32'),
(786, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:22:58', '2019-05-18 16:22:58'),
(787, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:28:08', '2019-05-18 16:28:08'),
(788, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:35:49', '2019-05-18 16:35:49'),
(789, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:46:14', '2019-05-18 16:46:14'),
(790, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:48:10', '2019-05-18 16:48:10'),
(791, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-18 16:51:04', '2019-05-18 16:51:04'),
(792, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-18 16:53:50', '2019-05-18 16:53:50'),
(793, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":null,\"_pjax\":\"#pjax-container\"}', '2019-05-18 16:53:59', '2019-05-18 16:53:59'),
(794, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-18 16:54:04', '2019-05-18 16:54:04'),
(795, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 16:55:38', '2019-05-18 16:55:38'),
(796, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 17:00:25', '2019-05-18 17:00:25'),
(797, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 17:03:14', '2019-05-18 17:03:14'),
(798, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:10:49', '2019-05-18 17:10:49'),
(799, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:10:54', '2019-05-18 17:10:54'),
(800, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 17:21:47', '2019-05-18 17:21:47'),
(801, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:28:33', '2019-05-18 17:28:33'),
(802, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:28:37', '2019-05-18 17:28:37'),
(803, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:29:30', '2019-05-18 17:29:30'),
(804, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 17:33:24', '2019-05-18 17:33:24'),
(805, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-18 17:38:42', '2019-05-18 17:38:42'),
(806, NULL, 1, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:40:08', '2019-05-18 17:40:08'),
(807, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:40:32', '2019-05-18 17:40:32'),
(808, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-18 17:40:41', '2019-05-18 17:40:41'),
(809, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-18 17:41:59', '2019-05-18 17:41:59'),
(810, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:47:43', '2019-05-18 17:47:43'),
(811, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-18 17:47:53', '2019-05-18 17:47:53'),
(812, NULL, 1, 'system_admin/locale/vi', 'GET', '127.0.0.1', '[]', '2019-05-18 18:15:41', '2019-05-18 18:15:41'),
(813, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:15:41', '2019-05-18 18:15:41'),
(814, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-18 18:15:49', '2019-05-18 18:15:49'),
(815, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:15:49', '2019-05-18 18:15:49'),
(816, NULL, 1, 'system_admin/locale/vi', 'GET', '127.0.0.1', '[]', '2019-05-18 18:15:56', '2019-05-18 18:15:56'),
(817, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:15:56', '2019-05-18 18:15:56'),
(818, NULL, 1, 'system_admin/locale/ar', 'GET', '127.0.0.1', '[]', '2019-05-18 18:16:03', '2019-05-18 18:16:03'),
(819, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-18 18:16:03', '2019-05-18 18:16:03'),
(820, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:16:09', '2019-05-18 18:16:09'),
(821, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:18:46', '2019-05-18 18:18:46'),
(822, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:30:16', '2019-05-18 18:30:16'),
(823, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:32:27', '2019-05-18 18:32:27'),
(824, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:32:52', '2019-05-18 18:32:52'),
(825, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:34:08', '2019-05-18 18:34:08'),
(826, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:34:44', '2019-05-18 18:34:44'),
(827, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:34:59', '2019-05-18 18:34:59'),
(828, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:35:10', '2019-05-18 18:35:10'),
(829, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:35:24', '2019-05-18 18:35:24'),
(830, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:35:46', '2019-05-18 18:35:46'),
(831, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-18 18:36:49', '2019-05-18 18:36:49'),
(832, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:03:45', '2019-05-19 02:03:45'),
(833, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:06:56', '2019-05-19 02:06:56'),
(834, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:07:36', '2019-05-19 02:07:36'),
(835, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:07:42', '2019-05-19 02:07:42'),
(836, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:11:30', '2019-05-19 02:11:30'),
(837, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:11:34', '2019-05-19 02:11:34'),
(838, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:12:16', '2019-05-19 02:12:16'),
(839, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:13:03', '2019-05-19 02:13:03'),
(840, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:16:03', '2019-05-19 02:16:03'),
(841, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:16:56', '2019-05-19 02:16:56'),
(842, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 02:20:11', '2019-05-19 02:20:11'),
(843, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:21:45', '2019-05-19 02:21:45'),
(844, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:21:56', '2019-05-19 02:21:56'),
(845, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingStandard\"}', '2019-05-19 02:22:17', '2019-05-19 02:22:17'),
(846, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '[]', '2019-05-19 02:22:28', '2019-05-19 02:22:28'),
(847, NULL, 1, 'system_admin/extensions/installExtension', 'POST', '127.0.0.1', '{\"_token\":\"XgX7CnjLPs8doHPlB14TAkJIE5Mz2KnM4qhQtSHC\",\"key\":\"ShippingBasic\",\"group\":\"Shipping\"}', '2019-05-19 02:22:35', '2019-05-19 02:22:35'),
(848, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '[]', '2019-05-19 02:22:36', '2019-05-19 02:22:36'),
(849, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingBasic\"}', '2019-05-19 02:22:43', '2019-05-19 02:22:43'),
(850, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"ShippingStandard\"}', '2019-05-19 02:23:07', '2019-05-19 02:23:07'),
(851, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '[]', '2019-05-19 02:23:13', '2019-05-19 02:23:13'),
(852, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:23:19', '2019-05-19 02:23:19'),
(853, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-19 02:23:22', '2019-05-19 02:23:22'),
(854, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 02:23:26', '2019-05-19 02:23:26'),
(855, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 02:35:50', '2019-05-19 02:35:50'),
(856, NULL, 1, 'system_admin/shop_discount/create', 'GET', '127.0.0.1', '[]', '2019-05-19 02:35:57', '2019-05-19 02:35:57'),
(857, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:36:48', '2019-05-19 02:36:48'),
(858, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-19 02:36:49', '2019-05-19 02:36:49'),
(859, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:45:02', '2019-05-19 02:45:02'),
(860, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:46:24', '2019-05-19 02:46:24'),
(861, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:50:38', '2019-05-19 02:50:38'),
(862, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:52:57', '2019-05-19 02:52:57'),
(863, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:53:17', '2019-05-19 02:53:17'),
(864, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:53:38', '2019-05-19 02:53:38'),
(865, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:54:03', '2019-05-19 02:54:03'),
(866, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 02:54:11', '2019-05-19 02:54:11'),
(867, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2019-05-19 02:54:30', '2019-05-19 02:54:30'),
(868, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:11:01', '2019-05-19 03:11:01'),
(869, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '[]', '2019-05-19 03:12:23', '2019-05-19 03:12:23'),
(870, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:12:30', '2019-05-19 03:12:30'),
(871, NULL, 1, 'system_admin/shop_shipping_status/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:12:34', '2019-05-19 03:12:34'),
(872, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:17:08', '2019-05-19 03:17:08'),
(873, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:18:05', '2019-05-19 03:18:05'),
(874, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:18:08', '2019-05-19 03:18:08'),
(875, NULL, 1, 'system_admin/subscribe', 'POST', '127.0.0.1', '{\"email\":\"mahmoud.25490@gmail.com\",\"_token\":\"XgX7CnjLPs8doHPlB14TAkJIE5Mz2KnM4qhQtSHC\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/subscribe\"}', '2019-05-19 03:18:15', '2019-05-19 03:18:15'),
(876, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:18:16', '2019-05-19 03:18:16'),
(877, NULL, 1, 'system_admin/subscribe', 'POST', '127.0.0.1', '{\"email\":\"mahmoud.25490@gmail.com\",\"_token\":\"XgX7CnjLPs8doHPlB14TAkJIE5Mz2KnM4qhQtSHC\"}', '2019-05-19 03:19:58', '2019-05-19 03:19:58'),
(878, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '[]', '2019-05-19 03:19:58', '2019-05-19 03:19:58'),
(879, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:01', '2019-05-19 03:31:01'),
(880, NULL, 1, 'system_admin/extensions/Shipping', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:15', '2019-05-19 03:31:15'),
(881, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:17', '2019-05-19 03:31:17'),
(882, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:18', '2019-05-19 03:31:18'),
(883, NULL, 1, 'system_admin/extensions/Other', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:21', '2019-05-19 03:31:21'),
(884, NULL, 1, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:31:26', '2019-05-19 03:31:26'),
(885, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:33:07', '2019-05-19 03:33:07'),
(886, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-19 03:33:11', '2019-05-19 03:33:11'),
(887, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 03:33:15', '2019-05-19 03:33:15'),
(888, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:33:28', '2019-05-19 03:33:28'),
(889, NULL, 1, 'system_admin/extensions/Total', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Discount\"}', '2019-05-19 03:33:32', '2019-05-19 03:33:32'),
(890, NULL, 1, 'system_admin/shop_discount', 'GET', '127.0.0.1', '[]', '2019-05-19 03:33:36', '2019-05-19 03:33:36'),
(891, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:34:49', '2019-05-19 03:34:49'),
(892, NULL, 1, 'system_admin/layout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:34:54', '2019-05-19 03:34:54'),
(893, NULL, 1, 'system_admin/layout/create', 'GET', '127.0.0.1', '[]', '2019-05-19 03:34:58', '2019-05-19 03:34:58'),
(894, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-19 03:35:17', '2019-05-19 03:35:17'),
(895, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '[]', '2019-05-19 03:57:02', '2019-05-19 03:57:02'),
(896, NULL, 1, 'system_admin/report/customer', 'GET', '127.0.0.1', '[]', '2019-05-19 03:58:02', '2019-05-19 03:58:02'),
(897, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 03:58:07', '2019-05-19 03:58:07'),
(898, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 04:02:39', '2019-05-19 04:02:39'),
(899, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-19 04:04:03', '2019-05-19 04:04:03'),
(900, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:00:29', '2019-05-20 02:00:29'),
(901, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"0106\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:07:22', '2019-05-20 02:07:22'),
(902, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:07:28', '2019-05-20 02:07:28'),
(903, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:08:40', '2019-05-20 02:08:40'),
(904, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:10:02', '2019-05-20 02:10:02'),
(905, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:10:41', '2019-05-20 02:10:41'),
(906, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:10:57', '2019-05-20 02:10:57'),
(907, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:11:24', '2019-05-20 02:11:24'),
(908, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:11:29', '2019-05-20 02:11:29'),
(909, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:14:59', '2019-05-20 02:14:59'),
(910, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:15:20', '2019-05-20 02:15:20'),
(911, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:15:46', '2019-05-20 02:15:46'),
(912, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:16:12', '2019-05-20 02:16:12'),
(913, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:30:00', '2019-05-20 02:30:00'),
(914, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:31:53', '2019-05-20 02:31:53'),
(915, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:02', '2019-05-20 02:33:02'),
(916, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:37', '2019-05-20 02:33:37'),
(917, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:53', '2019-05-20 02:33:53'),
(918, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:33:58', '2019-05-20 02:33:58'),
(919, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:34:17', '2019-05-20 02:34:17'),
(920, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:34:42', '2019-05-20 02:34:42'),
(921, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:35:27', '2019-05-20 02:35:27'),
(922, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:38:57', '2019-05-20 02:38:57'),
(923, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:39:32', '2019-05-20 02:39:32'),
(924, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:39:49', '2019-05-20 02:39:49'),
(925, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:42:07', '2019-05-20 02:42:07'),
(926, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:47:11', '2019-05-20 02:47:11'),
(927, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\"}', '2019-05-20 02:48:13', '2019-05-20 02:48:13'),
(928, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:24', '2019-05-20 02:48:24'),
(929, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:29', '2019-05-20 02:48:29'),
(930, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:48', '2019-05-20 02:48:48'),
(931, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:48:55', '2019-05-20 02:48:55'),
(932, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:50:37', '2019-05-20 02:50:37'),
(933, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:50:58', '2019-05-20 02:50:58'),
(934, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:51:33', '2019-05-20 02:51:33'),
(935, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:51:36', '2019-05-20 02:51:36'),
(936, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:53:18', '2019-05-20 02:53:18'),
(937, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:53:20', '2019-05-20 02:53:20'),
(938, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:53:56', '2019-05-20 02:53:56'),
(939, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:54:05', '2019-05-20 02:54:05'),
(940, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\"}', '2019-05-20 02:55:01', '2019-05-20 02:55:01'),
(941, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:07', '2019-05-20 02:55:07'),
(942, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:10', '2019-05-20 02:55:10'),
(943, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"3\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:13', '2019-05-20 02:55:13'),
(944, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:55:18', '2019-05-20 02:55:18'),
(945, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"3\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:56:17', '2019-05-20 02:56:17'),
(946, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:56:23', '2019-05-20 02:56:23'),
(947, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:56:52', '2019-05-20 02:56:52'),
(948, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:57:09', '2019-05-20 02:57:09'),
(949, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 02:57:16', '2019-05-20 02:57:16'),
(950, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:58:39', '2019-05-20 02:58:39'),
(951, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:58:41', '2019-05-20 02:58:41'),
(952, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:58:54', '2019-05-20 02:58:54'),
(953, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 02:59:00', '2019-05-20 02:59:00'),
(954, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:00:29', '2019-05-20 03:00:29'),
(955, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:01:16', '2019-05-20 03:01:16'),
(956, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"7\",\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:01:23', '2019-05-20 03:01:23'),
(957, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:01:51', '2019-05-20 03:01:51'),
(958, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:02:05', '2019-05-20 03:02:05'),
(959, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"7\"}', '2019-05-20 03:02:42', '2019-05-20 03:02:42'),
(960, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:04:42', '2019-05-20 03:04:42'),
(961, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:05:00', '2019-05-20 03:05:00'),
(962, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:05:19', '2019-05-20 03:05:19'),
(963, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:06:24', '2019-05-20 03:06:24'),
(964, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:11:58', '2019-05-20 03:11:58'),
(965, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:12:09', '2019-05-20 03:12:09'),
(966, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:16:44', '2019-05-20 03:16:44'),
(967, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:17:35', '2019-05-20 03:17:35'),
(968, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:19:07', '2019-05-20 03:19:07'),
(969, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:20:14', '2019-05-20 03:20:14'),
(970, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:20:37', '2019-05-20 03:20:37'),
(971, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:21:01', '2019-05-20 03:21:01'),
(972, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:21:43', '2019-05-20 03:21:43'),
(973, NULL, 1, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"3\"}', '2019-05-20 03:22:13', '2019-05-20 03:22:13'),
(974, NULL, 1, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\",\"add_order\":\"3\",\"add_id\":\"3\",\"add_qty\":\"1\",\"add_price\":\"220000\"}', '2019-05-20 03:22:14', '2019-05-20 03:22:14'),
(975, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:22:16', '2019-05-20 03:22:16'),
(976, NULL, 1, 'system_admin/get_info/itemInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2019-05-20 03:22:21', '2019-05-20 03:22:21'),
(977, NULL, 1, 'system_admin/shop_order_edit/order_edit_item', 'POST', '127.0.0.1', '{\"pOrder\":\"3\",\"pId\":\"4\",\"pName\":null,\"pQty\":\"1\",\"pPrice\":\"220000\",\"pAttr\":\"xc\",\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\"}', '2019-05-20 03:22:31', '2019-05-20 03:22:31'),
(978, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:22:32', '2019-05-20 03:22:32'),
(979, NULL, 1, 'system_admin/get_info/itemInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2019-05-20 03:22:39', '2019-05-20 03:22:39'),
(980, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:22:48', '2019-05-20 03:22:48'),
(981, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:22:51', '2019-05-20 03:22:51'),
(982, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:23:11', '2019-05-20 03:23:11'),
(983, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:23:15', '2019-05-20 03:23:15'),
(984, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:23:19', '2019-05-20 03:23:19'),
(985, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:24:37', '2019-05-20 03:24:37'),
(986, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:24:41', '2019-05-20 03:24:41'),
(987, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:27:48', '2019-05-20 03:27:48'),
(988, NULL, 1, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:17', '2019-05-20 03:29:17'),
(989, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:23', '2019-05-20 03:29:23'),
(990, NULL, 1, 'system_admin/shop_order_edit/9', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:32', '2019-05-20 03:29:32'),
(991, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-05-20 03:29:38', '2019-05-20 03:29:38'),
(992, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 03:30:06', '2019-05-20 03:30:06'),
(993, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 04:18:51', '2019-05-20 04:18:51'),
(994, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 04:24:00', '2019-05-20 04:24:00'),
(995, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2019-05-20 04:25:17', '2019-05-20 04:25:17'),
(996, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:25:32', '2019-05-20 04:25:32'),
(997, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:28:47', '2019-05-20 04:28:47'),
(998, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:29:17', '2019-05-20 04:29:17'),
(999, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:30:14', '2019-05-20 04:30:14'),
(1000, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:39:31', '2019-05-20 04:39:31'),
(1001, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:39:44', '2019-05-20 04:39:44'),
(1002, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:39:56', '2019-05-20 04:39:56'),
(1003, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:40:10', '2019-05-20 04:40:10'),
(1004, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:40:50', '2019-05-20 04:40:50'),
(1005, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:46:59', '2019-05-20 04:46:59'),
(1006, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:48:48', '2019-05-20 04:48:48'),
(1007, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:50:02', '2019-05-20 04:50:02'),
(1008, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 04:53:29', '2019-05-20 04:53:29'),
(1009, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:04:15', '2019-05-20 05:04:15'),
(1010, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:15:51', '2019-05-20 05:15:51'),
(1011, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-20 05:16:28', '2019-05-20 05:16:28'),
(1012, NULL, 1, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:16:47', '2019-05-20 05:16:47'),
(1013, NULL, 1, 'system_admin/shop_order_status/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:16:49', '2019-05-20 05:16:49'),
(1014, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:17:00', '2019-05-20 05:17:00'),
(1015, NULL, 1, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:17:02', '2019-05-20 05:17:02'),
(1016, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:17:54', '2019-05-20 05:17:54'),
(1017, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2019-05-20 05:18:30', '2019-05-20 05:18:30'),
(1018, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-05-20 05:18:37', '2019-05-20 05:18:37'),
(1019, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:18:57', '2019-05-20 05:18:57'),
(1020, NULL, 1, 'system_admin/shop_category/19', 'PUT', '127.0.0.1', '{\"top\":\"on\",\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\",\"_method\":\"PUT\"}', '2019-05-20 05:19:01', '2019-05-20 05:19:01'),
(1021, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:19:06', '2019-05-20 05:19:06'),
(1022, NULL, 1, 'system_admin/shop_category/19', 'PUT', '127.0.0.1', '{\"top\":\"on\",\"_token\":\"LM3RoeWQSrFex2RHTyCMoQwMNDsK6H7ioV3Ysjbi\",\"_method\":\"PUT\"}', '2019-05-20 05:19:08', '2019-05-20 05:19:08'),
(1023, NULL, 1, 'system_admin/shop_category/19/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:19:30', '2019-05-20 05:19:30'),
(1024, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:20:34', '2019-05-20 05:20:34'),
(1025, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 05:20:36', '2019-05-20 05:20:36'),
(1026, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:20:39', '2019-05-20 05:20:39'),
(1027, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:25:02', '2019-05-20 05:25:02'),
(1028, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:27:21', '2019-05-20 05:27:21'),
(1029, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 05:29:21', '2019-05-20 05:29:21'),
(1030, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:15:04', '2019-05-20 06:15:04'),
(1031, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:18:13', '2019-05-20 06:18:13'),
(1032, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:18:33', '2019-05-20 06:18:33'),
(1033, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:18:39', '2019-05-20 06:18:39'),
(1034, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:18:45', '2019-05-20 06:18:45'),
(1035, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-20 06:20:20', '2019-05-20 06:20:20'),
(1036, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:20:28', '2019-05-20 06:20:28'),
(1037, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:33:05', '2019-05-20 06:33:05'),
(1038, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:39:12', '2019-05-20 06:39:12'),
(1039, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:51:34', '2019-05-20 06:51:34'),
(1040, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:51:53', '2019-05-20 06:51:53'),
(1041, NULL, 1, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2019-05-20 06:53:02', '2019-05-20 06:53:02'),
(1042, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 03:46:20', '2019-05-21 03:46:20'),
(1043, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 03:49:20', '2019-05-21 03:49:20'),
(1044, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 03:50:16', '2019-05-21 03:50:16'),
(1045, NULL, 1, 'system_admin/modules/Cms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 03:50:31', '2019-05-21 03:50:31'),
(1046, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:10:05', '2019-05-21 04:10:05'),
(1047, NULL, 1, 'system_admin/auth/logs', 'GET', '127.0.0.1', '[]', '2019-05-21 04:10:27', '2019-05-21 04:10:27'),
(1048, NULL, 1, 'system_admin/shop_page', 'GET', '127.0.0.1', '[]', '2019-05-21 04:11:49', '2019-05-21 04:11:49'),
(1049, NULL, 1, 'system_admin/shop_page/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:11:55', '2019-05-21 04:11:55'),
(1050, NULL, 1, 'system_admin/shop_page/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:14:31', '2019-05-21 04:14:31'),
(1051, NULL, 1, 'system_admin/shop_page/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:19:22', '2019-05-21 04:19:22'),
(1052, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-21 04:19:31', '2019-05-21 04:19:31'),
(1053, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:21:12', '2019-05-21 04:21:12'),
(1054, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:21:16', '2019-05-21 04:21:16'),
(1055, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '[]', '2019-05-21 04:21:17', '2019-05-21 04:21:17'),
(1056, NULL, 1, 'system_admin/documents/folders', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558394478238\"}', '2019-05-21 04:21:18', '2019-05-21 04:21:18'),
(1057, NULL, 1, 'system_admin/documents/errors', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558394478239\"}', '2019-05-21 04:21:19', '2019-05-21 04:21:19'),
(1058, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558394478240\"}', '2019-05-21 04:21:19', '2019-05-21 04:21:19'),
(1059, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558394478241\"}', '2019-05-21 04:21:22', '2019-05-21 04:21:22'),
(1060, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\\/blogs\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558394478242\"}', '2019-05-21 04:21:24', '2019-05-21 04:21:24'),
(1061, NULL, 1, 'system_admin/banner', 'GET', '127.0.0.1', '[]', '2019-05-21 04:21:28', '2019-05-21 04:21:28'),
(1062, NULL, 1, 'system_admin/banner/create', 'GET', '127.0.0.1', '[]', '2019-05-21 04:21:32', '2019-05-21 04:21:32'),
(1063, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:21:56', '2019-05-21 04:21:56'),
(1064, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '[]', '2019-05-21 04:22:21', '2019-05-21 04:22:21'),
(1065, NULL, 1, 'system_admin/layout_url', 'GET', '127.0.0.1', '[]', '2019-05-21 04:26:40', '2019-05-21 04:26:40'),
(1066, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:32:44', '2019-05-21 04:32:44'),
(1067, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:32:53', '2019-05-21 04:32:53'),
(1068, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-21 04:33:23', '2019-05-21 04:33:23'),
(1069, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:43', '2019-05-21 04:36:43'),
(1070, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:45', '2019-05-21 04:36:45'),
(1071, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:47', '2019-05-21 04:36:47'),
(1072, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:36:48', '2019-05-21 04:36:48'),
(1073, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:36:54', '2019-05-21 04:36:54'),
(1074, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-21 04:36:57', '2019-05-21 04:36:57'),
(1075, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-21 04:37:01', '2019-05-21 04:37:01'),
(1076, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"watermark\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\"}', '2019-05-21 04:38:00', '2019-05-21 04:38:00'),
(1077, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"ar__title\":\"souqVIS\",\"ar__keyword\":null,\"ar__description\":\"easy to sell and buy\",\"en__title\":\"souqVIS\",\"en__keyword\":null,\"en__description\":\"easy to sell\",\"vi__title\":\"Souq\",\"vi__keyword\":\"ar\",\"vi__description\":null,\"phone\":\"0123456789\",\"long_phone\":\"Support: 0987654321\",\"time_active\":null,\"address\":\"123st - abc - xyz\",\"email\":\"admin@admin.com\",\"locale\":\"ar\",\"currency\":\"EGP\",\"_token\":\"xudvtdSG5nZiqQRmbwjSgtAwNcIiLWCMTmCyv4Wk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/system_admin\\/config_global\"}', '2019-05-21 04:38:23', '2019-05-21 04:38:23'),
(1078, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-21 04:38:23', '2019-05-21 04:38:23'),
(1079, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-24 17:31:38', '2019-05-24 17:31:38'),
(1080, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:00:01', '2019-05-25 03:00:01'),
(1081, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:02:28', '2019-05-25 03:02:28'),
(1082, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:07:57', '2019-05-25 03:07:57'),
(1083, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:13:10', '2019-05-25 03:13:10'),
(1084, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:13:45', '2019-05-25 03:13:45'),
(1085, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:17:24', '2019-05-25 03:17:24'),
(1086, NULL, 1, 'system_admin/config_global/1', 'GET', '127.0.0.1', '[]', '2019-05-25 03:21:19', '2019-05-25 03:21:19'),
(1087, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 03:21:44', '2019-05-25 03:21:44'),
(1088, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:27:50', '2019-05-25 03:27:50'),
(1089, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:27:56', '2019-05-25 03:27:56');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1090, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:29:11', '2019-05-25 03:29:11'),
(1091, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_columns_\":\"html,logo,descriptions,phone,long_phone,time_active,address,email,locale,currency\",\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:29:25', '2019-05-25 03:29:25'),
(1092, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 03:29:30', '2019-05-25 03:29:30'),
(1093, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-25 03:29:56', '2019-05-25 03:29:56'),
(1094, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-25 03:34:48', '2019-05-25 03:34:48'),
(1095, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2019-05-25 03:38:22', '2019-05-25 03:38:22'),
(1096, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:06:03', '2019-05-25 04:06:03'),
(1097, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:09:16', '2019-05-25 04:09:16'),
(1098, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:10:06', '2019-05-25 04:10:06'),
(1099, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:11:01', '2019-05-25 04:11:01'),
(1100, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:12:16', '2019-05-25 04:12:16'),
(1101, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:15:36', '2019-05-25 04:15:36'),
(1102, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:16:22', '2019-05-25 04:16:22'),
(1103, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-25 04:42:44', '2019-05-25 04:42:44'),
(1104, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:43:09', '2019-05-25 04:43:09'),
(1105, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2019-05-25 04:45:06', '2019-05-25 04:45:06'),
(1106, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:18', '2019-05-25 04:45:18'),
(1107, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:19', '2019-05-25 04:45:19'),
(1108, NULL, 1, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:25', '2019-05-25 04:45:25'),
(1109, NULL, 1, 'system_admin/subscribe/create', 'GET', '127.0.0.1', '[]', '2019-05-25 04:45:27', '2019-05-25 04:45:27'),
(1110, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:45:35', '2019-05-25 04:45:35'),
(1111, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-05-25 04:51:21', '2019-05-25 04:51:21'),
(1112, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:51:31', '2019-05-25 04:51:31'),
(1113, NULL, 1, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:52:57', '2019-05-25 04:52:57'),
(1114, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 04:53:01', '2019-05-25 04:53:01'),
(1115, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 04:53:21', '2019-05-25 04:53:21'),
(1116, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2019-05-25 05:06:22', '2019-05-25 05:06:22'),
(1117, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_columns_\":\"detail\",\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:39', '2019-05-25 05:06:39'),
(1118, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:43', '2019-05-25 05:06:43'),
(1119, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_columns_\":\"detail\",\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:47', '2019-05-25 05:06:47'),
(1120, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:06:52', '2019-05-25 05:06:52'),
(1121, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2019-05-25 05:07:11', '2019-05-25 05:07:11'),
(1122, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:07:16', '2019-05-25 05:07:16'),
(1123, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:07:26', '2019-05-25 05:07:26'),
(1124, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-05-25 05:22:24', '2019-05-25 05:22:24'),
(1125, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:27:42', '2019-05-25 05:27:42'),
(1126, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:28:55', '2019-05-25 05:28:55'),
(1127, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:30:17', '2019-05-25 05:30:17'),
(1128, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:30:41', '2019-05-25 05:30:41'),
(1129, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:31:20', '2019-05-25 05:31:20'),
(1130, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:33:07', '2019-05-25 05:33:07'),
(1131, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:33:56', '2019-05-25 05:33:56'),
(1132, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:34:20', '2019-05-25 05:34:20'),
(1133, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:46:20', '2019-05-25 05:46:20'),
(1134, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:49:10', '2019-05-25 05:49:10'),
(1135, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:49:48', '2019-05-25 05:49:48'),
(1136, NULL, 1, 'system_admin/report/product', 'GET', '127.0.0.1', '[]', '2019-05-25 05:50:52', '2019-05-25 05:50:52'),
(1137, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 05:51:07', '2019-05-25 05:51:07'),
(1138, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-05-25 05:51:21', '2019-05-25 05:51:21'),
(1139, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-05-25 14:55:14', '2019-05-25 14:55:14'),
(1140, NULL, 1, 'system_admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-05-25 14:56:53', '2019-05-25 14:56:53'),
(1141, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 14:57:00', '2019-05-25 14:57:00'),
(1142, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 14:57:02', '2019-05-25 14:57:02'),
(1143, NULL, 1, 'system_admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-05-25 14:58:40', '2019-05-25 14:58:40'),
(1144, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-25 15:08:32', '2019-05-25 15:08:32'),
(1145, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 15:11:17', '2019-05-25 15:11:17'),
(1146, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:04:28', '2019-05-25 21:04:28'),
(1147, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:04:54', '2019-05-25 21:04:54'),
(1148, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:05:11', '2019-05-25 21:05:11'),
(1149, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:06:27', '2019-05-25 21:06:27'),
(1150, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:07:14', '2019-05-25 21:07:14'),
(1151, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:07:52', '2019-05-25 21:07:52'),
(1152, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:08:10', '2019-05-25 21:08:10'),
(1153, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '[]', '2019-05-25 21:08:30', '2019-05-25 21:08:30'),
(1154, NULL, 1, 'system_admin/documents', 'GET', '127.0.0.1', '[]', '2019-05-26 01:49:31', '2019-05-26 01:49:31'),
(1155, NULL, 1, 'system_admin/documents/folders', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558817372549\"}', '2019-05-26 01:49:33', '2019-05-26 01:49:33'),
(1156, NULL, 1, 'system_admin/documents/errors', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"_\":\"1558817372550\"}', '2019-05-26 01:49:33', '2019-05-26 01:49:33'),
(1157, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":null,\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558817372551\"}', '2019-05-26 01:49:33', '2019-05-26 01:49:33'),
(1158, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558817372552\"}', '2019-05-26 01:49:45', '2019-05-26 01:49:45'),
(1159, NULL, 1, 'system_admin/documents/jsonitems', 'GET', '127.0.0.1', '{\"working_dir\":\"\\/photos\\/blogs\",\"type\":null,\"sort_type\":\"alphabetic\",\"_\":\"1558817372553\"}', '2019-05-26 01:49:47', '2019-05-26 01:49:47'),
(1160, NULL, 1, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-05-26 01:49:51', '2019-05-26 01:49:51'),
(1161, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-09-29 01:55:36', '2019-09-29 01:55:36'),
(1162, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-09-29 01:55:58', '2019-09-29 01:55:58'),
(1163, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-09-29 01:56:43', '2019-09-29 01:56:43'),
(1164, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":\"1\",\"price\":null,\"cost\":null,\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"_token\":\"EbNiiJVlLXKxKG3mAWXXc29IJDpEAO4FU6pLJ8fu\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2019-09-29 01:58:51', '2019-09-29 01:58:51'),
(1165, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2019-09-29 01:58:52', '2019-09-29 01:58:52'),
(1166, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":\"1\",\"price\":null,\"cost\":null,\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"_token\":\"EbNiiJVlLXKxKG3mAWXXc29IJDpEAO4FU6pLJ8fu\"}', '2019-09-29 02:32:00', '2019-09-29 02:32:00'),
(1167, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-10-17 01:19:36', '2019-10-17 01:19:36'),
(1168, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-17 01:21:29', '2019-10-17 01:21:29'),
(1169, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null}', '2019-10-17 01:21:45', '2019-10-17 01:21:45'),
(1170, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-17 01:21:46', '2019-10-17 01:21:46'),
(1171, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2019-11-16 04:21:38', '2019-11-16 04:21:38'),
(1172, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:21:48', '2019-11-16 04:21:48'),
(1173, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:21:52', '2019-11-16 04:21:52'),
(1174, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:01', '2019-11-16 04:22:01'),
(1175, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-11-16 04:22:15', '2019-11-16 04:22:15'),
(1176, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2019-11-16 04:22:21', '2019-11-16 04:22:21'),
(1177, NULL, 1, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2019-11-16 04:22:24', '2019-11-16 04:22:24'),
(1178, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:28', '2019-11-16 04:22:28'),
(1179, NULL, 1, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:30', '2019-11-16 04:22:30'),
(1180, NULL, 1, 'system_admin/shop_payment_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:34', '2019-11-16 04:22:34'),
(1181, NULL, 1, 'system_admin/shop_shipping_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:36', '2019-11-16 04:22:36'),
(1182, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:38', '2019-11-16 04:22:38'),
(1183, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:47', '2019-11-16 04:22:47'),
(1184, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-11-16 04:22:49', '2019-11-16 04:22:49'),
(1185, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-23 18:03:14', '2020-01-23 18:03:14'),
(1186, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-23 18:03:25', '2020-01-23 18:03:25'),
(1187, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '[]', '2020-01-23 18:03:34', '2020-01-23 18:03:34'),
(1188, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-23 18:03:43', '2020-01-23 18:03:43'),
(1189, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-23 18:14:55', '2020-01-23 18:14:55'),
(1190, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-23 18:30:36', '2020-01-23 18:30:36'),
(1191, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":\"1\",\"price\":\"250\",\"cost\":\"225\",\"stock\":\"258\",\"sku\":\"prod9\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":\"\\u0662\\u0660\\u0662\\u0660-\\u0660\\u0661-\\u0662\\u0663 \\u0660\\u0660:\\u0660\\u0660:\\u0660\\u0660\",\"_token\":\"BpvftfdAnuauLVuf7oppLNQcmcquNTrKrV1QIWVg\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-23 18:40:02', '2020-01-23 18:40:02'),
(1192, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-23 18:40:03', '2020-01-23 18:40:03'),
(1193, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":\"1\",\"price\":\"250\",\"cost\":\"225\",\"stock\":\"258\",\"sku\":\"prod9\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"BpvftfdAnuauLVuf7oppLNQcmcquNTrKrV1QIWVg\"}', '2020-01-23 18:41:11', '2020-01-23 18:41:11'),
(1194, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-23 18:41:11', '2020-01-23 18:41:11'),
(1195, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"name\":null,\"sku\":null,\"_pjax\":\"#pjax-container\"}', '2020-01-23 18:44:28', '2020-01-23 18:44:28'),
(1196, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '[]', '2020-01-23 18:44:36', '2020-01-23 18:44:36'),
(1197, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"name\":null,\"sku\":null}', '2020-01-23 18:44:44', '2020-01-23 18:44:44'),
(1198, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-23 18:47:56', '2020-01-23 18:47:56'),
(1199, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-24 00:41:45', '2020-01-24 00:41:45'),
(1200, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-24 00:44:03', '2020-01-24 00:44:03'),
(1201, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-24 05:01:38', '2020-01-24 05:01:38'),
(1202, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-24 05:01:47', '2020-01-24 05:01:47'),
(1203, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-24 05:01:56', '2020-01-24 05:01:56'),
(1204, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 05:02:00', '2020-01-24 05:02:00'),
(1205, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 05:20:47', '2020-01-24 05:20:47'),
(1206, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":\"19\",\"price\":null,\"cost\":null,\"stock\":\"8\",\"sku\":\"prod25490\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"_token\":\"5RFegBwiSmskzaBeBnJEY4jgkM8fEk1jIcVrkxs0\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-24 05:22:18', '2020-01-24 05:22:18'),
(1207, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 05:22:20', '2020-01-24 05:22:20'),
(1208, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 05:27:36', '2020-01-24 05:27:36'),
(1209, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 05:29:54', '2020-01-24 05:29:54'),
(1210, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":null,\"price\":null,\"cost\":null,\"stock\":null,\"company_id\":\"0\",\"sku\":null,\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"off\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"_token\":\"5RFegBwiSmskzaBeBnJEY4jgkM8fEk1jIcVrkxs0\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-24 05:30:08', '2020-01-24 05:30:08'),
(1211, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 05:30:08', '2020-01-24 05:30:08'),
(1212, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 05:30:48', '2020-01-24 05:30:48'),
(1213, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 06:12:21', '2020-01-24 06:12:21'),
(1214, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 06:12:34', '2020-01-24 06:12:34'),
(1215, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-24 06:13:59', '2020-01-24 06:13:59'),
(1216, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":\"19\",\"price\":\"25\",\"cost\":\"21\",\"stock\":\"25\",\"sku\":\"prod123456789\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"_token\":\"5RFegBwiSmskzaBeBnJEY4jgkM8fEk1jIcVrkxs0\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-24 06:14:47', '2020-01-24 06:14:47'),
(1217, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 06:14:48', '2020-01-24 06:14:48'),
(1218, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-24 06:15:19', '2020-01-24 06:15:19'),
(1219, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 06:17:08', '2020-01-24 06:17:08'),
(1220, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 06:18:02', '2020-01-24 06:18:02'),
(1221, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 06:19:06', '2020-01-24 06:19:06'),
(1222, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 06:20:59', '2020-01-24 06:20:59'),
(1223, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-24 06:21:06', '2020-01-24 06:21:06'),
(1224, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 02:46:46', '2020-01-25 02:46:46'),
(1225, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-25 04:18:56', '2020-01-25 04:18:56'),
(1226, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-25 04:18:59', '2020-01-25 04:18:59'),
(1227, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:29:31', '2020-01-25 04:29:31'),
(1228, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:30:57', '2020-01-25 04:30:57'),
(1229, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:32:48', '2020-01-25 04:32:48'),
(1230, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:38:00', '2020-01-25 04:38:00'),
(1231, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:38:17', '2020-01-25 04:38:17'),
(1232, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:39:31', '2020-01-25 04:39:31'),
(1233, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:41:35', '2020-01-25 04:41:35'),
(1234, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:42:59', '2020-01-25 04:42:59'),
(1235, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:44:58', '2020-01-25 04:44:58'),
(1236, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:45:33', '2020-01-25 04:45:33'),
(1237, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:46:11', '2020-01-25 04:46:11'),
(1238, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:46:39', '2020-01-25 04:46:39'),
(1239, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:47:02', '2020-01-25 04:47:02'),
(1240, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:47:20', '2020-01-25 04:47:20'),
(1241, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:47:39', '2020-01-25 04:47:39'),
(1242, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:50:44', '2020-01-25 04:50:44'),
(1243, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:50:49', '2020-01-25 04:50:49'),
(1244, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 04:55:59', '2020-01-25 04:55:59'),
(1245, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:06:21', '2020-01-25 05:06:21'),
(1246, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:08:00', '2020-01-25 05:08:00'),
(1247, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:08:50', '2020-01-25 05:08:50'),
(1248, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:09:05', '2020-01-25 05:09:05'),
(1249, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:10:56', '2020-01-25 05:10:56'),
(1250, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:12:35', '2020-01-25 05:12:35'),
(1251, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:13:28', '2020-01-25 05:13:28'),
(1252, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:16:32', '2020-01-25 05:16:32'),
(1253, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:25:16', '2020-01-25 05:25:16'),
(1254, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:27:29', '2020-01-25 05:27:29'),
(1255, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:27:58', '2020-01-25 05:27:58'),
(1256, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:28:14', '2020-01-25 05:28:14'),
(1257, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 05:29:07', '2020-01-25 05:29:07'),
(1258, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:33:29', '2020-01-25 06:33:29'),
(1259, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:33:31', '2020-01-25 06:33:31'),
(1260, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 06:33:43', '2020-01-25 06:33:43'),
(1261, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:33:51', '2020-01-25 06:33:51'),
(1262, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:35:15', '2020-01-25 06:35:15'),
(1263, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:35:48', '2020-01-25 06:35:48'),
(1264, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:44:03', '2020-01-25 06:44:03'),
(1265, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:45:13', '2020-01-25 06:45:13'),
(1266, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-25 06:45:40', '2020-01-25 06:45:40'),
(1267, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-25 06:47:03', '2020-01-25 06:47:03'),
(1268, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-25 06:47:12', '2020-01-25 06:47:12'),
(1269, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:24:35', '2020-01-25 20:24:35'),
(1270, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:25:55', '2020-01-25 20:25:55'),
(1271, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:26:17', '2020-01-25 20:26:17'),
(1272, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:27:02', '2020-01-25 20:27:02'),
(1273, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:31:12', '2020-01-25 20:31:12'),
(1274, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:32:02', '2020-01-25 20:32:02'),
(1275, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:32:56', '2020-01-25 20:32:56'),
(1276, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 20:51:42', '2020-01-25 20:51:42'),
(1277, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-25 22:18:54', '2020-01-25 22:18:54'),
(1278, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-25 22:20:26', '2020-01-25 22:20:26'),
(1279, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-25 22:20:32', '2020-01-25 22:20:32'),
(1280, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":null,\"price\":null,\"cost\":null,\"stock\":null,\"sku\":null,\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"off\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"group\":{\"1\":{\"name\":[\"1\",\"2\",\"3\"]}},\"_token\":\"T8f5i6vZN3sg2zMT83BeHAeKFnxCSZNLJo13HLR2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-25 22:21:24', '2020-01-25 22:21:24'),
(1281, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-25 22:21:24', '2020-01-25 22:21:24'),
(1282, NULL, 1, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"category_id\":null,\"price\":null,\"cost\":null,\"stock\":null,\"sku\":null,\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"off\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"group\":{\"1\":{\"name\":[\"1\"]}},\"_token\":\"T8f5i6vZN3sg2zMT83BeHAeKFnxCSZNLJo13HLR2\"}', '2020-01-25 22:29:48', '2020-01-25 22:29:48'),
(1283, NULL, 1, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-01-25 22:29:48', '2020-01-25 22:29:48'),
(1284, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-25 22:31:58', '2020-01-25 22:31:58'),
(1285, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-25 22:32:02', '2020-01-25 22:32:02'),
(1286, NULL, 1, 'system_admin/shop_product/53', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"price\":\"25\",\"cost\":\"21\",\"stock\":\"25\",\"sku\":\"prod123456789\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"images\":{\"111\":{\"id\":\"111\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"1\"]}},\"_token\":\"T8f5i6vZN3sg2zMT83BeHAeKFnxCSZNLJo13HLR2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-25 22:32:26', '2020-01-25 22:32:26'),
(1287, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-25 22:32:27', '2020-01-25 22:32:27'),
(1288, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-25 22:46:36', '2020-01-25 22:46:36'),
(1289, NULL, 1, 'system_admin/shop_product/53', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"price\":\"25\",\"cost\":\"21\",\"stock\":\"25\",\"sku\":\"prod123456789\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"images\":{\"111\":{\"id\":\"111\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"\\u0633\\u0628\",\"\\u0633\\u064a\\u0628\\u0633\\u064a\"]}},\"_token\":\"T8f5i6vZN3sg2zMT83BeHAeKFnxCSZNLJo13HLR2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-01-25 22:47:38', '2020-01-25 22:47:38'),
(1290, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-25 22:47:39', '2020-01-25 22:47:39'),
(1291, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-26 01:51:52', '2020-01-26 01:51:52'),
(1292, NULL, 1, 'system_admin/shop_product/53', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"price\":\"25\",\"cost\":\"21\",\"stock\":\"25\",\"sku\":\"prod123456789\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"images\":{\"111\":{\"id\":\"111\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"1\",\"\\u0633\\u064a\\u0628\\u0633\\u064a\"]}},\"_token\":\"qyZY7G5PQqm6qlgiH0CVGbdNRCliD4eW5cTJOzqV\",\"_method\":\"PUT\"}', '2020-01-26 01:53:12', '2020-01-26 01:53:12'),
(1293, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-26 01:53:12', '2020-01-26 01:53:12'),
(1294, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-26 02:03:48', '2020-01-26 02:03:48'),
(1295, NULL, 1, 'system_admin/shop_product/53/edit', 'GET', '127.0.0.1', '[]', '2020-01-26 02:03:51', '2020-01-26 02:03:51'),
(1296, NULL, 1, 'system_admin/shop_product/53', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"price\":\"25\",\"cost\":\"21\",\"stock\":\"25\",\"sku\":\"prod123456789\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"0\",\"date_available\":null,\"images\":{\"111\":{\"id\":\"111\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"\\u0633\\u064a\\u0628\\u0633\\u064a\"]}},\"_token\":\"qyZY7G5PQqm6qlgiH0CVGbdNRCliD4eW5cTJOzqV\",\"_method\":\"PUT\"}', '2020-01-26 02:04:03', '2020-01-26 02:04:03'),
(1297, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:04:03', '2020-01-26 02:04:03'),
(1298, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:07:28', '2020-01-26 02:07:28'),
(1299, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:07:30', '2020-01-26 02:07:30'),
(1300, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:07:55', '2020-01-26 02:07:55'),
(1301, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:07:56', '2020-01-26 02:07:56'),
(1302, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:08:09', '2020-01-26 02:08:09'),
(1303, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:08:11', '2020-01-26 02:08:11'),
(1304, NULL, 1, 'system_admin/shop_product/53', 'GET', '127.0.0.1', '[]', '2020-01-26 02:08:21', '2020-01-26 02:08:21'),
(1305, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-01-26 02:08:27', '2020-01-26 02:08:27'),
(1306, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-26 02:08:30', '2020-01-26 02:08:30'),
(1307, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-01-26 02:08:35', '2020-01-26 02:08:35'),
(1308, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-26 02:17:49', '2020-01-26 02:17:49'),
(1309, NULL, 1, 'system_admin/shop_brand/create', 'GET', '127.0.0.1', '[]', '2020-01-26 02:17:52', '2020-01-26 02:17:52'),
(1310, NULL, 1, 'system_admin/shop_brand', 'POST', '127.0.0.1', '{\"name\":\"brand2\",\"status\":\"on\",\"sort\":\"0\",\"_token\":\"qyZY7G5PQqm6qlgiH0CVGbdNRCliD4eW5cTJOzqV\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_brand\"}', '2020-01-26 02:18:37', '2020-01-26 02:18:37'),
(1311, NULL, 1, 'system_admin/shop_brand', 'GET', '127.0.0.1', '[]', '2020-01-26 02:18:37', '2020-01-26 02:18:37'),
(1312, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-01 05:25:22', '2020-02-01 05:25:22'),
(1313, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-01 05:25:41', '2020-02-01 05:25:41'),
(1314, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:27:23', '2020-02-01 05:27:23'),
(1315, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:27:26', '2020-02-01 05:27:26'),
(1316, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:27:28', '2020-02-01 05:27:28'),
(1317, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:27:30', '2020-02-01 05:27:30'),
(1318, NULL, 1, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:27:31', '2020-02-01 05:27:31'),
(1319, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:27:33', '2020-02-01 05:27:33'),
(1320, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '[]', '2020-02-01 05:27:35', '2020-02-01 05:27:35'),
(1321, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:29:06', '2020-02-01 05:29:06'),
(1322, NULL, 1, 'system_admin/shop_attribute_group/create', 'GET', '127.0.0.1', '[]', '2020-02-01 05:29:14', '2020-02-01 05:29:14'),
(1323, NULL, 1, 'system_admin/shop_attribute_group', 'POST', '127.0.0.1', '{\"name\":\"color\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"select\",\"_token\":\"Gsl4C06JD8HDh8gOFSPCzY3xQQ37sJoWeBFILoWY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_attribute_group\"}', '2020-02-01 05:29:42', '2020-02-01 05:29:42'),
(1324, NULL, 1, 'system_admin/shop_attribute_group/4/edit', 'GET', '127.0.0.1', '[]', '2020-02-01 05:29:43', '2020-02-01 05:29:43'),
(1325, NULL, 1, 'system_admin/shop_attribute_group/4', 'GET', '127.0.0.1', '[]', '2020-02-01 05:29:57', '2020-02-01 05:29:57'),
(1326, NULL, 1, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2020-02-01 05:30:06', '2020-02-01 05:30:06'),
(1327, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:30:13', '2020-02-01 05:30:13'),
(1328, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-01 05:30:18', '2020-02-01 05:30:18'),
(1329, NULL, 1, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:30:47', '2020-02-01 05:30:47'),
(1330, NULL, 1, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:30:52', '2020-02-01 05:30:52'),
(1331, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-01 05:31:03', '2020-02-01 05:31:03'),
(1332, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"watermark\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"Gsl4C06JD8HDh8gOFSPCzY3xQQ37sJoWeBFILoWY\",\"_method\":\"PUT\"}', '2020-02-01 05:31:14', '2020-02-01 05:31:14'),
(1333, NULL, 1, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"ar__title\":\"souqVIS\",\"ar__keyword\":null,\"ar__description\":\"easy to sell and buy\",\"en__title\":\"souqVIS\",\"en__keyword\":null,\"en__description\":\"easy to sell\",\"vi__title\":\"Souq\",\"vi__keyword\":\"ar\",\"vi__description\":null,\"phone\":\"0123456789\",\"long_phone\":\"Support: 0987654321\",\"time_active\":null,\"address\":\"123st - abc - xyz\",\"email\":\"admin@admin.com\",\"locale\":\"ar\",\"currency\":\"EGP\",\"_token\":\"Gsl4C06JD8HDh8gOFSPCzY3xQQ37sJoWeBFILoWY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/config_global\"}', '2020-02-01 05:32:04', '2020-02-01 05:32:04'),
(1334, NULL, 1, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-01 05:32:06', '2020-02-01 05:32:06'),
(1335, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:32:32', '2020-02-01 05:32:32'),
(1336, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:32:35', '2020-02-01 05:32:35'),
(1337, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:32:37', '2020-02-01 05:32:37'),
(1338, NULL, 1, 'system_admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2020-02-01 05:32:40', '2020-02-01 05:32:40'),
(1339, NULL, 1, 'system_admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":null,\"name\":null,\"permissions\":[\"1\",null],\"_token\":\"Gsl4C06JD8HDh8gOFSPCzY3xQQ37sJoWeBFILoWY\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/auth\\/roles\"}', '2020-02-01 05:32:49', '2020-02-01 05:32:49'),
(1340, NULL, 1, 'system_admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2020-02-01 05:32:50', '2020-02-01 05:32:50'),
(1341, NULL, 1, 'system_admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"admin2\",\"name\":\"admin2\",\"permissions\":[\"1\",null],\"_token\":\"Gsl4C06JD8HDh8gOFSPCzY3xQQ37sJoWeBFILoWY\"}', '2020-02-01 05:33:01', '2020-02-01 05:33:01'),
(1342, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-02-01 05:33:01', '2020-02-01 05:33:01'),
(1343, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:33:43', '2020-02-01 05:33:43'),
(1344, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:33:45', '2020-02-01 05:33:45'),
(1345, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:33:47', '2020-02-01 05:33:47'),
(1346, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-01 05:33:50', '2020-02-01 05:33:50'),
(1347, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-04 20:57:09', '2020-02-04 20:57:09'),
(1348, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-04 20:57:25', '2020-02-04 20:57:25'),
(1349, NULL, 1, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-04 20:57:29', '2020-02-04 20:57:29'),
(1350, NULL, 1, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-04 20:57:32', '2020-02-04 20:57:32'),
(1351, NULL, 1, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-04 20:57:34', '2020-02-04 20:57:34'),
(1352, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-04 20:57:37', '2020-02-04 20:57:37'),
(1353, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-04 20:57:42', '2020-02-04 20:57:42'),
(1354, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-04 21:14:57', '2020-02-04 21:14:57'),
(1355, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-04 21:15:06', '2020-02-04 21:15:06'),
(1356, NULL, 1, 'system_admin/process/productImport', 'GET', '127.0.0.1', '[]', '2020-02-04 21:15:11', '2020-02-04 21:15:11'),
(1357, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-05 02:15:57', '2020-02-05 02:15:57'),
(1358, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 02:16:34', '2020-02-05 02:16:34'),
(1359, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 05:55:54', '2020-02-05 05:55:54'),
(1360, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 05:57:05', '2020-02-05 05:57:05'),
(1361, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 05:57:09', '2020-02-05 05:57:09'),
(1362, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 05:57:34', '2020-02-05 05:57:34'),
(1363, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 05:59:40', '2020-02-05 05:59:40'),
(1364, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:14:51', '2020-02-05 06:14:51'),
(1365, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:15:32', '2020-02-05 06:15:32'),
(1366, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:15:52', '2020-02-05 06:15:52'),
(1367, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:17:40', '2020-02-05 06:17:40'),
(1368, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:18:10', '2020-02-05 06:18:10'),
(1369, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:31:07', '2020-02-05 06:31:07'),
(1370, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:33:18', '2020-02-05 06:33:18'),
(1371, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:41:57', '2020-02-05 06:41:57'),
(1372, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:42:39', '2020-02-05 06:42:39'),
(1373, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-05 06:43:10', '2020-02-05 06:43:10'),
(1374, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 01:09:27', '2020-02-10 01:09:27'),
(1375, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:16:20', '2020-02-10 01:16:20'),
(1376, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:16:21', '2020-02-10 01:16:21'),
(1377, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:16:25', '2020-02-10 01:16:25'),
(1378, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:16:26', '2020-02-10 01:16:26'),
(1379, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 01:19:53', '2020-02-10 01:19:53'),
(1380, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 01:20:06', '2020-02-10 01:20:06'),
(1381, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:20:14', '2020-02-10 01:20:14'),
(1382, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:20:41', '2020-02-10 01:20:41'),
(1383, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 01:26:27', '2020-02-10 01:26:27'),
(1384, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 01:26:45', '2020-02-10 01:26:45'),
(1385, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 01:26:49', '2020-02-10 01:26:49'),
(1386, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:42:03', '2020-02-10 01:42:03'),
(1387, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:43:01', '2020-02-10 01:43:01'),
(1388, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:45:23', '2020-02-10 01:45:23'),
(1389, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:48:11', '2020-02-10 01:48:11'),
(1390, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:49:15', '2020-02-10 01:49:15'),
(1391, NULL, 5, 'system_admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 01:50:11', '2020-02-10 01:50:11'),
(1392, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:51:05', '2020-02-10 01:51:05'),
(1393, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:51:37', '2020-02-10 01:51:37'),
(1394, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:52:04', '2020-02-10 01:52:04'),
(1395, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:53:16', '2020-02-10 01:53:16'),
(1396, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 01:53:22', '2020-02-10 01:53:22'),
(1397, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:00:51', '2020-02-10 02:00:51'),
(1398, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:02:04', '2020-02-10 02:02:04'),
(1399, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:02:27', '2020-02-10 02:02:27'),
(1400, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:02:41', '2020-02-10 02:02:41'),
(1401, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:04:11', '2020-02-10 02:04:11'),
(1402, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:04:29', '2020-02-10 02:04:29'),
(1403, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:04:50', '2020-02-10 02:04:50'),
(1404, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:05:07', '2020-02-10 02:05:07'),
(1405, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:05:14', '2020-02-10 02:05:14'),
(1406, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:05:23', '2020-02-10 02:05:23'),
(1407, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:05:51', '2020-02-10 02:05:51'),
(1408, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:06:36', '2020-02-10 02:06:36'),
(1409, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:08:32', '2020-02-10 02:08:32'),
(1410, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:11:56', '2020-02-10 02:11:56'),
(1411, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:12:57', '2020-02-10 02:12:57'),
(1412, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:13:00', '2020-02-10 02:13:00'),
(1413, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:13:20', '2020-02-10 02:13:20'),
(1414, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:15:33', '2020-02-10 02:15:33'),
(1415, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:38:36', '2020-02-10 02:38:36'),
(1416, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:38:38', '2020-02-10 02:38:38'),
(1417, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 02:41:24', '2020-02-10 02:41:24'),
(1418, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 02:42:36', '2020-02-10 02:42:36'),
(1419, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:43:07', '2020-02-10 02:43:07'),
(1420, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:44:01', '2020-02-10 02:44:01'),
(1421, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:44:40', '2020-02-10 02:44:40'),
(1422, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:58:49', '2020-02-10 02:58:49'),
(1423, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 02:59:08', '2020-02-10 02:59:08'),
(1424, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 03:00:07', '2020-02-10 03:00:07'),
(1425, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 03:00:25', '2020-02-10 03:00:25'),
(1426, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 03:01:30', '2020-02-10 03:01:30'),
(1427, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-10 03:01:48', '2020-02-10 03:01:48'),
(1428, NULL, 5, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:02:10', '2020-02-10 03:02:10'),
(1429, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:02:16', '2020-02-10 03:02:16'),
(1430, NULL, 5, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:03:03', '2020-02-10 03:03:03'),
(1431, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:03:05', '2020-02-10 03:03:05'),
(1432, NULL, 5, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:03:07', '2020-02-10 03:03:07'),
(1433, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 03:03:33', '2020-02-10 03:03:33'),
(1434, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:26:40', '2020-02-10 03:26:40'),
(1435, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 03:26:45', '2020-02-10 03:26:45'),
(1436, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:26:49', '2020-02-10 03:26:49'),
(1437, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:29:38', '2020-02-10 03:29:38'),
(1438, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:31:21', '2020-02-10 03:31:21'),
(1439, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:35:00', '2020-02-10 03:35:00');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1440, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:40:16', '2020-02-10 03:40:16'),
(1441, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:42:04', '2020-02-10 03:42:04'),
(1442, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 03:43:26', '2020-02-10 03:43:26'),
(1443, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 04:17:58', '2020-02-10 04:17:58'),
(1444, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 04:19:07', '2020-02-10 04:19:07'),
(1445, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 17:30:38', '2020-02-10 17:30:38'),
(1446, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 17:30:43', '2020-02-10 17:30:43'),
(1447, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 17:30:50', '2020-02-10 17:30:50'),
(1448, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 17:30:58', '2020-02-10 17:30:58'),
(1449, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 17:56:06', '2020-02-10 17:56:06'),
(1450, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 17:58:10', '2020-02-10 17:58:10'),
(1451, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 17:58:44', '2020-02-10 17:58:44'),
(1452, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:08:05', '2020-02-10 18:08:05'),
(1453, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:10:36', '2020-02-10 18:10:36'),
(1454, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:12:09', '2020-02-10 18:12:09'),
(1455, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:14:50', '2020-02-10 18:14:50'),
(1456, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:15:45', '2020-02-10 18:15:45'),
(1457, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:15:59', '2020-02-10 18:15:59'),
(1458, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:20:33', '2020-02-10 18:20:33'),
(1459, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:30:29', '2020-02-10 18:30:29'),
(1460, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:34:46', '2020-02-10 18:34:46'),
(1461, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 18:35:44', '2020-02-10 18:35:44'),
(1462, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":\"\\u0662\\u0660\\u0662\\u0660-\\u0660\\u0662-\\u0662\\u0667 \\u0660\\u0660:\\u0660\\u0660:\\u0660\\u0660\",\"group\":{\"1\":{\"name\":[\"\\u0633\\u064a\\u0628\\u0633\\u064a\",null]}},\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-02-10 20:05:15', '2020-02-10 20:05:15'),
(1463, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:05:15', '2020-02-10 20:05:15'),
(1464, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":\"1\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\"}', '2020-02-10 20:05:56', '2020-02-10 20:05:56'),
(1465, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:05:56', '2020-02-10 20:05:56'),
(1466, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:09:34', '2020-02-10 20:09:34'),
(1467, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":\"1\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"2\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-02-10 20:09:53', '2020-02-10 20:09:53'),
(1468, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:09:54', '2020-02-10 20:09:54'),
(1469, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":\"1\",\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"2\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\"}', '2020-02-10 20:10:44', '2020-02-10 20:10:44'),
(1470, NULL, 5, 'system_admin/shop_product/50', 'GET', '127.0.0.1', '[]', '2020-02-10 20:10:45', '2020-02-10 20:10:45'),
(1471, NULL, 5, 'system_admin/shop_product/50', 'GET', '127.0.0.1', '[]', '2020-02-10 20:11:20', '2020-02-10 20:11:20'),
(1472, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:11:25', '2020-02-10 20:11:25'),
(1473, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/50\"}', '2020-02-10 20:11:31', '2020-02-10 20:11:31'),
(1474, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:11:31', '2020-02-10 20:11:31'),
(1475, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\"}', '2020-02-10 20:12:36', '2020-02-10 20:12:36'),
(1476, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:12:36', '2020-02-10 20:12:36'),
(1477, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\"}', '2020-02-10 20:18:19', '2020-02-10 20:18:19'),
(1478, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 20:18:26', '2020-02-10 20:18:26'),
(1479, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"9\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\"}', '2020-02-10 20:18:47', '2020-02-10 20:18:47'),
(1480, NULL, 5, 'system_admin/shop_product/50', 'GET', '127.0.0.1', '[]', '2020-02-10 20:18:47', '2020-02-10 20:18:47'),
(1481, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:20:13', '2020-02-10 20:20:13'),
(1482, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/50\"}', '2020-02-10 20:20:16', '2020-02-10 20:20:16'),
(1483, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:20:16', '2020-02-10 20:20:16'),
(1484, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:22:45', '2020-02-10 20:22:45'),
(1485, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/50\"}', '2020-02-10 20:22:49', '2020-02-10 20:22:49'),
(1486, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 20:22:49', '2020-02-10 20:22:49'),
(1487, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:22:58', '2020-02-10 20:22:58'),
(1488, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"3\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-02-10 20:23:34', '2020-02-10 20:23:34'),
(1489, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 20:23:34', '2020-02-10 20:23:34'),
(1490, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:23:39', '2020-02-10 20:23:39'),
(1491, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:40:52', '2020-02-10 20:40:52'),
(1492, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:42:05', '2020-02-10 20:42:05'),
(1493, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"250\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-02-10 20:42:20', '2020-02-10 20:42:20'),
(1494, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 20:42:21', '2020-02-10 20:42:21'),
(1495, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:42:27', '2020-02-10 20:42:27'),
(1496, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:42:27', '2020-02-10 20:42:27'),
(1497, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:42:46', '2020-02-10 20:42:46'),
(1498, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-02-10 20:48:19', '2020-02-10 20:48:19'),
(1499, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 20:49:19', '2020-02-10 20:49:19'),
(1500, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:49:26', '2020-02-10 20:49:26'),
(1501, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 20:49:31', '2020-02-10 20:49:31'),
(1502, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:49:36', '2020-02-10 20:49:36'),
(1503, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 20:49:56', '2020-02-10 20:49:56'),
(1504, NULL, 5, 'system_admin/shop_product/50', 'PUT', '127.0.0.1', '{\"category_id\":\"19\",\"compnay_id\":null,\"price\":\"200\",\"cost\":\"120\",\"stock\":\"8\",\"sku\":\"prod1\",\"brand_id\":\"0\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"0\",\"date_available\":null,\"_token\":\"wuldM5Gf4oR4gsq9WYrp3hcYiAnBSWj9kMiYlRWc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-02-10 20:50:00', '2020-02-10 20:50:00'),
(1505, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 20:53:17', '2020-02-10 20:53:17'),
(1506, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-10 21:04:09', '2020-02-10 21:04:09'),
(1507, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-10 21:04:13', '2020-02-10 21:04:13'),
(1508, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-10 21:04:25', '2020-02-10 21:04:25'),
(1509, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-10 21:04:29', '2020-02-10 21:04:29'),
(1510, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:04:33', '2020-02-10 21:04:33'),
(1511, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:05:18', '2020-02-10 21:05:18'),
(1512, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:06:28', '2020-02-10 21:06:28'),
(1513, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:07:03', '2020-02-10 21:07:03'),
(1514, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:08:23', '2020-02-10 21:08:23'),
(1515, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:08:26', '2020-02-10 21:08:26'),
(1516, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:09:20', '2020-02-10 21:09:20'),
(1517, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-10 21:09:53', '2020-02-10 21:09:53'),
(1518, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 02:13:30', '2020-02-11 02:13:30'),
(1519, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:19:04', '2020-02-11 03:19:04'),
(1520, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:26:06', '2020-02-11 03:26:06'),
(1521, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:30:18', '2020-02-11 03:30:18'),
(1522, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:31:43', '2020-02-11 03:31:43'),
(1523, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:32:41', '2020-02-11 03:32:41'),
(1524, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:32:42', '2020-02-11 03:32:42'),
(1525, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:32:53', '2020-02-11 03:32:53'),
(1526, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:35:55', '2020-02-11 03:35:55'),
(1527, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:41:41', '2020-02-11 03:41:41'),
(1528, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:42:41', '2020-02-11 03:42:41'),
(1529, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:43:24', '2020-02-11 03:43:24'),
(1530, NULL, 5, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:53:38', '2020-02-11 03:53:38'),
(1531, NULL, 5, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:53:42', '2020-02-11 03:53:42'),
(1532, NULL, 5, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:53:45', '2020-02-11 03:53:45'),
(1533, NULL, 5, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:53:47', '2020-02-11 03:53:47'),
(1534, NULL, 5, 'system_admin/backup_database', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:53:51', '2020-02-11 03:53:51'),
(1535, NULL, 5, 'system_admin/backup', 'POST', '127.0.0.1', '{\"_token\":\"ss7NOKO2Bm3OBbMTlbOw0wFfoSffROIA4gYuFAnJ\"}', '2020-02-11 03:54:05', '2020-02-11 03:54:05'),
(1536, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:54:40', '2020-02-11 03:54:40'),
(1537, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:55:19', '2020-02-11 03:55:19'),
(1538, NULL, 5, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:55:34', '2020-02-11 03:55:34'),
(1539, NULL, 5, 'system_admin/subscribe/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"ss7NOKO2Bm3OBbMTlbOw0wFfoSffROIA4gYuFAnJ\"}', '2020-02-11 03:55:48', '2020-02-11 03:55:48'),
(1540, NULL, 5, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:55:49', '2020-02-11 03:55:49'),
(1541, NULL, 5, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:55:52', '2020-02-11 03:55:52'),
(1542, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:55:53', '2020-02-11 03:55:53'),
(1543, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:55:56', '2020-02-11 03:55:56'),
(1544, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:00', '2020-02-11 03:56:00'),
(1545, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:02', '2020-02-11 03:56:02'),
(1546, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:03', '2020-02-11 03:56:03'),
(1547, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:05', '2020-02-11 03:56:05'),
(1548, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:07', '2020-02-11 03:56:07'),
(1549, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:08', '2020-02-11 03:56:08'),
(1550, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:21', '2020-02-11 03:56:21'),
(1551, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:33', '2020-02-11 03:56:33'),
(1552, NULL, 5, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:35', '2020-02-11 03:56:35'),
(1553, NULL, 5, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:42', '2020-02-11 03:56:42'),
(1554, NULL, 5, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:46', '2020-02-11 03:56:46'),
(1555, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-11 03:56:49', '2020-02-11 03:56:49'),
(1556, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:56:55', '2020-02-11 03:56:55'),
(1557, NULL, 5, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:57:00', '2020-02-11 03:57:00'),
(1558, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:57:03', '2020-02-11 03:57:03'),
(1559, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:57:16', '2020-02-11 03:57:16'),
(1560, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 03:57:24', '2020-02-11 03:57:24'),
(1561, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:57:40', '2020-02-11 03:57:40'),
(1562, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:57:56', '2020-02-11 03:57:56'),
(1563, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 03:59:09', '2020-02-11 03:59:09'),
(1564, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:00:00', '2020-02-11 04:00:00'),
(1565, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:02:32', '2020-02-11 04:02:32'),
(1566, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:05:16', '2020-02-11 04:05:16'),
(1567, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:15:23', '2020-02-11 04:15:23'),
(1568, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:17:28', '2020-02-11 04:17:28'),
(1569, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:18:07', '2020-02-11 04:18:07'),
(1570, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:19:21', '2020-02-11 04:19:21'),
(1571, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:20:30', '2020-02-11 04:20:30'),
(1572, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:31:18', '2020-02-11 04:31:18'),
(1573, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:31:50', '2020-02-11 04:31:50'),
(1574, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:32:25', '2020-02-11 04:32:25'),
(1575, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 04:33:17', '2020-02-11 04:33:17'),
(1576, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:19:34', '2020-02-11 16:19:34'),
(1577, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:20:01', '2020-02-11 16:20:01'),
(1578, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:20:14', '2020-02-11 16:20:14'),
(1579, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:21:14', '2020-02-11 16:21:14'),
(1580, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:21:29', '2020-02-11 16:21:29'),
(1581, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:36:16', '2020-02-11 16:36:16'),
(1582, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:36:56', '2020-02-11 16:36:56'),
(1583, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:38:14', '2020-02-11 16:38:14'),
(1584, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:38:26', '2020-02-11 16:38:26'),
(1585, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 16:43:51', '2020-02-11 16:43:51'),
(1586, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:13:24', '2020-02-11 17:13:24'),
(1587, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:14:36', '2020-02-11 17:14:36'),
(1588, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:15:07', '2020-02-11 17:15:07'),
(1589, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:15:31', '2020-02-11 17:15:31'),
(1590, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:15:45', '2020-02-11 17:15:45'),
(1591, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:15:53', '2020-02-11 17:15:53'),
(1592, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:17:58', '2020-02-11 17:17:58'),
(1593, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:18:43', '2020-02-11 17:18:43'),
(1594, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:18:57', '2020-02-11 17:18:57'),
(1595, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:20:19', '2020-02-11 17:20:19'),
(1596, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:45:33', '2020-02-11 17:45:33'),
(1597, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:48:46', '2020-02-11 17:48:46'),
(1598, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:49:24', '2020-02-11 17:49:24'),
(1599, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:50:11', '2020-02-11 17:50:11'),
(1600, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:50:16', '2020-02-11 17:50:16'),
(1601, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:51:17', '2020-02-11 17:51:17'),
(1602, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:51:44', '2020-02-11 17:51:44'),
(1603, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:53:41', '2020-02-11 17:53:41'),
(1604, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:53:57', '2020-02-11 17:53:57'),
(1605, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:54:01', '2020-02-11 17:54:01'),
(1606, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 17:54:20', '2020-02-11 17:54:20'),
(1607, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 18:18:29', '2020-02-11 18:18:29'),
(1608, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 18:19:56', '2020-02-11 18:19:56'),
(1609, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 18:20:40', '2020-02-11 18:20:40'),
(1610, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 18:20:50', '2020-02-11 18:20:50'),
(1611, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 18:22:20', '2020-02-11 18:22:20'),
(1612, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 18:22:46', '2020-02-11 18:22:46'),
(1613, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:02:10', '2020-02-11 19:02:10'),
(1614, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:02:43', '2020-02-11 19:02:43'),
(1615, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:02:48', '2020-02-11 19:02:48'),
(1616, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:03:07', '2020-02-11 19:03:07'),
(1617, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:03:10', '2020-02-11 19:03:10'),
(1618, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:03:32', '2020-02-11 19:03:32'),
(1619, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:03:34', '2020-02-11 19:03:34'),
(1620, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:03:36', '2020-02-11 19:03:36'),
(1621, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:07:55', '2020-02-11 19:07:55'),
(1622, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:12:10', '2020-02-11 19:12:10'),
(1623, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:12:54', '2020-02-11 19:12:54'),
(1624, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:12:57', '2020-02-11 19:12:57'),
(1625, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:52:18', '2020-02-11 19:52:18'),
(1626, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:53:25', '2020-02-11 19:53:25'),
(1627, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:54:17', '2020-02-11 19:54:17'),
(1628, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:54:24', '2020-02-11 19:54:24'),
(1629, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:57:34', '2020-02-11 19:57:34'),
(1630, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:58:09', '2020-02-11 19:58:09'),
(1631, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:59:20', '2020-02-11 19:59:20'),
(1632, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 19:59:59', '2020-02-11 19:59:59'),
(1633, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:00:34', '2020-02-11 20:00:34'),
(1634, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:02:54', '2020-02-11 20:02:54'),
(1635, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:04:05', '2020-02-11 20:04:05'),
(1636, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:11:00', '2020-02-11 20:11:00'),
(1637, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:15:53', '2020-02-11 20:15:53'),
(1638, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:38:45', '2020-02-11 20:38:45'),
(1639, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:41:49', '2020-02-11 20:41:49'),
(1640, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:50:56', '2020-02-11 20:50:56'),
(1641, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:55:10', '2020-02-11 20:55:10'),
(1642, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-11 20:55:25', '2020-02-11 20:55:25'),
(1643, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-11 22:04:11', '2020-02-11 22:04:11'),
(1644, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 22:04:26', '2020-02-11 22:04:26'),
(1645, NULL, 5, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 22:54:08', '2020-02-11 22:54:08'),
(1646, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-11 22:54:10', '2020-02-11 22:54:10'),
(1647, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-12 20:57:30', '2020-02-12 20:57:30'),
(1648, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-21 20:55:12', '2020-02-21 20:55:12'),
(1649, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-21 21:01:34', '2020-02-21 21:01:34'),
(1650, NULL, 5, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2020-02-21 21:01:46', '2020-02-21 21:01:46'),
(1651, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 21:04:50', '2020-02-22 21:04:50'),
(1652, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-22 21:54:37', '2020-02-22 21:54:37'),
(1653, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:12:16', '2020-02-22 22:12:16'),
(1654, NULL, 5, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-02-22 22:24:52', '2020-02-22 22:24:52'),
(1655, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:24:52', '2020-02-22 22:24:52'),
(1656, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:26:48', '2020-02-22 22:26:48'),
(1657, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:27:42', '2020-02-22 22:27:42'),
(1658, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:28:19', '2020-02-22 22:28:19'),
(1659, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:31:22', '2020-02-22 22:31:22'),
(1660, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:34:51', '2020-02-22 22:34:51'),
(1661, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:36:26', '2020-02-22 22:36:26'),
(1662, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:45:36', '2020-02-22 22:45:36'),
(1663, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:46:23', '2020-02-22 22:46:23'),
(1664, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:47:05', '2020-02-22 22:47:05'),
(1665, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:50:52', '2020-02-22 22:50:52'),
(1666, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 22:53:45', '2020-02-22 22:53:45'),
(1667, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-22 23:32:39', '2020-02-22 23:32:39'),
(1668, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-22 23:32:45', '2020-02-22 23:32:45'),
(1669, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-22 23:32:50', '2020-02-22 23:32:50'),
(1670, NULL, 5, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2020-02-22 23:32:56', '2020-02-22 23:32:56'),
(1671, NULL, 5, 'system_admin/shop_category/create', 'GET', '127.0.0.1', '[]', '2020-02-22 23:38:42', '2020-02-22 23:38:42'),
(1672, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-22 23:39:26', '2020-02-22 23:39:26'),
(1673, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-22 23:39:31', '2020-02-22 23:39:31'),
(1674, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-22 23:39:38', '2020-02-22 23:39:38'),
(1675, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-22 23:40:29', '2020-02-22 23:40:29'),
(1676, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-23 00:45:22', '2020-02-23 00:45:22'),
(1677, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-23 00:45:42', '2020-02-23 00:45:42'),
(1678, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-23 00:46:41', '2020-02-23 00:46:41'),
(1679, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-23 00:48:35', '2020-02-23 00:48:35'),
(1680, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-23 00:49:02', '2020-02-23 00:49:02'),
(1681, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-23 01:01:31', '2020-02-23 01:01:31'),
(1682, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-24 23:07:19', '2020-02-24 23:07:19'),
(1683, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-24 23:07:40', '2020-02-24 23:07:40'),
(1684, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-24 23:07:46', '2020-02-24 23:07:46'),
(1685, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:03:47', '2020-02-25 02:03:47'),
(1686, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:04:28', '2020-02-25 02:04:28'),
(1687, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:05:44', '2020-02-25 02:05:44'),
(1688, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:11:26', '2020-02-25 02:11:26'),
(1689, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:12:53', '2020-02-25 02:12:53'),
(1690, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:13:21', '2020-02-25 02:13:21'),
(1691, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:14:53', '2020-02-25 02:14:53'),
(1692, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:16:52', '2020-02-25 02:16:52'),
(1693, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:17:46', '2020-02-25 02:17:46'),
(1694, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:18:32', '2020-02-25 02:18:32'),
(1695, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-02-25 02:19:13', '2020-02-25 02:19:13'),
(1696, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:34:19', '2020-02-25 02:34:19'),
(1697, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:35:24', '2020-02-25 02:35:24'),
(1698, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:36:24', '2020-02-25 02:36:24'),
(1699, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:37:34', '2020-02-25 02:37:34'),
(1700, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:43:06', '2020-02-25 02:43:06'),
(1701, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:43:30', '2020-02-25 02:43:30'),
(1702, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:44:13', '2020-02-25 02:44:13'),
(1703, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:45:08', '2020-02-25 02:45:08'),
(1704, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:49:56', '2020-02-25 02:49:56'),
(1705, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:50:48', '2020-02-25 02:50:48'),
(1706, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:51:28', '2020-02-25 02:51:28'),
(1707, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:53:37', '2020-02-25 02:53:37'),
(1708, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:54:38', '2020-02-25 02:54:38'),
(1709, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:55:41', '2020-02-25 02:55:41'),
(1710, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:55:58', '2020-02-25 02:55:58'),
(1711, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:57:12', '2020-02-25 02:57:12'),
(1712, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:57:23', '2020-02-25 02:57:23'),
(1713, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:57:49', '2020-02-25 02:57:49'),
(1714, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:58:23', '2020-02-25 02:58:23'),
(1715, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:58:53', '2020-02-25 02:58:53'),
(1716, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:59:17', '2020-02-25 02:59:17'),
(1717, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 02:59:59', '2020-02-25 02:59:59'),
(1718, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:01:06', '2020-02-25 03:01:06'),
(1719, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:02:22', '2020-02-25 03:02:22'),
(1720, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:04:48', '2020-02-25 03:04:48'),
(1721, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:05:07', '2020-02-25 03:05:07'),
(1722, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:10:02', '2020-02-25 03:10:02'),
(1723, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:13:09', '2020-02-25 03:13:09'),
(1724, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:13:32', '2020-02-25 03:13:32'),
(1725, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 03:14:12', '2020-02-25 03:14:12'),
(1726, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 04:03:51', '2020-02-25 04:03:51'),
(1727, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 04:04:50', '2020-02-25 04:04:50'),
(1728, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 04:08:39', '2020-02-25 04:08:39'),
(1729, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 04:12:33', '2020-02-25 04:12:33'),
(1730, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 04:26:13', '2020-02-25 04:26:13'),
(1731, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-25 04:28:22', '2020-02-25 04:28:22'),
(1732, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-26 01:41:50', '2020-02-26 01:41:50'),
(1733, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 01:42:00', '2020-02-26 01:42:00'),
(1734, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 01:42:07', '2020-02-26 01:42:07'),
(1735, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 01:47:02', '2020-02-26 01:47:02'),
(1736, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 01:47:15', '2020-02-26 01:47:15'),
(1737, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 01:48:16', '2020-02-26 01:48:16'),
(1738, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 02:06:24', '2020-02-26 02:06:24'),
(1739, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 02:20:57', '2020-02-26 02:20:57'),
(1740, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 02:34:56', '2020-02-26 02:34:56'),
(1741, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 02:37:12', '2020-02-26 02:37:12'),
(1742, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 02:38:47', '2020-02-26 02:38:47'),
(1743, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-26 03:14:57', '2020-02-26 03:14:57'),
(1744, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 03:15:07', '2020-02-26 03:15:07'),
(1745, NULL, 5, 'system_admin/shop_category/18/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:15:17', '2020-02-26 03:15:17'),
(1746, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 03:15:33', '2020-02-26 03:15:33'),
(1747, NULL, 5, 'system_admin/shop_category/19/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:15:37', '2020-02-26 03:15:37'),
(1748, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 03:15:50', '2020-02-26 03:15:50'),
(1749, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 03:15:55', '2020-02-26 03:15:55'),
(1750, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:16:02', '2020-02-26 03:16:02'),
(1751, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:18:04', '2020-02-26 03:18:04'),
(1752, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:19:10', '2020-02-26 03:19:10'),
(1753, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 03:19:25', '2020-02-26 03:19:25'),
(1754, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 03:19:30', '2020-02-26 03:19:30'),
(1755, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:19:33', '2020-02-26 03:19:33'),
(1756, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:36:52', '2020-02-26 03:36:52'),
(1757, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:37:11', '2020-02-26 03:37:11'),
(1758, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:39:36', '2020-02-26 03:39:36'),
(1759, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:40:34', '2020-02-26 03:40:34'),
(1760, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:41:16', '2020-02-26 03:41:16'),
(1761, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:42:13', '2020-02-26 03:42:13'),
(1762, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:44:49', '2020-02-26 03:44:49'),
(1763, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:57:36', '2020-02-26 03:57:36'),
(1764, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 03:59:55', '2020-02-26 03:59:55'),
(1765, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 04:00:27', '2020-02-26 04:00:27'),
(1766, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 04:00:32', '2020-02-26 04:00:32'),
(1767, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2020-02-26 04:00:36', '2020-02-26 04:00:36'),
(1768, NULL, 5, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 04:00:42', '2020-02-26 04:00:42'),
(1769, NULL, 5, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 04:00:44', '2020-02-26 04:00:44'),
(1770, NULL, 5, 'system_admin/backup_database', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 04:01:16', '2020-02-26 04:01:16'),
(1771, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 04:28:16', '2020-02-26 04:28:16'),
(1772, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-26 04:30:28', '2020-02-26 04:30:28'),
(1773, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-26 05:08:49', '2020-02-26 05:08:49'),
(1774, NULL, 5, 'system_admin/shop_category/19/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 00:55:48', '2020-02-27 00:55:48'),
(1775, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-27 01:03:10', '2020-02-27 01:03:10'),
(1776, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-27 01:03:12', '2020-02-27 01:03:12'),
(1777, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:03:17', '2020-02-27 01:03:17'),
(1778, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-27 01:05:19', '2020-02-27 01:05:19'),
(1779, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:05:23', '2020-02-27 01:05:23'),
(1780, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-27 01:05:28', '2020-02-27 01:05:28'),
(1781, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:08:12', '2020-02-27 01:08:12'),
(1782, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:08:18', '2020-02-27 01:08:18'),
(1783, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:09:08', '2020-02-27 01:09:08'),
(1784, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:10:06', '2020-02-27 01:10:06'),
(1785, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:10:08', '2020-02-27 01:10:08'),
(1786, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:10:10', '2020-02-27 01:10:10'),
(1787, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:11:21', '2020-02-27 01:11:21'),
(1788, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:11:22', '2020-02-27 01:11:22'),
(1789, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:15:07', '2020-02-27 01:15:07'),
(1790, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:16:23', '2020-02-27 01:16:23'),
(1791, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-02-27 01:17:20', '2020-02-27 01:17:20'),
(1792, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-27 01:17:36', '2020-02-27 01:17:36'),
(1793, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-27 01:17:40', '2020-02-27 01:17:40'),
(1794, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:17:44', '2020-02-27 01:17:44'),
(1795, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:26:04', '2020-02-27 01:26:04');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1796, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:28:01', '2020-02-27 01:28:01'),
(1797, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:29:06', '2020-02-27 01:29:06'),
(1798, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 01:46:14', '2020-02-27 01:46:14'),
(1799, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 02:05:08', '2020-02-27 02:05:08'),
(1800, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 02:07:01', '2020-02-27 02:07:01'),
(1801, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 02:08:45', '2020-02-27 02:08:45'),
(1802, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 02:09:30', '2020-02-27 02:09:30'),
(1803, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 02:20:53', '2020-02-27 02:20:53'),
(1804, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:26:47', '2020-02-27 03:26:47'),
(1805, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:30:35', '2020-02-27 03:30:35'),
(1806, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:31:34', '2020-02-27 03:31:34'),
(1807, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:31:48', '2020-02-27 03:31:48'),
(1808, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:38:07', '2020-02-27 03:38:07'),
(1809, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:38:35', '2020-02-27 03:38:35'),
(1810, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:53:18', '2020-02-27 03:53:18'),
(1811, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:54:07', '2020-02-27 03:54:07'),
(1812, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:54:27', '2020-02-27 03:54:27'),
(1813, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:55:12', '2020-02-27 03:55:12'),
(1814, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 03:57:32', '2020-02-27 03:57:32'),
(1815, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:02:03', '2020-02-27 04:02:03'),
(1816, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:04:53', '2020-02-27 04:04:53'),
(1817, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:09:44', '2020-02-27 04:09:44'),
(1818, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:10:59', '2020-02-27 04:10:59'),
(1819, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:16:38', '2020-02-27 04:16:38'),
(1820, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:17:45', '2020-02-27 04:17:45'),
(1821, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:18:01', '2020-02-27 04:18:01'),
(1822, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:18:07', '2020-02-27 04:18:07'),
(1823, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:21:01', '2020-02-27 04:21:01'),
(1824, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:21:16', '2020-02-27 04:21:16'),
(1825, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:21:31', '2020-02-27 04:21:31'),
(1826, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:21:47', '2020-02-27 04:21:47'),
(1827, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:22:16', '2020-02-27 04:22:16'),
(1828, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:22:30', '2020-02-27 04:22:30'),
(1829, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:25:30', '2020-02-27 04:25:30'),
(1830, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:27:49', '2020-02-27 04:27:49'),
(1831, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:33:15', '2020-02-27 04:33:15'),
(1832, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:33:47', '2020-02-27 04:33:47'),
(1833, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:35:43', '2020-02-27 04:35:43'),
(1834, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-27 04:44:37', '2020-02-27 04:44:37'),
(1835, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-28 12:08:53', '2020-02-28 12:08:53'),
(1836, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-28 12:09:00', '2020-02-28 12:09:00'),
(1837, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 12:09:45', '2020-02-28 12:09:45'),
(1838, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 12:10:00', '2020-02-28 12:10:00'),
(1839, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-28 12:10:05', '2020-02-28 12:10:05'),
(1840, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 12:11:34', '2020-02-28 12:11:34'),
(1841, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-28 13:29:24', '2020-02-28 13:29:24'),
(1842, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 13:53:36', '2020-02-28 13:53:36'),
(1843, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-02-28 13:58:32', '2020-02-28 13:58:32'),
(1844, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-28 18:53:11', '2020-02-28 18:53:11'),
(1845, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 18:53:20', '2020-02-28 18:53:20'),
(1846, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-02-28 18:53:24', '2020-02-28 18:53:24'),
(1847, NULL, 5, 'system_admin/test', 'GET', '127.0.0.1', '[]', '2020-02-28 18:58:16', '2020-02-28 18:58:16'),
(1848, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:04:53', '2020-02-28 19:04:53'),
(1849, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:05:38', '2020-02-28 19:05:38'),
(1850, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-28 19:47:14', '2020-02-28 19:47:14'),
(1851, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 19:47:44', '2020-02-28 19:47:44'),
(1852, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 19:47:48', '2020-02-28 19:47:48'),
(1853, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-28 19:47:50', '2020-02-28 19:47:50'),
(1854, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:56:59', '2020-02-28 19:56:59'),
(1855, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:57:41', '2020-02-28 19:57:41'),
(1856, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:57:43', '2020-02-28 19:57:43'),
(1857, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:57:50', '2020-02-28 19:57:50'),
(1858, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:58:06', '2020-02-28 19:58:06'),
(1859, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:58:14', '2020-02-28 19:58:14'),
(1860, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:58:21', '2020-02-28 19:58:21'),
(1861, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 19:58:34', '2020-02-28 19:58:34'),
(1862, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:01:27', '2020-02-28 20:01:27'),
(1863, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:01:52', '2020-02-28 20:01:52'),
(1864, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-28 20:56:16', '2020-02-28 20:56:16'),
(1865, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:56:33', '2020-02-28 20:56:33'),
(1866, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:57:28', '2020-02-28 20:57:28'),
(1867, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:57:51', '2020-02-28 20:57:51'),
(1868, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:57:58', '2020-02-28 20:57:58'),
(1869, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:58:06', '2020-02-28 20:58:06'),
(1870, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 20:58:28', '2020-02-28 20:58:28'),
(1871, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 21:04:11', '2020-02-28 21:04:11'),
(1872, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 21:05:35', '2020-02-28 21:05:35'),
(1873, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 21:05:57', '2020-02-28 21:05:57'),
(1874, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 21:07:18', '2020-02-28 21:07:18'),
(1875, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 21:10:20', '2020-02-28 21:10:20'),
(1876, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 21:59:36', '2020-02-28 21:59:36'),
(1877, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 22:02:07', '2020-02-28 22:02:07'),
(1878, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 22:06:46', '2020-02-28 22:06:46'),
(1879, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 22:11:32', '2020-02-28 22:11:32'),
(1880, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 22:22:40', '2020-02-28 22:22:40'),
(1881, NULL, 5, 'system_admin/compnay', 'GET', '127.0.0.1', '[]', '2020-02-28 22:24:58', '2020-02-28 22:24:58'),
(1882, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:25:39', '2020-02-28 22:25:39'),
(1883, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:31:35', '2020-02-28 22:31:35'),
(1884, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:31:46', '2020-02-28 22:31:46'),
(1885, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:31:50', '2020-02-28 22:31:50'),
(1886, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:32:06', '2020-02-28 22:32:06'),
(1887, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:34:03', '2020-02-28 22:34:03'),
(1888, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:34:05', '2020-02-28 22:34:05'),
(1889, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:34:32', '2020-02-28 22:34:32'),
(1890, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:34:33', '2020-02-28 22:34:33'),
(1891, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:35:06', '2020-02-28 22:35:06'),
(1892, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:35:09', '2020-02-28 22:35:09'),
(1893, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:35:15', '2020-02-28 22:35:15'),
(1894, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:55:35', '2020-02-28 22:55:35'),
(1895, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:55:43', '2020-02-28 22:55:43'),
(1896, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:55:46', '2020-02-28 22:55:46'),
(1897, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:55:51', '2020-02-28 22:55:51'),
(1898, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:55:59', '2020-02-28 22:55:59'),
(1899, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:56:01', '2020-02-28 22:56:01'),
(1900, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:56:04', '2020-02-28 22:56:04'),
(1901, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:56:25', '2020-02-28 22:56:25'),
(1902, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 22:56:27', '2020-02-28 22:56:27'),
(1903, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:11:33', '2020-02-28 23:11:33'),
(1904, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:12:21', '2020-02-28 23:12:21'),
(1905, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:14:34', '2020-02-28 23:14:34'),
(1906, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:14:48', '2020-02-28 23:14:48'),
(1907, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:15:55', '2020-02-28 23:15:55'),
(1908, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:16:03', '2020-02-28 23:16:03'),
(1909, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:17:04', '2020-02-28 23:17:04'),
(1910, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:17:10', '2020-02-28 23:17:10'),
(1911, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:17:31', '2020-02-28 23:17:31'),
(1912, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:17:53', '2020-02-28 23:17:53'),
(1913, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-28 23:24:36', '2020-02-28 23:24:36'),
(1914, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-28 23:24:49', '2020-02-28 23:24:49'),
(1915, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:25:08', '2020-02-28 23:25:08'),
(1916, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:28:14', '2020-02-28 23:28:14'),
(1917, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:28:33', '2020-02-28 23:28:33'),
(1918, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:42:13', '2020-02-28 23:42:13'),
(1919, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:43:49', '2020-02-28 23:43:49'),
(1920, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:44:55', '2020-02-28 23:44:55'),
(1921, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:45:24', '2020-02-28 23:45:24'),
(1922, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:47:09', '2020-02-28 23:47:09'),
(1923, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:47:30', '2020-02-28 23:47:30'),
(1924, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:48:12', '2020-02-28 23:48:12'),
(1925, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:49:35', '2020-02-28 23:49:35'),
(1926, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:52:55', '2020-02-28 23:52:55'),
(1927, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:56:59', '2020-02-28 23:56:59'),
(1928, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-28 23:57:19', '2020-02-28 23:57:19'),
(1929, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-29 02:02:49', '2020-02-29 02:02:49'),
(1930, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-29 02:34:46', '2020-02-29 02:34:46'),
(1931, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-29 02:35:14', '2020-02-29 02:35:14'),
(1932, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-29 02:36:09', '2020-02-29 02:36:09'),
(1933, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-29 02:37:00', '2020-02-29 02:37:00'),
(1934, NULL, 5, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-02-29 02:37:11', '2020-02-29 02:37:11'),
(1935, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-29 02:37:19', '2020-02-29 02:37:19'),
(1936, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 02:37:23', '2020-02-29 02:37:23'),
(1937, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:37:42', '2020-02-29 02:37:42'),
(1938, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:38:33', '2020-02-29 02:38:33'),
(1939, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:38:46', '2020-02-29 02:38:46'),
(1940, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:53:22', '2020-02-29 02:53:22'),
(1941, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:53:44', '2020-02-29 02:53:44'),
(1942, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:54:54', '2020-02-29 02:54:54'),
(1943, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:55:35', '2020-02-29 02:55:35'),
(1944, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:55:58', '2020-02-29 02:55:58'),
(1945, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:56:24', '2020-02-29 02:56:24'),
(1946, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:58:04', '2020-02-29 02:58:04'),
(1947, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:58:44', '2020-02-29 02:58:44'),
(1948, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 02:59:45', '2020-02-29 02:59:45'),
(1949, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:00:08', '2020-02-29 03:00:08'),
(1950, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:00:19', '2020-02-29 03:00:19'),
(1951, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:00:40', '2020-02-29 03:00:40'),
(1952, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:01:29', '2020-02-29 03:01:29'),
(1953, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:01:41', '2020-02-29 03:01:41'),
(1954, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:02:37', '2020-02-29 03:02:37'),
(1955, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:03:28', '2020-02-29 03:03:28'),
(1956, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:03:50', '2020-02-29 03:03:50'),
(1957, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:04:08', '2020-02-29 03:04:08'),
(1958, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:04:52', '2020-02-29 03:04:52'),
(1959, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:05:09', '2020-02-29 03:05:09'),
(1960, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:05:21', '2020-02-29 03:05:21'),
(1961, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:06:19', '2020-02-29 03:06:19'),
(1962, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-02-29 03:06:31', '2020-02-29 03:06:31'),
(1963, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-29 03:07:49', '2020-02-29 03:07:49'),
(1964, NULL, 5, 'system_admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-02-29 03:08:03', '2020-02-29 03:08:03'),
(1965, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:13:05', '2020-02-29 03:13:05'),
(1966, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:13:07', '2020-02-29 03:13:07'),
(1967, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:14:55', '2020-02-29 03:14:55'),
(1968, NULL, 5, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2020-02-29 03:14:59', '2020-02-29 03:14:59'),
(1969, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-29 03:15:09', '2020-02-29 03:15:09'),
(1970, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:15:12', '2020-02-29 03:15:12'),
(1971, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:15:48', '2020-02-29 03:15:48'),
(1972, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:16:38', '2020-02-29 03:16:38'),
(1973, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:17:35', '2020-02-29 03:17:35'),
(1974, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:18:11', '2020-02-29 03:18:11'),
(1975, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:26:53', '2020-02-29 03:26:53'),
(1976, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:27:24', '2020-02-29 03:27:24'),
(1977, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:27:31', '2020-02-29 03:27:31'),
(1978, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:27:59', '2020-02-29 03:27:59'),
(1979, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:28:29', '2020-02-29 03:28:29'),
(1980, NULL, 1, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:31:45', '2020-02-29 03:31:45'),
(1981, NULL, 1, 'system_admin/company/1', 'GET', '127.0.0.1', '[]', '2020-02-29 03:40:22', '2020-02-29 03:40:22'),
(1982, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 03:40:27', '2020-02-29 03:40:27'),
(1983, NULL, 1, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:40:34', '2020-02-29 03:40:34'),
(1984, NULL, 1, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 03:40:37', '2020-02-29 03:40:37'),
(1985, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-02-29 19:26:57', '2020-02-29 19:26:57'),
(1986, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 19:56:06', '2020-02-29 19:56:06'),
(1987, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 19:56:14', '2020-02-29 19:56:14'),
(1988, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:07:15', '2020-02-29 20:07:15'),
(1989, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 20:35:01', '2020-02-29 20:35:01'),
(1990, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:35:02', '2020-02-29 20:35:02'),
(1991, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:37:26', '2020-02-29 20:37:26'),
(1992, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:39:32', '2020-02-29 20:39:32'),
(1993, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:39:58', '2020-02-29 20:39:58'),
(1994, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:40:13', '2020-02-29 20:40:13'),
(1995, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:41:30', '2020-02-29 20:41:30'),
(1996, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:55:13', '2020-02-29 20:55:13'),
(1997, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:55:34', '2020-02-29 20:55:34'),
(1998, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 20:55:39', '2020-02-29 20:55:39'),
(1999, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:55:39', '2020-02-29 20:55:39'),
(2000, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-02-29 20:59:30', '2020-02-29 20:59:30'),
(2001, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 20:59:30', '2020-02-29 20:59:30'),
(2002, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:59:37', '2020-02-29 20:59:37'),
(2003, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 20:59:45', '2020-02-29 20:59:45'),
(2004, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 20:59:45', '2020-02-29 20:59:45'),
(2005, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 20:59:50', '2020-02-29 20:59:50'),
(2006, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 21:53:05', '2020-02-29 21:53:05'),
(2007, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 21:53:49', '2020-02-29 21:53:49'),
(2008, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 21:53:53', '2020-02-29 21:53:53'),
(2009, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:53:57', '2020-02-29 21:53:57'),
(2010, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 21:54:14', '2020-02-29 21:54:14'),
(2011, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:14', '2020-02-29 21:54:14'),
(2012, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:15', '2020-02-29 21:54:15'),
(2013, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:15', '2020-02-29 21:54:15'),
(2014, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:16', '2020-02-29 21:54:16'),
(2015, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:16', '2020-02-29 21:54:16'),
(2016, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:16', '2020-02-29 21:54:16'),
(2017, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:17', '2020-02-29 21:54:17'),
(2018, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:17', '2020-02-29 21:54:17'),
(2019, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:18', '2020-02-29 21:54:18'),
(2020, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:18', '2020-02-29 21:54:18'),
(2021, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:18', '2020-02-29 21:54:18'),
(2022, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:19', '2020-02-29 21:54:19'),
(2023, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:19', '2020-02-29 21:54:19'),
(2024, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:20', '2020-02-29 21:54:20'),
(2025, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:20', '2020-02-29 21:54:20'),
(2026, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:20', '2020-02-29 21:54:20'),
(2027, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:21', '2020-02-29 21:54:21'),
(2028, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:21', '2020-02-29 21:54:21'),
(2029, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:21', '2020-02-29 21:54:21'),
(2030, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:22', '2020-02-29 21:54:22'),
(2031, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 21:54:45', '2020-02-29 21:54:45'),
(2032, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:55:44', '2020-02-29 21:55:44'),
(2033, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-29 21:55:57', '2020-02-29 21:55:57'),
(2034, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:55:57', '2020-02-29 21:55:57'),
(2035, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:55:58', '2020-02-29 21:55:58'),
(2036, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:55:58', '2020-02-29 21:55:58'),
(2037, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:55:59', '2020-02-29 21:55:59'),
(2038, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:56:08', '2020-02-29 21:56:08'),
(2039, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:56:35', '2020-02-29 21:56:35'),
(2040, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 21:56:51', '2020-02-29 21:56:51'),
(2041, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:04:44', '2020-02-29 22:04:44'),
(2042, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:04:50', '2020-02-29 22:04:50'),
(2043, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:04:51', '2020-02-29 22:04:51'),
(2044, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:04:54', '2020-02-29 22:04:54'),
(2045, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:05:06', '2020-02-29 22:05:06'),
(2046, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:05:06', '2020-02-29 22:05:06'),
(2047, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:05:13', '2020-02-29 22:05:13'),
(2048, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:06:09', '2020-02-29 22:06:09'),
(2049, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:06:15', '2020-02-29 22:06:15'),
(2050, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:06:18', '2020-02-29 22:06:18'),
(2051, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"4\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:06:23', '2020-02-29 22:06:23'),
(2052, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"4\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:07:47', '2020-02-29 22:07:47'),
(2053, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 22:11:32', '2020-02-29 22:11:32'),
(2054, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:11:36', '2020-02-29 22:11:36'),
(2055, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:11:39', '2020-02-29 22:11:39'),
(2056, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:11:43', '2020-02-29 22:11:43'),
(2057, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 22:13:19', '2020-02-29 22:13:19'),
(2058, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:13:21', '2020-02-29 22:13:21'),
(2059, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:13:24', '2020-02-29 22:13:24'),
(2060, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:13:26', '2020-02-29 22:13:26'),
(2061, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:13:26', '2020-02-29 22:13:26'),
(2062, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:13:29', '2020-02-29 22:13:29'),
(2063, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:13:55', '2020-02-29 22:13:55'),
(2064, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:13:55', '2020-02-29 22:13:55'),
(2065, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:14:07', '2020-02-29 22:14:07'),
(2066, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:14:09', '2020-02-29 22:14:09'),
(2067, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:14:09', '2020-02-29 22:14:09'),
(2068, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:15:37', '2020-02-29 22:15:37'),
(2069, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 22:15:39', '2020-02-29 22:15:39'),
(2070, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 22:16:19', '2020-02-29 22:16:19'),
(2071, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 22:16:21', '2020-02-29 22:16:21'),
(2072, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 22:16:25', '2020-02-29 22:16:25'),
(2073, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:14:30', '2020-02-29 23:14:30'),
(2074, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 23:14:33', '2020-02-29 23:14:33'),
(2075, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 23:15:36', '2020-02-29 23:15:36'),
(2076, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:15:39', '2020-02-29 23:15:39'),
(2077, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-02-29 23:15:42', '2020-02-29 23:15:42'),
(2078, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 23:15:42', '2020-02-29 23:15:42'),
(2079, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:16:14', '2020-02-29 23:16:14'),
(2080, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 23:16:16', '2020-02-29 23:16:16'),
(2081, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 23:20:25', '2020-02-29 23:20:25'),
(2082, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 23:20:28', '2020-02-29 23:20:28'),
(2083, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:20:31', '2020-02-29 23:20:31'),
(2084, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"4\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 23:20:36', '2020-02-29 23:20:36'),
(2085, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 23:20:36', '2020-02-29 23:20:36'),
(2086, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:24:11', '2020-02-29 23:24:11'),
(2087, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:26:09', '2020-02-29 23:26:09'),
(2088, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 23:26:14', '2020-02-29 23:26:14'),
(2089, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 23:48:54', '2020-02-29 23:48:54'),
(2090, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:48:58', '2020-02-29 23:48:58'),
(2091, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-02-29 23:49:00', '2020-02-29 23:49:00'),
(2092, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 23:52:07', '2020-02-29 23:52:07'),
(2093, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:52:10', '2020-02-29 23:52:10'),
(2094, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-02-29 23:52:12', '2020-02-29 23:52:12'),
(2095, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 23:52:13', '2020-02-29 23:52:13'),
(2096, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:52:15', '2020-02-29 23:52:15'),
(2097, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 23:52:42', '2020-02-29 23:52:42'),
(2098, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-02-29 23:52:43', '2020-02-29 23:52:43'),
(2099, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:56:20', '2020-02-29 23:56:20'),
(2100, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-02-29 23:56:21', '2020-02-29 23:56:21'),
(2101, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-02-29 23:56:49', '2020-02-29 23:56:49'),
(2102, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-02-29 23:56:53', '2020-02-29 23:56:53'),
(2103, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-02-29 23:56:55', '2020-02-29 23:56:55'),
(2104, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-29 23:57:01', '2020-02-29 23:57:01'),
(2105, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"parent\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-02-29 23:57:07', '2020-02-29 23:57:07'),
(2106, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 00:08:38', '2020-03-01 00:08:38'),
(2107, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:08:41', '2020-03-01 00:08:41'),
(2108, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:10:11', '2020-03-01 00:10:11'),
(2109, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 00:35:42', '2020-03-01 00:35:42'),
(2110, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 00:36:47', '2020-03-01 00:36:47'),
(2111, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:36:50', '2020-03-01 00:36:50'),
(2112, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 00:36:52', '2020-03-01 00:36:52'),
(2113, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 00:38:01', '2020-03-01 00:38:01'),
(2114, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:38:04', '2020-03-01 00:38:04'),
(2115, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"2\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 00:38:09', '2020-03-01 00:38:09'),
(2116, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-01 00:38:10', '2020-03-01 00:38:10'),
(2117, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:38:13', '2020-03-01 00:38:13'),
(2118, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-01 00:40:42', '2020-03-01 00:40:42'),
(2119, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-01 00:40:42', '2020-03-01 00:40:42'),
(2120, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:40:45', '2020-03-01 00:40:45'),
(2121, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-01 00:40:49', '2020-03-01 00:40:49'),
(2122, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-01 00:40:50', '2020-03-01 00:40:50'),
(2123, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:40:52', '2020-03-01 00:40:52'),
(2124, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:40:56', '2020-03-01 00:40:56'),
(2125, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-01 00:42:59', '2020-03-01 00:42:59'),
(2126, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 00:43:35', '2020-03-01 00:43:35'),
(2127, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:43:38', '2020-03-01 00:43:38'),
(2128, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 00:43:41', '2020-03-01 00:43:41'),
(2129, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 00:44:08', '2020-03-01 00:44:08'),
(2130, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 00:44:11', '2020-03-01 00:44:11'),
(2131, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:43:02', '2020-03-01 01:43:02'),
(2132, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 01:43:04', '2020-03-01 01:43:04'),
(2133, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 01:45:10', '2020-03-01 01:45:10'),
(2134, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:45:13', '2020-03-01 01:45:13'),
(2135, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 01:45:15', '2020-03-01 01:45:15'),
(2136, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 01:47:44', '2020-03-01 01:47:44'),
(2137, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:47:46', '2020-03-01 01:47:46'),
(2138, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 01:47:48', '2020-03-01 01:47:48'),
(2139, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-01 01:48:22', '2020-03-01 01:48:22'),
(2140, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"2\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-03-01 01:48:27', '2020-03-01 01:48:27'),
(2141, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 01:51:08', '2020-03-01 01:51:08'),
(2142, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:51:10', '2020-03-01 01:51:10'),
(2143, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"6\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 01:51:15', '2020-03-01 01:51:15'),
(2144, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 01:51:43', '2020-03-01 01:51:43'),
(2145, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:51:46', '2020-03-01 01:51:46'),
(2146, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:51:46', '2020-03-01 01:51:46'),
(2147, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 01:51:48', '2020-03-01 01:51:48'),
(2148, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 01:52:46', '2020-03-01 01:52:46'),
(2149, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:52:48', '2020-03-01 01:52:48'),
(2150, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"2\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 01:52:52', '2020-03-01 01:52:52'),
(2151, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-01 01:52:52', '2020-03-01 01:52:52'),
(2152, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 01:52:55', '2020-03-01 01:52:55');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2153, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:14:18', '2020-03-01 02:14:18'),
(2154, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-01 02:14:19', '2020-03-01 02:14:19'),
(2155, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:15:03', '2020-03-01 02:15:03'),
(2156, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-03-01 02:16:21', '2020-03-01 02:16:21'),
(2157, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:18:34', '2020-03-01 02:18:34'),
(2158, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:18:36', '2020-03-01 02:18:36'),
(2159, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:18:38', '2020-03-01 02:18:38'),
(2160, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:18:57', '2020-03-01 02:18:57'),
(2161, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:19:00', '2020-03-01 02:19:00'),
(2162, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:19:02', '2020-03-01 02:19:02'),
(2163, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:19:02', '2020-03-01 02:19:02'),
(2164, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:19:05', '2020-03-01 02:19:05'),
(2165, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:19:07', '2020-03-01 02:19:07'),
(2166, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:19:07', '2020-03-01 02:19:07'),
(2167, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:21:01', '2020-03-01 02:21:01'),
(2168, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:21:03', '2020-03-01 02:21:03'),
(2169, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:21:08', '2020-03-01 02:21:08'),
(2170, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:21:08', '2020-03-01 02:21:08'),
(2171, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:21:23', '2020-03-01 02:21:23'),
(2172, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:21:24', '2020-03-01 02:21:24'),
(2173, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:21:25', '2020-03-01 02:21:25'),
(2174, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:22:10', '2020-03-01 02:22:10'),
(2175, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:22:12', '2020-03-01 02:22:12'),
(2176, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:22:12', '2020-03-01 02:22:12'),
(2177, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:22:29', '2020-03-01 02:22:29'),
(2178, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:22:31', '2020-03-01 02:22:31'),
(2179, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:22:32', '2020-03-01 02:22:32'),
(2180, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:27:31', '2020-03-01 02:27:31'),
(2181, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:28:30', '2020-03-01 02:28:30'),
(2182, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:28:53', '2020-03-01 02:28:53'),
(2183, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:28:55', '2020-03-01 02:28:55'),
(2184, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:28:58', '2020-03-01 02:28:58'),
(2185, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:31:18', '2020-03-01 02:31:18'),
(2186, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:31:21', '2020-03-01 02:31:21'),
(2187, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"4\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:31:27', '2020-03-01 02:31:27'),
(2188, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"4\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2\"}', '2020-03-01 02:46:42', '2020-03-01 02:46:42'),
(2189, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:46:46', '2020-03-01 02:46:46'),
(2190, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=4&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:46:51', '2020-03-01 02:46:51'),
(2191, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=4&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2\"}', '2020-03-01 02:47:12', '2020-03-01 02:47:12'),
(2192, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:47:17', '2020-03-01 02:47:17'),
(2193, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D4%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:47:19', '2020-03-01 02:47:19'),
(2194, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D4%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2\"}', '2020-03-01 02:47:36', '2020-03-01 02:47:36'),
(2195, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:47:39', '2020-03-01 02:47:39'),
(2196, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D4%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:47:41', '2020-03-01 02:47:41'),
(2197, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D4%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2\"}', '2020-03-01 02:52:07', '2020-03-01 02:52:07'),
(2198, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:52:09', '2020-03-01 02:52:09'),
(2199, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D4%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:52:13', '2020-03-01 02:52:13'),
(2200, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D4%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2\"}', '2020-03-01 02:52:50', '2020-03-01 02:52:50'),
(2201, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:52:51', '2020-03-01 02:52:51'),
(2202, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:53:04', '2020-03-01 02:53:04'),
(2203, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D3%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D4%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:53:07', '2020-03-01 02:53:07'),
(2204, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D3%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D4%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2\"}', '2020-03-01 02:54:48', '2020-03-01 02:54:48'),
(2205, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:54:50', '2020-03-01 02:54:50'),
(2206, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D3%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D4%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:54:52', '2020-03-01 02:54:52'),
(2207, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D3%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D4%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2\"}', '2020-03-01 02:55:26', '2020-03-01 02:55:26'),
(2208, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:55:28', '2020-03-01 02:55:28'),
(2209, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D3%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D4%252525252526_token%25252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D1%25252525252526_token%2525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany%252525252525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:55:29', '2020-03-01 02:55:29'),
(2210, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:55:44', '2020-03-01 02:55:44'),
(2211, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D3%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D3%252525252526_token%25252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D4%25252525252526_token%2525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany%252525252525252F2%252525252525253Fname%252525252525253Dhighcoder%2525252525252526notes%252525252525253Dlabtops%2525252525252526activity_id%252525252525253D%2525252525252526activity_id%252525252525253D1%2525252525252526_token%252525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252525252526_method%252525252525253DPUT%2525252525252526_previous_%252525252525253Dhttp%25252525252525253A%25252525252525252F%25252525252525252F127.0.0.1%25252525252525253A8000%25252525252525252Fsystem_admin%25252525252525252Fcompany%25252525252525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:55:46', '2020-03-01 02:55:46'),
(2212, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:55:58', '2020-03-01 02:55:58'),
(2213, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D3%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D3%25252525252526_token%2525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany%252525252525252F2%252525252525253Fname%252525252525253Dhighcoder%2525252525252526notes%252525252525253Dlabtops%2525252525252526activity_id%252525252525253D%2525252525252526activity_id%252525252525253D4%2525252525252526_token%252525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252525252526_method%252525252525253DPUT%2525252525252526_previous_%252525252525253Dhttp%25252525252525253A%25252525252525252F%25252525252525252F127.0.0.1%25252525252525253A8000%25252525252525252Fsystem_admin%25252525252525252Fcompany%25252525252525252F2%25252525252525253Fname%25252525252525253Dhighcoder%252525252525252526notes%25252525252525253Dlabtops%252525252525252526activity_id%25252525252525253D%252525252525252526activity_id%25252525252525253D1%252525252525252526_token%25252525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252525252526_method%25252525252525253DPUT%252525252525252526_previous_%25252525252525253Dhttp%2525252525252525253A%2525252525252525252F%2525252525252525252F127.0.0.1%2525252525252525253A8000%2525252525252525252Fsystem_admin%2525252525252525252Fcompany%2525252525252525252F2\",\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:56:17', '2020-03-01 02:56:17'),
(2214, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D3%25252526_token%2525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D3%25252525252526_token%2525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany%252525252525252F2%252525252525253Fname%252525252525253Dhighcoder%2525252525252526notes%252525252525253Dlabtops%2525252525252526activity_id%252525252525253D%2525252525252526activity_id%252525252525253D4%2525252525252526_token%252525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%2525252525252526_method%252525252525253DPUT%2525252525252526_previous_%252525252525253Dhttp%25252525252525253A%25252525252525252F%25252525252525252F127.0.0.1%25252525252525253A8000%25252525252525252Fsystem_admin%25252525252525252Fcompany%25252525252525252F2%25252525252525253Fname%25252525252525253Dhighcoder%252525252525252526notes%25252525252525253Dlabtops%252525252525252526activity_id%25252525252525253D%252525252525252526activity_id%25252525252525253D1%252525252525252526_token%25252525252525253Dt1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf%252525252525252526_method%25252525252525253DPUT%252525252525252526_previous_%25252525252525253Dhttp%2525252525252525253A%2525252525252525252F%2525252525252525252F127.0.0.1%2525252525252525253A8000%2525252525252525252Fsystem_admin%2525252525252525252Fcompany%2525252525252525252F2\"}', '2020-03-01 02:56:19', '2020-03-01 02:56:19'),
(2215, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:56:21', '2020-03-01 02:56:21'),
(2216, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-03-01 02:56:22', '2020-03-01 02:56:22'),
(2217, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:56:43', '2020-03-01 02:56:43'),
(2218, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:56:54', '2020-03-01 02:56:54'),
(2219, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:57:22', '2020-03-01 02:57:22'),
(2220, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:57:24', '2020-03-01 02:57:24'),
(2221, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:57:26', '2020-03-01 02:57:26'),
(2222, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-01 02:57:48', '2020-03-01 02:57:48'),
(2223, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-03-01 02:57:53', '2020-03-01 02:57:53'),
(2224, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 02:59:19', '2020-03-01 02:59:19'),
(2225, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:59:22', '2020-03-01 02:59:22'),
(2226, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 02:59:23', '2020-03-01 02:59:23'),
(2227, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 02:59:24', '2020-03-01 02:59:24'),
(2228, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"t1QEN1Wti43nGueNMsVwDhFBHQcuUouvQm0iDZyf\",\"_method\":\"PUT\"}', '2020-03-01 03:04:49', '2020-03-01 03:04:49'),
(2229, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 03:04:50', '2020-03-01 03:04:50'),
(2230, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 09:23:40', '2020-03-01 09:23:40'),
(2231, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 09:23:44', '2020-03-01 09:23:44'),
(2232, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"SQINk6FuSX5iIRxWwUIKRPcl3Pe2wJWZSMkZJ0Nj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 09:23:47', '2020-03-01 09:23:47'),
(2233, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-01 09:23:48', '2020-03-01 09:23:48'),
(2234, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 09:23:50', '2020-03-01 09:23:50'),
(2235, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 09:25:00', '2020-03-01 09:25:00'),
(2236, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 09:25:03', '2020-03-01 09:25:03'),
(2237, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 09:25:16', '2020-03-01 09:25:16'),
(2238, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"SQINk6FuSX5iIRxWwUIKRPcl3Pe2wJWZSMkZJ0Nj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-01 09:25:31', '2020-03-01 09:25:31'),
(2239, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-01 09:25:31', '2020-03-01 09:25:31'),
(2240, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-01 09:25:36', '2020-03-01 09:25:36'),
(2241, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:18:34', '2020-03-02 01:18:34'),
(2242, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:18:37', '2020-03-02 01:18:37'),
(2243, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:18:49', '2020-03-02 01:18:49'),
(2244, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:19:08', '2020-03-02 01:19:08'),
(2245, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:19:55', '2020-03-02 01:19:55'),
(2246, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:20:12', '2020-03-02 01:20:12'),
(2247, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:21:04', '2020-03-02 01:21:04'),
(2248, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:21:05', '2020-03-02 01:21:05'),
(2249, NULL, 5, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-03-02 01:21:21', '2020-03-02 01:21:21'),
(2250, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 01:21:25', '2020-03-02 01:21:25'),
(2251, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:21:29', '2020-03-02 01:21:29'),
(2252, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:21:50', '2020-03-02 01:21:50'),
(2253, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"2\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:22:37', '2020-03-02 01:22:37'),
(2254, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:23:47', '2020-03-02 01:23:47'),
(2255, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=2&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:23:49', '2020-03-02 01:23:49'),
(2256, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=2&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany\"}', '2020-03-02 01:24:32', '2020-03-02 01:24:32');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2257, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=2&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany\"}', '2020-03-02 01:24:46', '2020-03-02 01:24:46'),
(2258, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=2&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany\"}', '2020-03-02 01:35:45', '2020-03-02 01:35:45'),
(2259, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:35:48', '2020-03-02 01:35:48'),
(2260, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D2%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:35:50', '2020-03-02 01:35:50'),
(2261, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D2%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany\"}', '2020-03-02 01:36:00', '2020-03-02 01:36:00'),
(2262, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:36:03', '2020-03-02 01:36:03'),
(2263, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D2%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:36:06', '2020-03-02 01:36:06'),
(2264, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D2%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany\"}', '2020-03-02 01:36:32', '2020-03-02 01:36:32'),
(2265, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:36:36', '2020-03-02 01:36:36'),
(2266, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D2%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:36:41', '2020-03-02 01:36:41'),
(2267, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:37:20', '2020-03-02 01:37:20'),
(2268, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D2%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:37:50', '2020-03-02 01:37:50'),
(2269, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:39:30', '2020-03-02 01:39:30'),
(2270, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D2%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:39:32', '2020-03-02 01:39:32'),
(2271, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=3&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D2%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany\"}', '2020-03-02 01:40:05', '2020-03-02 01:40:05'),
(2272, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:40:07', '2020-03-02 01:40:07'),
(2273, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D2%252525252526_token%25252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:40:09', '2020-03-02 01:40:09'),
(2274, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D3%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D2%252525252526_token%25252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany\"}', '2020-03-02 01:40:50', '2020-03-02 01:40:50'),
(2275, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:40:53', '2020-03-02 01:40:53'),
(2276, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D3%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D2%25252525252526_token%2525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:40:55', '2020-03-02 01:40:55'),
(2277, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:42:08', '2020-03-02 01:42:08'),
(2278, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D3%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D3%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D1%25252525252526_token%2525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany%252525252525252F2%252525252525253Fname%252525252525253Dhighcoder%2525252525252526notes%252525252525253Dlabtops%2525252525252526activity_id%252525252525253D%2525252525252526activity_id%252525252525253D2%2525252525252526_token%252525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252525252526_method%252525252525253DPUT%2525252525252526_previous_%252525252525253Dhttp%25252525252525253A%25252525252525252F%25252525252525252F127.0.0.1%25252525252525253A8000%25252525252525252Fsystem_admin%25252525252525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:44:33', '2020-03-02 01:44:33'),
(2279, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:45:51', '2020-03-02 01:45:51'),
(2280, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:46:29', '2020-03-02 01:46:29'),
(2281, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D1%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D1%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525252F2%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D3%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D3%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D1%25252525252526_token%2525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany%252525252525252F2%252525252525253Fname%252525252525253Dhighcoder%2525252525252526notes%252525252525253Dlabtops%2525252525252526activity_id%252525252525253D%2525252525252526activity_id%252525252525253D1%2525252525252526_token%252525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252525252526_method%252525252525253DPUT%2525252525252526_previous_%252525252525253Dhttp%25252525252525253A%25252525252525252F%25252525252525252F127.0.0.1%25252525252525253A8000%25252525252525252Fsystem_admin%25252525252525252Fcompany%25252525252525252F2%25252525252525253Fname%25252525252525253Dhighcoder%252525252525252526notes%25252525252525253Dlabtops%252525252525252526activity_id%25252525252525253D%252525252525252526activity_id%25252525252525253D2%252525252525252526_token%25252525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252525252526_method%25252525252525253DPUT%252525252525252526_previous_%25252525252525253Dhttp%2525252525252525253A%2525252525252525252F%2525252525252525252F127.0.0.1%2525252525252525253A8000%2525252525252525252Fsystem_admin%2525252525252525252Fcompany\",\"_pjax\":\"#pjax-container\"}', '2020-03-02 01:46:32', '2020-03-02 01:46:32'),
(2282, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:46:35', '2020-03-02 01:46:35'),
(2283, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2?name=highcoder&notes=labtops&activity_id=&activity_id=1&_token=hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb&_method=PUT&_previous_=http%3A%2F%2F127.0.0.1%3A8000%2Fsystem_admin%2Fcompany%2F2%3Fname%3Dhighcoder%26notes%3Dlabtops%26activity_id%3D%26activity_id%3D1%26_token%3DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%26_method%3DPUT%26_previous_%3Dhttp%253A%252F%252F127.0.0.1%253A8000%252Fsystem_admin%252Fcompany%252F2%253Fname%253Dhighcoder%2526notes%253Dlabtops%2526activity_id%253D%2526activity_id%253D3%2526_token%253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2526_method%253DPUT%2526_previous_%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8000%25252Fsystem_admin%25252Fcompany%25252F2%25253Fname%25253Dhighcoder%252526notes%25253Dlabtops%252526activity_id%25253D%252526activity_id%25253D3%252526_token%25253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252526_method%25253DPUT%252526_previous_%25253Dhttp%2525253A%2525252F%2525252F127.0.0.1%2525253A8000%2525252Fsystem_admin%2525252Fcompany%2525253Fname%2525253Dhighcoder%25252526notes%2525253Dlabtops%25252526activity_id%2525253D%25252526activity_id%2525253D1%25252526_token%2525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252526_method%2525253DPUT%25252526_previous_%2525253Dhttp%252525253A%252525252F%252525252F127.0.0.1%252525253A8000%252525252Fsystem_admin%252525252Fcompany%252525252F2%252525253Fname%252525253Dhighcoder%2525252526notes%252525253Dlabtops%2525252526activity_id%252525253D%2525252526activity_id%252525253D1%2525252526_token%252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%2525252526_method%252525253DPUT%2525252526_previous_%252525253Dhttp%25252525253A%25252525252F%25252525252F127.0.0.1%25252525253A8000%25252525252Fsystem_admin%25252525252Fcompany%25252525252F2%25252525253Fname%25252525253Dhighcoder%252525252526notes%25252525253Dlabtops%252525252526activity_id%25252525253D%252525252526activity_id%25252525253D1%252525252526_token%25252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%252525252526_method%25252525253DPUT%252525252526_previous_%25252525253Dhttp%2525252525253A%2525252525252F%2525252525252F127.0.0.1%2525252525253A8000%2525252525252Fsystem_admin%2525252525252Fcompany%2525252525252F2%2525252525253Fname%2525252525253Dhighcoder%25252525252526notes%2525252525253Dlabtops%25252525252526activity_id%2525252525253D%25252525252526activity_id%2525252525253D2%25252525252526_token%2525252525253DhRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb%25252525252526_method%2525252525253DPUT%25252525252526_previous_%2525252525253Dhttp%252525252525253A%252525252525252F%252525252525252F127.0.0.1%252525252525253A8000%252525252525252Fsystem_admin%252525252525252Fcompany\"}', '2020-03-02 01:47:32', '2020-03-02 01:47:32'),
(2284, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 01:47:35', '2020-03-02 01:47:35'),
(2285, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 01:48:15', '2020-03-02 01:48:15'),
(2286, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:55:16', '2020-03-02 01:55:16'),
(2287, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 01:55:43', '2020-03-02 01:55:43'),
(2288, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:23:22', '2020-03-02 02:23:22'),
(2289, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:23:22', '2020-03-02 02:23:22'),
(2290, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:23:46', '2020-03-02 02:23:46'),
(2291, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:23:47', '2020-03-02 02:23:47'),
(2292, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:24:38', '2020-03-02 02:24:38'),
(2293, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:24:39', '2020-03-02 02:24:39'),
(2294, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:24:50', '2020-03-02 02:24:50'),
(2295, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:24:51', '2020-03-02 02:24:51'),
(2296, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:25:04', '2020-03-02 02:25:04'),
(2297, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:25:05', '2020-03-02 02:25:05'),
(2298, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:26:58', '2020-03-02 02:26:58'),
(2299, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:26:58', '2020-03-02 02:26:58'),
(2300, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:27:41', '2020-03-02 02:27:41'),
(2301, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 02:27:42', '2020-03-02 02:27:42'),
(2302, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 02:47:58', '2020-03-02 02:47:58'),
(2303, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 02:47:59', '2020-03-02 02:47:59'),
(2304, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:48:04', '2020-03-02 02:48:04'),
(2305, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:48:05', '2020-03-02 02:48:05'),
(2306, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 02:48:08', '2020-03-02 02:48:08'),
(2307, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 02:48:08', '2020-03-02 02:48:08'),
(2308, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:48:58', '2020-03-02 02:48:58'),
(2309, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:48:59', '2020-03-02 02:48:59'),
(2310, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 02:50:07', '2020-03-02 02:50:07'),
(2311, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 02:50:08', '2020-03-02 02:50:08'),
(2312, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:50:29', '2020-03-02 02:50:29'),
(2313, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 02:50:39', '2020-03-02 02:50:39'),
(2314, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 02:50:39', '2020-03-02 02:50:39'),
(2315, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:52:08', '2020-03-02 02:52:08'),
(2316, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 02:52:19', '2020-03-02 02:52:19'),
(2317, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 02:52:21', '2020-03-02 02:52:21'),
(2318, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-02 02:54:08', '2020-03-02 02:54:08'),
(2319, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\"}', '2020-03-02 02:54:14', '2020-03-02 02:54:14'),
(2320, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:35:01', '2020-03-02 03:35:01'),
(2321, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:35:15', '2020-03-02 03:35:15'),
(2322, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:35:18', '2020-03-02 03:35:18'),
(2323, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:35:48', '2020-03-02 03:35:48'),
(2324, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:35:51', '2020-03-02 03:35:51'),
(2325, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"1\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:35:53', '2020-03-02 03:35:53'),
(2326, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:45:48', '2020-03-02 03:45:48'),
(2327, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:45:50', '2020-03-02 03:45:50'),
(2328, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:45:55', '2020-03-02 03:45:55'),
(2329, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:45:55', '2020-03-02 03:45:55'),
(2330, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:45:59', '2020-03-02 03:45:59'),
(2331, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:46:04', '2020-03-02 03:46:04'),
(2332, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:46:05', '2020-03-02 03:46:05'),
(2333, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:47:27', '2020-03-02 03:47:27'),
(2334, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops1\",\"activity_id\":\"4\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:47:38', '2020-03-02 03:47:38'),
(2335, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:48:46', '2020-03-02 03:48:46'),
(2336, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:48:48', '2020-03-02 03:48:48'),
(2337, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:48:50', '2020-03-02 03:48:50'),
(2338, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops1\",\"activity_id\":\"2\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:48:56', '2020-03-02 03:48:56'),
(2339, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:49:11', '2020-03-02 03:49:11'),
(2340, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:49:27', '2020-03-02 03:49:27'),
(2341, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops1\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:49:32', '2020-03-02 03:49:32'),
(2342, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:49:32', '2020-03-02 03:49:32'),
(2343, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:50:22', '2020-03-02 03:50:22'),
(2344, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:50:24', '2020-03-02 03:50:24'),
(2345, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops1\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:50:27', '2020-03-02 03:50:27'),
(2346, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:07', '2020-03-02 03:51:07'),
(2347, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:10', '2020-03-02 03:51:10'),
(2348, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:13', '2020-03-02 03:51:13'),
(2349, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:16', '2020-03-02 03:51:16'),
(2350, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops1\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:51:18', '2020-03-02 03:51:18'),
(2351, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:23', '2020-03-02 03:51:23'),
(2352, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:26', '2020-03-02 03:51:26'),
(2353, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops1\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\\/2\"}', '2020-03-02 03:51:28', '2020-03-02 03:51:28'),
(2354, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-02 03:51:59', '2020-03-02 03:51:59'),
(2355, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:07', '2020-03-02 03:52:07'),
(2356, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:14', '2020-03-02 03:52:14'),
(2357, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:18', '2020-03-02 03:52:18'),
(2358, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:24', '2020-03-02 03:52:24'),
(2359, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:27', '2020-03-02 03:52:27'),
(2360, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 03:52:31', '2020-03-02 03:52:31'),
(2361, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:31', '2020-03-02 03:52:31'),
(2362, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:46', '2020-03-02 03:52:46'),
(2363, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 03:52:50', '2020-03-02 03:52:50'),
(2364, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:52:50', '2020-03-02 03:52:50'),
(2365, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-02 03:53:02', '2020-03-02 03:53:02'),
(2366, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"_token\":\"hRPpWLbYQ9MgXBPA2aLjFtauQZM7knPP7LpIYvlb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-02 03:53:05', '2020-03-02 03:53:05'),
(2367, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 03:53:07', '2020-03-02 03:53:07'),
(2368, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '[]', '2020-03-02 04:18:54', '2020-03-02 04:18:54'),
(2369, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 04:18:59', '2020-03-02 04:18:59'),
(2370, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 04:19:13', '2020-03-02 04:19:13'),
(2371, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 04:19:38', '2020-03-02 04:19:38'),
(2372, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 04:20:03', '2020-03-02 04:20:03'),
(2373, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 04:20:05', '2020-03-02 04:20:05'),
(2374, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 04:21:28', '2020-03-02 04:21:28'),
(2375, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 04:21:31', '2020-03-02 04:21:31'),
(2376, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-02 04:22:11', '2020-03-02 04:22:11'),
(2377, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-02 04:22:13', '2020-03-02 04:22:13'),
(2378, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-04 02:02:30', '2020-03-04 02:02:30'),
(2379, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-04 02:22:36', '2020-03-04 02:22:36'),
(2380, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-04 02:22:38', '2020-03-04 02:22:38'),
(2381, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-04 02:22:39', '2020-03-04 02:22:39'),
(2382, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-04 02:23:52', '2020-03-04 02:23:52'),
(2383, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 02:30:39', '2020-03-04 02:30:39'),
(2384, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-04 03:36:45', '2020-03-04 03:36:45'),
(2385, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 03:48:18', '2020-03-04 03:48:18'),
(2386, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2020-03-04 03:48:35', '2020-03-04 03:48:35'),
(2387, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"3\"}', '2020-03-04 03:48:43', '2020-03-04 03:48:43'),
(2388, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"3\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2020-03-04 03:48:48', '2020-03-04 03:48:48'),
(2389, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2020-03-04 03:48:48', '2020-03-04 03:48:48'),
(2390, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:00:34', '2020-03-04 04:00:34'),
(2391, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:01:42', '2020-03-04 04:01:42'),
(2392, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:02:41', '2020-03-04 04:02:41'),
(2393, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:03:37', '2020-03-04 04:03:37'),
(2394, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:06:20', '2020-03-04 04:06:20'),
(2395, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:06:47', '2020-03-04 04:06:47'),
(2396, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:07:35', '2020-03-04 04:07:35'),
(2397, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:08:37', '2020-03-04 04:08:37'),
(2398, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\"}', '2020-03-04 04:08:50', '2020-03-04 04:08:50'),
(2399, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:09:15', '2020-03-04 04:09:15'),
(2400, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:10:25', '2020-03-04 04:10:25'),
(2401, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:11:28', '2020-03-04 04:11:28');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2402, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:15:07', '2020-03-04 04:15:07'),
(2403, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:16:55', '2020-03-04 04:16:55'),
(2404, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:17:12', '2020-03-04 04:17:12'),
(2405, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:17:27', '2020-03-04 04:17:27'),
(2406, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:21:42', '2020-03-04 04:21:42'),
(2407, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:22:20', '2020-03-04 04:22:20'),
(2408, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"page\":\"1\",\"per_page\":\"100\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-04 04:22:50', '2020-03-04 04:22:50'),
(2409, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-04 04:28:09', '2020-03-04 04:28:09'),
(2410, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:28:56', '2020-03-04 04:28:56'),
(2411, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:29:05', '2020-03-04 04:29:05'),
(2412, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:29:41', '2020-03-04 04:29:41'),
(2413, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:32:36', '2020-03-04 04:32:36'),
(2414, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:33:00', '2020-03-04 04:33:00'),
(2415, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:33:20', '2020-03-04 04:33:20'),
(2416, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:33:47', '2020-03-04 04:33:47'),
(2417, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:34:10', '2020-03-04 04:34:10'),
(2418, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-04 04:34:33', '2020-03-04 04:34:33'),
(2419, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-06 23:15:42', '2020-03-06 23:15:42'),
(2420, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-06 23:16:03', '2020-03-06 23:16:03'),
(2421, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-06 23:16:09', '2020-03-06 23:16:09'),
(2422, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-06 23:16:11', '2020-03-06 23:16:11'),
(2423, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:21:29', '2020-03-06 23:21:29'),
(2424, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:21:56', '2020-03-06 23:21:56'),
(2425, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:26:48', '2020-03-06 23:26:48'),
(2426, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:27:26', '2020-03-06 23:27:26'),
(2427, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:29:11', '2020-03-06 23:29:11'),
(2428, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:30:05', '2020-03-06 23:30:05'),
(2429, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:47:22', '2020-03-06 23:47:22'),
(2430, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:47:56', '2020-03-06 23:47:56'),
(2431, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:48:18', '2020-03-06 23:48:18'),
(2432, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:50:51', '2020-03-06 23:50:51'),
(2433, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:51:09', '2020-03-06 23:51:09'),
(2434, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:51:32', '2020-03-06 23:51:32'),
(2435, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:58:09', '2020-03-06 23:58:09'),
(2436, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-06 23:59:30', '2020-03-06 23:59:30'),
(2437, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-07 00:00:01', '2020-03-07 00:00:01'),
(2438, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-07 00:01:59', '2020-03-07 00:01:59'),
(2439, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-07 00:02:06', '2020-03-07 00:02:06'),
(2440, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:02:10', '2020-03-07 00:02:10'),
(2441, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:02:37', '2020-03-07 00:02:37'),
(2442, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:04:15', '2020-03-07 00:04:15'),
(2443, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:04:29', '2020-03-07 00:04:29'),
(2444, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:04:51', '2020-03-07 00:04:51'),
(2445, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:05:18', '2020-03-07 00:05:18'),
(2446, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:05:35', '2020-03-07 00:05:35'),
(2447, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:05:54', '2020-03-07 00:05:54'),
(2448, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:19:14', '2020-03-07 00:19:14'),
(2449, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:19:28', '2020-03-07 00:19:28'),
(2450, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:19:38', '2020-03-07 00:19:38'),
(2451, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:19:53', '2020-03-07 00:19:53'),
(2452, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:20:07', '2020-03-07 00:20:07'),
(2453, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:20:37', '2020-03-07 00:20:37'),
(2454, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:20:46', '2020-03-07 00:20:46'),
(2455, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:21:15', '2020-03-07 00:21:15'),
(2456, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:21:27', '2020-03-07 00:21:27'),
(2457, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 00:21:53', '2020-03-07 00:21:53'),
(2458, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name\":\"lklk\",\"sku\":null,\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:22:38', '2020-03-07 00:22:38'),
(2459, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null}', '2020-03-07 00:22:42', '2020-03-07 00:22:42'),
(2460, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":\"led\",\"sku\":null}', '2020-03-07 00:22:55', '2020-03-07 00:22:55'),
(2461, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null}', '2020-03-07 00:23:00', '2020-03-07 00:23:00'),
(2462, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"edition\"}', '2020-03-07 00:23:14', '2020-03-07 00:23:14'),
(2463, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null}', '2020-03-07 00:23:18', '2020-03-07 00:23:18'),
(2464, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"2560\"}', '2020-03-07 00:23:31', '2020-03-07 00:23:31'),
(2465, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null}', '2020-03-07 00:24:47', '2020-03-07 00:24:47'),
(2466, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name\":\"polo\",\"sku\":null}', '2020-03-07 00:25:56', '2020-03-07 00:25:56'),
(2467, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name\":\"polo\",\"name_or_sku\":\"mega\",\"sku\":null,\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:28:38', '2020-03-07 00:28:38'),
(2468, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name\":\"polo\",\"name_or_sku\":\"megaGA2560\",\"_pjax\":\"#pjax-container\",\"sku\":null}', '2020-03-07 00:29:05', '2020-03-07 00:29:05'),
(2469, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name\":\"polo\",\"name_or_sku\":\"megaGA2560\",\"sku\":null}', '2020-03-07 00:31:45', '2020-03-07 00:31:45'),
(2470, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name\":\"polo\",\"name_or_sku\":\"megaGA2560\",\"sku\":null}', '2020-03-07 00:32:08', '2020-03-07 00:32:08'),
(2471, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"name\":\"polo\",\"sku\":null,\"company\":\"dorra\",\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:32:38', '2020-03-07 00:32:38'),
(2472, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"name\":\"polo\",\"sku\":null,\"company\":\"dorra\"}', '2020-03-07 00:33:08', '2020-03-07 00:33:08'),
(2473, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"company\":\"dorra\",\"name\":\"polo\",\"sku\":null,\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:33:15', '2020-03-07 00:33:15'),
(2474, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"company\":\"dorra\",\"name\":\"polo\",\"sku\":null,\"companies\":{\"name\":\"dorra\"}}', '2020-03-07 00:33:28', '2020-03-07 00:33:28'),
(2475, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"company\":{\"name\":\"dorra\"},\"companies\":{\"name\":\"dorra\"},\"name\":\"polo\",\"sku\":null,\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:33:32', '2020-03-07 00:33:32'),
(2476, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null,\"company\":{\"name\":\"highcoder\"}}', '2020-03-07 00:43:47', '2020-03-07 00:43:47'),
(2477, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null,\"company\":{\"name\":\"high coder\"}}', '2020-03-07 00:43:52', '2020-03-07 00:43:52'),
(2478, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":\"polo\",\"sku\":null,\"company\":{\"name\":null}}', '2020-03-07 00:43:54', '2020-03-07 00:43:54'),
(2479, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"LEDFAN1\",\"company\":{\"name\":null}}', '2020-03-07 00:44:46', '2020-03-07 00:44:46'),
(2480, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"LEDFAN1\",\"company\":{\"name\":null}}', '2020-03-07 00:46:10', '2020-03-07 00:46:10'),
(2481, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"LEDFAN1\",\"company\":{\"name\":null}}', '2020-03-07 00:46:11', '2020-03-07 00:46:11'),
(2482, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"LEDFAN1\",\"company\":{\"name\":null}}', '2020-03-07 00:49:46', '2020-03-07 00:49:46'),
(2483, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"LEDFAN1\",\"company\":{\"name\":null}}', '2020-03-07 00:49:47', '2020-03-07 00:49:47'),
(2484, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":\"LEDFAN1\",\"company\":{\"name\":null}}', '2020-03-07 00:50:12', '2020-03-07 00:50:12'),
(2485, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"name_or_sku\":\"megaGA2560\",\"companies\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null,\"company\":{\"name\":null}}', '2020-03-07 00:50:51', '2020-03-07 00:50:51'),
(2486, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:54:14', '2020-03-07 00:54:14'),
(2487, NULL, 5, 'system_admin/config_info/44', 'PUT', '127.0.0.1', '{\"value\":\"off\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_method\":\"PUT\"}', '2020-03-07 00:54:27', '2020-03-07 00:54:27'),
(2488, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2020-03-07 00:54:34', '2020-03-07 00:54:34'),
(2489, NULL, 5, 'system_admin/config_info/44', 'PUT', '127.0.0.1', '{\"value\":\"off\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_method\":\"PUT\"}', '2020-03-07 00:54:38', '2020-03-07 00:54:38'),
(2490, NULL, 5, 'system_admin/config_info/30', 'PUT', '127.0.0.1', '{\"value\":\"on\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_method\":\"PUT\"}', '2020-03-07 00:55:27', '2020-03-07 00:55:27'),
(2491, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2020-03-07 00:55:29', '2020-03-07 00:55:29'),
(2492, NULL, 5, 'system_admin/config_info/30', 'PUT', '127.0.0.1', '{\"value\":\"on\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_method\":\"PUT\"}', '2020-03-07 00:55:32', '2020-03-07 00:55:32'),
(2493, NULL, 5, 'system_admin/config_info/30', 'PUT', '127.0.0.1', '{\"value\":\"off\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_method\":\"PUT\"}', '2020-03-07 00:55:33', '2020-03-07 00:55:33'),
(2494, NULL, 5, 'system_admin/config_info/30', 'PUT', '127.0.0.1', '{\"value\":\"on\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_method\":\"PUT\"}', '2020-03-07 00:55:34', '2020-03-07 00:55:34'),
(2495, NULL, 5, 'system_admin/config_updateConfigField', 'PUT', '127.0.0.1', '{\"name\":\"smtp_host\",\"value\":\"k\",\"pk\":\"smtp_host\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-07 00:56:12', '2020-03-07 00:56:12'),
(2496, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2020-03-07 00:56:15', '2020-03-07 00:56:15'),
(2497, NULL, 5, 'system_admin/config_updateConfigField', 'PUT', '127.0.0.1', '{\"name\":\"smtp_host\",\"value\":null,\"pk\":\"smtp_host\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-07 00:56:21', '2020-03-07 00:56:21'),
(2498, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2020-03-07 00:56:23', '2020-03-07 00:56:23'),
(2499, NULL, 5, 'system_admin/config_updateConfigField', 'PUT', '127.0.0.1', '{\"name\":\"smtp_port\",\"value\":\"590\",\"pk\":\"smtp_port\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-07 00:56:33', '2020-03-07 00:56:33'),
(2500, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '[]', '2020-03-07 00:56:35', '2020-03-07 00:56:35'),
(2501, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:59:25', '2020-03-07 00:59:25'),
(2502, NULL, 5, 'system_admin/language', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:59:33', '2020-03-07 00:59:33'),
(2503, NULL, 5, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 00:59:38', '2020-03-07 00:59:38'),
(2504, NULL, 5, 'system_admin/currencies', 'GET', '127.0.0.1', '[]', '2020-03-07 00:59:56', '2020-03-07 00:59:56'),
(2505, NULL, 5, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 01:00:14', '2020-03-07 01:00:14'),
(2506, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 01:00:31', '2020-03-07 01:00:31'),
(2507, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 01:01:20', '2020-03-07 01:01:20'),
(2508, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-07 01:01:27', '2020-03-07 01:01:27'),
(2509, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-07 01:01:32', '2020-03-07 01:01:32'),
(2510, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 01:01:57', '2020-03-07 01:01:57'),
(2511, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 01:30:20', '2020-03-07 01:30:20'),
(2512, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 01:30:45', '2020-03-07 01:30:45'),
(2513, NULL, 5, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"ar__name\":\"test\",\"price\":\"100\",\"cost\":\"50\",\"ar__keyword\":\"test search\",\"ar__description\":\"test brief\",\"ar__content\":\"<img alt=\\\"yes\\\" height=\\\"23\\\" src=\\\"http:\\/\\/127.0.0.1:8000\\/packages\\/ckeditor\\/plugins\\/smiley\\/images\\/thumbs_up.png\\\" title=\\\"yes\\\" width=\\\"23\\\" \\/>test <strong>long&nbsp;<\\/strong>\",\"category_id\":\"6\",\"compnay_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-06 00:00:00\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product?_pjax=%23pjax-container&_sort%5Bcolumn%5D=id&_sort%5Btype%5D=asc\"}', '2020-03-07 01:33:20', '2020-03-07 01:33:20'),
(2514, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 01:33:21', '2020-03-07 01:33:21'),
(2515, NULL, 5, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"ar__name\":\"test\",\"price\":\"100\",\"cost\":\"50\",\"ar__keyword\":\"test search\",\"ar__description\":\"test brief\",\"ar__content\":\"<img alt=\\\"yes\\\" height=\\\"23\\\" src=\\\"http:\\/\\/127.0.0.1:8000\\/packages\\/ckeditor\\/plugins\\/smiley\\/images\\/thumbs_up.png\\\" title=\\\"yes\\\" width=\\\"23\\\" \\/>test <strong>long&nbsp;<\\/strong>\",\"category_id\":\"6\",\"compnay_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-06 00:00:00\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\"}', '2020-03-07 02:31:07', '2020-03-07 02:31:07'),
(2516, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 02:31:08', '2020-03-07 02:31:08'),
(2517, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 02:47:05', '2020-03-07 02:47:05'),
(2518, NULL, 5, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"25\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"category_id\":\"11\",\"company_id\":\"2\",\"stock\":null,\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"off\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product?_pjax=%23pjax-container&_sort%5Bcolumn%5D=id&_sort%5Btype%5D=asc\"}', '2020-03-07 02:53:09', '2020-03-07 02:53:09'),
(2519, NULL, 5, 'system_admin/shop_product/create', 'GET', '127.0.0.1', '[]', '2020-03-07 02:53:10', '2020-03-07 02:53:10'),
(2520, NULL, 5, 'system_admin/shop_product', 'POST', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"25\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"category_id\":\"11\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"kUmPYzeETgGs1PfYIectzFIFcxwFWA8dvw8oH8lC\"}', '2020-03-07 03:00:19', '2020-03-07 03:00:19'),
(2521, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-07 03:00:19', '2020-03-07 03:00:19'),
(2522, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 03:01:47', '2020-03-07 03:01:47'),
(2523, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:27:10', '2020-03-07 13:27:10'),
(2524, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:28:01', '2020-03-07 13:28:01'),
(2525, NULL, 5, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-03-07 13:29:38', '2020-03-07 13:29:38'),
(2526, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-07 13:29:41', '2020-03-07 13:29:41'),
(2527, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:29:43', '2020-03-07 13:29:43'),
(2528, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:29:53', '2020-03-07 13:29:53'),
(2529, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 13:30:02', '2020-03-07 13:30:02'),
(2530, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:30:08', '2020-03-07 13:30:08'),
(2531, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:31:11', '2020-03-07 13:31:11'),
(2532, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:31:21', '2020-03-07 13:31:21'),
(2533, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:32:52', '2020-03-07 13:32:52'),
(2534, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:14', '2020-03-07 13:33:14'),
(2535, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:22', '2020-03-07 13:33:22'),
(2536, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:25', '2020-03-07 13:33:25'),
(2537, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:32', '2020-03-07 13:33:32'),
(2538, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:36', '2020-03-07 13:33:36'),
(2539, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:39', '2020-03-07 13:33:39'),
(2540, NULL, 5, 'system_admin/company/1', 'PUT', '127.0.0.1', '{\"name\":\"dorra\",\"notes\":\"clothes\",\"activity_id\":\"4\",\"_token\":\"cjB1F9iht9KoD6cdECLlLAD57YwttBiZlrdAwxBo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-07 13:33:53', '2020-03-07 13:33:53'),
(2541, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-07 13:33:58', '2020-03-07 13:33:58'),
(2542, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 13:34:00', '2020-03-07 13:34:00'),
(2543, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 13:34:07', '2020-03-07 13:34:07'),
(2544, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:03:52', '2020-03-07 14:03:52'),
(2545, NULL, 5, 'system_admin/company/1', 'PUT', '127.0.0.1', '{\"name\":\"dorra\",\"notes\":\"books\",\"activity_id\":\"4\",\"_token\":\"cjB1F9iht9KoD6cdECLlLAD57YwttBiZlrdAwxBo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-07 14:04:01', '2020-03-07 14:04:01'),
(2546, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-07 14:04:03', '2020-03-07 14:04:03'),
(2547, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 14:04:05', '2020-03-07 14:04:05'),
(2548, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:04:58', '2020-03-07 14:04:58'),
(2549, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-07 14:05:04', '2020-03-07 14:05:04'),
(2550, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:05:08', '2020-03-07 14:05:08'),
(2551, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-07 14:05:11', '2020-03-07 14:05:11'),
(2552, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 14:17:51', '2020-03-07 14:17:51'),
(2553, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:17:55', '2020-03-07 14:17:55'),
(2554, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 14:17:59', '2020-03-07 14:17:59'),
(2555, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:07', '2020-03-07 14:18:07'),
(2556, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:10', '2020-03-07 14:18:10'),
(2557, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:13', '2020-03-07 14:18:13'),
(2558, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:16', '2020-03-07 14:18:16'),
(2559, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:20', '2020-03-07 14:18:20'),
(2560, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:22', '2020-03-07 14:18:22'),
(2561, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-07 14:18:24', '2020-03-07 14:18:24'),
(2562, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:22:32', '2020-03-07 14:22:32'),
(2563, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:25:10', '2020-03-07 14:25:10'),
(2564, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:26:12', '2020-03-07 14:26:12'),
(2565, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:26:26', '2020-03-07 14:26:26'),
(2566, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:26:52', '2020-03-07 14:26:52'),
(2567, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:27:38', '2020-03-07 14:27:38'),
(2568, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:29:29', '2020-03-07 14:29:29'),
(2569, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:29:31', '2020-03-07 14:29:31'),
(2570, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 14:29:56', '2020-03-07 14:29:56'),
(2571, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-07 18:40:32', '2020-03-07 18:40:32'),
(2572, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-07 18:44:36', '2020-03-07 18:44:36'),
(2573, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-08 04:04:14', '2020-03-08 04:04:14'),
(2574, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-08 04:04:35', '2020-03-08 04:04:35'),
(2575, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-08 04:04:41', '2020-03-08 04:04:41'),
(2576, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:04:47', '2020-03-08 04:04:47'),
(2577, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:07:33', '2020-03-08 04:07:33'),
(2578, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:11:26', '2020-03-08 04:11:26'),
(2579, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:13:48', '2020-03-08 04:13:48'),
(2580, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:14:45', '2020-03-08 04:14:45'),
(2581, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:16:15', '2020-03-08 04:16:15'),
(2582, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:16:32', '2020-03-08 04:16:32'),
(2583, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:17:13', '2020-03-08 04:17:13'),
(2584, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:19:31', '2020-03-08 04:19:31'),
(2585, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:23:24', '2020-03-08 04:23:24'),
(2586, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:28:15', '2020-03-08 04:28:15'),
(2587, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:28:46', '2020-03-08 04:28:46'),
(2588, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:30:18', '2020-03-08 04:30:18'),
(2589, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:39:54', '2020-03-08 04:39:54'),
(2590, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:41:45', '2020-03-08 04:41:45'),
(2591, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:44:35', '2020-03-08 04:44:35'),
(2592, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-08 04:45:04', '2020-03-08 04:45:04'),
(2593, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-09 00:34:34', '2020-03-09 00:34:34'),
(2594, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-09 00:35:01', '2020-03-09 00:35:01'),
(2595, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-09 00:35:13', '2020-03-09 00:35:13'),
(2596, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-09 00:53:10', '2020-03-09 00:53:10'),
(2597, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null,\"company\":{\"name\":\"highcoder\"}}', '2020-03-09 00:53:21', '2020-03-09 00:53:21'),
(2598, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null,\"company\":{\"name\":\"dorra\"}}', '2020-03-09 00:53:27', '2020-03-09 00:53:27'),
(2599, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-09 00:53:57', '2020-03-09 00:53:57'),
(2600, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"name\":null,\"sku\":null,\"company\":{\"name\":\"dorra\"}}', '2020-03-09 00:54:11', '2020-03-09 00:54:11'),
(2601, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"name\":null,\"sku\":null,\"company\":{\"name\":\"dorra\"},\"_pjax\":\"#pjax-container\"}', '2020-03-09 00:56:50', '2020-03-09 00:56:50'),
(2602, NULL, 5, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-09 00:57:17', '2020-03-09 00:57:17'),
(2603, NULL, 5, 'system_admin/shop_product/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-09 01:11:21', '2020-03-09 01:11:21'),
(2604, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-09 01:12:54', '2020-03-09 01:12:54'),
(2605, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-09 01:13:04', '2020-03-09 01:13:04'),
(2606, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-10 01:51:46', '2020-03-10 01:51:46'),
(2607, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-10 01:51:50', '2020-03-10 01:51:50'),
(2608, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 01:52:05', '2020-03-10 01:52:05'),
(2609, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:17:35', '2020-03-10 02:17:35'),
(2610, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:19:56', '2020-03-10 02:19:56'),
(2611, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-10 02:44:37', '2020-03-10 02:44:37'),
(2612, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:44:41', '2020-03-10 02:44:41'),
(2613, NULL, 5, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"lE2N8dijp3KAv67EeIj7GM6DlkJY5dx9Oo0GtuAz\",\"_method\":\"PUT\"}', '2020-03-10 02:44:53', '2020-03-10 02:44:53'),
(2614, NULL, 5, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"watermark\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"lE2N8dijp3KAv67EeIj7GM6DlkJY5dx9Oo0GtuAz\",\"_method\":\"PUT\"}', '2020-03-10 02:44:56', '2020-03-10 02:44:56'),
(2615, NULL, 5, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"ar__title\":\"souqVIS\",\"ar__keyword\":null,\"ar__description\":\"easy to sell and buy\",\"en__title\":\"souqVIS\",\"en__keyword\":null,\"en__description\":\"easy to sell\",\"vi__title\":\"Souq\",\"vi__keyword\":\"ar\",\"vi__description\":null,\"phone\":\"0123456789\",\"long_phone\":\"Support: 0987654321\",\"time_active\":null,\"address\":\"123st - abc - xyz\",\"email\":\"admin@admin.com\",\"locale\":\"ar\",\"currency\":\"EGP\",\"_token\":\"lE2N8dijp3KAv67EeIj7GM6DlkJY5dx9Oo0GtuAz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/config_global\"}', '2020-03-10 02:45:02', '2020-03-10 02:45:02'),
(2616, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '[]', '2020-03-10 02:45:02', '2020-03-10 02:45:02'),
(2617, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:45:06', '2020-03-10 02:45:06'),
(2618, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-10 02:46:29', '2020-03-10 02:46:29'),
(2619, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:46:32', '2020-03-10 02:46:32'),
(2620, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:49:57', '2020-03-10 02:49:57'),
(2621, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:50:50', '2020-03-10 02:50:50'),
(2622, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 02:53:52', '2020-03-10 02:53:52'),
(2623, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:01:11', '2020-03-10 03:01:11'),
(2624, NULL, 5, 'system_admin/company/2', 'PUT', '127.0.0.1', '{\"name\":\"highcoder\",\"notes\":\"labtops\",\"activity_id\":\"3\",\"iban\":null,\"company_contact\":{\"phone_contact\":null},\"_token\":\"lE2N8dijp3KAv67EeIj7GM6DlkJY5dx9Oo0GtuAz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/company\"}', '2020-03-10 03:01:20', '2020-03-10 03:01:20'),
(2625, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-10 03:02:47', '2020-03-10 03:02:47'),
(2626, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:02:52', '2020-03-10 03:02:52'),
(2627, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:04:33', '2020-03-10 03:04:33'),
(2628, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:04:52', '2020-03-10 03:04:52'),
(2629, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:05:49', '2020-03-10 03:05:49'),
(2630, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:05:59', '2020-03-10 03:05:59'),
(2631, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-10 03:06:05', '2020-03-10 03:06:05'),
(2632, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:06:09', '2020-03-10 03:06:09'),
(2633, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:07:27', '2020-03-10 03:07:27'),
(2634, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:09:29', '2020-03-10 03:09:29'),
(2635, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:10:06', '2020-03-10 03:10:06'),
(2636, NULL, 5, 'system_admin/company/1', 'GET', '127.0.0.1', '[]', '2020-03-10 03:12:00', '2020-03-10 03:12:00'),
(2637, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-10 03:12:04', '2020-03-10 03:12:04'),
(2638, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '{\"name\":\"highcoder\",\"_pjax\":\"#pjax-container\"}', '2020-03-10 03:12:23', '2020-03-10 03:12:23'),
(2639, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:12:25', '2020-03-10 03:12:25'),
(2640, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-10 03:13:17', '2020-03-10 03:13:17'),
(2641, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-10 03:21:30', '2020-03-10 03:21:30'),
(2642, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:21:34', '2020-03-10 03:21:34'),
(2643, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:27:30', '2020-03-10 03:27:30'),
(2644, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:27:48', '2020-03-10 03:27:48'),
(2645, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:30:32', '2020-03-10 03:30:32'),
(2646, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:31:25', '2020-03-10 03:31:25'),
(2647, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:38:34', '2020-03-10 03:38:34'),
(2648, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-10 03:38:50', '2020-03-10 03:38:50'),
(2649, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-10 03:40:45', '2020-03-10 03:40:45'),
(2650, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:40:47', '2020-03-10 03:40:47'),
(2651, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 03:42:07', '2020-03-10 03:42:07'),
(2652, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2020-03-10 03:42:36', '2020-03-10 03:42:36'),
(2653, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2020-03-10 03:44:49', '2020-03-10 03:44:49'),
(2654, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-10 03:45:18', '2020-03-10 03:45:18'),
(2655, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-10 10:50:46', '2020-03-10 10:50:46'),
(2656, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 10:50:52', '2020-03-10 10:50:52'),
(2657, NULL, 5, 'system_admin/process/productImport', 'GET', '127.0.0.1', '[]', '2020-03-10 10:52:21', '2020-03-10 10:52:21'),
(2658, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 10:59:54', '2020-03-10 10:59:54'),
(2659, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:00:53', '2020-03-10 11:00:53'),
(2660, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:02:46', '2020-03-10 11:02:46'),
(2661, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-10 11:03:16', '2020-03-10 11:03:16'),
(2662, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:03:21', '2020-03-10 11:03:21'),
(2663, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:42:38', '2020-03-10 11:42:38'),
(2664, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:42:55', '2020-03-10 11:42:55'),
(2665, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:45:28', '2020-03-10 11:45:28'),
(2666, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:45:47', '2020-03-10 11:45:47'),
(2667, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:46:48', '2020-03-10 11:46:48'),
(2668, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:47:17', '2020-03-10 11:47:17'),
(2669, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:47:46', '2020-03-10 11:47:46'),
(2670, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:48:15', '2020-03-10 11:48:15'),
(2671, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:49:11', '2020-03-10 11:49:11'),
(2672, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:49:29', '2020-03-10 11:49:29'),
(2673, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-10 11:50:24', '2020-03-10 11:50:24'),
(2674, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-12 11:38:05', '2020-03-12 11:38:05'),
(2675, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-12 11:38:14', '2020-03-12 11:38:14'),
(2676, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 11:38:18', '2020-03-12 11:38:18'),
(2677, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:24:10', '2020-03-12 13:24:10'),
(2678, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-12 13:25:13', '2020-03-12 13:25:13'),
(2679, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"page:1\"}', '2020-03-12 13:25:28', '2020-03-12 13:25:28'),
(2680, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-12 13:26:16', '2020-03-12 13:26:16'),
(2681, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:26:39', '2020-03-12 13:26:39'),
(2682, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:28:46', '2020-03-12 13:28:46'),
(2683, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:33:33', '2020-03-12 13:33:33'),
(2684, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:33:40', '2020-03-12 13:33:40'),
(2685, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:34:05', '2020-03-12 13:34:05'),
(2686, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-12 13:34:23', '2020-03-12 13:34:23'),
(2687, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:34:31', '2020-03-12 13:34:31'),
(2688, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-12 13:40:22', '2020-03-12 13:40:22'),
(2689, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-12 13:40:26', '2020-03-12 13:40:26'),
(2690, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-12 13:40:27', '2020-03-12 13:40:27'),
(2691, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:40:30', '2020-03-12 13:40:30'),
(2692, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-12 13:40:43', '2020-03-12 13:40:43'),
(2693, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:40:46', '2020-03-12 13:40:46'),
(2694, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-12 13:40:59', '2020-03-12 13:40:59'),
(2695, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-12 13:41:00', '2020-03-12 13:41:00'),
(2696, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:41:06', '2020-03-12 13:41:06'),
(2697, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:48:36', '2020-03-12 13:48:36'),
(2698, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:49:48', '2020-03-12 13:49:48'),
(2699, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 13:55:18', '2020-03-12 13:55:18'),
(2700, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 14:13:37', '2020-03-12 14:13:37'),
(2701, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 14:14:44', '2020-03-12 14:14:44'),
(2702, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 14:15:55', '2020-03-12 14:15:55'),
(2703, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 14:20:19', '2020-03-12 14:20:19'),
(2704, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 14:31:28', '2020-03-12 14:31:28'),
(2705, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-12 14:32:51', '2020-03-12 14:32:51'),
(2706, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-13 23:24:43', '2020-03-13 23:24:43'),
(2707, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-13 23:24:54', '2020-03-13 23:24:54'),
(2708, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-13 23:25:04', '2020-03-13 23:25:04'),
(2709, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:25:09', '2020-03-13 23:25:09'),
(2710, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-13 23:25:21', '2020-03-13 23:25:21'),
(2711, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-13 23:25:42', '2020-03-13 23:25:42'),
(2712, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:25:48', '2020-03-13 23:25:48'),
(2713, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\"}', '2020-03-13 23:26:14', '2020-03-13 23:26:14'),
(2714, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"key\":null,\"image\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\"}', '2020-03-13 23:26:18', '2020-03-13 23:26:18');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2715, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"15000\",\"ar__keyword\":null,\"ar__description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"ar__content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"category_id\":\"2\",\"company_id\":null,\"stock\":\"74\",\"brand_id\":\"5\",\"vendor_id\":\"0\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-13 23:27:05', '2020-03-13 23:27:05'),
(2716, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-13 23:27:05', '2020-03-13 23:27:05'),
(2717, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:27:17', '2020-03-13 23:27:17'),
(2718, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"15000\",\"ar__keyword\":null,\"ar__description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"ar__content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"category_id\":\"2\",\"company_id\":null,\"stock\":\"74\",\"brand_id\":\"5\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-13 23:31:22', '2020-03-13 23:31:22'),
(2719, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:31:23', '2020-03-13 23:31:23'),
(2720, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"15000\",\"ar__keyword\":null,\"ar__description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"ar__content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"category_id\":\"2\",\"company_id\":null,\"stock\":\"74\",\"brand_id\":\"5\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\"}', '2020-03-13 23:31:46', '2020-03-13 23:31:46'),
(2721, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-13 23:33:27', '2020-03-13 23:33:27'),
(2722, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:35:25', '2020-03-13 23:35:25'),
(2723, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:36:23', '2020-03-13 23:36:23'),
(2724, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-13 23:36:43', '2020-03-13 23:36:43'),
(2725, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"15000\",\"ar__keyword\":null,\"ar__description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"ar__content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"2\",\"company_id\":null,\"stock\":\"74\",\"brand_id\":\"5\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-13 23:37:16', '2020-03-13 23:37:16'),
(2726, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:13:13', '2020-03-14 00:13:13'),
(2727, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:13:14', '2020-03-14 00:13:14'),
(2728, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 00:13:18', '2020-03-14 00:13:18'),
(2729, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-14 00:25:29', '2020-03-14 00:25:29'),
(2730, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-14 00:25:30', '2020-03-14 00:25:30'),
(2731, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"name\":null,\"sku\":\"48\",\"company\":{\"name\":null},\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:25:46', '2020-03-14 00:25:46'),
(2732, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"sku\":null,\"company\":{\"name\":null}}', '2020-03-14 00:25:50', '2020-03-14 00:25:50'),
(2733, NULL, 5, 'system_admin/shop_product/48/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 00:25:57', '2020-03-14 00:25:57'),
(2734, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:44:06', '2020-03-14 00:44:06'),
(2735, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-14 00:46:10', '2020-03-14 00:46:10'),
(2736, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:46:38', '2020-03-14 00:46:38'),
(2737, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:46:41', '2020-03-14 00:46:41'),
(2738, NULL, 5, 'system_admin/shop_special_price/15/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 00:46:50', '2020-03-14 00:46:50'),
(2739, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2020-03-14 00:46:51', '2020-03-14 00:46:51'),
(2740, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2020-03-14 00:47:06', '2020-03-14 00:47:06'),
(2741, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 00:47:30', '2020-03-14 00:47:30'),
(2742, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 00:47:37', '2020-03-14 00:47:37'),
(2743, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-14 02:32:31', '2020-03-14 02:32:31'),
(2744, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 02:33:35', '2020-03-14 02:33:35'),
(2745, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 02:33:38', '2020-03-14 02:33:38'),
(2746, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 02:33:40', '2020-03-14 02:33:40'),
(2747, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 02:33:43', '2020-03-14 02:33:43'),
(2748, NULL, 5, 'system_admin/shop_order_status', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 02:33:45', '2020-03-14 02:33:45'),
(2749, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 02:33:58', '2020-03-14 02:33:58'),
(2750, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 02:34:03', '2020-03-14 02:34:03'),
(2751, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"25\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"11\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 02:35:10', '2020-03-14 02:35:10'),
(2752, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 03:48:29', '2020-03-14 03:48:29'),
(2753, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2test\",\"price\":\"258\",\"cost\":\"205\",\"ar__keyword\":\"\\u0628\\u0648\\u0631\\u062f\",\"ar__description\":\"2333333prod2 des1\",\"ar__content\":\"prod2 des2 big\",\"area\":\"2\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\"}', '2020-03-14 03:50:01', '2020-03-14 03:50:01'),
(2754, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 03:50:01', '2020-03-14 03:50:01'),
(2755, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 03:51:19', '2020-03-14 03:51:19'),
(2756, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 03:55:11', '2020-03-14 03:55:11'),
(2757, NULL, 5, 'system_admin/shop_product/54', 'GET', '127.0.0.1', '[]', '2020-03-14 04:16:47', '2020-03-14 04:16:47'),
(2758, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:16:50', '2020-03-14 04:16:50'),
(2759, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-14 04:16:56', '2020-03-14 04:16:56'),
(2760, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:17:01', '2020-03-14 04:17:01'),
(2761, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:18:29', '2020-03-14 04:18:29'),
(2762, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:19:45', '2020-03-14 04:19:45'),
(2763, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:19:58', '2020-03-14 04:19:58'),
(2764, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:20:03', '2020-03-14 04:20:03'),
(2765, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:21:26', '2020-03-14 04:21:26'),
(2766, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 77\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":\"Easy Polo Black Edition 77\",\"ar__description\":\"test short edit\",\"ar__content\":\"<p>test long edit<br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"74\",\"brand_id\":\"5\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 04:23:10', '2020-03-14 04:23:10'),
(2767, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:23:10', '2020-03-14 04:23:10'),
(2768, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:24:27', '2020-03-14 04:24:27'),
(2769, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":null,\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 04:31:05', '2020-03-14 04:31:05'),
(2770, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:31:06', '2020-03-14 04:31:06'),
(2771, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":null,\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\"}', '2020-03-14 04:32:15', '2020-03-14 04:32:15'),
(2772, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:32:16', '2020-03-14 04:32:16'),
(2773, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":null,\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\"}', '2020-03-14 04:35:59', '2020-03-14 04:35:59'),
(2774, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-14 04:36:00', '2020-03-14 04:36:00'),
(2775, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-14 04:36:05', '2020-03-14 04:36:05'),
(2776, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:36:10', '2020-03-14 04:36:10'),
(2777, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":null,\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 04:37:44', '2020-03-14 04:37:44'),
(2778, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 04:37:51', '2020-03-14 04:37:51'),
(2779, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":\"ddd\",\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"6\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"yASQO8fRq8F3iYkGoGLSazDox74wwCvs3W9iRNFT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-14 04:38:09', '2020-03-14 04:38:09'),
(2780, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:44:20', '2020-03-14 12:44:20'),
(2781, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:47:25', '2020-03-14 12:47:25'),
(2782, NULL, 5, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-03-14 12:47:30', '2020-03-14 12:47:30'),
(2783, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:47:41', '2020-03-14 12:47:41'),
(2784, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:47:56', '2020-03-14 12:47:56'),
(2785, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:48:09', '2020-03-14 12:48:09'),
(2786, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:48:55', '2020-03-14 12:48:55'),
(2787, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:49:10', '2020-03-14 12:49:10'),
(2788, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:49:53', '2020-03-14 12:49:53'),
(2789, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:53:11', '2020-03-14 12:53:11'),
(2790, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 12:55:16', '2020-03-14 12:55:16'),
(2791, NULL, 5, 'system_admin/shop_special_price/15/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:55:19', '2020-03-14 12:55:19'),
(2792, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2020-03-14 12:55:20', '2020-03-14 12:55:20'),
(2793, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 12:55:36', '2020-03-14 12:55:36'),
(2794, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 12:55:40', '2020-03-14 12:55:40'),
(2795, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 12:55:44', '2020-03-14 12:55:44'),
(2796, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:04:20', '2020-03-14 13:04:20'),
(2797, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:12:02', '2020-03-14 13:12:02'),
(2798, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:49:40', '2020-03-14 13:49:40'),
(2799, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:50:09', '2020-03-14 13:50:09'),
(2800, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:50:12', '2020-03-14 13:50:12'),
(2801, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:51:50', '2020-03-14 13:51:50'),
(2802, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:52:12', '2020-03-14 13:52:12'),
(2803, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:52:33', '2020-03-14 13:52:33'),
(2804, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:55:25', '2020-03-14 13:55:25'),
(2805, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 13:55:43', '2020-03-14 13:55:43'),
(2806, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 13:55:46', '2020-03-14 13:55:46'),
(2807, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 13:55:48', '2020-03-14 13:55:48'),
(2808, NULL, 5, 'system_admin/shop_special_price/15/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 13:55:52', '2020-03-14 13:55:52'),
(2809, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2020-03-14 13:55:53', '2020-03-14 13:55:53'),
(2810, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2020-03-14 13:55:58', '2020-03-14 13:55:58'),
(2811, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:15:33', '2020-03-14 14:15:33'),
(2812, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:15:37', '2020-03-14 14:15:37'),
(2813, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:30:38', '2020-03-14 14:30:38'),
(2814, NULL, 5, 'system_admin/shop_special_price/15/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:30:45', '2020-03-14 14:30:45'),
(2815, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2020-03-14 14:30:45', '2020-03-14 14:30:45'),
(2816, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2020-03-14 14:30:48', '2020-03-14 14:30:48'),
(2817, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:31:09', '2020-03-14 14:31:09'),
(2818, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 14:31:16', '2020-03-14 14:31:16'),
(2819, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:31:20', '2020-03-14 14:31:20'),
(2820, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:34:31', '2020-03-14 14:34:31'),
(2821, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:34:34', '2020-03-14 14:34:34'),
(2822, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 14:35:37', '2020-03-14 14:35:37'),
(2823, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:35:41', '2020-03-14 14:35:41'),
(2824, NULL, 5, 'system_admin/shop_special_price/15/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:35:44', '2020-03-14 14:35:44'),
(2825, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2020-03-14 14:35:45', '2020-03-14 14:35:45'),
(2826, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:35:56', '2020-03-14 14:35:56'),
(2827, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:36:17', '2020-03-14 14:36:17'),
(2828, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:36:20', '2020-03-14 14:36:20'),
(2829, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 14:39:08', '2020-03-14 14:39:08'),
(2830, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:39:11', '2020-03-14 14:39:11'),
(2831, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:42:25', '2020-03-14 14:42:25'),
(2832, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 14:42:28', '2020-03-14 14:42:28'),
(2833, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"0\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 14:43:24', '2020-03-14 14:43:24'),
(2834, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:44:22', '2020-03-14 14:44:22'),
(2835, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 14:44:30', '2020-03-14 14:44:30'),
(2836, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 15:19:17', '2020-03-14 15:19:17'),
(2837, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 15:19:20', '2020-03-14 15:19:20'),
(2838, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 15:19:28', '2020-03-14 15:19:28'),
(2839, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 15:19:32', '2020-03-14 15:19:32'),
(2840, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 16:34:39', '2020-03-14 16:34:39'),
(2841, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 16:34:48', '2020-03-14 16:34:48'),
(2842, NULL, 5, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 16:34:58', '2020-03-14 16:34:58'),
(2843, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 16:40:50', '2020-03-14 16:40:50'),
(2844, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2020-03-14 16:41:18', '2020-03-14 16:41:18'),
(2845, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2020-03-14 16:41:25', '2020-03-14 16:41:25'),
(2846, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2020-03-14 16:41:29', '2020-03-14 16:41:29'),
(2847, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 16:41:44', '2020-03-14 16:41:44'),
(2848, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 16:43:02', '2020-03-14 16:43:02'),
(2849, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 16:43:04', '2020-03-14 16:43:04'),
(2850, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 17:18:40', '2020-03-14 17:18:40'),
(2851, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"9\",\"pocket\":\"6\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-14 17:18:55', '2020-03-14 17:18:55'),
(2852, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 17:19:10', '2020-03-14 17:19:10'),
(2853, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"0\",\"carton\":\"5\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\"}', '2020-03-14 17:19:19', '2020-03-14 17:19:19'),
(2854, NULL, 5, 'system_admin/shop_product/54', 'GET', '127.0.0.1', '[]', '2020-03-14 17:33:29', '2020-03-14 17:33:29'),
(2855, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 17:33:32', '2020-03-14 17:33:32'),
(2856, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"0\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/54\"}', '2020-03-14 17:33:38', '2020-03-14 17:33:38'),
(2857, NULL, 5, 'system_admin/shop_product/54', 'GET', '127.0.0.1', '[]', '2020-03-14 17:46:41', '2020-03-14 17:46:41'),
(2858, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 17:46:44', '2020-03-14 17:46:44'),
(2859, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"0\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/54\"}', '2020-03-14 17:46:48', '2020-03-14 17:46:48'),
(2860, NULL, 5, 'system_admin/shop_product/54', 'GET', '127.0.0.1', '[]', '2020-03-14 18:09:23', '2020-03-14 18:09:23'),
(2861, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 18:09:26', '2020-03-14 18:09:26'),
(2862, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"0\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/54\"}', '2020-03-14 18:09:29', '2020-03-14 18:09:29'),
(2863, NULL, 5, 'system_admin/shop_product/54', 'GET', '127.0.0.1', '[]', '2020-03-14 18:15:57', '2020-03-14 18:15:57'),
(2864, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 18:15:59', '2020-03-14 18:15:59'),
(2865, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"7\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/54\"}', '2020-03-14 18:16:28', '2020-03-14 18:16:28'),
(2866, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 18:16:28', '2020-03-14 18:16:28'),
(2867, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"7\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\"}', '2020-03-14 18:17:09', '2020-03-14 18:17:09'),
(2868, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 18:17:09', '2020-03-14 18:17:09'),
(2869, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\"}', '2020-03-14 18:19:40', '2020-03-14 18:19:40'),
(2870, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 18:19:41', '2020-03-14 18:19:41'),
(2871, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"2\",\"carton\":\"5\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"7KzQFyrAN4CxMxkImKGeDN8cjMpTW3Ly7xMV6qLw\",\"_method\":\"PUT\"}', '2020-03-14 18:22:03', '2020-03-14 18:22:03'),
(2872, NULL, 5, 'system_admin/shop_product/54', 'GET', '127.0.0.1', '[]', '2020-03-14 18:46:49', '2020-03-14 18:46:49'),
(2873, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 18:46:53', '2020-03-14 18:46:53'),
(2874, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 19:02:57', '2020-03-14 19:02:57'),
(2875, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-14 22:18:40', '2020-03-14 22:18:40'),
(2876, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-14 22:19:01', '2020-03-14 22:19:01'),
(2877, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:19:05', '2020-03-14 22:19:05'),
(2878, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 22:19:16', '2020-03-14 22:19:16'),
(2879, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 22:19:30', '2020-03-14 22:19:30'),
(2880, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:19:36', '2020-03-14 22:19:36'),
(2881, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:23:47', '2020-03-14 22:23:47'),
(2882, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:24:01', '2020-03-14 22:24:01'),
(2883, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:32:38', '2020-03-14 22:32:38'),
(2884, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:33:30', '2020-03-14 22:33:30'),
(2885, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:38:09', '2020-03-14 22:38:09'),
(2886, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:38:30', '2020-03-14 22:38:30'),
(2887, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:38:54', '2020-03-14 22:38:54'),
(2888, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:39:09', '2020-03-14 22:39:09'),
(2889, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:42:55', '2020-03-14 22:42:55'),
(2890, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:54:01', '2020-03-14 22:54:01'),
(2891, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:54:21', '2020-03-14 22:54:21'),
(2892, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-14 22:55:00', '2020-03-14 22:55:00'),
(2893, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-15 01:23:46', '2020-03-15 01:23:46'),
(2894, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 01:24:26', '2020-03-15 01:24:26'),
(2895, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:24:34', '2020-03-15 01:24:34'),
(2896, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:25:15', '2020-03-15 01:25:15'),
(2897, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:26:59', '2020-03-15 01:26:59'),
(2898, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:27:39', '2020-03-15 01:27:39'),
(2899, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:27:54', '2020-03-15 01:27:54');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2900, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:28:50', '2020-03-15 01:28:50'),
(2901, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:34:33', '2020-03-15 01:34:33'),
(2902, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:36:56', '2020-03-15 01:36:56'),
(2903, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:38:06', '2020-03-15 01:38:06'),
(2904, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:41:53', '2020-03-15 01:41:53'),
(2905, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:42:14', '2020-03-15 01:42:14'),
(2906, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:43:47', '2020-03-15 01:43:47'),
(2907, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:46:25', '2020-03-15 01:46:25'),
(2908, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:47:03', '2020-03-15 01:47:03'),
(2909, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:48:10', '2020-03-15 01:48:10'),
(2910, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:48:23', '2020-03-15 01:48:23'),
(2911, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:49:45', '2020-03-15 01:49:45'),
(2912, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:50:36', '2020-03-15 01:50:36'),
(2913, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:51:04', '2020-03-15 01:51:04'),
(2914, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:51:44', '2020-03-15 01:51:44'),
(2915, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:52:38', '2020-03-15 01:52:38'),
(2916, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:52:40', '2020-03-15 01:52:40'),
(2917, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:53:20', '2020-03-15 01:53:20'),
(2918, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:53:34', '2020-03-15 01:53:34'),
(2919, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:53:46', '2020-03-15 01:53:46'),
(2920, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:59:42', '2020-03-15 01:59:42'),
(2921, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 01:59:52', '2020-03-15 01:59:52'),
(2922, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:00:24', '2020-03-15 02:00:24'),
(2923, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:02:24', '2020-03-15 02:02:24'),
(2924, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:02:45', '2020-03-15 02:02:45'),
(2925, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:03:19', '2020-03-15 02:03:19'),
(2926, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:04:41', '2020-03-15 02:04:41'),
(2927, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:06:32', '2020-03-15 02:06:32'),
(2928, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:08:40', '2020-03-15 02:08:40'),
(2929, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:08:56', '2020-03-15 02:08:56'),
(2930, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:09:23', '2020-03-15 02:09:23'),
(2931, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:10:39', '2020-03-15 02:10:39'),
(2932, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:12:34', '2020-03-15 02:12:34'),
(2933, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:12:56', '2020-03-15 02:12:56'),
(2934, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:13:41', '2020-03-15 02:13:41'),
(2935, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:37:06', '2020-03-15 02:37:06'),
(2936, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:37:08', '2020-03-15 02:37:08'),
(2937, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:37:33', '2020-03-15 02:37:33'),
(2938, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:37:42', '2020-03-15 02:37:42'),
(2939, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:38:52', '2020-03-15 02:38:52'),
(2940, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:40:15', '2020-03-15 02:40:15'),
(2941, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:43:36', '2020-03-15 02:43:36'),
(2942, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:45:05', '2020-03-15 02:45:05'),
(2943, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:45:22', '2020-03-15 02:45:22'),
(2944, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:49:33', '2020-03-15 02:49:33'),
(2945, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:51:26', '2020-03-15 02:51:26'),
(2946, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:51:44', '2020-03-15 02:51:44'),
(2947, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:52:22', '2020-03-15 02:52:22'),
(2948, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:53:18', '2020-03-15 02:53:18'),
(2949, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:54:01', '2020-03-15 02:54:01'),
(2950, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:54:33', '2020-03-15 02:54:33'),
(2951, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 03:08:20', '2020-03-15 03:08:20'),
(2952, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 03:42:40', '2020-03-15 03:42:40'),
(2953, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 03:44:29', '2020-03-15 03:44:29'),
(2954, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 03:44:52', '2020-03-15 03:44:52'),
(2955, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 03:45:23', '2020-03-15 03:45:23'),
(2956, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 03:47:09', '2020-03-15 03:47:09'),
(2957, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 03:47:26', '2020-03-15 03:47:26'),
(2958, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2020-03-15 03:58:06', '2020-03-15 03:58:06'),
(2959, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 03:59:34', '2020-03-15 03:59:34'),
(2960, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 03:59:46', '2020-03-15 03:59:46'),
(2961, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2020-03-15 04:00:14', '2020-03-15 04:00:14'),
(2962, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-03-15 04:00:22', '2020-03-15 04:00:22'),
(2963, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-15 04:00:25', '2020-03-15 04:00:25'),
(2964, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-15 04:00:35', '2020-03-15 04:00:35'),
(2965, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2020-03-15 04:02:38', '2020-03-15 04:02:38'),
(2966, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-15 04:03:45', '2020-03-15 04:03:45'),
(2967, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-15 04:07:14', '2020-03-15 04:07:14'),
(2968, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:16', '2020-03-15 04:07:16'),
(2969, NULL, 5, 'system_admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 04:07:24', '2020-03-15 04:07:24'),
(2970, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-15 04:07:35', '2020-03-15 04:07:35'),
(2971, NULL, 5, 'system_admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:40', '2020-03-15 04:07:40'),
(2972, NULL, 5, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:42', '2020-03-15 04:07:42'),
(2973, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:49', '2020-03-15 04:07:49'),
(2974, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:50', '2020-03-15 04:07:50'),
(2975, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:52', '2020-03-15 04:07:52'),
(2976, NULL, 5, 'system_admin/shop_customer', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:53', '2020-03-15 04:07:53'),
(2977, NULL, 5, 'system_admin/subscribe', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:55', '2020-03-15 04:07:55'),
(2978, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 04:07:57', '2020-03-15 04:07:57'),
(2979, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-15 04:08:00', '2020-03-15 04:08:00'),
(2980, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-16 02:19:38', '2020-03-16 02:19:38'),
(2981, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 02:19:43', '2020-03-16 02:19:43'),
(2982, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 03:13:54', '2020-03-16 03:13:54'),
(2983, NULL, 5, 'system_admin/company/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 03:15:26', '2020-03-16 03:15:26'),
(2984, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-16 03:35:18', '2020-03-16 03:35:18'),
(2985, NULL, 5, 'system_admin/activities/8/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 03:35:34', '2020-03-16 03:35:34'),
(2986, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-16 03:35:43', '2020-03-16 03:35:43'),
(2987, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-16 11:46:09', '2020-03-16 11:46:09'),
(2988, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-16 11:47:17', '2020-03-16 11:47:17'),
(2989, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-16 11:48:10', '2020-03-16 11:48:10'),
(2990, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 11:48:30', '2020-03-16 11:48:30'),
(2991, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 11:50:30', '2020-03-16 11:50:30'),
(2992, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 11:56:59', '2020-03-16 11:56:59'),
(2993, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-16 11:57:08', '2020-03-16 11:57:08'),
(2994, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 11:57:15', '2020-03-16 11:57:15'),
(2995, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 14:54:43', '2020-03-16 14:54:43'),
(2996, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 14:55:16', '2020-03-16 14:55:16'),
(2997, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 14:56:09', '2020-03-16 14:56:09'),
(2998, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 14:56:40', '2020-03-16 14:56:40'),
(2999, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-16 14:57:17', '2020-03-16 14:57:17'),
(3000, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 01:57:47', '2020-03-17 01:57:47'),
(3001, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\"}', '2020-03-17 02:32:23', '2020-03-17 02:32:23'),
(3002, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 02:32:28', '2020-03-17 02:32:28'),
(3003, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:32:32', '2020-03-17 02:32:32'),
(3004, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:32:33', '2020-03-17 02:32:33'),
(3005, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:33:55', '2020-03-17 02:33:55'),
(3006, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:34:41', '2020-03-17 02:34:41'),
(3007, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 02:39:50', '2020-03-17 02:39:50'),
(3008, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 02:40:47', '2020-03-17 02:40:47'),
(3009, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:40:50', '2020-03-17 02:40:50'),
(3010, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 02:41:10', '2020-03-17 02:41:10'),
(3011, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 02:41:53', '2020-03-17 02:41:53'),
(3012, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:41:56', '2020-03-17 02:41:56'),
(3013, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 02:42:06', '2020-03-17 02:42:06'),
(3014, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:42:06', '2020-03-17 02:42:06'),
(3015, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\"}', '2020-03-17 02:42:41', '2020-03-17 02:42:41'),
(3016, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 02:42:42', '2020-03-17 02:42:42'),
(3017, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 03:07:58', '2020-03-17 03:07:58'),
(3018, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 03:08:13', '2020-03-17 03:08:13'),
(3019, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 03:08:22', '2020-03-17 03:08:22'),
(3020, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 03:25:34', '2020-03-17 03:25:34'),
(3021, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 03:28:08', '2020-03-17 03:28:08'),
(3022, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 03:28:15', '2020-03-17 03:28:15'),
(3023, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 03:28:18', '2020-03-17 03:28:18'),
(3024, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pQIZ3oByTP9TmWPyTcSTV7qMShjT0JKRXx5OwEYt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 03:31:40', '2020-03-17 03:31:40'),
(3025, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 10:40:28', '2020-03-17 10:40:28'),
(3026, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 10:40:31', '2020-03-17 10:40:31'),
(3027, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 10:40:44', '2020-03-17 10:40:44'),
(3028, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 11:01:11', '2020-03-17 11:01:11'),
(3029, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-17 11:01:15', '2020-03-17 11:01:15'),
(3030, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:01:20', '2020-03-17 11:01:20'),
(3031, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-17 11:01:38', '2020-03-17 11:01:38'),
(3032, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:01:39', '2020-03-17 11:01:39'),
(3033, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\"}', '2020-03-17 11:09:27', '2020-03-17 11:09:27'),
(3034, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 11:12:15', '2020-03-17 11:12:15'),
(3035, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:12:17', '2020-03-17 11:12:17'),
(3036, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 11:12:48', '2020-03-17 11:12:48'),
(3037, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 11:12:49', '2020-03-17 11:12:49'),
(3038, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:13:18', '2020-03-17 11:13:18'),
(3039, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 11:13:32', '2020-03-17 11:13:32'),
(3040, NULL, 5, 'system_admin/activities/7', 'GET', '127.0.0.1', '[]', '2020-03-17 11:31:29', '2020-03-17 11:31:29'),
(3041, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:31:32', '2020-03-17 11:31:32'),
(3042, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/7\"}', '2020-03-17 11:31:46', '2020-03-17 11:31:46'),
(3043, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-17 11:32:09', '2020-03-17 11:32:09'),
(3044, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-17 11:32:16', '2020-03-17 11:32:16'),
(3045, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:32:25', '2020-03-17 11:32:25'),
(3046, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-17 11:36:44', '2020-03-17 11:36:44'),
(3047, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:36:45', '2020-03-17 11:36:45'),
(3048, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\"}', '2020-03-17 11:37:22', '2020-03-17 11:37:22'),
(3049, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:37:22', '2020-03-17 11:37:22'),
(3050, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"pkkgRucCoXyxM5542OTnZOH2JQeNRCok3Z1qnyOa\",\"_method\":\"PUT\"}', '2020-03-17 11:37:35', '2020-03-17 11:37:35'),
(3051, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-17 11:37:36', '2020-03-17 11:37:36'),
(3052, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-19 22:20:48', '2020-03-19 22:20:48'),
(3053, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:20:58', '2020-03-19 22:20:58'),
(3054, NULL, 5, 'system_admin/activities/8/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:21:05', '2020-03-19 22:21:05'),
(3055, NULL, 5, 'system_admin/activities/8', 'PUT', '127.0.0.1', '{\"type\":\"Spare Parts Motors\",\"notes\":\"spare parts Motors\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-19 22:21:21', '2020-03-19 22:21:21'),
(3056, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-19 22:21:28', '2020-03-19 22:21:28'),
(3057, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:21:31', '2020-03-19 22:21:31'),
(3058, NULL, 5, 'system_admin/activities/8/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:21:35', '2020-03-19 22:21:35'),
(3059, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:25:47', '2020-03-19 22:25:47'),
(3060, NULL, 5, 'system_admin/activities/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:25:52', '2020-03-19 22:25:52'),
(3061, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:25:55', '2020-03-19 22:25:55'),
(3062, NULL, 5, 'system_admin/activities/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:25:59', '2020-03-19 22:25:59'),
(3063, NULL, 5, 'system_admin/activities/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:25:59', '2020-03-19 22:25:59'),
(3064, NULL, 5, 'system_admin/activities/2', 'PUT', '127.0.0.1', '{\"type\":\"Mobiles&Accesciories\",\"notes\":\"Mobiles&Accesciories\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-19 22:26:03', '2020-03-19 22:26:03'),
(3065, NULL, 5, 'system_admin/activities/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:26:04', '2020-03-19 22:26:04'),
(3066, NULL, 5, 'system_admin/activities/2', 'PUT', '127.0.0.1', '{\"type\":\"Mobiles&Accesciories\",\"notes\":\"Mobiles&Accesciories\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\"}', '2020-03-19 22:34:06', '2020-03-19 22:34:06'),
(3067, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-19 22:35:35', '2020-03-19 22:35:35'),
(3068, NULL, 5, 'system_admin/activities/2', 'GET', '127.0.0.1', '[]', '2020-03-19 22:35:37', '2020-03-19 22:35:37'),
(3069, NULL, 5, 'system_admin/activities/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:35:40', '2020-03-19 22:35:40'),
(3070, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:35:43', '2020-03-19 22:35:43'),
(3071, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:44:49', '2020-03-19 22:44:49'),
(3072, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:45:00', '2020-03-19 22:45:00'),
(3073, NULL, 5, 'system_admin/activities/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:45:24', '2020-03-19 22:45:24'),
(3074, NULL, 5, 'system_admin/activities/4', 'PUT', '127.0.0.1', '{\"type\":\"2Books\",\"notes\":\"2Books\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-19 22:45:48', '2020-03-19 22:45:48'),
(3075, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:45:49', '2020-03-19 22:45:49'),
(3076, NULL, 5, 'system_admin/activities/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:46:00', '2020-03-19 22:46:00'),
(3077, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:46:04', '2020-03-19 22:46:04'),
(3078, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:46:45', '2020-03-19 22:46:45'),
(3079, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-19 22:46:58', '2020-03-19 22:46:58'),
(3080, NULL, 5, 'system_admin/activities/9', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\"}', '2020-03-19 22:47:00', '2020-03-19 22:47:00'),
(3081, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 22:47:05', '2020-03-19 22:47:05'),
(3082, NULL, 5, 'system_admin/activities/9', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\"}', '2020-03-19 22:47:15', '2020-03-19 22:47:15'),
(3083, NULL, 5, 'system_admin/activities/9', 'PUT', '127.0.0.1', '{\"active\":\"on\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\"}', '2020-03-19 22:47:28', '2020-03-19 22:47:28'),
(3084, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-19 22:52:04', '2020-03-19 22:52:04'),
(3085, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 22:52:24', '2020-03-19 22:52:24'),
(3086, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:52:29', '2020-03-19 22:52:29'),
(3087, NULL, 5, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 22:54:05', '2020-03-19 22:54:05'),
(3088, NULL, 5, 'system_admin/shop_attribute_group/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:54:18', '2020-03-19 22:54:18'),
(3089, NULL, 5, 'system_admin/shop_attribute_group/1', 'PUT', '127.0.0.1', '{\"name\":\"Color\",\"status\":\"on\",\"sort\":\"1\",\"type\":\"select\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_attribute_group\"}', '2020-03-19 22:54:31', '2020-03-19 22:54:31'),
(3090, NULL, 5, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '[]', '2020-03-19 22:54:32', '2020-03-19 22:54:32'),
(3091, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 22:54:38', '2020-03-19 22:54:38'),
(3092, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 22:54:43', '2020-03-19 22:54:43'),
(3093, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:10:19', '2020-03-19 23:10:19'),
(3094, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:10:21', '2020-03-19 23:10:21'),
(3095, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:10:23', '2020-03-19 23:10:23'),
(3096, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:10:24', '2020-03-19 23:10:24'),
(3097, NULL, 5, 'system_admin/shop_attribute_group', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:13:13', '2020-03-19 23:13:13'),
(3098, NULL, 5, 'system_admin/shop_attribute_group/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 23:13:17', '2020-03-19 23:13:17'),
(3099, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:13:26', '2020-03-19 23:13:26'),
(3100, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 23:13:30', '2020-03-19 23:13:30'),
(3101, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"1\",\"carton\":\"5\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"group\":{\"1\":{\"name\":[\"\\u0641\\u0642\",\"\\u0641\\u0642\\u0642\\u062b\",null]}},\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-19 23:13:48', '2020-03-19 23:13:48'),
(3102, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 23:13:50', '2020-03-19 23:13:50'),
(3103, NULL, 5, 'system_admin/shop_product/54', 'PUT', '127.0.0.1', '{\"sku\":\"prod2\",\"ar__name\":\"prod2\",\"price\":\"258\",\"cost\":\"20\",\"ar__keyword\":\"prod2\",\"ar__description\":\"prod2 des1\",\"ar__content\":\"prod2 des2\",\"area\":\"2\",\"carton\":\"5\",\"pocket\":\"0\",\"category_id\":\"6\",\"company_id\":\"2\",\"stock\":\"10\",\"brand_id\":\"2\",\"vendor_id\":\"1\",\"status\":\"on\",\"sort\":\"2\",\"type\":\"0\",\"date_available\":\"2020-03-11 00:00:00\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\"}', '2020-03-19 23:20:36', '2020-03-19 23:20:36'),
(3104, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:38:52', '2020-03-19 23:38:52'),
(3105, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:38:55', '2020-03-19 23:38:55'),
(3106, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 23:39:17', '2020-03-19 23:39:17'),
(3107, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:43:41', '2020-03-19 23:43:41'),
(3108, NULL, 5, 'system_admin/shop_special_price/14/edit', 'GET', '127.0.0.1', '[]', '2020-03-19 23:43:58', '2020-03-19 23:43:58'),
(3109, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":null}', '2020-03-19 23:43:59', '2020-03-19 23:43:59'),
(3110, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2020-03-19 23:44:06', '2020-03-19 23:44:06'),
(3111, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-19 23:44:13', '2020-03-19 23:44:13'),
(3112, NULL, 5, 'system_admin/shop_special_price/13', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"mlByhfZugcnxlJl0pUK26m3jodlmZVfDfMvKe4yY\",\"_method\":\"PUT\"}', '2020-03-19 23:44:43', '2020-03-19 23:44:43'),
(3113, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-20 13:20:26', '2020-03-20 13:20:26'),
(3114, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 13:21:05', '2020-03-20 13:21:05'),
(3115, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 13:30:35', '2020-03-20 13:30:35'),
(3116, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 13:50:19', '2020-03-20 13:50:19'),
(3117, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 13:50:52', '2020-03-20 13:50:52'),
(3118, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 13:51:14', '2020-03-20 13:51:14'),
(3119, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 14:34:17', '2020-03-20 14:34:17'),
(3120, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 14:36:26', '2020-03-20 14:36:26'),
(3121, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 14:36:46', '2020-03-20 14:36:46'),
(3122, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 14:37:13', '2020-03-20 14:37:13'),
(3123, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 14:38:30', '2020-03-20 14:38:30'),
(3124, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 14:38:32', '2020-03-20 14:38:32'),
(3125, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 14:39:01', '2020-03-20 14:39:01'),
(3126, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 14:39:02', '2020-03-20 14:39:02'),
(3127, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 14:39:30', '2020-03-20 14:39:30'),
(3128, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 14:50:01', '2020-03-20 14:50:01'),
(3129, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-20 19:42:19', '2020-03-20 19:42:19'),
(3130, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 19:42:48', '2020-03-20 19:42:48'),
(3131, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:43:07', '2020-03-20 19:43:07'),
(3132, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:46:32', '2020-03-20 19:46:32'),
(3133, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:50:07', '2020-03-20 19:50:07'),
(3134, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:50:26', '2020-03-20 19:50:26'),
(3135, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:50:31', '2020-03-20 19:50:31'),
(3136, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 19:51:25', '2020-03-20 19:51:25'),
(3137, NULL, 5, 'system_admin/shop_category/19/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:51:29', '2020-03-20 19:51:29'),
(3138, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 19:53:24', '2020-03-20 19:53:24'),
(3139, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 19:53:27', '2020-03-20 19:53:27'),
(3140, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-20 21:48:34', '2020-03-20 21:48:34'),
(3141, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-20 21:48:38', '2020-03-20 21:48:38'),
(3142, NULL, 5, 'system_admin/activities/9', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"UclpZupT8zOzqu1dli1GLO1kSz5xqlUYRgEYGwV8\",\"_method\":\"PUT\"}', '2020-03-20 21:48:43', '2020-03-20 21:48:43'),
(3143, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 21:48:46', '2020-03-20 21:48:46'),
(3144, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 21:48:58', '2020-03-20 21:48:58'),
(3145, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 21:49:44', '2020-03-20 21:49:44'),
(3146, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 21:50:20', '2020-03-20 21:50:20'),
(3147, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 21:52:22', '2020-03-20 21:52:22'),
(3148, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 21:55:41', '2020-03-20 21:55:41'),
(3149, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-20 22:14:24', '2020-03-20 22:14:24'),
(3150, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 22:14:28', '2020-03-20 22:14:28'),
(3151, NULL, 5, 'system_admin/item_units/create', 'GET', '127.0.0.1', '[]', '2020-03-20 22:17:58', '2020-03-20 22:17:58'),
(3152, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 22:38:17', '2020-03-20 22:38:17'),
(3153, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 22:38:30', '2020-03-20 22:38:30'),
(3154, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 22:39:30', '2020-03-20 22:39:30'),
(3155, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-20 22:40:12', '2020-03-20 22:40:12'),
(3156, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 22:40:15', '2020-03-20 22:40:15'),
(3157, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 22:52:24', '2020-03-20 22:52:24'),
(3158, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 22:53:10', '2020-03-20 22:53:10'),
(3159, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-20 22:53:14', '2020-03-20 22:53:14'),
(3160, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 22:53:18', '2020-03-20 22:53:18'),
(3161, NULL, 5, 'system_admin/item_units/4', 'PUT', '127.0.0.1', '{\"code\":\"pocket\",\"name\":\"\\u0639\\u0644\\u0628\\u0629\",\"_token\":\"UclpZupT8zOzqu1dli1GLO1kSz5xqlUYRgEYGwV8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/item_units\"}', '2020-03-20 23:00:58', '2020-03-20 23:00:58'),
(3162, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 23:00:58', '2020-03-20 23:00:58'),
(3163, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 23:01:04', '2020-03-20 23:01:04'),
(3164, NULL, 5, 'system_admin/item_units/4', 'PUT', '127.0.0.1', '{\"code\":\"pocket1\",\"name\":\"\\u0639\\u0644\\u0628\\u0629\",\"_token\":\"UclpZupT8zOzqu1dli1GLO1kSz5xqlUYRgEYGwV8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/item_units\"}', '2020-03-20 23:01:12', '2020-03-20 23:01:12'),
(3165, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-20 23:01:12', '2020-03-20 23:01:12'),
(3166, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-20 23:10:06', '2020-03-20 23:10:06'),
(3167, NULL, 5, 'system_admin/item_units/2', 'PUT', '127.0.0.1', '{\"code\":\"color\",\"name\":\"\\u0627\\u0644\\u0644\\u0648\\u0646\",\"_token\":\"UclpZupT8zOzqu1dli1GLO1kSz5xqlUYRgEYGwV8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/item_units\"}', '2020-03-21 00:16:15', '2020-03-21 00:16:15'),
(3168, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-21 00:16:15', '2020-03-21 00:16:15'),
(3169, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:16:17', '2020-03-21 00:16:17'),
(3170, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:48:12', '2020-03-21 00:48:12'),
(3171, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:49:15', '2020-03-21 00:49:15'),
(3172, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 00:49:21', '2020-03-21 00:49:21'),
(3173, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:49:24', '2020-03-21 00:49:24'),
(3174, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:49:41', '2020-03-21 00:49:41'),
(3175, NULL, 5, 'system_admin/item_units/2', 'PUT', '127.0.0.1', '{\"code\":\"color\",\"name\":\"\\u0627\\u0644\\u0644\\u0648\\u0646\",\"_token\":\"UclpZupT8zOzqu1dli1GLO1kSz5xqlUYRgEYGwV8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/item_units\"}', '2020-03-21 00:49:45', '2020-03-21 00:49:45'),
(3176, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-21 00:49:45', '2020-03-21 00:49:45'),
(3177, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:49:48', '2020-03-21 00:49:48'),
(3178, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:50:15', '2020-03-21 00:50:15'),
(3179, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:51:43', '2020-03-21 00:51:43'),
(3180, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:55:07', '2020-03-21 00:55:07'),
(3181, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:55:48', '2020-03-21 00:55:48'),
(3182, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:56:08', '2020-03-21 00:56:08'),
(3183, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 00:56:51', '2020-03-21 00:56:51'),
(3184, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:16:33', '2020-03-21 01:16:33'),
(3185, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:17:18', '2020-03-21 01:17:18'),
(3186, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:17:21', '2020-03-21 01:17:21'),
(3187, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:17:30', '2020-03-21 01:17:30'),
(3188, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:18:43', '2020-03-21 01:18:43'),
(3189, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:19:01', '2020-03-21 01:19:01'),
(3190, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:19:25', '2020-03-21 01:19:25'),
(3191, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 01:20:56', '2020-03-21 01:20:56'),
(3192, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:07:15', '2020-03-21 02:07:15'),
(3193, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:09:09', '2020-03-21 02:09:09'),
(3194, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:14:18', '2020-03-21 02:14:18'),
(3195, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:15:02', '2020-03-21 02:15:02'),
(3196, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:15:15', '2020-03-21 02:15:15'),
(3197, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-21 02:16:08', '2020-03-21 02:16:08'),
(3198, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:16:12', '2020-03-21 02:16:12'),
(3199, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:16:22', '2020-03-21 02:16:22'),
(3200, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:17:15', '2020-03-21 02:17:15'),
(3201, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:18:27', '2020-03-21 02:18:27'),
(3202, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:19:05', '2020-03-21 02:19:05'),
(3203, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:19:28', '2020-03-21 02:19:28'),
(3204, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:20:09', '2020-03-21 02:20:09'),
(3205, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 02:20:39', '2020-03-21 02:20:39'),
(3206, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:16:41', '2020-03-21 12:16:41'),
(3207, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:17:13', '2020-03-21 12:17:13'),
(3208, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:17:47', '2020-03-21 12:17:47'),
(3209, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:18:10', '2020-03-21 12:18:10'),
(3210, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:18:24', '2020-03-21 12:18:24'),
(3211, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:19:23', '2020-03-21 12:19:23'),
(3212, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:57:57', '2020-03-21 12:57:57'),
(3213, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:58:18', '2020-03-21 12:58:18'),
(3214, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 12:58:31', '2020-03-21 12:58:31'),
(3215, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:00:25', '2020-03-21 13:00:25'),
(3216, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:00:36', '2020-03-21 13:00:36'),
(3217, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:00:53', '2020-03-21 13:00:53'),
(3218, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:01:34', '2020-03-21 13:01:34'),
(3219, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:02:23', '2020-03-21 13:02:23'),
(3220, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:04:44', '2020-03-21 13:04:44'),
(3221, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:05:26', '2020-03-21 13:05:26'),
(3222, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:06:12', '2020-03-21 13:06:12'),
(3223, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:06:37', '2020-03-21 13:06:37'),
(3224, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:06:59', '2020-03-21 13:06:59'),
(3225, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:07:37', '2020-03-21 13:07:37'),
(3226, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:09:57', '2020-03-21 13:09:57'),
(3227, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:10:45', '2020-03-21 13:10:45'),
(3228, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:11:43', '2020-03-21 13:11:43'),
(3229, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:13:31', '2020-03-21 13:13:31'),
(3230, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:13:46', '2020-03-21 13:13:46'),
(3231, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:14:03', '2020-03-21 13:14:03'),
(3232, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:14:39', '2020-03-21 13:14:39'),
(3233, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:15:17', '2020-03-21 13:15:17'),
(3234, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:15:33', '2020-03-21 13:15:33'),
(3235, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:15:49', '2020-03-21 13:15:49'),
(3236, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:16:07', '2020-03-21 13:16:07'),
(3237, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:16:49', '2020-03-21 13:16:49'),
(3238, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:17:24', '2020-03-21 13:17:24'),
(3239, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:17:49', '2020-03-21 13:17:49'),
(3240, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:18:40', '2020-03-21 13:18:40'),
(3241, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:18:54', '2020-03-21 13:18:54'),
(3242, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:19:03', '2020-03-21 13:19:03'),
(3243, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:19:24', '2020-03-21 13:19:24'),
(3244, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:19:38', '2020-03-21 13:19:38'),
(3245, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:20:08', '2020-03-21 13:20:08'),
(3246, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:20:29', '2020-03-21 13:20:29'),
(3247, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:20:39', '2020-03-21 13:20:39'),
(3248, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:20:49', '2020-03-21 13:20:49'),
(3249, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:21:37', '2020-03-21 13:21:37'),
(3250, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:22:11', '2020-03-21 13:22:11'),
(3251, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:22:49', '2020-03-21 13:22:49'),
(3252, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:23:20', '2020-03-21 13:23:20'),
(3253, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:23:31', '2020-03-21 13:23:31'),
(3254, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:24:08', '2020-03-21 13:24:08');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(3255, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:24:26', '2020-03-21 13:24:26'),
(3256, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:25:13', '2020-03-21 13:25:13'),
(3257, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:26:12', '2020-03-21 13:26:12'),
(3258, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:26:21', '2020-03-21 13:26:21'),
(3259, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:31:42', '2020-03-21 13:31:42'),
(3260, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:32:18', '2020-03-21 13:32:18'),
(3261, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:35:16', '2020-03-21 13:35:16'),
(3262, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:35:30', '2020-03-21 13:35:30'),
(3263, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:36:40', '2020-03-21 13:36:40'),
(3264, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:37:06', '2020-03-21 13:37:06'),
(3265, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:37:32', '2020-03-21 13:37:32'),
(3266, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:40:05', '2020-03-21 13:40:05'),
(3267, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:40:51', '2020-03-21 13:40:51'),
(3268, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:41:19', '2020-03-21 13:41:19'),
(3269, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:42:56', '2020-03-21 13:42:56'),
(3270, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:44:40', '2020-03-21 13:44:40'),
(3271, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:44:54', '2020-03-21 13:44:54'),
(3272, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:45:35', '2020-03-21 13:45:35'),
(3273, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:46:41', '2020-03-21 13:46:41'),
(3274, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:47:02', '2020-03-21 13:47:02'),
(3275, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:47:13', '2020-03-21 13:47:13'),
(3276, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:47:49', '2020-03-21 13:47:49'),
(3277, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:51:31', '2020-03-21 13:51:31'),
(3278, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 13:53:28', '2020-03-21 13:53:28'),
(3279, NULL, 5, 'system_admin/config_updateConfigField', 'PUT', '127.0.0.1', '{\"name\":\"1\",\"value\":\"\\u0635\\u063a\\u064a\\u0631\",\"pk\":\"small\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 14:09:35', '2020-03-21 14:09:35'),
(3280, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:09:38', '2020-03-21 14:09:38'),
(3281, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:11:24', '2020-03-21 14:11:24'),
(3282, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:12:51', '2020-03-21 14:12:51'),
(3283, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:14:28', '2020-03-21 14:14:28'),
(3284, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 14:36:59', '2020-03-21 14:36:59'),
(3285, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:37:04', '2020-03-21 14:37:04'),
(3286, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 14:37:15', '2020-03-21 14:37:15'),
(3287, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-21 14:37:26', '2020-03-21 14:37:26'),
(3288, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 14:37:32', '2020-03-21 14:37:32'),
(3289, NULL, 5, 'system_admin/item_units/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:37:36', '2020-03-21 14:37:36'),
(3290, NULL, 5, 'system_admin/item_units/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:37:42', '2020-03-21 14:37:42'),
(3291, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 14:37:48', '2020-03-21 14:37:48'),
(3292, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:00:58', '2020-03-21 15:00:58'),
(3293, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:09:03', '2020-03-21 15:09:03'),
(3294, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:09:57', '2020-03-21 15:09:57'),
(3295, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:11:09', '2020-03-21 15:11:09'),
(3296, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:13:39', '2020-03-21 15:13:39'),
(3297, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:13:55', '2020-03-21 15:13:55'),
(3298, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:14:18', '2020-03-21 15:14:18'),
(3299, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:15:14', '2020-03-21 15:15:14'),
(3300, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:15:42', '2020-03-21 15:15:42'),
(3301, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:16:51', '2020-03-21 15:16:51'),
(3302, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:17:18', '2020-03-21 15:17:18'),
(3303, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:17:30', '2020-03-21 15:17:30'),
(3304, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:17:50', '2020-03-21 15:17:50'),
(3305, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:17:57', '2020-03-21 15:17:57'),
(3306, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:19:42', '2020-03-21 15:19:42'),
(3307, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:27:24', '2020-03-21 15:27:24'),
(3308, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:49:58', '2020-03-21 15:49:58'),
(3309, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:56:40', '2020-03-21 15:56:40'),
(3310, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 15:57:44', '2020-03-21 15:57:44'),
(3311, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 16:05:09', '2020-03-21 16:05:09'),
(3312, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 17:26:17', '2020-03-21 17:26:17'),
(3313, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 17:33:51', '2020-03-21 17:33:51'),
(3314, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 17:38:53', '2020-03-21 17:38:53'),
(3315, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 17:38:57', '2020-03-21 17:38:57'),
(3316, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 17:39:15', '2020-03-21 17:39:15'),
(3317, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 18:16:11', '2020-03-21 18:16:11'),
(3318, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 18:26:38', '2020-03-21 18:26:38'),
(3319, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 18:26:39', '2020-03-21 18:26:39'),
(3320, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 18:51:27', '2020-03-21 18:51:27'),
(3321, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 18:51:33', '2020-03-21 18:51:33'),
(3322, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large4\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 18:51:51', '2020-03-21 18:51:51'),
(3323, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 20:25:21', '2020-03-21 20:25:21'),
(3324, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large5\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 20:25:37', '2020-03-21 20:25:37'),
(3325, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large5\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 20:26:22', '2020-03-21 20:26:22'),
(3326, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 20:32:46', '2020-03-21 20:32:46'),
(3327, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"name\",\"value\":\"\\u0643\\u0628\\u064a\\u0631\\u06294\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 20:32:56', '2020-03-21 20:32:56'),
(3328, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"amount_in_base\",\"value\":\"38\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 20:33:24', '2020-03-21 20:33:24'),
(3329, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 20:34:02', '2020-03-21 20:34:02'),
(3330, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large1\",\"pk\":\"6\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 20:35:20', '2020-03-21 20:35:20'),
(3331, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"medium4\",\"pk\":\"8\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-21 20:37:21', '2020-03-21 20:37:21'),
(3332, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 20:37:23', '2020-03-21 20:37:23'),
(3333, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-21 21:23:17', '2020-03-21 21:23:17'),
(3334, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 21:23:26', '2020-03-21 21:23:26'),
(3335, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"15000\",\"cost\":\"13005\",\"ar__keyword\":\"ddd\",\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"0\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\",\"AM\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-21 21:23:47', '2020-03-21 21:23:47'),
(3336, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:24:28', '2020-03-21 21:24:28'),
(3337, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 21:24:31', '2020-03-21 21:24:31'),
(3338, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnvnkkn\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"13005\",\"ar__keyword\":\"ddd\",\"ar__description\":\"test\",\"ar__content\":\"<p>test long<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"0\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"12\",\"company_id\":null,\"stock\":\"75\",\"brand_id\":\"3\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-21 21:25:02', '2020-03-21 21:25:02'),
(3339, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:25:07', '2020-03-21 21:25:07'),
(3340, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 21:25:09', '2020-03-21 21:25:09'),
(3341, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"131151\",\"ar__keyword\":\"ddddsdfsdfsdfs\",\"ar__description\":\"test 8\",\"ar__content\":\"<p>test long test 2<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"12\",\"company_id\":\"3\",\"stock\":\"75\",\"brand_id\":\"1\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-21 21:26:09', '2020-03-21 21:26:09'),
(3342, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:31:16', '2020-03-21 21:31:16'),
(3343, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 21:31:20', '2020-03-21 21:31:20'),
(3344, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"131151\",\"ar__keyword\":\"ddddsdfsdfsdfs\",\"ar__description\":\"test 8\",\"ar__content\":\"<p>test long test 2<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"12\",\"company_id\":\"3\",\"stock\":\"75\",\"brand_id\":\"1\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-21 21:32:25', '2020-03-21 21:32:25'),
(3345, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:36:36', '2020-03-21 21:36:36'),
(3346, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:38:11', '2020-03-21 21:38:11'),
(3347, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:38:27', '2020-03-21 21:38:27'),
(3348, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:38:35', '2020-03-21 21:38:35'),
(3349, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:39:53', '2020-03-21 21:39:53'),
(3350, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:40:07', '2020-03-21 21:40:07'),
(3351, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:40:23', '2020-03-21 21:40:23'),
(3352, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:40:48', '2020-03-21 21:40:48'),
(3353, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:40:57', '2020-03-21 21:40:57'),
(3354, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:41:23', '2020-03-21 21:41:23'),
(3355, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 21:41:34', '2020-03-21 21:41:34'),
(3356, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 21:41:36', '2020-03-21 21:41:36'),
(3357, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"131151\",\"ar__keyword\":\"ddddsdfsdfsdfs\",\"ar__description\":\"test 8\",\"ar__content\":\"<p>test long test 2<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"area\":\"1\",\"carton\":\"0\",\"pocket\":\"0\",\"category_id\":\"12\",\"company_id\":\"3\",\"stock\":\"75\",\"brand_id\":\"4\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-21 21:41:47', '2020-03-21 21:41:47'),
(3358, NULL, 5, 'system_admin/item_units/4', 'PUT', '127.0.0.1', '{\"code\":\"pocket\",\"name\":\"\\u0639\\u0644\\u0628\\u0629\",\"_token\":\"0O9lfrmPB8hafhdIvSapcoBfaJI0r3lxPMFi0foE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/item_units\"}', '2020-03-21 23:20:48', '2020-03-21 23:20:48'),
(3359, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-21 23:20:48', '2020-03-21 23:20:48'),
(3360, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 23:20:52', '2020-03-21 23:20:52'),
(3361, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-21 23:21:00', '2020-03-21 23:21:00'),
(3362, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 23:21:06', '2020-03-21 23:21:06'),
(3363, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-21 23:21:45', '2020-03-21 23:21:45'),
(3364, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 23:24:57', '2020-03-21 23:24:57'),
(3365, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-03-21 23:25:04', '2020-03-21 23:25:04'),
(3366, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-03-21 23:25:08', '2020-03-21 23:25:08'),
(3367, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":null,\"_pjax\":\"#pjax-container\"}', '2020-03-21 23:25:10', '2020-03-21 23:25:10'),
(3368, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-21 23:25:23', '2020-03-21 23:25:23'),
(3369, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"keyword\":null}', '2020-03-21 23:25:27', '2020-03-21 23:25:27'),
(3370, NULL, 5, 'system_admin/shop_order_edit/3', 'GET', '127.0.0.1', '[]', '2020-03-21 23:25:31', '2020-03-21 23:25:31'),
(3371, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 23:34:27', '2020-03-21 23:34:27'),
(3372, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-21 23:34:28', '2020-03-21 23:34:28'),
(3373, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-21 23:34:33', '2020-03-21 23:34:33'),
(3374, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-21 23:34:40', '2020-03-21 23:34:40'),
(3375, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 23:34:42', '2020-03-21 23:34:42'),
(3376, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 23:36:45', '2020-03-21 23:36:45'),
(3377, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-21 23:37:39', '2020-03-21 23:37:39'),
(3378, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-27 17:03:26', '2020-03-27 17:03:26'),
(3379, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-27 18:17:04', '2020-03-27 18:17:04'),
(3380, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-27 18:17:09', '2020-03-27 18:17:09'),
(3381, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-27 18:17:12', '2020-03-27 18:17:12'),
(3382, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-27 18:17:23', '2020-03-27 18:17:23'),
(3383, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 18:17:26', '2020-03-27 18:17:26'),
(3384, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 19:44:30', '2020-03-27 19:44:30'),
(3385, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 19:51:13', '2020-03-27 19:51:13'),
(3386, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 19:56:55', '2020-03-27 19:56:55'),
(3387, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 19:57:22', '2020-03-27 19:57:22'),
(3388, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 19:57:57', '2020-03-27 19:57:57'),
(3389, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 19:58:51', '2020-03-27 19:58:51'),
(3390, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:00:15', '2020-03-27 20:00:15'),
(3391, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:00:45', '2020-03-27 20:00:45'),
(3392, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:01:21', '2020-03-27 20:01:21'),
(3393, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:03:04', '2020-03-27 20:03:04'),
(3394, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:04:01', '2020-03-27 20:04:01'),
(3395, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:04:12', '2020-03-27 20:04:12'),
(3396, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:04:37', '2020-03-27 20:04:37'),
(3397, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:04:45', '2020-03-27 20:04:45'),
(3398, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:04:55', '2020-03-27 20:04:55'),
(3399, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:07:31', '2020-03-27 20:07:31'),
(3400, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:07:31', '2020-03-27 20:07:31'),
(3401, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:07:34', '2020-03-27 20:07:34'),
(3402, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:08:32', '2020-03-27 20:08:32'),
(3403, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:09:30', '2020-03-27 20:09:30'),
(3404, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 20:09:31', '2020-03-27 20:09:31'),
(3405, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:23:07', '2020-03-27 21:23:07'),
(3406, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:23:41', '2020-03-27 21:23:41'),
(3407, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:25:52', '2020-03-27 21:25:52'),
(3408, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:28:54', '2020-03-27 21:28:54'),
(3409, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:29:53', '2020-03-27 21:29:53'),
(3410, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:35:20', '2020-03-27 21:35:20'),
(3411, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:36:15', '2020-03-27 21:36:15'),
(3412, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:41:13', '2020-03-27 21:41:13'),
(3413, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:41:27', '2020-03-27 21:41:27'),
(3414, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:41:58', '2020-03-27 21:41:58'),
(3415, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:42:25', '2020-03-27 21:42:25'),
(3416, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:42:53', '2020-03-27 21:42:53'),
(3417, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:43:12', '2020-03-27 21:43:12'),
(3418, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:43:23', '2020-03-27 21:43:23'),
(3419, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 21:46:09', '2020-03-27 21:46:09'),
(3420, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:07:23', '2020-03-27 22:07:23'),
(3421, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:07:56', '2020-03-27 22:07:56'),
(3422, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:08:34', '2020-03-27 22:08:34'),
(3423, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:09:04', '2020-03-27 22:09:04'),
(3424, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:13:19', '2020-03-27 22:13:19'),
(3425, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:13:48', '2020-03-27 22:13:48'),
(3426, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:16:04', '2020-03-27 22:16:04'),
(3427, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:22:19', '2020-03-27 22:22:19'),
(3428, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:22:37', '2020-03-27 22:22:37'),
(3429, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:25:47', '2020-03-27 22:25:47'),
(3430, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:26:45', '2020-03-27 22:26:45'),
(3431, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:26:55', '2020-03-27 22:26:55'),
(3432, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:27:37', '2020-03-27 22:27:37'),
(3433, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:31:47', '2020-03-27 22:31:47'),
(3434, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:32:08', '2020-03-27 22:32:08'),
(3435, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:33:13', '2020-03-27 22:33:13'),
(3436, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:33:35', '2020-03-27 22:33:35'),
(3437, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:33:45', '2020-03-27 22:33:45'),
(3438, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:34:11', '2020-03-27 22:34:11'),
(3439, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:34:28', '2020-03-27 22:34:28'),
(3440, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:35:29', '2020-03-27 22:35:29'),
(3441, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:35:51', '2020-03-27 22:35:51'),
(3442, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:36:35', '2020-03-27 22:36:35'),
(3443, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:37:29', '2020-03-27 22:37:29'),
(3444, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:41:47', '2020-03-27 22:41:47'),
(3445, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:41:49', '2020-03-27 22:41:49'),
(3446, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:42:12', '2020-03-27 22:42:12'),
(3447, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:42:14', '2020-03-27 22:42:14'),
(3448, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 22:42:44', '2020-03-27 22:42:44'),
(3449, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 23:56:32', '2020-03-27 23:56:32'),
(3450, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 23:58:27', '2020-03-27 23:58:27'),
(3451, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-27 23:59:45', '2020-03-27 23:59:45'),
(3452, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:00:23', '2020-03-28 00:00:23'),
(3453, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:01:49', '2020-03-28 00:01:49'),
(3454, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:02:03', '2020-03-28 00:02:03'),
(3455, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:02:20', '2020-03-28 00:02:20'),
(3456, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:02:42', '2020-03-28 00:02:42'),
(3457, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:03:32', '2020-03-28 00:03:32'),
(3458, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:04:18', '2020-03-28 00:04:18'),
(3459, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:11:32', '2020-03-28 00:11:32'),
(3460, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:12:28', '2020-03-28 00:12:28'),
(3461, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:16:08', '2020-03-28 00:16:08'),
(3462, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:16:36', '2020-03-28 00:16:36'),
(3463, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:33:55', '2020-03-28 00:33:55'),
(3464, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:34:06', '2020-03-28 00:34:06'),
(3465, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:34:36', '2020-03-28 00:34:36'),
(3466, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:35:55', '2020-03-28 00:35:55'),
(3467, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:36:21', '2020-03-28 00:36:21'),
(3468, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:36:44', '2020-03-28 00:36:44'),
(3469, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:37:11', '2020-03-28 00:37:11'),
(3470, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:42:08', '2020-03-28 00:42:08'),
(3471, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:45:34', '2020-03-28 00:45:34'),
(3472, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 00:45:35', '2020-03-28 00:45:35'),
(3473, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:10:24', '2020-03-28 02:10:24'),
(3474, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:12:16', '2020-03-28 02:12:16'),
(3475, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:13:03', '2020-03-28 02:13:03'),
(3476, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:13:40', '2020-03-28 02:13:40'),
(3477, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:14:27', '2020-03-28 02:14:27'),
(3478, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:18:11', '2020-03-28 02:18:11'),
(3479, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:18:26', '2020-03-28 02:18:26'),
(3480, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:18:42', '2020-03-28 02:18:42'),
(3481, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:18:58', '2020-03-28 02:18:58'),
(3482, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:22:41', '2020-03-28 02:22:41'),
(3483, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:24:57', '2020-03-28 02:24:57'),
(3484, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 02:25:23', '2020-03-28 02:25:23'),
(3485, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:02', '2020-03-28 02:26:02'),
(3486, NULL, 5, 'system_admin/shop_special_price', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:07', '2020-03-28 02:26:07'),
(3487, NULL, 5, 'system_admin/shop_brand', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:10', '2020-03-28 02:26:10'),
(3488, NULL, 5, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:24', '2020-03-28 02:26:24'),
(3489, NULL, 5, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:24', '2020-03-28 02:26:24'),
(3490, NULL, 5, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:25', '2020-03-28 02:26:25'),
(3491, NULL, 5, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:25', '2020-03-28 02:26:25'),
(3492, NULL, 5, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 02:26:27', '2020-03-28 02:26:27'),
(3493, NULL, 5, 'system_admin/shop_vendor', 'GET', '127.0.0.1', '[]', '2020-03-28 02:28:50', '2020-03-28 02:28:50'),
(3494, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-28 16:50:50', '2020-03-28 16:50:50'),
(3495, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 16:51:09', '2020-03-28 16:51:09'),
(3496, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 16:51:12', '2020-03-28 16:51:12'),
(3497, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 16:55:33', '2020-03-28 16:55:33'),
(3498, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 16:55:46', '2020-03-28 16:55:46'),
(3499, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 16:55:48', '2020-03-28 16:55:48'),
(3500, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 16:58:59', '2020-03-28 16:58:59'),
(3501, NULL, 5, 'system_admin/config_info/32', 'PUT', '127.0.0.1', '{\"value\":\"off\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-28 16:59:12', '2020-03-28 16:59:12'),
(3502, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-28 16:59:15', '2020-03-28 16:59:15'),
(3503, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 16:59:19', '2020-03-28 16:59:19'),
(3504, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 16:59:28', '2020-03-28 16:59:28'),
(3505, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '[]', '2020-03-28 16:59:32', '2020-03-28 16:59:32'),
(3506, NULL, 5, 'system_admin/shop_category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 16:59:37', '2020-03-28 16:59:37'),
(3507, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 16:59:46', '2020-03-28 16:59:46'),
(3508, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 16:59:49', '2020-03-28 16:59:49'),
(3509, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-28 17:19:48', '2020-03-28 17:19:48'),
(3510, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 17:19:52', '2020-03-28 17:19:52'),
(3511, NULL, 5, 'system_admin/company/create', 'GET', '127.0.0.1', '[]', '2020-03-28 17:20:25', '2020-03-28 17:20:25'),
(3512, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:20:59', '2020-03-28 17:20:59'),
(3513, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 17:24:53', '2020-03-28 17:24:53'),
(3514, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:24:55', '2020-03-28 17:24:55'),
(3515, NULL, 5, 'system_admin/activities/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:31:00', '2020-03-28 17:31:00'),
(3516, NULL, 5, 'system_admin/activities/1', 'PUT', '127.0.0.1', '{\"type\":\"Clothes\",\"notes\":\"Clothes\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-28 17:31:18', '2020-03-28 17:31:18'),
(3517, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:31:18', '2020-03-28 17:31:18'),
(3518, NULL, 5, 'system_admin/activities/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:31:22', '2020-03-28 17:31:22'),
(3519, NULL, 5, 'system_admin/activities/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:39:32', '2020-03-28 17:39:32'),
(3520, NULL, 5, 'system_admin/activities/1', 'PUT', '127.0.0.1', '{\"type\":\"Clothes\",\"notes\":\"Clothes\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-28 17:39:36', '2020-03-28 17:39:36'),
(3521, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:39:36', '2020-03-28 17:39:36'),
(3522, NULL, 5, 'system_admin/activities/7/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:39:46', '2020-03-28 17:39:46'),
(3523, NULL, 5, 'system_admin/activities/7', 'PUT', '127.0.0.1', '{\"type\":\"Food&Drink\",\"notes\":\"ood&Drinks\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-28 17:39:52', '2020-03-28 17:39:52'),
(3524, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:39:52', '2020-03-28 17:39:52'),
(3525, NULL, 5, 'system_admin/activities/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:40:13', '2020-03-28 17:40:13'),
(3526, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:40:18', '2020-03-28 17:40:18'),
(3527, NULL, 5, 'system_admin/activities/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:40:20', '2020-03-28 17:40:20'),
(3528, NULL, 5, 'system_admin/activities/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:40:25', '2020-03-28 17:40:25'),
(3529, NULL, 5, 'system_admin/activities/3', 'PUT', '127.0.0.1', '{\"type\":\"Labtop&PCs\",\"notes\":\"Labtop&PCs\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-28 17:40:36', '2020-03-28 17:40:36'),
(3530, NULL, 5, 'system_admin/activities/3', 'GET', '127.0.0.1', '[]', '2020-03-28 17:42:24', '2020-03-28 17:42:24'),
(3531, NULL, 5, 'system_admin/activities/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:42:28', '2020-03-28 17:42:28'),
(3532, NULL, 5, 'system_admin/activities/3', 'PUT', '127.0.0.1', '{\"type\":\"Labtop&PCs\",\"notes\":\"Labtop&PCs\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/3\"}', '2020-03-28 17:42:36', '2020-03-28 17:42:36'),
(3533, NULL, 5, 'system_admin/activities/3', 'GET', '127.0.0.1', '[]', '2020-03-28 17:46:47', '2020-03-28 17:46:47'),
(3534, NULL, 5, 'system_admin/activities/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:46:50', '2020-03-28 17:46:50'),
(3535, NULL, 5, 'system_admin/activities/3', 'PUT', '127.0.0.1', '{\"type\":\"Labtop&PCs\",\"notes\":\"Labtop&PCs\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\\/3\"}', '2020-03-28 17:47:01', '2020-03-28 17:47:01'),
(3536, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:47:01', '2020-03-28 17:47:01'),
(3537, NULL, 5, 'system_admin/activities/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:47:49', '2020-03-28 17:47:49'),
(3538, NULL, 5, 'system_admin/activities/1', 'PUT', '127.0.0.1', '{\"type\":\"Clothes\",\"notes\":\"Clothes\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-28 17:48:00', '2020-03-28 17:48:00'),
(3539, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:48:00', '2020-03-28 17:48:00'),
(3540, NULL, 5, 'system_admin/activities/9', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-28 17:49:54', '2020-03-28 17:49:54'),
(3541, NULL, 5, 'system_admin/activities/create', 'GET', '127.0.0.1', '[]', '2020-03-28 17:52:29', '2020-03-28 17:52:29'),
(3542, NULL, 5, 'system_admin/activities', 'POST', '127.0.0.1', '{\"type\":\"test new\",\"notes\":\"labtops1\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/activities\"}', '2020-03-28 17:52:47', '2020-03-28 17:52:47'),
(3543, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:52:47', '2020-03-28 17:52:47'),
(3544, NULL, 5, 'system_admin/activities/create', 'GET', '127.0.0.1', '[]', '2020-03-28 17:52:59', '2020-03-28 17:52:59'),
(3545, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:53:05', '2020-03-28 17:53:05'),
(3546, NULL, 5, 'system_admin/activities/10/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:53:21', '2020-03-28 17:53:21'),
(3547, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:53:36', '2020-03-28 17:53:36'),
(3548, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:53:37', '2020-03-28 17:53:37'),
(3549, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:54:54', '2020-03-28 17:54:54'),
(3550, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:55:52', '2020-03-28 17:55:52'),
(3551, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 17:56:34', '2020-03-28 17:56:34'),
(3552, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 17:56:36', '2020-03-28 17:56:36'),
(3553, NULL, 5, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 17:58:38', '2020-03-28 17:58:38'),
(3554, NULL, 5, 'system_admin/auth/permissions/5/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 17:58:49', '2020-03-28 17:58:49'),
(3555, NULL, 5, 'system_admin/auth/permissions/5', 'GET', '127.0.0.1', '[]', '2020-03-28 18:50:37', '2020-03-28 18:50:37'),
(3556, NULL, 5, 'system_admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-03-28 18:50:39', '2020-03-28 18:50:39'),
(3557, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 18:50:55', '2020-03-28 18:50:55'),
(3558, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 18:51:26', '2020-03-28 18:51:26');
INSERT INTO `admin_operation_log` (`id`, `company_id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(3559, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 18:51:29', '2020-03-28 18:51:29'),
(3560, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:05:44', '2020-03-28 19:05:44'),
(3561, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:14:29', '2020-03-28 19:14:29'),
(3562, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:19:31', '2020-03-28 19:19:31'),
(3563, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:20:44', '2020-03-28 19:20:44'),
(3564, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:34:18', '2020-03-28 19:34:18'),
(3565, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:37:15', '2020-03-28 19:37:15'),
(3566, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:38:36', '2020-03-28 19:38:36'),
(3567, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:39:10', '2020-03-28 19:39:10'),
(3568, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:43:35', '2020-03-28 19:43:35'),
(3569, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:44:02', '2020-03-28 19:44:02'),
(3570, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:45:24', '2020-03-28 19:45:24'),
(3571, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:46:28', '2020-03-28 19:46:28'),
(3572, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:47:19', '2020-03-28 19:47:19'),
(3573, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:48:04', '2020-03-28 19:48:04'),
(3574, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:48:23', '2020-03-28 19:48:23'),
(3575, NULL, 5, 'system_admin/company/2', 'GET', '127.0.0.1', '[]', '2020-03-28 19:49:12', '2020-03-28 19:49:12'),
(3576, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 19:49:14', '2020-03-28 19:49:14'),
(3577, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:40:26', '2020-03-28 20:40:26'),
(3578, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:44:42', '2020-03-28 20:44:42'),
(3579, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:45:39', '2020-03-28 20:45:39'),
(3580, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:45:48', '2020-03-28 20:45:48'),
(3581, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:47:32', '2020-03-28 20:47:32'),
(3582, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:48:24', '2020-03-28 20:48:24'),
(3583, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:48:31', '2020-03-28 20:48:31'),
(3584, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:50:12', '2020-03-28 20:50:12'),
(3585, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 20:54:49', '2020-03-28 20:54:49'),
(3586, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:04:38', '2020-03-28 21:04:38'),
(3587, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:05:46', '2020-03-28 21:05:46'),
(3588, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:08:10', '2020-03-28 21:08:10'),
(3589, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:09:02', '2020-03-28 21:09:02'),
(3590, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 21:10:11', '2020-03-28 21:10:11'),
(3591, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 21:10:15', '2020-03-28 21:10:15'),
(3592, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:10:20', '2020-03-28 21:10:20'),
(3593, NULL, 5, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"watermark\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-28 21:10:34', '2020-03-28 21:10:34'),
(3594, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:10:54', '2020-03-28 21:10:54'),
(3595, NULL, 5, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"watermark\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-28 21:11:06', '2020-03-28 21:11:06'),
(3596, NULL, 5, 'system_admin/config_global/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"logo\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-28 21:11:36', '2020-03-28 21:11:36'),
(3597, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 21:12:52', '2020-03-28 21:12:52'),
(3598, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-28 21:41:50', '2020-03-28 21:41:50'),
(3599, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 21:41:56', '2020-03-28 21:41:56'),
(3600, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:42:00', '2020-03-28 21:42:00'),
(3601, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 21:42:41', '2020-03-28 21:42:41'),
(3602, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 22:48:38', '2020-03-28 22:48:38'),
(3603, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-28 22:48:59', '2020-03-28 22:48:59'),
(3604, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:08:37', '2020-03-28 23:08:37'),
(3605, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"131151\",\"ar__keyword\":\"ddddsdfsdfsdfs\",\"ar__description\":\"test 8\",\"ar__content\":\"<p>test long test 2<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"category_id\":\"12\",\"company_id\":\"2\",\"stock\":\"75\",\"brand_id\":\"4\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\"}', '2020-03-28 23:09:07', '2020-03-28 23:09:07'),
(3606, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-28 23:09:08', '2020-03-28 23:09:08'),
(3607, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:09:10', '2020-03-28 23:09:10'),
(3608, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"131151\",\"ar__keyword\":\"ddddsdfsdfsdfs\",\"ar__description\":\"test 8\",\"ar__content\":\"<p>test long test 2<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"category_id\":\"12\",\"company_id\":\"2\",\"stock\":\"75\",\"brand_id\":\"4\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-28 23:09:21', '2020-03-28 23:09:21'),
(3609, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-28 23:09:22', '2020-03-28 23:09:22'),
(3610, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:09:29', '2020-03-28 23:09:29'),
(3611, NULL, 5, 'system_admin/shop_product/49', 'PUT', '127.0.0.1', '{\"sku\":\"BX-5UTbnv\",\"ar__name\":\"Easy Polo Black Edition 49\",\"price\":\"150008\",\"cost\":\"131151\",\"ar__keyword\":\"ddddsdfsdfsdfs\",\"ar__description\":\"test 8\",\"ar__content\":\"<p>test long test 2<img alt=\\\"\\\" src=\\\"\\/documents\\/photos\\/blogs\\/16d9_star_trek_tng_uniform_tee.jpeg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\",\"category_id\":\"12\",\"company_id\":\"3\",\"stock\":\"75\",\"brand_id\":\"4\",\"vendor_id\":\"2\",\"status\":\"on\",\"sort\":\"0\",\"type\":\"1\",\"date_available\":\"2019-03-29 19:00:00\",\"images\":{\"109\":{\"id\":\"109\",\"_remove_\":\"0\"},\"113\":{\"id\":\"113\",\"_remove_\":\"0\"}},\"group\":{\"1\":{\"name\":[\"Blue\",\"Red\"]},\"2\":{\"name\":[\"S\",\"M\"]}},\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/system_admin\\/shop_product\\/49\"}', '2020-03-28 23:12:52', '2020-03-28 23:12:52'),
(3612, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-28 23:12:52', '2020-03-28 23:12:52'),
(3613, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-28 23:15:40', '2020-03-28 23:15:40'),
(3614, NULL, 5, 'system_admin/shop_product/49', 'GET', '127.0.0.1', '[]', '2020-03-28 23:15:59', '2020-03-28 23:15:59'),
(3615, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:16:02', '2020-03-28 23:16:02'),
(3616, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:25:08', '2020-03-28 23:25:08'),
(3617, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:32:55', '2020-03-28 23:32:55'),
(3618, NULL, 5, 'system_admin/shop_product/49/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:48:18', '2020-03-28 23:48:18'),
(3619, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-28 23:52:06', '2020-03-28 23:52:06'),
(3620, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:57:21', '2020-03-28 23:57:21'),
(3621, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:58:30', '2020-03-28 23:58:30'),
(3622, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-28 23:59:20', '2020-03-28 23:59:20'),
(3623, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:00:15', '2020-03-29 00:00:15'),
(3624, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:00:57', '2020-03-29 00:00:57'),
(3625, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:15:58', '2020-03-29 00:15:58'),
(3626, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:30:06', '2020-03-29 00:30:06'),
(3627, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:30:09', '2020-03-29 00:30:09'),
(3628, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:30:26', '2020-03-29 00:30:26'),
(3629, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:30:38', '2020-03-29 00:30:38'),
(3630, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:31:00', '2020-03-29 00:31:00'),
(3631, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:35:42', '2020-03-29 00:35:42'),
(3632, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:36:50', '2020-03-29 00:36:50'),
(3633, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:38:20', '2020-03-29 00:38:20'),
(3634, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:38:26', '2020-03-29 00:38:26'),
(3635, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:39:06', '2020-03-29 00:39:06'),
(3636, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:41:44', '2020-03-29 00:41:44'),
(3637, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:41:50', '2020-03-29 00:41:50'),
(3638, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:43:02', '2020-03-29 00:43:02'),
(3639, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:43:04', '2020-03-29 00:43:04'),
(3640, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:43:06', '2020-03-29 00:43:06'),
(3641, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 00:45:11', '2020-03-29 00:45:11'),
(3642, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-29 00:45:15', '2020-03-29 00:45:15'),
(3643, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:45:19', '2020-03-29 00:45:19'),
(3644, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:47:47', '2020-03-29 00:47:47'),
(3645, NULL, 5, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 00:53:11', '2020-03-29 00:53:11'),
(3646, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '[]', '2020-03-29 01:19:18', '2020-03-29 01:19:18'),
(3647, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-29 01:19:27', '2020-03-29 01:19:27'),
(3648, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:19:30', '2020-03-29 01:19:30'),
(3649, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:20:35', '2020-03-29 01:20:35'),
(3650, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:20:38', '2020-03-29 01:20:38'),
(3651, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:24:41', '2020-03-29 01:24:41'),
(3652, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:26:48', '2020-03-29 01:26:48'),
(3653, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:27:32', '2020-03-29 01:27:32'),
(3654, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:31:37', '2020-03-29 01:31:37'),
(3655, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:32:22', '2020-03-29 01:32:22'),
(3656, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:34:38', '2020-03-29 01:34:38'),
(3657, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:35:18', '2020-03-29 01:35:18'),
(3658, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"on\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:39:47', '2020-03-29 01:39:47'),
(3659, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:39:57', '2020-03-29 01:39:57'),
(3660, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:40:03', '2020-03-29 01:40:03'),
(3661, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"on\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:40:10', '2020-03-29 01:40:10'),
(3662, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:44:20', '2020-03-29 01:44:20'),
(3663, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"on\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:44:25', '2020-03-29 01:44:25'),
(3664, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:45:44', '2020-03-29 01:45:44'),
(3665, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:51:22', '2020-03-29 01:51:22'),
(3666, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"on\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:51:27', '2020-03-29 01:51:27'),
(3667, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:51:39', '2020-03-29 01:51:39'),
(3668, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"off\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:51:42', '2020-03-29 01:51:42'),
(3669, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:51:45', '2020-03-29 01:51:45'),
(3670, NULL, 5, 'system_admin/activities/10', 'PUT', '127.0.0.1', '{\"active\":\"on\",\"_token\":\"XIyvUDwbAeqEdwoYyIrajXlr1mF1e4p6N9dSwaSL\",\"_method\":\"PUT\"}', '2020-03-29 01:51:54', '2020-03-29 01:51:54'),
(3671, NULL, 5, 'system_admin/activities/10/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 01:51:56', '2020-03-29 01:51:56'),
(3672, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 01:52:02', '2020-03-29 01:52:02'),
(3673, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-29 15:03:30', '2020-03-29 15:03:30'),
(3674, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-29 15:04:13', '2020-03-29 15:04:13'),
(3675, NULL, 5, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-29 15:04:39', '2020-03-29 15:04:39'),
(3676, NULL, 5, 'system_admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-29 15:04:59', '2020-03-29 15:04:59'),
(3677, NULL, 5, 'system_admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-03-29 15:05:13', '2020-03-29 15:05:13'),
(3678, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-29 16:43:20', '2020-03-29 16:43:20'),
(3679, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-29 17:57:52', '2020-03-29 17:57:52'),
(3680, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 17:57:56', '2020-03-29 17:57:56'),
(3681, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-29 17:57:59', '2020-03-29 17:57:59'),
(3682, NULL, 5, 'system_admin/company/3', 'PUT', '127.0.0.1', '{\"seller\":\"on\",\"_token\":\"V0VIc6Z4wlC2p3pcZge2syxgQ5fjxvAlJpX0iZJO\",\"_method\":\"PUT\"}', '2020-03-29 17:58:13', '2020-03-29 17:58:13'),
(3683, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-29 17:58:16', '2020-03-29 17:58:16'),
(3684, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-29 18:41:03', '2020-03-29 18:41:03'),
(3685, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-29 18:41:05', '2020-03-29 18:41:05'),
(3686, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-29 19:56:25', '2020-03-29 19:56:25'),
(3687, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-30 02:18:19', '2020-03-30 02:18:19'),
(3688, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-03-30 02:18:25', '2020-03-30 02:18:25'),
(3689, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-30 02:18:40', '2020-03-30 02:18:40'),
(3690, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:18:44', '2020-03-30 02:18:44'),
(3691, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:23:13', '2020-03-30 02:23:13'),
(3692, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:23:44', '2020-03-30 02:23:44'),
(3693, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:23:55', '2020-03-30 02:23:55'),
(3694, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:24:38', '2020-03-30 02:24:38'),
(3695, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:25:29', '2020-03-30 02:25:29'),
(3696, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:25:44', '2020-03-30 02:25:44'),
(3697, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:27:01', '2020-03-30 02:27:01'),
(3698, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:28:57', '2020-03-30 02:28:57'),
(3699, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:30:05', '2020-03-30 02:30:05'),
(3700, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:32:55', '2020-03-30 02:32:55'),
(3701, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:33:31', '2020-03-30 02:33:31'),
(3702, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:34:20', '2020-03-30 02:34:20'),
(3703, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 02:35:29', '2020-03-30 02:35:29'),
(3704, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-30 16:18:59', '2020-03-30 16:18:59'),
(3705, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 16:19:17', '2020-03-30 16:19:17'),
(3706, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 16:19:21', '2020-03-30 16:19:21'),
(3707, NULL, 5, 'system_admin/item_units/3/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 16:25:00', '2020-03-30 16:25:00'),
(3708, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-30 19:06:23', '2020-03-30 19:06:23'),
(3709, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-30 19:06:38', '2020-03-30 19:06:38'),
(3710, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 19:06:45', '2020-03-30 19:06:45'),
(3711, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 19:06:51', '2020-03-30 19:06:51'),
(3712, NULL, 5, 'system_admin/config_global', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 19:07:29', '2020-03-30 19:07:29'),
(3713, NULL, 5, 'system_admin/config_global/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-30 19:07:32', '2020-03-30 19:07:32'),
(3714, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 19:08:03', '2020-03-30 19:08:03'),
(3715, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:08:05', '2020-03-30 19:08:05'),
(3716, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:11:41', '2020-03-30 19:11:41'),
(3717, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 19:11:48', '2020-03-30 19:11:48'),
(3718, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:14:06', '2020-03-30 19:14:06'),
(3719, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:15:23', '2020-03-30 19:15:23'),
(3720, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:15:58', '2020-03-30 19:15:58'),
(3721, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:21:19', '2020-03-30 19:21:19'),
(3722, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:21:54', '2020-03-30 19:21:54'),
(3723, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:22:12', '2020-03-30 19:22:12'),
(3724, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 19:24:57', '2020-03-30 19:24:57'),
(3725, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-03-30 20:24:23', '2020-03-30 20:24:23'),
(3726, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-03-30 20:24:42', '2020-03-30 20:24:42'),
(3727, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 20:24:48', '2020-03-30 20:24:48'),
(3728, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 20:24:54', '2020-03-30 20:24:54'),
(3729, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2020-03-30 23:13:11', '2020-03-30 23:13:11'),
(3730, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2020-03-30 23:14:36', '2020-03-30 23:14:36'),
(3731, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:14:54', '2020-03-30 23:14:54'),
(3732, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 23:25:23', '2020-03-30 23:25:23'),
(3733, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:25:29', '2020-03-30 23:25:29'),
(3734, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:30:17', '2020-03-30 23:30:17'),
(3735, NULL, 5, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"0\",\"pk\":\"4\",\"_token\":\"NzJ20P7tcifUOH61q7INZA08cPn2YpYm6TxVnxtc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-30 23:30:41', '2020-03-30 23:30:41'),
(3736, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:30:45', '2020-03-30 23:30:45'),
(3737, NULL, 5, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"4\",\"_token\":\"NzJ20P7tcifUOH61q7INZA08cPn2YpYm6TxVnxtc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-30 23:30:51', '2020-03-30 23:30:51'),
(3738, NULL, 5, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"shipping_status\",\"value\":\"1\",\"pk\":\"4\",\"_token\":\"NzJ20P7tcifUOH61q7INZA08cPn2YpYm6TxVnxtc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-30 23:36:59', '2020-03-30 23:36:59'),
(3739, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:37:01', '2020-03-30 23:37:01'),
(3740, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"34\"}', '2020-03-30 23:38:17', '2020-03-30 23:38:17'),
(3741, NULL, 5, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"NzJ20P7tcifUOH61q7INZA08cPn2YpYm6TxVnxtc\",\"add_order\":\"4\",\"add_id\":\"34\",\"add_qty\":\"1\",\"add_price\":\"2007\"}', '2020-03-30 23:38:24', '2020-03-30 23:38:24'),
(3742, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:38:25', '2020-03-30 23:38:25'),
(3743, NULL, 5, 'system_admin/shop_order_edit/shop_order_update', 'PUT', '127.0.0.1', '{\"name\":\"comment\",\"value\":\"test\",\"pk\":\"4\",\"_token\":\"NzJ20P7tcifUOH61q7INZA08cPn2YpYm6TxVnxtc\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-03-30 23:38:34', '2020-03-30 23:38:34'),
(3744, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:39:02', '2020-03-30 23:39:02'),
(3745, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:39:04', '2020-03-30 23:39:04'),
(3746, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-30 23:39:30', '2020-03-30 23:39:30'),
(3747, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-30 23:39:44', '2020-03-30 23:39:44'),
(3748, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-30 23:39:48', '2020-03-30 23:39:48'),
(3749, NULL, 5, 'system_admin/get_info/userInfo', 'GET', '127.0.0.1', '{\"id\":\"5\"}', '2020-03-30 23:39:54', '2020-03-30 23:39:54'),
(3750, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 00:58:09', '2020-03-31 00:58:09'),
(3751, NULL, 5, 'system_admin/currencies', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 00:58:18', '2020-03-31 00:58:18'),
(3752, NULL, 5, 'system_admin/currencies/1/edit', 'GET', '127.0.0.1', '[]', '2020-03-31 00:58:29', '2020-03-31 00:58:29'),
(3753, NULL, 5, 'system_admin/currencies', 'GET', '127.0.0.1', '[]', '2020-03-31 03:05:24', '2020-03-31 03:05:24'),
(3754, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 03:05:43', '2020-03-31 03:05:43'),
(3755, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:09:28', '2020-03-31 03:09:28'),
(3756, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:28:19', '2020-03-31 03:28:19'),
(3757, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"22\"}', '2020-03-31 03:28:41', '2020-03-31 03:28:41'),
(3758, NULL, 5, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"VxZvPztMlAZXwcgxsIuDeSdtegnjOmhXaYGKlkdJ\",\"add_order\":\"5\",\"add_id\":\"22\",\"add_qty\":\"1\",\"add_price\":\"500000\"}', '2020-03-31 03:28:59', '2020-03-31 03:28:59'),
(3759, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:42:17', '2020-03-31 03:42:17'),
(3760, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"47\"}', '2020-03-31 03:42:23', '2020-03-31 03:42:23'),
(3761, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:42:33', '2020-03-31 03:42:33'),
(3762, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"48\"}', '2020-03-31 03:42:40', '2020-03-31 03:42:40'),
(3763, NULL, 5, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"VxZvPztMlAZXwcgxsIuDeSdtegnjOmhXaYGKlkdJ\",\"add_order\":\"5\",\"add_id\":\"48\",\"add_qty\":\"1\",\"add_price\":\"15000\",\"form_attr\":{\"1\":\"5\",\"2\":\"7\"}}', '2020-03-31 03:43:09', '2020-03-31 03:43:09'),
(3764, NULL, 5, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"VxZvPztMlAZXwcgxsIuDeSdtegnjOmhXaYGKlkdJ\",\"add_order\":\"5\",\"add_id\":\"48\",\"add_qty\":\"1\",\"add_price\":\"15000\",\"form_attr\":{\"1\":\"5\",\"2\":\"7\"}}', '2020-03-31 03:43:23', '2020-03-31 03:43:23'),
(3765, NULL, 5, 'system_admin/shop_order_edit/order_add_item', 'POST', '127.0.0.1', '{\"_token\":\"VxZvPztMlAZXwcgxsIuDeSdtegnjOmhXaYGKlkdJ\",\"add_order\":\"5\",\"add_id\":\"48\",\"add_qty\":\"1\",\"add_price\":\"15000\",\"form_attr\":{\"1\":\"5\",\"2\":\"7\"}}', '2020-03-31 03:43:36', '2020-03-31 03:43:36'),
(3766, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:45:05', '2020-03-31 03:45:05'),
(3767, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:46:49', '2020-03-31 03:46:49'),
(3768, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:47:45', '2020-03-31 03:47:45'),
(3769, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:47:55', '2020-03-31 03:47:55'),
(3770, NULL, 5, 'system_admin/shop_order_edit/5', 'GET', '127.0.0.1', '[]', '2020-03-31 03:48:59', '2020-03-31 03:48:59'),
(3771, NULL, 5, 'system_admin/shop_order_edit/6', 'GET', '127.0.0.1', '[]', '2020-03-31 03:59:09', '2020-03-31 03:59:09'),
(3772, NULL, 5, 'system_admin/config_info', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 03:59:48', '2020-03-31 03:59:48'),
(3773, NULL, 5, 'system_admin/config_template', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 03:59:58', '2020-03-31 03:59:58'),
(3774, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 04:00:02', '2020-03-31 04:00:02'),
(3775, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Cash\"}', '2020-03-31 04:00:15', '2020-03-31 04:00:15'),
(3776, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Cash\"}', '2020-03-31 04:00:21', '2020-03-31 04:00:21'),
(3777, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '[]', '2020-03-31 04:00:24', '2020-03-31 04:00:24'),
(3778, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Cash\"}', '2020-03-31 04:00:27', '2020-03-31 04:00:27'),
(3779, NULL, 5, 'system_admin/extensions/Payment', 'GET', '127.0.0.1', '{\"action\":\"config\",\"extensionKey\":\"Cash\"}', '2020-03-31 04:00:41', '2020-03-31 04:00:41'),
(3780, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 05:11:25', '2020-03-31 05:11:25'),
(3781, NULL, 5, 'system_admin/shop_order_edit/1', 'GET', '127.0.0.1', '[]', '2020-03-31 05:11:28', '2020-03-31 05:11:28'),
(3782, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 05:12:18', '2020-03-31 05:12:18'),
(3783, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-31 05:12:20', '2020-03-31 05:12:20'),
(3784, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-31 05:13:29', '2020-03-31 05:13:29'),
(3785, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-31 05:15:03', '2020-03-31 05:15:03'),
(3786, NULL, 5, 'system_admin/shop_order/create', 'GET', '127.0.0.1', '[]', '2020-03-31 05:15:45', '2020-03-31 05:15:45'),
(3787, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-31 05:26:20', '2020-03-31 05:26:20'),
(3788, NULL, 5, 'system_admin/shop_order_edit/6', 'GET', '127.0.0.1', '[]', '2020-03-31 05:26:24', '2020-03-31 05:26:24'),
(3789, NULL, 5, 'system_admin/shop_order_edit/4', 'GET', '127.0.0.1', '[]', '2020-03-31 05:26:56', '2020-03-31 05:26:56'),
(3790, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '[]', '2020-03-31 05:27:08', '2020-03-31 05:27:08'),
(3791, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 00:54:19', '2020-04-03 00:54:19'),
(3792, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:01:05', '2020-04-03 01:01:05'),
(3793, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:02:54', '2020-04-03 01:02:54'),
(3794, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:03:05', '2020-04-03 01:03:05'),
(3795, NULL, 5, 'system_admin/activities/10/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:03:09', '2020-04-03 01:03:09'),
(3796, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:11:03', '2020-04-03 01:11:03'),
(3797, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:11:09', '2020-04-03 01:11:09'),
(3798, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:11:12', '2020-04-03 01:11:12'),
(3799, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:12:32', '2020-04-03 01:12:32'),
(3800, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:12:40', '2020-04-03 01:12:40'),
(3801, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:12:48', '2020-04-03 01:12:48'),
(3802, NULL, 5, 'system_admin/activities/10/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:12:50', '2020-04-03 01:12:50'),
(3803, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:12:53', '2020-04-03 01:12:53'),
(3804, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:12:56', '2020-04-03 01:12:56'),
(3805, NULL, 5, 'system_admin/company/3/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:12:58', '2020-04-03 01:12:58'),
(3806, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:14:06', '2020-04-03 01:14:06'),
(3807, NULL, 5, 'system_admin/item_units/create', 'GET', '127.0.0.1', '[]', '2020-04-03 01:14:15', '2020-04-03 01:14:15'),
(3808, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:14:20', '2020-04-03 01:14:20'),
(3809, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"medium\",\"pk\":\"8\",\"_token\":\"vLlsIHNug76aoDJRieaV4nYLTAMikZuVaLV79KCB\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-04-03 01:16:00', '2020-04-03 01:16:00'),
(3810, NULL, 5, 'system_admin/updateUofm', 'PUT', '127.0.0.1', '{\"name\":\"code\",\"value\":\"large\",\"pk\":\"6\",\"_token\":\"vLlsIHNug76aoDJRieaV4nYLTAMikZuVaLV79KCB\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-04-03 01:16:07', '2020-04-03 01:16:07'),
(3811, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:19:21', '2020-04-03 01:19:21'),
(3812, NULL, 5, 'system_admin/activities/10/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:19:23', '2020-04-03 01:19:23'),
(3813, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:19:28', '2020-04-03 01:19:28'),
(3814, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:19:31', '2020-04-03 01:19:31'),
(3815, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:19:59', '2020-04-03 01:19:59'),
(3816, NULL, 5, 'system_admin/activities/10/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:20:08', '2020-04-03 01:20:08'),
(3817, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:20:17', '2020-04-03 01:20:17'),
(3818, NULL, 5, 'system_admin/activities/9/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:20:23', '2020-04-03 01:20:23'),
(3819, NULL, 5, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:20:29', '2020-04-03 01:20:29'),
(3820, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:20:30', '2020-04-03 01:20:30'),
(3821, NULL, 5, 'system_admin/company/2/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:20:36', '2020-04-03 01:20:36'),
(3822, NULL, 5, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:21:05', '2020-04-03 01:21:05'),
(3823, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:21:09', '2020-04-03 01:21:09'),
(3824, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:21:12', '2020-04-03 01:21:12'),
(3825, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:24:35', '2020-04-03 01:24:35'),
(3826, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:25:37', '2020-04-03 01:25:37'),
(3827, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:26:13', '2020-04-03 01:26:13'),
(3828, NULL, 5, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:27:34', '2020-04-03 01:27:34'),
(3829, NULL, 5, 'system_admin/shop_product/54/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:28:33', '2020-04-03 01:28:33'),
(3830, NULL, 5, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:30:31', '2020-04-03 01:30:31'),
(3831, NULL, 5, 'system_admin/shop_order_edit/6', 'GET', '127.0.0.1', '[]', '2020-04-03 01:30:33', '2020-04-03 01:30:33'),
(3832, NULL, 5, 'system_admin/get_info/productInfo', 'GET', '127.0.0.1', '{\"id\":\"47\"}', '2020-04-03 01:30:47', '2020-04-03 01:30:47'),
(3833, NULL, 5, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2020-04-03 01:30:52', '2020-04-03 01:30:52'),
(3834, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:31:04', '2020-04-03 01:31:04'),
(3835, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:31:15', '2020-04-03 01:31:15'),
(3836, NULL, 1, 'system_admin/shop_product', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:31:19', '2020-04-03 01:31:19'),
(3837, NULL, 1, 'system_admin/shop_product/50/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:31:25', '2020-04-03 01:31:25'),
(3838, NULL, 1, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:31:36', '2020-04-03 01:31:36'),
(3839, NULL, 1, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:31:37', '2020-04-03 01:31:37'),
(3840, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:31:55', '2020-04-03 01:31:55'),
(3841, NULL, 1, 'system_admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:32:47', '2020-04-03 01:32:47'),
(3842, NULL, 1, 'system_admin/company', 'GET', '127.0.0.1', '[]', '2020-04-03 01:33:06', '2020-04-03 01:33:06'),
(3843, NULL, 1, 'system_admin/activities', 'GET', '127.0.0.1', '[]', '2020-04-03 01:33:08', '2020-04-03 01:33:08'),
(3844, NULL, 1, 'system_admin/shop_order', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:33:12', '2020-04-03 01:33:12'),
(3845, NULL, 1, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2020-04-03 01:33:41', '2020-04-03 01:33:41'),
(3846, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:34:21', '2020-04-03 01:34:21'),
(3847, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:34:28', '2020-04-03 01:34:28'),
(3848, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:34:32', '2020-04-03 01:34:32'),
(3849, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:34:39', '2020-04-03 01:34:39'),
(3850, NULL, 5, 'system_admin/item_units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-03 01:34:44', '2020-04-03 01:34:44'),
(3851, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:34:49', '2020-04-03 01:34:49'),
(3852, NULL, 5, 'system_admin/item_units/4/edit', 'GET', '127.0.0.1', '[]', '2020-04-03 01:34:49', '2020-04-03 01:34:49'),
(3853, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:41:05', '2020-04-03 01:41:05'),
(3854, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:44:03', '2020-04-03 01:44:03'),
(3855, NULL, 5, 'system_admin', 'GET', '127.0.0.1', '[]', '2020-04-03 01:45:28', '2020-04-03 01:45:28'),
(3856, NULL, 5, 'system_admin/auth/logout', 'GET', '127.0.0.1', '[]', '2020-04-03 01:45:31', '2020-04-03 01:45:31');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `company_id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, NULL, 'All permission', '*', '', '*', NULL, '2018-07-26 07:29:38'),
(2, NULL, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, NULL, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, NULL, 'User setting', 'auth.setting', 'GET,PUT,DELETE', '/auth/setting', NULL, '2018-08-25 04:19:26'),
(5, NULL, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(10, NULL, 'View', 'view', 'GET', '*', '2018-09-23 11:56:03', '2019-02-09 10:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `company_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Administrator', 'administrator', '2018-01-12 10:27:40', '2018-01-12 10:27:40'),
(2, NULL, 'Admin', 'admin', '2018-01-12 11:02:33', '2018-01-12 11:02:33'),
(3, NULL, 'User', 'user', '2018-01-12 11:03:14', '2018-01-12 11:03:14'),
(4, NULL, 'Content', 'content', '2018-01-13 01:27:11', '2018-01-13 01:27:11'),
(5, 1, 'admin2', 'admin2', '2020-02-01 05:33:01', '2020-02-01 05:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(3, 3, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(3, 10, NULL, NULL),
(5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(3, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `superuser` int(11) NOT NULL DEFAULT 0,
  `seller_type` smallint(6) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(220) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `company_id`, `name`, `lname`, `avatar`, `superuser`, `seller_type`, `remember_token`, `api_token`, `email`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$XisO29cFPf1fJQp1toGt7uYSy7lQMGj67ceC/x6x0JJ9Wbn7KLL7e', 1, 'Administrator', NULL, NULL, 0, 1, 'Ol3ZqomrDiawz16wCs7jCVjJHJ5Chhe97yFDdq9p2kKZs4WZSBr97YtxVd3H', NULL, 'admin@adminco.com', '2018-01-12 10:27:40', '2019-03-31 01:59:05'),
(3, 'test', '$2y$10$Ao7Uey2z5jPFta/rZG51XuG1OZiWdlbdf3QSgsAjKn9Hfpcp14Ami', NULL, 'User', NULL, NULL, 0, 0, '5JS9Sgy0dX24uyOwFjR5w5rCgimd7B2Y1DLvxQgnZ2w0IJY7nNO9vqTg2AOl', NULL, NULL, '2018-01-12 11:05:28', '2018-09-23 11:56:26'),
(4, 'mahmoud', '$2y$10$ZIWhkat2JRBesEk4VrS.P.75KgmeIjvHiSi2orh5UEwRlnHcV/F9i', 2, 'mahmoud', NULL, NULL, 0, 1, NULL, NULL, 'mahmoud@mahmoudco.com', '2019-05-02 20:23:08', '2019-05-02 20:23:08'),
(5, 'superadmin', '$2y$10$XisO29cFPf1fJQp1toGt7uYSy7lQMGj67ceC/x6x0JJ9Wbn7KLL7e', 3, 'Administrator', NULL, NULL, 1, 1, 'vpbAEPHPW1oGxcIh6IcyiRPyNtx4WegaepiLP5QcYMK7HXsPoYz6xiYSyfJC', NULL, 'superadmin@admin.com', '2018-01-12 10:27:40', '2019-03-31 01:59:05'),
(6, 'mahmoud8_x', '$2y$10$jNg5VCm8CQwCN2qXsLtkdeeGhDzZklGcRDmPvZ1op9ffRS5t90zni', NULL, 'mahmoud8', 'x', NULL, 0, 0, 'X2Xjiqr4z5iez21AA26QIu4mydF2D9itexbEDWpGadlZa6TN3VqaDrchoSdU', NULL, 'test1@test1.com', '2020-02-21 14:37:50', '2020-02-21 14:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_user_permissions`
--

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `click` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `company_id`, `image`, `url`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
(8, NULL, 'banner/6122cfae7fdb5fff1a4e7406dcab10ef.jpg', NULL, '<h1>S-CART</h1>\r\n                  <h2>Free E-Commerce Template</h2>\r\n                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>\r\n                  <button type=\"button\" class=\"btn btn-default get\">Get it now</button>', 1, 0, 0, 1, '2018-08-02 09:23:32', '2018-09-20 15:24:53'),
(16, NULL, 'banner/7b16dd5b838439ddbe58c3ea506f5db1.jpg', NULL, '<h1>S-CART</h1>\r\n                  <h2>Free E-Commerce Template</h2>\r\n                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>\r\n                  <button type=\"button\" class=\"btn btn-default get\">Get it now</button>', 1, 0, 0, 1, '2018-08-21 08:09:08', '2018-09-20 15:24:43'),
(17, NULL, 'banner/36e662803f744d4f9df2cecc2e17b87b.jpg', NULL, '<h1>S-CART</h1>\r\n                  <h2>Free E-Commerce Template</h2>\r\n                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>\r\n                  <button type=\"button\" class=\"btn btn-default get\">Get it now</button>', 1, 0, 0, 0, '2018-09-03 09:51:56', '2018-09-20 15:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `seller` tinyint(1) NOT NULL DEFAULT 1,
  `iban` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `fax` varchar(250) DEFAULT NULL,
  `general_manger` varchar(250) DEFAULT NULL,
  `manager` int(250) DEFAULT NULL,
  `published_date` timestamp NULL DEFAULT NULL,
  `youtube_url` varchar(300) DEFAULT NULL,
  `longitude` varchar(250) DEFAULT NULL,
  `latitude` varchar(250) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `activity_id`, `seller`, `iban`, `active`, `fax`, `general_manger`, `manager`, `published_date`, `youtube_url`, `longitude`, `latitude`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'dorra', 4, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'books', '2020-02-28 16:59:33', '2020-03-07 14:04:01'),
(2, 'highcoder', 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'labtops', '2020-02-28 16:59:33', '2020-03-02 03:52:31'),
(3, 'master', 9, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 16:59:33', '2020-02-29 16:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `company_contact`
--

CREATE TABLE `company_contact` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `phone_contact` varchar(250) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `site` varchar(300) DEFAULT NULL,
  `fax` varchar(250) DEFAULT NULL,
  `general_manger` varchar(250) DEFAULT NULL,
  `manager` int(250) DEFAULT NULL,
  `published_date` timestamp NULL DEFAULT NULL,
  `youtube_url` varchar(300) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `about_us` varchar(300) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `latitude` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `company_contact`
--

INSERT INTO `company_contact` (`id`, `company_id`, `phone_contact`, `address`, `email`, `site`, `fax`, `general_manger`, `manager`, `published_date`, `youtube_url`, `image`, `about_us`, `longitude`, `latitude`) VALUES
(1, 1, '01142931228', 'almadii', 'ms_ms25490@yahoo.com', 'dorra.com', NULL, NULL, NULL, NULL, NULL, '', 'since 5 years we are the top on the market ', NULL, NULL),
(2, 1, '01142931228', 'almadii2', 'ms_ms25490@yahoo.com', 'facebook page', NULL, NULL, NULL, NULL, NULL, '', 'since 5 years we are the top on the market ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `detail` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `company_id`, `type`, `code`, `key`, `value`, `sort`, `detail`) VALUES
(10, NULL, NULL, 'config', 'shop_allow_guest', '1', 11, 'language.admin.shop_allow_guest'),
(11, NULL, NULL, 'smtp', 'smtp_host', NULL, 8, 'language.admin.smtp_host'),
(12, NULL, NULL, 'smtp', 'smtp_user', '', 7, 'language.admin.smtp_user'),
(13, NULL, NULL, 'smtp', 'smtp_password', '', 6, 'language.admin.smtp_password'),
(14, NULL, NULL, 'smtp', 'smtp_security', '', 5, 'language.admin.smtp_security'),
(15, NULL, NULL, 'smtp', 'smtp_port', '590', 4, 'language.admin.smtp_port'),
(16, NULL, NULL, 'smtp', 'smtp_mode', '0', 9, 'language.admin.smtp_mode'),
(18, NULL, NULL, 'config', 'product_preorder', '1', 18, 'language.admin.product_preorder'),
(19, NULL, NULL, 'config', 'product_display_out_of_stock', '1', 19, 'language.admin.product_display_out_of_stock'),
(20, NULL, NULL, 'config', 'product_buy_out_of_stock', '1', 20, 'language.admin.product_buy_out_of_stock'),
(22, NULL, NULL, 'config', 'show_date_available', '1', 21, 'language.admin.show_date_available'),
(26, NULL, NULL, 'display', 'product_hot', '6', 0, 'language.admin.hot_product'),
(27, NULL, NULL, 'display', 'product_new', '6', 0, 'language.admin.new_product'),
(28, NULL, NULL, 'display', 'product_list', '18', 0, 'language.admin.list_product'),
(29, NULL, NULL, 'display', 'product_relation', '4', 0, 'language.admin.relation_product'),
(30, NULL, NULL, 'config', 'site_ssl', '0', 0, 'language.admin.enable_https'),
(32, NULL, NULL, 'config', 'watermark', '1', 0, 'language.admin.enable_watermark'),
(44, NULL, NULL, 'config', 'site_status', '1', 100, 'language.admin.site_status'),
(45, NULL, NULL, 'display', 'product_viewed', '4', 0, 'language.admin.viewed_product'),
(47, NULL, 'Extensions', 'Payment', 'Cash', '1', 0, 'Extensions/Payment/Cash.title'),
(48, NULL, 'Extensions', 'Shipping', 'ShippingStandard', '1', 0, 'Shipping Standard'),
(55, NULL, 'Extensions', 'Total', 'Discount', '1', 0, 'Extensions/Total/Discount.title'),
(64, NULL, 'Modules', 'Other', 'LastViewProduct', '1', 0, 'Modules/Other/LastViewProduct.title'),
(65, NULL, NULL, 'display', 'item_list', '12', 0, 'language.admin.item_list'),
(66, NULL, NULL, 'config', 'show_product_of_category_children', '1', 21, 'language.admin.show_product_of_category_children'),
(67, NULL, 'Extensions', 'Shipping', 'ShippingBasic', '1', 0, 'Extensions/Shipping/ShippingBasic.title');

-- --------------------------------------------------------

--
-- Table structure for table `config_global`
--

CREATE TABLE `config_global` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `polices_and_condition` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_app` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `watermark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_active` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config_global`
--

INSERT INTO `config_global` (`id`, `company_id`, `polices_and_condition`, `about_app`, `logo`, `watermark`, `template`, `phone`, `long_phone`, `email`, `time_active`, `address`, `locale`, `currency`) VALUES
(1, 1, 'polices and condition test', NULL, 'images/highcoder.png', 'images/watermark.png', 'default', '0123456789', 'Support: 0987654321', 'admin@admin.com', NULL, '123st - abc - xyz', 'ar', 'EGP');

-- --------------------------------------------------------

--
-- Table structure for table `config_global_description`
--

CREATE TABLE `config_global_description` (
  `config_id` int(11) NOT NULL,
  `lang_id` tinyint(4) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_global_description`
--

INSERT INTO `config_global_description` (`config_id`, `lang_id`, `title`, `description`, `keyword`) VALUES
(1, 1, 'souqVIS', 'easy to sell and buy', NULL),
(1, 2, 'souqVIS', 'easy to sell', NULL),
(1, 3, 'Souq', NULL, 'ar');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` bigint(20) NOT NULL,
  `coupon_name` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `code` varchar(300) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `used_time` int(11) NOT NULL DEFAULT 0,
  `type` enum('RATE','VALUE','','') NOT NULL,
  `Value` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direction` enum('RTL','LTR') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LTR',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `company_id`, `name`, `code`, `direction`, `icon`, `status`, `sort`) VALUES
(1, 1, 'arabic', 'ar', 'RTL', 'language/QA.PNG', 1, 2),
(2, 1, 'English', 'en', 'LTR', 'language/flag_uk.png', 1, 1),
(3, NULL, 'Tiếng Việt', 'vi', 'LTR', 'language/flag_vn.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

CREATE TABLE `layout` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout`
--

INSERT INTO `layout` (`id`, `company_id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`) VALUES
(1, NULL, 'Facebook code', 'top', '', 'html', '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \'//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=934208239994473\';\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));\r\n</script>', 1, 0),
(2, NULL, 'Google Analytics', 'header', '', 'html', '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-128658138-1\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'UA-128658138-1\');\r\n</script>', 1, 0),
(4, NULL, 'Product last view', 'left', '', 'module', '\\App\\Modules\\Other\\Controllers\\LastViewProduct', 1, 0),
(5, NULL, 'Product special', 'left', 'home,product_list', 'view', 'product_special', 1, 1),
(6, NULL, 'Brands', 'left', 'home,item_list', 'view', 'brands_left', 1, 3),
(7, NULL, 'Banner home', 'banner_top', 'home', 'view', 'banner_image', 1, 0),
(8, NULL, 'Categories', 'left', 'home,product_list,product_detail,shop_wishlist', 'view', 'categories', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `layout_page`
--

CREATE TABLE `layout_page` (
  `id` int(11) NOT NULL,
  `uniquekey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout_page`
--

INSERT INTO `layout_page` (`id`, `uniquekey`, `name`) VALUES
(1, 'home', 'Home page'),
(2, 'product_list', 'Product list'),
(3, 'product_detail', 'Product detail'),
(4, 'shop_cart', 'Shop cart'),
(5, 'shop_account', 'Account'),
(6, 'shop_profile', 'Profile'),
(7, 'shop_compare', 'Compare page'),
(8, 'shop_wishlist', 'Wishlist page'),
(9, 'item_list', 'Item list');

-- --------------------------------------------------------

--
-- Table structure for table `layout_position`
--

CREATE TABLE `layout_position` (
  `id` int(11) NOT NULL,
  `uniquekey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout_position`
--

INSERT INTO `layout_position` (`id`, `uniquekey`, `name`) VALUES
(1, 'meta', 'Meta'),
(2, 'header', 'Header'),
(3, 'top', 'Top'),
(4, 'bottom', 'Bottom'),
(5, 'footer', 'Footer'),
(6, 'left', 'Column left'),
(7, 'right', 'Column right'),
(8, 'banner_top', 'Banner top');

-- --------------------------------------------------------

--
-- Table structure for table `layout_type`
--

CREATE TABLE `layout_type` (
  `id` int(11) NOT NULL,
  `uniquekey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layout_type`
--

INSERT INTO `layout_type` (`id`, `uniquekey`, `name`) VALUES
(1, 'html', 'Html'),
(2, 'view', 'View'),
(4, 'module', 'Module');

-- --------------------------------------------------------

--
-- Table structure for table `layout_url`
--

CREATE TABLE `layout_url` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `target` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `sort` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layout_url`
--

INSERT INTO `layout_url` (`id`, `company_id`, `name`, `url`, `target`, `group`, `module`, `status`, `sort`) VALUES
(1, 1, 'language.contact', '/contact.html', '_self', 'menu', NULL, 1, 3),
(2, NULL, 'language.about', '/about.html', '_self', 'menu', NULL, 0, 5),
(3, NULL, 'Latest Discount', '/home', '_blank', 'menu', NULL, 1, 0),
(4, NULL, 'language.my_profile', '/member/login.html', '_self', 'footer', NULL, 1, 4),
(5, NULL, 'language.compare_page', '/compare.html', '_self', 'footer', NULL, 1, 4),
(6, NULL, 'language.wishlist_page', '/wishlist.html', '_self', 'footer', NULL, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_list`
--

CREATE TABLE `product_price_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) NOT NULL,
  `customer_group` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `uof_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `product_price_list`
--

INSERT INTO `product_price_list` (`id`, `product_id`, `customer_group`, `price`, `uof_id`, `company_id`, `created_at`, `updated_at`) VALUES
(4, 54, NULL, '258.00', 2, 2, '2020-03-19 23:20:36', '2020-03-19 23:20:36'),
(5, 54, NULL, '258.00', 5, 2, '2020-03-19 23:20:36', '2020-03-19 23:20:36'),
(7, 49, NULL, '150008.00', 1, 3, '2020-03-21 21:41:47', '2020-03-21 21:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_standard`
--

CREATE TABLE `shipping_standard` (
  `id` int(10) UNSIGNED NOT NULL,
  `fee` int(11) NOT NULL,
  `shipping_free` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_standard`
--

INSERT INTO `shipping_standard` (`id`, `fee`, `shipping_free`) VALUES
(1, 20000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `shop_api`
--

CREATE TABLE `shop_api` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hidden_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'private - secret - public'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_api`
--

INSERT INTO `shop_api` (`id`, `company_id`, `name`, `hidden_default`, `type`) VALUES
(1, 1, 'api_product_list', NULL, 'secret'),
(2, 1, 'api_product_detail', 'cost,sold,stock,sort', 'private'),
(3, 1, 'api_order_list', '', 'public'),
(4, 1, 'api_order_detail', '', 'secret');

-- --------------------------------------------------------

--
-- Table structure for table `shop_api_process`
--

CREATE TABLE `shop_api_process` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL DEFAULT 0,
  `secret_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden_fileds` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_allow` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_deny` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exp` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_api_process`
--

INSERT INTO `shop_api_process` (`id`, `api_id`, `secret_key`, `hidden_fileds`, `ip_allow`, `ip_deny`, `created_at`, `updated_at`, `exp`, `status`) VALUES
(1, 1, '!CVCBsd$6j9ds3%flh[^d', 'descriptions,cost', '', '127.0.0.11,1233.2.2.3', '2018-12-16 07:13:16', '2018-12-16 07:17:33', '2019-12-14 09:20:33', 1),
(4, 1, '%GSFf13gkLtP@d', 'descriptions,brand_id', NULL, NULL, '2018-12-16 07:13:16', '2018-12-16 07:13:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute_detail`
--

CREATE TABLE `shop_attribute_detail` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `attribute_id` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_attribute_detail`
--

INSERT INTO `shop_attribute_detail` (`id`, `name`, `attribute_id`, `product_id`, `sort`) VALUES
(5, 'Blue', 1, 48, 0),
(6, 'White', 1, 48, 0),
(7, 'S', 2, 48, 0),
(8, 'XL', 2, 48, 0),
(9, 'Blue', 1, 49, 0),
(10, 'Red', 1, 49, 0),
(11, 'S', 2, 49, 0),
(12, 'M', 2, 49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute_group`
--

CREATE TABLE `shop_attribute_group` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_attribute_group`
--

INSERT INTO `shop_attribute_group` (`id`, `company_id`, `name`, `status`, `sort`, `type`) VALUES
(1, NULL, 'Color', 1, 1, 'radio'),
(2, NULL, 'Size', 1, 2, 'select'),
(3, 1, 'دهبي', 1, 1, 'radio'),
(4, 1, 'color', 1, 0, 'select');

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute_values`
--

CREATE TABLE `shop_attribute_values` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value` varchar(250) NOT NULL,
  `value_type` enum('Number','Price','String','') NOT NULL DEFAULT 'String',
  `compnay_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `shop_brand`
--

CREATE TABLE `shop_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_brand`
--

INSERT INTO `shop_brand` (`id`, `company_id`, `name`, `image`, `url`, `status`, `sort`) VALUES
(1, NULL, 'Husq', 'brand/1ca28f797c0f2edb635c4b51c2e7e952.png', NULL, 1, 0),
(2, NULL, 'Ideal', 'brand/0a778de7e1e2f2a0635d6a1727e3de8d.png', NULL, 1, 0),
(3, 1, 'Apex', 'brand/d3abfcfc8c0fef7e1356fc637ab9d8d8.png', NULL, 1, 0),
(4, NULL, 'CST', 'brand/185c50c85b83644e02e8b96639370341.png', NULL, 1, 0),
(5, NULL, 'Klein', 'brand/3e11cc022e9f30774ab5f6a0c6c36451.png', NULL, 1, 0),
(6, NULL, 'Metabo', 'brand/7868b0924b8f115aef70292aea1a67b8.png', NULL, 1, 0),
(7, NULL, 'brand2', 'brand/581c2e179c2450590779127d51c358b4.png', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `top` int(11) DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_category`
--

INSERT INTO `shop_category` (`id`, `company_id`, `image`, `parent`, `top`, `sort`, `status`) VALUES
(1, 1, NULL, 0, 1, 0, 1),
(2, NULL, '', 0, 1, 0, 1),
(3, NULL, '', 0, 1, 0, 1),
(4, NULL, '', 0, 1, 0, 1),
(5, NULL, '', 0, 1, 0, 1),
(6, NULL, '', 9, 0, 0, 1),
(7, NULL, '', 4, 0, 0, 1),
(8, NULL, '', 4, 0, 0, 1),
(9, NULL, '', 0, 1, 0, 1),
(10, NULL, '', 2, 0, 0, 1),
(11, NULL, '', 1, 0, 0, 1),
(12, NULL, '', 1, 0, 3, 1),
(13, NULL, '', 9, 0, 2, 1),
(14, NULL, '', 4, 0, 0, 1),
(15, NULL, '', 5, 0, 0, 1),
(16, NULL, '', 2, 0, 0, 1),
(17, NULL, '', 3, 0, 0, 1),
(18, NULL, '', 3, 0, 0, 1),
(19, 1, 'category/a08b2175a89edfb4ed2147a633351c58.PNG', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category_description`
--

CREATE TABLE `shop_category_description` (
  `shop_category_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `lang_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_category_description`
--

INSERT INTO `shop_category_description` (`shop_category_id`, `company_id`, `lang_id`, `name`, `keyword`, `description`) VALUES
(1, NULL, 1, 'SPORTSWEAR', NULL, NULL),
(1, NULL, 2, 'Danh mục SPORTSWEAR', NULL, NULL),
(2, NULL, 1, 'MENS', NULL, NULL),
(2, NULL, 2, 'Danh mục MENS', NULL, NULL),
(3, NULL, 1, 'WOMENS', NULL, NULL),
(3, NULL, 2, 'Danh mục WOMENS', NULL, NULL),
(4, NULL, 1, 'KIDS', NULL, NULL),
(4, NULL, 2, 'Danh mục KIDS', NULL, NULL),
(5, NULL, 1, 'FASHION', NULL, NULL),
(5, NULL, 2, 'Danh mục FASHION', NULL, NULL),
(6, NULL, 1, 'GUESS', NULL, NULL),
(6, NULL, 2, 'Danh mục GUESS', NULL, NULL),
(7, NULL, 1, 'PUMA', NULL, NULL),
(7, NULL, 2, 'Danh mục PUMA', NULL, NULL),
(8, NULL, 1, 'ASICS', NULL, NULL),
(8, NULL, 2, 'Danh mục ASICS', NULL, NULL),
(9, NULL, 1, 'HOUSEHOLDS', NULL, NULL),
(9, NULL, 2, 'Danh mục HOUSEHOLDS', NULL, NULL),
(10, NULL, 1, 'VALENTINO', NULL, NULL),
(10, NULL, 2, 'Danh mục VALENTINO', NULL, NULL),
(11, NULL, 1, 'DIOR', NULL, NULL),
(11, NULL, 2, 'Danh mục DIOR', NULL, NULL),
(12, NULL, 1, 'VALENTINO', NULL, NULL),
(12, NULL, 2, 'Danh mục VALENTINO', NULL, NULL),
(13, NULL, 1, 'DIOR', NULL, NULL),
(13, NULL, 2, 'Danh mục DIOR', NULL, NULL),
(14, NULL, 1, 'FENDI', NULL, NULL),
(14, NULL, 2, 'Danh mục FENDI', NULL, NULL),
(15, NULL, 1, 'FENDI', NULL, NULL),
(15, NULL, 2, 'Danh mục  FENDI', NULL, NULL),
(16, NULL, 1, 'NIKE', NULL, NULL),
(16, NULL, 2, 'Danh mục NIKE', NULL, NULL),
(17, NULL, 1, 'UNDER ARMOUR', NULL, NULL),
(17, NULL, 2, 'Danh mục UNDER ARMOUR', NULL, NULL),
(18, NULL, 1, 'ADIDAS', NULL, NULL),
(18, NULL, 2, 'Danh mục ADIDAS', NULL, NULL),
(19, NULL, 1, 'cat1', 'cat1 keyword', 'cat1 description');

-- --------------------------------------------------------

--
-- Table structure for table `shop_currency`
--

CREATE TABLE `shop_currency` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_default` tinyint(1) NOT NULL DEFAULT 0,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` float NOT NULL,
  `precision` tinyint(1) NOT NULL DEFAULT 2,
  `symbol_first` tinyint(4) NOT NULL DEFAULT 0,
  `thousands` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT ',',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_currency`
--

INSERT INTO `shop_currency` (`id`, `name`, `company_id`, `order_default`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES
(1, 'EGP pound', 1, 0, 'EGP', 'P', 1, 0, 1, ',', 1, 0),
(2, 'VietNam Dong', NULL, 0, 'VND', '₫', 20, 0, 0, ',', 1, 1),
(3, 'Dinar', 1, 1, 'KD', 'KD', 1, 2, 0, ',', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_discount`
--

CREATE TABLE `shop_discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `reward` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_uses` int(11) NOT NULL DEFAULT 1,
  `used` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `login` int(11) NOT NULL DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_discount`
--

INSERT INTO `shop_discount` (`id`, `code`, `company_id`, `reward`, `type`, `data`, `number_uses`, `used`, `status`, `login`, `expires_at`) VALUES
(1, 'TEST', NULL, 10, 0, NULL, 10, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_discount_user`
--

CREATE TABLE `shop_discount_user` (
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `subtotal` int(11) DEFAULT 0,
  `shipping` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-not send 1-pp send 2-sent',
  `shipping_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-notship 1-sending 2-pp send 3-shipped',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-new 1-processing 2-hold 3-cancel 4-Completed',
  `tax` tinyint(4) DEFAULT 0 COMMENT '%',
  `total` int(11) DEFAULT 0,
  `currency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `received` int(11) DEFAULT 0,
  `balance` int(11) DEFAULT 0,
  `toname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` int(3) DEFAULT NULL,
  `phone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order`
--

INSERT INTO `shop_order` (`id`, `company_id`, `user_id`, `subtotal`, `shipping`, `discount`, `payment_status`, `shipping_status`, `status`, `tax`, `total`, `currency`, `exchange_rate`, `received`, `balance`, `toname`, `address1`, `address2`, `country`, `phone`, `email`, `comment`, `payment_method`, `transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 400000, 0, 0, 0, 1, 1, 0, 400000, 'USD', 1, 0, 400000, 'mahmod', 'caru egt', 'j', NULL, '01142931228', 'ms_ms25490@yahoo.com', NULL, 'Cash', NULL, '2019-04-17 04:15:47', '2019-05-09 02:17:09'),
(3, 2, 0, 5210000, 0, 0, 0, 0, 1, 0, 5210000, 'USD', 1, 0, 5210000, 'max', 'caru egt', 'address2', NULL, '01142931228', 'ms_ms20@yahoo.com', NULL, 'Cash', NULL, '2019-04-20 02:53:58', '2019-05-20 03:22:14'),
(4, 1, 1, 2207, 0, 0, 0, 1, 1, 0, 2207, 'EGP', 1, 0, 2207, 'mahmoud', 'caru egt', NULL, NULL, '1142931228_', 'ms_ms25490@yahoo.com', 'test', NULL, NULL, '2019-05-08 01:43:09', '2020-03-30 23:38:34'),
(6, 1, 2, 800, 0, 0, 0, 0, 0, 0, 800, 'Dinar', 1, 0, 800, 'Administrator', 'asyuit1', NULL, NULL, '0165331143', 'superadmin@admin.com', NULL, NULL, NULL, '2020-03-31 03:44:43', '2020-04-02 05:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_detail`
--

CREATE TABLE `shop_order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT 0 COMMENT 'Price: price of product or type',
  `qty` int(11) DEFAULT 0,
  `total_price` int(11) DEFAULT 0,
  `sku` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `currency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_detail`
--

INSERT INTO `shop_order_detail` (`id`, `company_id`, `order_id`, `product_id`, `name`, `price`, `qty`, `total_price`, `sku`, `type`, `currency`, `exchange_rate`, `attribute`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 3, 'Easy Polo Black Edition 3', 200000, 2, 400000, 'MEGA2560', NULL, NULL, NULL, NULL, '2019-04-17 04:15:47', NULL),
(2, NULL, 3, 11, 'Easy Polo Black Edition 11', 4990000, 1, 4990000, 'ANYCUBIC-P', NULL, NULL, NULL, NULL, '2019-04-20 02:53:58', NULL),
(3, NULL, 4, 50, 'prod1', 200, 1, 200, 'prod1', NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 3, 3, '', 220000, 1, 220000, 'MEGA2560', NULL, NULL, NULL, 'xc', NULL, '2019-05-20 03:22:32'),
(5, NULL, 4, 34, 'Easy Polo Black Edition 34', 2007, 1, 2007, '3D-TEFTLON-W24', NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 5, 22, 'Easy Polo Black Edition 22', 500000, 1, 500000, '3D-GOLD1.75', NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, 5, 48, 'Easy Polo Black Edition 48', 15000, 1, 15000, 'BX-5UT', NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 5, 48, 'Easy Polo Black Edition 48', 15000, 1, 15000, 'BX-5UT', NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 5, 48, 'Easy Polo Black Edition 48', 15000, 1, 15000, 'BX-5UT', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, 6, 50, 'prod1', 20, 10, 200, 'prod1', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, 6, 50, 'prod1', 20, 10, 200, 'prod1', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, 6, 50, 'prod1', 20, 10, 200, 'prod1', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 6, 50, 'prod1', 20, 10, 200, 'prod1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_history`
--

CREATE TABLE `shop_order_history` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `add_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_history`
--

INSERT INTO `shop_order_history` (`id`, `company_id`, `order_id`, `content`, `admin_id`, `user_id`, `add_date`) VALUES
(1, NULL, 1, 'New order', 0, 0, '2019-04-17 04:15:47'),
(2, NULL, 3, 'New order', 0, 0, '2019-04-20 02:53:58'),
(3, NULL, 3, 'Change <b>status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, '2019-04-26 01:51:31'),
(4, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'6\'</span> to <span style=\"color:red\">\'7\'</span>', 1, 0, '2019-05-08 02:21:25'),
(5, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'7\'</span> to <span style=\"color:red\">\'2\'</span>', 1, 0, '2019-05-08 02:22:45'),
(6, NULL, 4, 'Add product prod1', 1, 0, '2019-05-08 02:47:00'),
(7, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'6\'</span>', 1, 0, '2019-05-09 01:58:14'),
(8, NULL, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, '2019-05-09 01:58:47'),
(9, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'6\'</span> to <span style=\"color:red\">\'7\'</span>', 1, 0, '2019-05-09 01:59:16'),
(10, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'7\'</span> to <span style=\"color:red\">\'9\'</span>', 1, 0, '2019-05-09 02:00:07'),
(11, NULL, 1, 'Change <b>shipping_status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, '2019-05-09 02:17:09'),
(12, NULL, 3, 'Add product ', 1, 0, '2019-05-20 03:22:14'),
(13, NULL, 3, 'Edit product #4: Data {\"qty\":\"1\",\"price\":\"220000\",\"name\":\"\",\"total_price\":220000,\"attribute\":\"xc\"}', 1, 0, '2019-05-20 03:22:32'),
(14, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'0\'</span>', 5, 0, '2020-03-30 23:30:41'),
(15, NULL, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 5, 0, '2020-03-30 23:30:51'),
(16, NULL, 4, 'Change <b>shipping_status</b> from <span style=\"color:blue\">\'0\'</span> to <span style=\"color:red\">\'1\'</span>', 5, 0, '2020-03-30 23:36:59'),
(17, NULL, 4, 'Add product Easy Polo Black Edition 34', 5, 0, '2020-03-30 23:38:24'),
(18, NULL, 4, 'Change <b>comment</b> from <span style=\"color:blue\">\'\'</span> to <span style=\"color:red\">\'test\'</span>', 5, 0, '2020-03-30 23:38:34'),
(19, NULL, 5, 'Add product Easy Polo Black Edition 22', 5, 0, '2020-03-31 03:28:59'),
(20, NULL, 5, 'Add product Easy Polo Black Edition 48', 5, 0, '2020-03-31 03:43:09'),
(21, NULL, 5, 'Add product Easy Polo Black Edition 48', 5, 0, '2020-03-31 03:43:23'),
(22, NULL, 5, 'Add product Easy Polo Black Edition 48', 5, 0, '2020-03-31 03:43:36'),
(23, 1, 6, 'Add product prod1', 5, 0, '2020-03-31 05:26:04'),
(24, NULL, 6, 'Edit product #50: Data {\"qty\":\"5\",\"price\":\"7\",\"name\":\"\",\"total_price\":35,\"attribute\":null}', 5, 0, '2020-03-31 17:30:24'),
(25, NULL, 6, 'Edit product #50: Data {\"qty\":\"5\",\"price\":\"7\",\"name\":\"\",\"total_price\":35,\"attribute\":null}', 5, 0, '2020-03-31 18:04:56'),
(26, NULL, 6, 'Edit product #50: Data {\"qty\":\"5\",\"price\":\"7\",\"name\":\"\",\"total_price\":35,\"attribute\":null}', 5, 0, '2020-04-01 04:21:30'),
(27, NULL, 6, 'Edit product #50: Data {\"qty\":\"7\",\"price\":\"7\",\"total_price\":49,\"attribute\":null}', 5, 0, '2020-04-01 05:01:03'),
(28, NULL, 6, 'Remove item pID#0', 5, 0, '2020-04-01 05:17:00'),
(29, 1, 6, 'Add product prod1', 5, 0, '2020-04-02 05:35:12'),
(30, 1, 6, 'Add product prod1', 5, 0, '2020-04-02 05:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_status`
--

CREATE TABLE `shop_order_status` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_status`
--

INSERT INTO `shop_order_status` (`id`, `company_id`, `name`) VALUES
(0, 1, 'New'),
(1, 1, 'Processing'),
(2, 1, 'Hold'),
(3, 1, 'Canceled'),
(4, 1, 'Done'),
(5, 1, 'Failed');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_total`
--

CREATE TABLE `shop_order_total` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) NOT NULL,
  `text` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_order_total`
--

INSERT INTO `shop_order_total` (`id`, `company_id`, `order_id`, `title`, `code`, `value`, `text`, `sort`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Sub Total', 'subtotal', 400000, '$400,000', 1, '2019-04-17 04:15:47', NULL),
(2, 0, 1, 'Shipping Standard', 'shipping', 0, '$0', 10, '2019-04-17 04:15:47', NULL),
(3, 0, 1, 'Discount', 'discount', 0, '$0', 20, '2019-04-17 04:15:47', NULL),
(4, 0, 1, 'Total', 'total', 400000, '$400,000', 100, '2019-04-17 04:15:47', NULL),
(5, 0, 1, 'Received', 'received', 0, '$0', 200, '2019-04-17 04:15:47', NULL),
(6, NULL, 3, 'Sub Total', 'subtotal', 5210000, '4,990,000', 1, '2019-04-20 02:53:58', '2019-05-20 03:22:15'),
(7, NULL, 3, 'Shipping Standard', 'shipping', 0, '0', 10, '2019-04-20 02:53:58', NULL),
(8, NULL, 3, 'Discount', 'discount', 0, '0', 20, '2019-04-20 02:53:58', NULL),
(9, NULL, 3, 'Total', 'total', 5210000, '4,990,000', 100, '2019-04-20 02:53:58', '2019-05-20 03:22:15'),
(10, NULL, 3, 'Received', 'received', 0, '0', 200, '2019-04-20 02:53:58', NULL),
(11, NULL, 4, 'Subtotal', 'subtotal', 2207, NULL, 1, NULL, '2020-03-30 23:38:24'),
(12, NULL, 4, 'Shipping', 'shipping', 0, NULL, 10, NULL, NULL),
(13, NULL, 4, 'Discount', 'discount', 0, NULL, 20, NULL, NULL),
(14, NULL, 4, 'Total', 'total', 2207, NULL, 100, NULL, '2020-03-30 23:38:24'),
(15, NULL, 4, 'Received', 'received', 0, NULL, 200, NULL, NULL),
(16, NULL, 6, 'Subtotal', 'subtotal', 800, NULL, 1, NULL, '2020-04-02 05:44:40'),
(17, NULL, 6, 'Shipping', 'shipping', 0, NULL, 10, NULL, NULL),
(18, NULL, 6, 'Discount', 'discount', 0, NULL, 20, NULL, NULL),
(19, NULL, 6, 'Total', 'total', 800, NULL, 100, NULL, '2020-04-02 05:44:40'),
(20, NULL, 6, 'Received', 'received', 0, NULL, 200, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_page`
--

CREATE TABLE `shop_page` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniquekey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_page`
--

INSERT INTO `shop_page` (`id`, `company_id`, `image`, `uniquekey`, `status`) VALUES
(1, NULL, '', 'about', 1),
(2, NULL, NULL, 'contact', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_page_description`
--

CREATE TABLE `shop_page_description` (
  `page_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_page_description`
--

INSERT INTO `shop_page_description` (`page_id`, `lang_id`, `title`, `keyword`, `description`, `content`) VALUES
(1, 1, 'About', NULL, NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(1, 2, 'Giới thiệu', NULL, NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(2, 1, 'Contact', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(2, 2, 'Liên hệ với chúng tôi', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

-- --------------------------------------------------------

--
-- Table structure for table `shop_payment_status`
--

CREATE TABLE `shop_payment_status` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_payment_status`
--

INSERT INTO `shop_payment_status` (`id`, `company_id`, `name`) VALUES
(0, 1, 'Unpaid'),
(1, 1, 'Partial payment'),
(2, 1, 'Paid'),
(3, 1, 'Refurn');

-- --------------------------------------------------------

--
-- Table structure for table `shop_preferred_product`
--

CREATE TABLE `shop_preferred_product` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_preferred_product`
--

INSERT INTO `shop_preferred_product` (`id`, `product_id`, `company_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 50, 1, 5, '2020-03-29 22:22:40', '2020-03-30 04:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sku` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT 0,
  `vendor_id` int(10) UNSIGNED DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_other` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `cost` int(11) DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `path` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-Nomal 1-New 2-Hot',
  `option` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0- inactive 1-active ',
  `view` int(11) DEFAULT 0,
  `date_lastview` timestamp NULL DEFAULT NULL,
  `date_available` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`id`, `company_id`, `sku`, `image`, `brand_id`, `vendor_id`, `category_id`, `category_other`, `price`, `cost`, `stock`, `path`, `sold`, `type`, `option`, `sort`, `status`, `view`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
(3, 1, 'MEGA2560', 'product/f2d9505d28f1b10f949cec466cada01e.jpeg', 1, 1, 7, NULL, '220000.00', 150000, 98, NULL, 2, 0, NULL, 0, 1, 152, '2020-02-26 02:16:20', NULL, '2018-01-15 07:57:31', '2020-02-26 02:16:20'),
(4, 3, 'LEDFAN1', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 6, NULL, '190000.00', 100000, 99, NULL, 1, 1, NULL, 0, 1, 123, '2020-01-26 03:18:52', NULL, '2018-01-16 06:03:54', '2020-01-26 03:18:52'),
(5, NULL, 'CLOCKFAN1', 'product/15aa6b1f31b53a0177d7653761a45274.jpeg', 1, 1, 13, NULL, '420000.00', 320000, 100, NULL, 0, 1, NULL, 0, 1, 141, '2020-01-26 03:45:47', NULL, '2018-01-16 06:04:41', '2020-01-26 03:45:47'),
(6, NULL, 'CLOCKFAN2', 'product/0e1416d509af3712bd801404ca928702.jpeg', 1, 1, 13, NULL, '380000.00', 250000, 97, NULL, 3, 1, NULL, 0, 1, 183, '2020-03-13 18:32:48', NULL, '2018-02-02 07:52:50', '2020-03-13 18:32:48'),
(7, NULL, 'CLOCKFAN3', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 13, NULL, '320000.00', 250000, 99, NULL, 1, 1, NULL, 1, 1, 136, '2019-03-30 20:01:30', NULL, '2018-02-02 07:53:30', '2019-03-30 20:01:30'),
(8, NULL, 'TMC2208', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 11, NULL, '220000.00', 130000, 100, NULL, 0, 0, NULL, 1, 1, 161, '2019-03-29 20:59:27', NULL, '2018-02-02 07:53:30', '2019-03-29 20:59:27'),
(9, NULL, 'FILAMENT', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 1, 1, 15, NULL, '299000.00', 200000, 99, NULL, 1, 1, NULL, 1, 1, 190, '2019-03-25 10:34:42', NULL, '2018-02-02 07:53:30', '2019-03-25 10:34:42'),
(10, NULL, 'A4988', 'product/820283598735f98a9b23960821da438b.jpeg', 2, 1, 11, NULL, '39000.00', 20000, 100, NULL, 0, 0, NULL, 1, 1, 88, '2019-03-23 13:37:07', NULL, '2018-02-02 07:53:30', '2019-03-23 13:37:07'),
(11, NULL, 'ANYCUBIC-P', 'product/d63af407fa92299e163696a585566dc7.jpeg', 2, 1, 10, NULL, '4990000.00', 3500000, 99, NULL, 1, 0, NULL, 0, 1, 132, '2020-02-26 02:18:38', NULL, '2018-01-15 07:57:31', '2020-02-26 02:18:38'),
(12, NULL, '3DHLFD', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 2, 1, 12, NULL, '7990000.00', 5200000, 100, NULL, 0, 1, NULL, 0, 1, 126, '2020-03-13 18:32:27', NULL, '2018-01-15 07:57:31', '2020-03-13 18:32:27'),
(20, NULL, 'SS495A', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 3, 1, 14, NULL, '15000.00', 7000, 100, NULL, 0, 1, NULL, 0, 1, 169, '2019-03-30 10:48:54', NULL, '2018-01-15 07:57:31', '2019-03-30 10:48:54'),
(21, NULL, '3D-CARBON1.75', 'product/d05966a529efdd8d7b41ed9b687859b6.jpeg', 3, 1, 15, NULL, '390000.00', 15000, 100, NULL, 0, 1, NULL, 1, 1, 147, '2019-03-31 01:34:44', NULL, '2018-02-02 07:53:30', '2019-03-31 01:34:44'),
(22, NULL, '3D-GOLD1.75', 'product/eedfd153bf368919a134da17f22c8de7.jpeg', 3, 1, 15, NULL, '500000.00', 15000, 100, NULL, 0, 1, NULL, 1, 1, 192, '2019-03-30 15:41:07', NULL, '2018-04-12 08:05:37', '2019-03-30 15:41:07'),
(23, NULL, 'LCD12864-3D', 'product/a7a315526ecf7594731448d792714a11.jpeg', 3, 1, 11, NULL, '220000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 72, '2019-03-30 07:03:19', NULL, '2018-08-11 06:33:37', '2019-03-30 07:03:19'),
(24, NULL, 'LCD2004-3D', 'product/9215506044b8a350fc082f5350b3653a.jpg', 3, 1, 11, NULL, '190000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 93, '2019-03-30 07:03:13', NULL, '2018-08-11 06:39:31', '2019-03-30 07:03:13'),
(25, NULL, 'RAMPS1.5-3D', 'product/1d6cdd4473603c7a4d162067713b8da8.jpg', 3, 1, 11, NULL, '120000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 93, '2019-03-30 07:02:12', NULL, '2018-08-11 06:41:25', '2019-03-30 07:02:12'),
(26, NULL, 'EFULL-3D', 'product/07e79f6546499878cba383dd5bfe977e.jpeg', 3, 1, 11, NULL, '890000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 77, '2019-03-30 18:12:24', NULL, '2018-08-11 06:50:25', '2019-03-30 18:12:24'),
(27, NULL, 'ANYCUBIC-I3M', 'product/ea88b7078652909f3d6c5d445aa05f59.jpeg', 3, 1, 10, NULL, '7990000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 162, '2019-03-30 15:50:41', NULL, '2018-08-22 09:26:00', '2019-03-30 15:50:41'),
(28, NULL, '3DNOZZLE', 'product/c25c81c852823f5ea8ba4250978217a5.jpeg', 3, 1, 11, NULL, '10000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 77, '2019-03-30 07:03:17', NULL, '2018-08-23 21:21:48', '2019-03-30 07:03:17'),
(29, NULL, '3D-TEFLONLOCK', 'product/8e28f51184f0a96970c05185b1412fa1.jpeg', 3, 1, 12, NULL, '10000.00', 15000, 99, NULL, 1, 0, NULL, 0, 1, 115, '2019-03-30 07:49:35', NULL, '2018-08-23 21:32:48', '2019-03-30 07:49:35'),
(30, NULL, '3D-BELT-GT2', 'product/8f795b2335d42cdb7c7eafcfaf714cb2.jpeg', 4, 1, 11, NULL, '20000.00', 15000, 100, NULL, 0, 1, NULL, 0, 1, 145, '2019-04-19 22:15:49', NULL, '2018-08-23 21:35:39', '2019-04-19 22:15:49'),
(31, NULL, '3D-TEFLONLOCK-M10', 'product/0e1416d509af3712bd801404ca928702.jpeg', 4, 1, 11, NULL, '10000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 85, '2019-03-30 20:00:41', NULL, '2018-08-23 21:39:03', '2019-03-30 20:00:41'),
(32, NULL, '3D-HOTWIRE1240', 'product/efd9fb910ba539c125b7c431a1ccc563.jpg', 4, 1, 11, NULL, '20000.00', 15000, 100, NULL, 0, 1, NULL, 0, 1, 165, '2019-03-30 20:53:09', NULL, '2018-08-23 21:40:54', '2019-03-30 20:53:09'),
(33, NULL, '3D-TEFTLON-24', 'product/a635cc2bdf5485ccb2c0cc9d186968b2.jpeg', 4, 1, 16, NULL, '15000.00', 15000, 100, NULL, 0, 0, NULL, 1, 1, 119, '2019-03-26 16:41:29', NULL, '2018-08-23 21:44:04', '2019-03-26 16:41:29'),
(34, NULL, '3D-TEFTLON-W24', 'product/a32f12e009ebf0d24ab264706ecbc15e.jpeg', 4, 1, 11, NULL, '20000.00', 15000, 100, NULL, 0, 1, NULL, 0, 1, 148, '2019-03-29 01:51:55', NULL, '2018-08-23 22:09:34', '2019-03-29 01:51:55'),
(35, NULL, '3D-SENSOR-NTC 100K', 'product/41c8f0d0111cd5a3f0538604233cbed8.jpeg', 4, 1, 10, NULL, '15000.00', 15000, 100, NULL, 0, 1, NULL, 0, 1, 213, '2019-05-02 18:50:15', NULL, '2018-08-23 22:13:58', '2019-05-02 18:50:15'),
(36, NULL, 'nRLF24L01+2.4HZ', 'product/820283598735f98a9b23960821da438b.jpeg', 4, 1, 11, NULL, '25000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 137, '2019-03-30 18:52:08', NULL, '2018-08-23 23:07:15', '2019-03-30 18:52:08'),
(37, NULL, 'ARDUINO-NANO', 'product/da687e60e54bd7fc7eab5c76e7ec3754.jpeg', 4, 1, 17, NULL, '100000.00', 15000, 99, NULL, 1, 0, NULL, 0, 1, 175, '2019-03-29 13:34:47', NULL, '2018-08-23 23:25:48', '2019-03-29 13:34:47'),
(38, NULL, 'LEDSTRIP-5050RGB', 'product/61559578baf403e03565e73a14f845ce.jpeg', 4, 1, 9, NULL, '15000.00', 15000, 99, NULL, 1, 1, NULL, 0, 1, 203, '2019-03-29 14:39:01', NULL, '2018-08-23 23:33:31', '2019-03-29 14:39:01'),
(39, NULL, 'LEDSTRIP-S', 'product/c400aecd5c6d87782ac9af33dd7a5980.jpg', 4, 1, 12, NULL, '15000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 93, '2019-03-28 09:48:06', NULL, '2018-08-24 01:46:21', '2019-03-28 09:48:06'),
(40, NULL, 'P10-IR', 'product/830d640cd17eba0bf186dc649d5c3053.jpeg', 5, 1, 12, NULL, '15000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 83, '2019-03-28 21:01:21', NULL, '2018-08-24 01:49:49', '2019-03-28 21:01:21'),
(41, NULL, 'P10-IG', 'product/9d9aab8be8634708c9cf5b690fee74a4.jpeg', 5, 1, 10, NULL, '15000.00', 15000, 99, NULL, 1, 1, NULL, 0, 1, 121, '2019-03-29 13:47:31', NULL, '2018-08-24 01:51:11', '2019-03-29 13:47:31'),
(42, NULL, 'P10-IB', 'product/98fafb9da683cd9ee854598f3f3a3bd5.jpeg', 5, 1, 11, NULL, '15000.00', 15000, 100, NULL, 0, 0, NULL, 0, 1, 98, '2019-03-28 17:25:25', NULL, '2018-08-24 01:52:58', '2019-03-28 17:25:25'),
(43, NULL, 'P10-IRGB', 'product/a111c060ebb6ffbbd2d34ae278501789.jpg', 5, 1, 6, NULL, '15000.00', 15000, 99, NULL, 1, 0, NULL, 0, 1, 124, '2019-03-30 16:51:34', NULL, '2018-08-24 01:54:45', '2019-03-30 16:51:34'),
(44, NULL, 'P10-IRG', 'product/95349d3747fdaf79d391fdc98e083701.jpg', 5, 1, 11, NULL, '15000.00', 15000, 100, NULL, 0, 1, NULL, 0, 1, 173, '2019-03-30 15:42:45', NULL, '2018-08-24 01:56:02', '2019-03-30 15:42:45'),
(45, NULL, 'LFF', 'product/3c8f613d30b4e487ef95a5e4cdea634c.jpeg', 5, 1, 6, NULL, '15000.00', 15000, 94, NULL, 6, 0, NULL, 0, 1, 238, '2019-03-29 11:49:10', NULL, '2018-08-24 01:58:42', '2019-03-29 11:49:10'),
(46, NULL, 'P25-I', 'product/949fa36ebd56593445fb61d141fd2a81.jpeg', 5, 1, 10, NULL, '15000.00', 15000, 96, NULL, 4, 0, NULL, 0, 1, 230, '2019-03-30 14:18:48', NULL, '2018-08-24 02:23:07', '2019-03-30 14:18:48'),
(47, NULL, 'BX-5U0', 'product/cd7aa3394c35330ed7f9e4095c6adb65.jpeg', 5, 1, 12, NULL, '15000.00', 15000, 93, NULL, 7, 0, NULL, 0, 1, 266, '2019-03-30 15:30:39', NULL, '2018-08-24 02:48:31', '2019-03-30 15:30:39'),
(48, NULL, 'BX-5UT', 'product/b0d947f6ddd37e9684055c6cd45cd40d.jpg', 5, 1, 11, NULL, '15000.00', 15000, 84, NULL, 16, 0, NULL, 0, 1, 500, '2019-03-30 07:19:42', NULL, '2018-08-24 02:52:15', '2019-03-30 07:19:42'),
(49, 3, 'BX-5UTbnv', 'product/42eb3619452dfabb8ea09f64cff290c6.jpeg', 4, 2, 12, NULL, '150008.00', 131151, 75, NULL, 26, 1, NULL, 0, 1, 459, '2020-02-02 21:53:02', '2019-03-29 17:00:00', '2018-09-03 01:05:59', '2020-03-21 21:41:47'),
(50, 1, 'prod1', NULL, 0, 0, 19, NULL, '200.00', 120, 15, NULL, -7, 0, NULL, 1, 1, 3, '2020-03-14 00:59:33', NULL, '2019-05-05 01:20:50', '2020-04-01 05:17:00'),
(51, NULL, 'prod9', NULL, 3, 2, 1, NULL, '250.00', 225, 258, NULL, 0, 0, NULL, 1, 1, 0, NULL, NULL, '2020-01-23 18:41:11', '2020-01-23 18:41:11'),
(53, 1, 'prod123456789', 'product/49d18551e3a1fea40dcc7e3f298aa54c.PNG', 3, 2, 19, NULL, '25.00', 21, 25, NULL, 0, 0, NULL, 0, 1, 1, '2020-03-14 00:59:57', NULL, '2020-01-24 06:14:47', '2020-03-14 00:59:57'),
(54, 2, 'prod2', NULL, 2, 1, 6, NULL, '258.00', 20, 10, NULL, 0, 0, NULL, 2, 1, 0, NULL, '2020-03-10 22:00:00', '2020-03-07 03:00:19', '2020-03-19 23:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_description`
--

CREATE TABLE `shop_product_description` (
  `product_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_description`
--

INSERT INTO `shop_product_description` (`product_id`, `lang_id`, `company_id`, `name`, `description`, `keyword`, `content`) VALUES
(3, 1, 1, 'Easy Polo Black Edition 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(3, 2, NULL, 'Easy Polo Black Edition 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(4, 1, 3, 'Easy Polo Black Edition 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(4, 2, NULL, 'Easy Polo Black Edition 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(5, 1, NULL, 'Easy Polo Black Edition 5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(5, 2, NULL, 'Easy Polo Black Edition 5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(6, 1, NULL, 'Easy Polo Black Edition 6', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(6, 2, NULL, 'Easy Polo Black Edition 6', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(7, 1, NULL, 'Easy Polo Black Edition 7', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(7, 2, NULL, 'Easy Polo Black Edition 7', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(8, 1, NULL, 'Easy Polo Black Edition 8', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(8, 2, NULL, 'Easy Polo Black Edition 8', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(9, 1, NULL, 'Easy Polo Black Edition 9', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(9, 2, NULL, 'Easy Polo Black Edition 9', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(10, 1, NULL, 'Easy Polo Black Edition 10', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(10, 2, NULL, 'Easy Polo Black Edition 10', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(11, 1, NULL, 'Easy Polo Black Edition 11', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(11, 2, NULL, 'Easy Polo Black Edition 11', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(12, 1, NULL, 'Easy Polo Black Edition 12', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(12, 2, NULL, 'Easy Polo Black Edition 12', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(20, 1, NULL, 'Easy Polo Black Edition 20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(20, 2, NULL, 'Easy Polo Black Edition 20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(21, 1, NULL, 'Easy Polo Black Edition 21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(21, 2, NULL, 'Easy Polo Black Edition 21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(22, 1, NULL, 'Easy Polo Black Edition 22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(22, 2, NULL, 'Easy Polo Black Edition 22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(23, 1, NULL, 'Easy Polo Black Edition 23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(23, 2, NULL, 'Easy Polo Black Edition 23', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(24, 1, NULL, 'Easy Polo Black Edition 24', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(24, 2, NULL, 'Easy Polo Black Edition 24', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(25, 1, NULL, 'Easy Polo Black Edition 25', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(25, 2, NULL, 'Easy Polo Black Edition 25', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(26, 1, NULL, 'Easy Polo Black Edition 26', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(26, 2, NULL, 'Easy Polo Black Edition 26', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(27, 1, NULL, 'Easy Polo Black Edition 27', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>');
INSERT INTO `shop_product_description` (`product_id`, `lang_id`, `company_id`, `name`, `description`, `keyword`, `content`) VALUES
(27, 2, NULL, 'Easy Polo Black Edition 27', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(28, 1, NULL, 'Easy Polo Black Edition 28', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(28, 2, NULL, 'Easy Polo Black Edition 28', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(29, 1, NULL, 'Easy Polo Black Edition 29', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(29, 2, NULL, 'Easy Polo Black Edition 29', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(30, 1, NULL, 'Easy Polo Black Edition 30', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(30, 2, NULL, 'Easy Polo Black Edition 30', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(31, 1, NULL, 'Easy Polo Black Edition 31', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(31, 2, NULL, 'Easy Polo Black Edition 31', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(32, 1, NULL, 'Easy Polo Black Edition 32', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(32, 2, NULL, 'Easy Polo Black Edition 32', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(33, 1, NULL, 'Easy Polo Black Edition 33', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(33, 2, NULL, 'Easy Polo Black Edition 33', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(34, 1, NULL, 'Easy Polo Black Edition 34', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(34, 2, NULL, 'Easy Polo Black Edition 34', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(35, 1, NULL, 'Easy Polo Black Edition 35', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(35, 2, NULL, 'Easy Polo Black Edition 35', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(36, 1, NULL, 'Easy Polo Black Edition 36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(36, 2, NULL, 'Easy Polo Black Edition 36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(37, 1, NULL, 'Easy Polo Black Edition 37', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(37, 2, NULL, 'Easy Polo Black Edition 37', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(38, 1, NULL, 'Easy Polo Black Edition 38', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(38, 2, NULL, 'Easy Polo Black Edition 38', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(39, 1, NULL, 'Easy Polo Black Edition 39', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(39, 2, NULL, 'Easy Polo Black Edition 39', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(40, 1, NULL, 'Easy Polo Black Edition 40', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(40, 2, NULL, 'Easy Polo Black Edition 40', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(41, 1, NULL, 'Easy Polo Black Edition 41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(41, 2, NULL, 'Easy Polo Black Edition 41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(42, 1, NULL, 'Easy Polo Black Edition 42', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(42, 2, NULL, 'Easy Polo Black Edition 42', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(43, 1, NULL, 'Easy Polo Black Edition 43', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(43, 2, NULL, 'Easy Polo Black Edition 43', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(44, 1, NULL, 'Easy Polo Black Edition 44', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(44, 2, NULL, 'Easy Polo Black Edition 44', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>');
INSERT INTO `shop_product_description` (`product_id`, `lang_id`, `company_id`, `name`, `description`, `keyword`, `content`) VALUES
(45, 1, NULL, 'Easy Polo Black Edition 45', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(45, 2, NULL, 'Easy Polo Black Edition 45', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(46, 1, NULL, 'Easy Polo Black Edition 46', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(46, 2, NULL, 'Easy Polo Black Edition 46', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(47, 1, NULL, 'Easy Polo Black Edition 47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(47, 2, NULL, 'Easy Polo Black Edition 47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(48, 1, NULL, 'Easy Polo Black Edition 48', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(48, 2, NULL, 'Easy Polo Black Edition 48', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(49, 1, 3, 'Easy Polo Black Edition 49', 'test 8', 'ddddsdfsdfsdfs', '<p>test long test 2<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(49, 3, NULL, 'Easy Polo Black Edition 49', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/documents/photos/blogs/16d9_star_trek_tng_uniform_tee.jpeg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>'),
(50, 1, 1, 'prod1', 'prod1 desc', 'prod1 keyword', 'prod 1 long data'),
(54, 1, 2, 'prod2', 'prod2 des1', 'prod2', 'prod2 des2');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_image`
--

CREATE TABLE `shop_product_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(2) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(2) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_image`
--

INSERT INTO `shop_product_image` (`id`, `company_id`, `image`, `product_id`, `path`, `sort`, `status`) VALUES
(82, NULL, 'product_slide/0642809276ecd6a28cb23d464cf41734.jpeg', 38, NULL, 0, 0),
(83, NULL, 'product_slide/f4786d81509a8d8ffa461535b07c77bc.png', 38, NULL, 0, 0),
(84, NULL, 'product_slide/e09af215f794f8225063c368f46a971d.jpeg', 39, NULL, 0, 0),
(87, NULL, 'product_slide/54fac65e58eb9abafe3ac1acbde5ee6d.jpeg', 40, NULL, 0, 0),
(88, NULL, 'product_slide/81f37c10d867710075e3ab6153a31d03.png', 40, NULL, 0, 0),
(89, NULL, 'product_slide/2fbba5ac3b9c0838e5ce2b536d0c5659.jpeg', 42, NULL, 0, 0),
(90, NULL, 'product_slide/8718dfdb75f951010cdce669768c3e3a.png', 42, NULL, 0, 0),
(92, NULL, 'product_slide/86282e4f808428108773596dea5ee29c.jpeg', 43, NULL, 0, 0),
(93, NULL, 'product_slide/b89873b9c888c0511e14c6e3abc798e8.jpeg', 43, NULL, 0, 0),
(94, NULL, 'product_slide/b0d9ffad7e40d07bae6d36665f765e0f.jpeg', 43, NULL, 0, 0),
(95, NULL, 'product_slide/70edffd9b5b4121fb8aee7e41c941f03.jpeg', 44, NULL, 0, 0),
(96, NULL, 'product_slide/e9d5898fc6daf50751ec0c4e91ed904d.jpeg', 45, NULL, 0, 0),
(109, NULL, 'product_slide/e91e85e37bb89ed854aa4123ce5eb14f.jpeg', 49, NULL, 0, 0),
(110, NULL, 'product_slide/bcf85f60d3fe35de2c1be6272f9605ef.png', 52, NULL, 0, 0),
(111, NULL, 'product_slide/40999526f41b1d4090e30c6b0ce21dca.jpg', 53, NULL, 0, 0),
(113, NULL, 'product_slide/7963a1dc4e1676c2b3bc97ade96de7b6.jpeg', 49, NULL, 0, 0),
(114, NULL, 'product_slide/101a109520cfbddde1be1791423010b6.jpeg', 46, NULL, 0, 0),
(115, NULL, 'product_slide/f02dbb115272eac46f46f015608ab93a.jpeg', 46, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_like`
--

CREATE TABLE `shop_product_like` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `review` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_like`
--

INSERT INTO `shop_product_like` (`id`, `product_id`, `company_id`, `users_id`, `review`, `rate`, `created_at`, `updated_at`) VALUES
(1, 50, 1, 5, '77', 5, '2020-03-29 22:22:40', '2020-04-03 05:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_option`
--

CREATE TABLE `shop_product_option` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `opt_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_sku` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_price` int(11) DEFAULT NULL,
  `opt_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_product_option`
--

INSERT INTO `shop_product_option` (`id`, `company_id`, `opt_name`, `opt_sku`, `opt_price`, `opt_image`, `product_id`) VALUES
(3, 0, 'Sản phẩm xanh', 'BX-5UT-s', 454, 'product/4c28c6a2fc6a3fa79197798707d55b5c.png', 48),
(4, 0, '34324234', 'BX-5UT-T', 1111, 'product/293da323794f89ee2d7962f44f930393.png', 48),
(12, 0, 'fdgdfg', 'fgdfgd', NULL, 'product/68f8a4d063e4ddef447616116dd03e0f.png', 42),
(13, 0, 'bnmbnmbn', 'BX-5U0-1fgfgjghjhgj', NULL, 'product/2702691387f97f5985843cbb243d267c.png', 42),
(16, 0, 'Sản phẩm xanh', 'BX-5U0-1fgfgkjh', NULL, 'product/777274d55ff7adeef36ca930022a8db9.jpg', 29),
(17, 0, 'Sản phẩm xanh', 'BX-5U0-1fgfgl', NULL, 'product/0ba3c6a927bb0e2cd2d54ce0c13df919.jpg', 30),
(18, 0, 'Sản phẩm xanh', 'BX-5U0-1fgfgg', NULL, 'product/7eb3eefcb94b7548cc4942a42f36e186.jpg', 27);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping`
--

CREATE TABLE `shop_shipping` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  `free` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_shipping`
--

INSERT INTO `shop_shipping` (`id`, `company_id`, `type`, `value`, `free`, `status`) VALUES
(1, NULL, 0, 20000, 10000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_status`
--

CREATE TABLE `shop_shipping_status` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_shipping_status`
--

INSERT INTO `shop_shipping_status` (`id`, `company_id`, `name`) VALUES
(0, 0, 'Not sent'),
(1, 0, 'Sending'),
(2, 0, 'Shipping done');

-- --------------------------------------------------------

--
-- Table structure for table `shop_shoppingcart`
--

CREATE TABLE `shop_shoppingcart` (
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_special_price`
--

CREATE TABLE `shop_special_price` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `off` int(11) DEFAULT 0,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `comment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_special_price`
--

INSERT INTO `shop_special_price` (`id`, `company_id`, `product_id`, `price`, `off`, `date_start`, `date_end`, `status`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 150000, 0, '2018-01-27 17:00:00', '2019-04-29 17:00:00', 1, NULL, '2018-02-06 05:05:20', '2018-04-12 07:45:17'),
(4, NULL, 6, 40000, 0, NULL, '2019-06-27 17:00:00', 1, NULL, '2018-02-06 05:44:40', '2018-04-12 07:45:32'),
(6, NULL, 8, 30000, 0, '2018-02-06 17:00:00', '2018-03-09 17:00:00', 1, NULL, '2018-02-07 07:45:19', '2018-02-07 08:17:42'),
(7, NULL, 10, 15000, 0, '2018-02-05 17:00:00', '2018-03-28 17:00:00', 1, NULL, '2018-02-07 07:49:48', '2018-03-10 22:36:43'),
(9, NULL, 11, 100000, 0, '2018-03-18 17:00:00', '2018-03-30 17:00:00', 1, NULL, '2018-02-08 08:51:45', '2018-03-24 19:49:07'),
(11, NULL, 12, 100000, 0, NULL, NULL, 1, NULL, '2018-03-27 07:13:47', '2018-03-27 07:18:44'),
(12, NULL, 7, 320000, 0, '2011-10-25 17:00:00', '2019-05-07 17:00:00', 1, NULL, '2018-04-12 07:46:40', '2018-08-31 17:05:12'),
(13, NULL, 23, 198000, 10, '2018-05-07 17:00:00', '2018-06-07 17:00:00', 0, 'test giam gia', '2018-05-09 08:15:37', '2018-08-28 15:13:45'),
(14, NULL, 49, 10000, 0, NULL, NULL, 1, NULL, '2018-09-22 11:19:07', '2018-09-22 11:19:07'),
(15, NULL, 3, 200000, 0, NULL, NULL, 1, NULL, '2018-09-22 11:20:14', '2018-09-22 11:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `shop_users`
--

CREATE TABLE `shop_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_users`
--

INSERT INTO `shop_users` (`id`, `company_id`, `name`, `email`, `password`, `address1`, `address2`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'mahmoud', 'ms_ms25490@yahoo.com', '$2y$10$MpxfOiKlstJNu0yjL4vjo.n2504ygw17tkIxseCfkEKmteoEm82fe', 'caru egt', NULL, '1142931228', NULL, '2019-05-07 03:41:09', '2019-05-07 03:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `shop_vendor`
--

CREATE TABLE `shop_vendor` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_vendor`
--

INSERT INTO `shop_vendor` (`id`, `company_id`, `name`, `email`, `phone`, `image`, `address`, `url`, `sort`) VALUES
(1, NULL, 'ABC distributor', 'abc@abc.com', '012496657567', NULL, NULL, NULL, 0),
(2, 1, 'mahmoud', 'ms_ms25490@yahoo.com', '1142931228', 'vendor/94bf816d0d1fffd7d11b3a3adcd31359.jpg', 'caru egt', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `company_id`, `email`, `updated_at`, `created_at`) VALUES
(2, NULL, 'mahmoud.25490@gmail.com', '2019-05-19', '2019-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `uofms`
--

CREATE TABLE `uofms` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(220) NOT NULL,
  `amount_in_base` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `uofms`
--

INSERT INTO `uofms` (`id`, `group_id`, `code`, `name`, `amount_in_base`, `created_at`, `updated_at`) VALUES
(1, 1, 'small', 'صغيرة', 1, '2020-02-26 22:48:45', NULL),
(2, 1, 'medium', 'متوسطة', 2, '2020-02-26 22:50:18', NULL),
(4, 1, 'large', 'كبيرة', 3, '2020-02-26 22:50:18', NULL),
(5, 3, 'large', 'كبيرة', 3, '2020-02-26 22:50:18', NULL),
(6, 4, 'large', 'كبيرة', 3, '2020-02-26 22:50:18', '2020-04-03 01:16:07'),
(7, 3, 'medium', 'متوسطة', 2, '2020-02-26 22:50:18', NULL),
(8, 4, 'medium', 'متوسطة', 2, '2020-02-26 22:50:18', '2020-04-03 01:16:00'),
(9, 3, 'small', 'صغيرة', 1, '2020-02-26 22:48:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uofm_groups`
--

CREATE TABLE `uofm_groups` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `uofm_groups`
--

INSERT INTO `uofm_groups` (`id`, `code`, `name`, `created_at`, `updated_at`, `company_id`) VALUES
(1, 'area', 'مساحة', '2020-02-05 00:00:00', '2020-02-05 00:00:00', NULL),
(2, 'color', 'اللون', '2020-02-05 00:00:00', NULL, NULL),
(3, 'carton', 'كرتونة', '2020-02-05 00:00:00', NULL, NULL),
(4, 'pocket', 'علبة', '2020-02-05 00:00:00', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activitylist`
--
ALTER TABLE `activitylist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`),
  ADD UNIQUE KEY `api_token` (`api_token`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `company_contact`
--
ALTER TABLE `company_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `config_global`
--
ALTER TABLE `config_global`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_global_description`
--
ALTER TABLE `config_global_description`
  ADD UNIQUE KEY `config_id_lang_id` (`config_id`,`lang_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `layout`
--
ALTER TABLE `layout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layout_page`
--
ALTER TABLE `layout_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniquekey` (`uniquekey`);

--
-- Indexes for table `layout_position`
--
ALTER TABLE `layout_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniquekey` (`uniquekey`);

--
-- Indexes for table `layout_type`
--
ALTER TABLE `layout_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniquekey` (`uniquekey`);

--
-- Indexes for table `layout_url`
--
ALTER TABLE `layout_url`
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
-- Indexes for table `product_price_list`
--
ALTER TABLE `product_price_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_standard`
--
ALTER TABLE `shipping_standard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_api`
--
ALTER TABLE `shop_api`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shop_api_process`
--
ALTER TABLE `shop_api_process`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `secret_key` (`secret_key`);

--
-- Indexes for table `shop_attribute_detail`
--
ALTER TABLE `shop_attribute_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_attribute_group`
--
ALTER TABLE `shop_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_attribute_values`
--
ALTER TABLE `shop_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_brand`
--
ALTER TABLE `shop_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category_description`
--
ALTER TABLE `shop_category_description`
  ADD UNIQUE KEY `shop_category_id_lang_id` (`shop_category_id`,`lang_id`);

--
-- Indexes for table `shop_currency`
--
ALTER TABLE `shop_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `shop_discount`
--
ALTER TABLE `shop_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_discount_code_unique` (`code`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_history`
--
ALTER TABLE `shop_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_status`
--
ALTER TABLE `shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_total`
--
ALTER TABLE `shop_order_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_page`
--
ALTER TABLE `shop_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`uniquekey`);

--
-- Indexes for table `shop_page_description`
--
ALTER TABLE `shop_page_description`
  ADD UNIQUE KEY `cms_page_id_lang_id` (`page_id`,`lang_id`);

--
-- Indexes for table `shop_payment_status`
--
ALTER TABLE `shop_payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_preferred_product`
--
ALTER TABLE `shop_preferred_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`users_id`,`company_id`) USING BTREE;

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `shop_product_description`
--
ALTER TABLE `shop_product_description`
  ADD UNIQUE KEY `product_id_lang_id` (`product_id`,`lang_id`);

--
-- Indexes for table `shop_product_image`
--
ALTER TABLE `shop_product_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_product_like`
--
ALTER TABLE `shop_product_like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`users_id`,`company_id`) USING BTREE;

--
-- Indexes for table `shop_product_option`
--
ALTER TABLE `shop_product_option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `opt_sku` (`opt_sku`);

--
-- Indexes for table `shop_shipping`
--
ALTER TABLE `shop_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shipping_status`
--
ALTER TABLE `shop_shipping_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shoppingcart`
--
ALTER TABLE `shop_shoppingcart`
  ADD KEY `shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`);

--
-- Indexes for table `shop_special_price`
--
ALTER TABLE `shop_special_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_users`
--
ALTER TABLE `shop_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `shop_vendor`
--
ALTER TABLE `shop_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uofms`
--
ALTER TABLE `uofms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_fk` (`group_id`);

--
-- Indexes for table `uofm_groups`
--
ALTER TABLE `uofm_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activitylist`
--
ALTER TABLE `activitylist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3857;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_contact`
--
ALTER TABLE `company_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `config_global`
--
ALTER TABLE `config_global`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `layout`
--
ALTER TABLE `layout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `layout_page`
--
ALTER TABLE `layout_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `layout_position`
--
ALTER TABLE `layout_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `layout_type`
--
ALTER TABLE `layout_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `layout_url`
--
ALTER TABLE `layout_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_price_list`
--
ALTER TABLE `product_price_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipping_standard`
--
ALTER TABLE `shipping_standard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_api`
--
ALTER TABLE `shop_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_api_process`
--
ALTER TABLE `shop_api_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_attribute_detail`
--
ALTER TABLE `shop_attribute_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shop_attribute_group`
--
ALTER TABLE `shop_attribute_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_attribute_values`
--
ALTER TABLE `shop_attribute_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_brand`
--
ALTER TABLE `shop_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `shop_currency`
--
ALTER TABLE `shop_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_discount`
--
ALTER TABLE `shop_discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shop_order_history`
--
ALTER TABLE `shop_order_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `shop_order_status`
--
ALTER TABLE `shop_order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_order_total`
--
ALTER TABLE `shop_order_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shop_page`
--
ALTER TABLE `shop_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_payment_status`
--
ALTER TABLE `shop_payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_preferred_product`
--
ALTER TABLE `shop_preferred_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `shop_product_image`
--
ALTER TABLE `shop_product_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `shop_product_like`
--
ALTER TABLE `shop_product_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_product_option`
--
ALTER TABLE `shop_product_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `shop_shipping`
--
ALTER TABLE `shop_shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_shipping_status`
--
ALTER TABLE `shop_shipping_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_special_price`
--
ALTER TABLE `shop_special_price`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shop_users`
--
ALTER TABLE `shop_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shop_vendor`
--
ALTER TABLE `shop_vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uofms`
--
ALTER TABLE `uofms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `uofm_groups`
--
ALTER TABLE `uofm_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `uofms`
--
ALTER TABLE `uofms`
  ADD CONSTRAINT `group_fk` FOREIGN KEY (`group_id`) REFERENCES `uofm_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
