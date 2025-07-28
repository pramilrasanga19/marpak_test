-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2025 at 02:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marpak_web_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `event`, `created_at`, `updated_at`) VALUES
(1, 'default', 'User has been updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"510.00\"},\"old\":{\"balance\":\"250.00\"}}', NULL, 'updated', '2025-07-28 05:15:06', '2025-07-28 05:15:06'),
(2, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"544.00\"},\"old\":{\"balance\":\"510.00\"}}', NULL, 'updated', '2025-07-28 05:20:43', '2025-07-28 05:20:43'),
(3, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"887.00\"},\"old\":{\"balance\":\"544.00\"}}', NULL, 'updated', '2025-07-28 05:22:18', '2025-07-28 05:22:18'),
(4, 'default', 'topup_processed', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"old\":{\"balance\":\"544.00\"},\"new\":{\"balance\":\"887.00\"},\"amount\":\"343\"}', NULL, NULL, '2025-07-28 05:22:18', '2025-07-28 05:22:18'),
(5, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1000.00\"},\"old\":{\"balance\":\"887.00\"}}', NULL, 'updated', '2025-07-28 05:23:40', '2025-07-28 05:23:40'),
(6, 'default', 'topup_processed', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"old\":{\"balance\":\"887.00\"},\"new\":{\"balance\":\"1000.00\"},\"amount\":\"113\"}', NULL, NULL, '2025-07-28 05:23:40', '2025-07-28 05:23:40'),
(7, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"966.00\"},\"old\":{\"balance\":\"1000.00\"}}', NULL, 'updated', '2025-07-28 05:24:57', '2025-07-28 05:24:57'),
(8, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"404.00\"},\"old\":{\"balance\":\"370.00\"}}', NULL, 'updated', '2025-07-28 05:24:57', '2025-07-28 05:24:57'),
(9, 'default', 'funds_transferred_out', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"old_balance\":\"1000.00\",\"new_balance\":\"966.00\",\"recipient\":{\"id\":1,\"name\":\"test\",\"email\":\"test@gmail.com\"},\"amount\":\"34\"}', NULL, NULL, '2025-07-28 05:24:57', '2025-07-28 05:24:57'),
(10, 'default', 'funds_transferred_in', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"old_balance\":\"370.00\",\"new_balance\":\"404.00\",\"sender\":{\"id\":2,\"name\":\"test2\",\"email\":\"test2@gmail.com\"},\"amount\":\"34\"}', NULL, NULL, '2025-07-28 05:24:57', '2025-07-28 05:24:57'),
(11, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1000.00\"},\"old\":{\"balance\":\"966.00\"}}', NULL, 'updated', '2025-07-28 05:26:23', '2025-07-28 05:26:23'),
(12, 'default', 'topup_processed', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"old\":{\"balance\":\"966.00\"},\"new\":{\"balance\":\"1000.00\"},\"amount\":\"34\"}', NULL, NULL, '2025-07-28 05:26:23', '2025-07-28 05:26:23'),
(13, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"995.00\"},\"old\":{\"balance\":\"1000.00\"}}', NULL, 'updated', '2025-07-28 05:26:46', '2025-07-28 05:26:46'),
(14, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"409.00\"},\"old\":{\"balance\":\"404.00\"}}', NULL, 'updated', '2025-07-28 05:26:46', '2025-07-28 05:26:46'),
(15, 'default', 'funds_transferred_out', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"old_balance\":\"1000.00\",\"new_balance\":\"995.00\",\"recipient\":{\"id\":1,\"name\":\"test\",\"email\":\"test@gmail.com\"},\"amount\":\"5\"}', NULL, NULL, '2025-07-28 05:26:46', '2025-07-28 05:26:46'),
(16, 'default', 'funds_transferred_in', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"old_balance\":\"404.00\",\"new_balance\":\"409.00\",\"sender\":{\"id\":2,\"name\":\"test2\",\"email\":\"test2@gmail.com\"},\"amount\":\"5\"}', NULL, NULL, '2025-07-28 05:26:46', '2025-07-28 05:26:46'),
(17, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"940.00\"},\"old\":{\"balance\":\"995.00\"}}', NULL, 'updated', '2025-07-28 05:32:55', '2025-07-28 05:32:55'),
(18, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"830.00\"},\"old\":{\"balance\":\"940.00\"}}', NULL, 'updated', '2025-07-28 05:36:02', '2025-07-28 05:36:02'),
(19, 'default', 'bill_payment_processed', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"transaction_id\":9,\"old_balance\":\"940.00\",\"new_balance\":\"830.00\",\"biller\":{\"id\":1,\"name\":\"Electricity\",\"fee_percentage\":10},\"payment_details\":{\"amount\":\"100\",\"fee\":10,\"total\":110}}', NULL, NULL, '2025-07-28 05:36:02', '2025-07-28 05:36:02'),
(20, 'default', 'payment_received', 'App\\Models\\Transaction', 9, 'App\\Models\\User', 2, '{\"user_id\":2,\"biller_id\":1,\"amount_paid\":110}', NULL, NULL, '2025-07-28 05:36:02', '2025-07-28 05:36:02'),
(21, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"725.00\"},\"old\":{\"balance\":\"830.00\"}}', NULL, 'updated', '2025-07-28 05:36:15', '2025-07-28 05:36:15'),
(22, 'default', 'bill_payment_processed', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"transaction_id\":10,\"old_balance\":\"830.00\",\"new_balance\":\"725.00\",\"biller\":{\"id\":2,\"name\":\"Water\",\"fee_percentage\":5},\"payment_details\":{\"amount\":\"100\",\"fee\":5,\"total\":105}}', NULL, NULL, '2025-07-28 05:36:15', '2025-07-28 05:36:15'),
(23, 'default', 'payment_received', 'App\\Models\\Transaction', 10, 'App\\Models\\User', 2, '{\"user_id\":2,\"biller_id\":2,\"amount_paid\":105}', NULL, NULL, '2025-07-28 05:36:15', '2025-07-28 05:36:15'),
(24, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1500.00\"},\"old\":{\"balance\":\"725.00\"}}', NULL, 'updated', '2025-07-28 05:42:25', '2025-07-28 05:42:25'),
(25, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 11, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"775\",\"balance_before\":\"725.00\",\"balance_after\":\"1500.00\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 05:42:25', '2025-07-28 05:42:25'),
(26, 'default', 'Paid Electricity bill', 'App\\Models\\Transaction', 12, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Electricity\",\"amount\":\"100\",\"fee\":10,\"total\":110,\"balance_before\":\"1500.00\",\"balance_after\":1390}', NULL, NULL, '2025-07-28 05:42:44', '2025-07-28 05:42:44'),
(27, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1350.00\"},\"old\":{\"balance\":\"1500.00\"}}', NULL, 'updated', '2025-07-28 05:42:59', '2025-07-28 05:42:59'),
(28, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"559.00\"},\"old\":{\"balance\":\"409.00\"}}', NULL, 'updated', '2025-07-28 05:42:59', '2025-07-28 05:42:59'),
(29, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 13, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"150\",\"balance_before\":\"1500.00\",\"balance_after\":\"1350.00\"}', NULL, NULL, '2025-07-28 05:42:59', '2025-07-28 05:42:59'),
(30, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 14, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"150\",\"balance_before\":\"409.00\",\"balance_after\":\"559.00\"}', NULL, NULL, '2025-07-28 05:42:59', '2025-07-28 05:42:59'),
(31, 'default', 'Paid Electricity bill', 'App\\Models\\Transaction', 15, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Electricity\",\"amount\":\"350\",\"fee\":35,\"total\":385,\"balance_before\":\"1350.00\",\"balance_after\":965}', NULL, NULL, '2025-07-28 05:43:10', '2025-07-28 05:43:10'),
(32, 'default', 'Paid Internet bill', 'App\\Models\\Transaction', 16, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Internet\",\"amount\":\"500\",\"fee\":0,\"total\":500,\"balance_before\":\"1350.00\",\"balance_after\":850}', NULL, NULL, '2025-07-28 05:43:33', '2025-07-28 05:43:33'),
(33, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1300.00\"},\"old\":{\"balance\":\"1350.00\"}}', NULL, 'updated', '2025-07-28 05:44:35', '2025-07-28 05:44:35'),
(34, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"609.00\"},\"old\":{\"balance\":\"559.00\"}}', NULL, 'updated', '2025-07-28 05:44:35', '2025-07-28 05:44:35'),
(35, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 17, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"50\",\"balance_before\":\"1350.00\",\"balance_after\":\"1300.00\"}', NULL, NULL, '2025-07-28 05:44:35', '2025-07-28 05:44:35'),
(36, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 18, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"50\",\"balance_before\":\"559.00\",\"balance_after\":\"609.00\"}', NULL, NULL, '2025-07-28 05:44:35', '2025-07-28 05:44:35'),
(37, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1500.00\"},\"old\":{\"balance\":\"1300.00\"}}', NULL, 'updated', '2025-07-28 05:44:42', '2025-07-28 05:44:42'),
(38, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 19, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"200\",\"balance_before\":\"1300.00\",\"balance_after\":\"1500.00\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 05:44:42', '2025-07-28 05:44:42'),
(39, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1472.50\"},\"old\":{\"balance\":\"1500.00\"}}', NULL, 'updated', '2025-07-28 05:45:32', '2025-07-28 05:45:32'),
(40, 'default', 'bill_payment_processed', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"transaction_id\":20,\"old_balance\":\"1500.00\",\"new_balance\":\"1472.50\",\"biller\":{\"id\":1,\"name\":\"Electricity\",\"fee_percentage\":10},\"payment_details\":{\"amount\":\"25\",\"fee\":2.5,\"total\":27.5}}', NULL, NULL, '2025-07-28 05:45:32', '2025-07-28 05:45:32'),
(41, 'default', 'payment_received', 'App\\Models\\Transaction', 20, 'App\\Models\\User', 2, '{\"user_id\":2,\"biller_id\":1,\"amount_paid\":27.5}', NULL, NULL, '2025-07-28 05:45:32', '2025-07-28 05:45:32'),
(42, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1393.30\"},\"old\":{\"balance\":\"1472.50\"}}', NULL, 'updated', '2025-07-28 05:47:34', '2025-07-28 05:47:34'),
(43, 'default', 'Paid Electricity bill', 'App\\Models\\Transaction', 21, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Electricity\",\"amount\":\"72\",\"fee\":7.2,\"total\":79.2,\"balance_before\":\"1472.50\",\"balance_after\":\"1393.30\"}', NULL, NULL, '2025-07-28 05:47:34', '2025-07-28 05:47:34'),
(44, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1400.30\"},\"old\":{\"balance\":\"1393.30\"}}', NULL, 'updated', '2025-07-28 05:47:49', '2025-07-28 05:47:49'),
(45, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 22, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"7\",\"balance_before\":\"1393.30\",\"balance_after\":\"1400.30\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 05:47:49', '2025-07-28 05:47:49'),
(46, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1300.30\"},\"old\":{\"balance\":\"1400.30\"}}', NULL, 'updated', '2025-07-28 05:47:58', '2025-07-28 05:47:58'),
(47, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"709.00\"},\"old\":{\"balance\":\"609.00\"}}', NULL, 'updated', '2025-07-28 05:47:58', '2025-07-28 05:47:58'),
(48, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 23, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"100\",\"balance_before\":\"1400.30\",\"balance_after\":\"1300.30\"}', NULL, NULL, '2025-07-28 05:47:58', '2025-07-28 05:47:58'),
(49, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 24, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"100\",\"balance_before\":\"609.00\",\"balance_after\":\"709.00\"}', NULL, NULL, '2025-07-28 05:47:58', '2025-07-28 05:47:58'),
(50, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1300.00\"},\"old\":{\"balance\":\"1300.30\"}}', NULL, 'updated', '2025-07-28 05:48:09', '2025-07-28 05:48:09'),
(51, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"709.30\"},\"old\":{\"balance\":\"709.00\"}}', NULL, 'updated', '2025-07-28 05:48:09', '2025-07-28 05:48:09'),
(52, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 25, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"0.30\",\"balance_before\":\"1300.30\",\"balance_after\":\"1300.00\"}', NULL, NULL, '2025-07-28 05:48:09', '2025-07-28 05:48:09'),
(53, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 26, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"0.30\",\"balance_before\":\"709.00\",\"balance_after\":\"709.30\"}', NULL, NULL, '2025-07-28 05:48:09', '2025-07-28 05:48:09'),
(54, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1150.00\"},\"old\":{\"balance\":\"1300.00\"}}', NULL, 'updated', '2025-07-28 05:48:22', '2025-07-28 05:48:22'),
(55, 'default', 'Paid Internet bill', 'App\\Models\\Transaction', 27, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Internet\",\"amount\":\"150\",\"fee\":0,\"total\":150,\"balance_before\":\"1300.00\",\"balance_after\":\"1150.00\"}', NULL, NULL, '2025-07-28 05:48:22', '2025-07-28 05:48:22'),
(56, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"2000.00\"},\"old\":{\"balance\":\"1150.00\"}}', NULL, 'updated', '2025-07-28 05:49:01', '2025-07-28 05:49:01'),
(57, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 28, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"850\",\"balance_before\":\"1150.00\",\"balance_after\":\"2000.00\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 05:49:01', '2025-07-28 05:49:01'),
(58, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1800.00\"},\"old\":{\"balance\":\"2000.00\"}}', NULL, 'updated', '2025-07-28 05:49:10', '2025-07-28 05:49:10'),
(59, 'default', 'Paid Internet bill', 'App\\Models\\Transaction', 29, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Internet\",\"amount\":\"200\",\"fee\":0,\"total\":200,\"balance_before\":\"2000.00\",\"balance_after\":\"1800.00\"}', NULL, NULL, '2025-07-28 05:49:10', '2025-07-28 05:49:10'),
(60, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1500.00\"},\"old\":{\"balance\":\"1800.00\"}}', NULL, 'updated', '2025-07-28 05:49:22', '2025-07-28 05:49:22'),
(61, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1009.30\"},\"old\":{\"balance\":\"709.30\"}}', NULL, 'updated', '2025-07-28 05:49:22', '2025-07-28 05:49:22'),
(62, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 30, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"300\",\"balance_before\":\"1800.00\",\"balance_after\":\"1500.00\"}', NULL, NULL, '2025-07-28 05:49:22', '2025-07-28 05:49:22'),
(63, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 31, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"300\",\"balance_before\":\"709.30\",\"balance_after\":\"1009.30\"}', NULL, NULL, '2025-07-28 05:49:22', '2025-07-28 05:49:22'),
(64, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1455.00\"},\"old\":{\"balance\":\"1500.00\"}}', NULL, 'updated', '2025-07-28 05:50:44', '2025-07-28 05:50:44'),
(65, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1054.30\"},\"old\":{\"balance\":\"1009.30\"}}', NULL, 'updated', '2025-07-28 05:50:44', '2025-07-28 05:50:44'),
(66, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 32, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"45\",\"balance_before\":\"1500.00\",\"balance_after\":\"1455.00\"}', NULL, NULL, '2025-07-28 05:50:44', '2025-07-28 05:50:44'),
(67, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 33, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"45\",\"balance_before\":\"1009.30\",\"balance_after\":\"1054.30\"}', NULL, NULL, '2025-07-28 05:50:44', '2025-07-28 05:50:44'),
(68, 'default', 'Payment attempt failed due to insufficient funds', NULL, NULL, 'App\\Models\\User', 2, '{\"event\":\"failed_payment\",\"biller\":\"Internet\",\"amount\":\"2000\",\"fee\":0,\"required\":2000,\"current_balance\":\"1455.00\"}', NULL, NULL, '2025-07-28 05:51:00', '2025-07-28 05:51:00'),
(69, 'default', 'Transfer failed due to insufficient funds', NULL, NULL, 'App\\Models\\User', 2, '{\"event\":\"failed_transfer\",\"recipient\":\"test@gmail.com\",\"amount\":\"5000\",\"balance\":\"1455.00\"}', NULL, NULL, '2025-07-28 05:51:13', '2025-07-28 05:51:13'),
(70, 'default', 'Transfer failed due to insufficient funds', NULL, NULL, 'App\\Models\\User', 2, '{\"event\":\"failed_transfer\",\"recipient\":\"test@gmail.com\",\"amount\":\"1500\",\"balance\":\"1455.00\"}', NULL, NULL, '2025-07-28 05:51:24', '2025-07-28 05:51:24'),
(71, 'default', 'Payment attempt failed due to insufficient funds', NULL, NULL, 'App\\Models\\User', 2, '{\"event\":\"failed_payment\",\"biller\":\"Water\",\"amount\":\"5000\",\"fee\":250,\"required\":5250,\"current_balance\":\"1455.00\"}', NULL, NULL, '2025-07-28 05:51:35', '2025-07-28 05:51:35'),
(72, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6455.00\"},\"old\":{\"balance\":\"1455.00\"}}', NULL, 'updated', '2025-07-28 05:51:44', '2025-07-28 05:51:44'),
(73, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 34, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"5000\",\"balance_before\":\"1455.00\",\"balance_after\":\"6455.00\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 05:51:44', '2025-07-28 05:51:44'),
(74, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6520.00\"},\"old\":{\"balance\":\"6455.00\"}}', NULL, 'updated', '2025-07-28 11:25:16', '2025-07-28 11:25:16'),
(75, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 35, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"65\",\"balance_before\":\"6455.00\",\"balance_after\":\"6520.00\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 11:25:16', '2025-07-28 11:25:16'),
(76, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6600.00\"},\"old\":{\"balance\":\"6520.00\"}}', NULL, 'updated', '2025-07-28 11:25:29', '2025-07-28 11:25:29'),
(77, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 36, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"80\",\"balance_before\":\"6520.00\",\"balance_after\":\"6600.00\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 11:25:29', '2025-07-28 11:25:29'),
(78, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6566.00\"},\"old\":{\"balance\":\"6600.00\"}}', NULL, 'updated', '2025-07-28 11:51:17', '2025-07-28 11:51:17'),
(79, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1088.30\"},\"old\":{\"balance\":\"1054.30\"}}', NULL, 'updated', '2025-07-28 11:51:17', '2025-07-28 11:51:17'),
(80, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 37, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"34\",\"balance_before\":\"6600.00\",\"balance_after\":\"6566.00\"}', NULL, NULL, '2025-07-28 11:51:17', '2025-07-28 11:51:17'),
(81, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 38, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"34\",\"balance_before\":\"1054.30\",\"balance_after\":\"1088.30\"}', NULL, NULL, '2025-07-28 11:51:17', '2025-07-28 11:51:17'),
(82, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6521.00\"},\"old\":{\"balance\":\"6566.00\"}}', NULL, 'updated', '2025-07-28 11:52:15', '2025-07-28 11:52:15'),
(83, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1133.30\"},\"old\":{\"balance\":\"1088.30\"}}', NULL, 'updated', '2025-07-28 11:52:15', '2025-07-28 11:52:15'),
(84, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 39, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"45\",\"balance_before\":\"6566.00\",\"balance_after\":\"6521.00\"}', NULL, NULL, '2025-07-28 11:52:15', '2025-07-28 11:52:15'),
(85, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 40, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"45\",\"balance_before\":\"1088.30\",\"balance_after\":\"1133.30\"}', NULL, NULL, '2025-07-28 11:52:15', '2025-07-28 11:52:15'),
(86, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6468.50\"},\"old\":{\"balance\":\"6521.00\"}}', NULL, 'updated', '2025-07-28 11:53:50', '2025-07-28 11:53:50'),
(87, 'default', 'Paid Water bill', 'App\\Models\\Transaction', 41, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Water\",\"amount\":\"50\",\"fee\":2.5,\"total\":52.5,\"balance_before\":\"6521.00\",\"balance_after\":\"6468.50\"}', NULL, NULL, '2025-07-28 11:53:50', '2025-07-28 11:53:50'),
(88, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6213.50\"},\"old\":{\"balance\":\"6468.50\"}}', NULL, 'updated', '2025-07-28 12:01:33', '2025-07-28 12:01:33'),
(89, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1388.30\"},\"old\":{\"balance\":\"1133.30\"}}', NULL, 'updated', '2025-07-28 12:01:33', '2025-07-28 12:01:33'),
(90, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 42, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"255\",\"balance_before\":\"6468.50\",\"balance_after\":\"6213.50\"}', NULL, NULL, '2025-07-28 12:01:33', '2025-07-28 12:01:33'),
(91, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 43, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"255\",\"balance_before\":\"1133.30\",\"balance_after\":\"1388.30\"}', NULL, NULL, '2025-07-28 12:01:33', '2025-07-28 12:01:33'),
(92, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"6000.50\"},\"old\":{\"balance\":\"6213.50\"}}', NULL, 'updated', '2025-07-28 12:01:44', '2025-07-28 12:01:44'),
(93, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1601.30\"},\"old\":{\"balance\":\"1388.30\"}}', NULL, 'updated', '2025-07-28 12:01:44', '2025-07-28 12:01:44'),
(94, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 44, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"213\",\"balance_before\":\"6213.50\",\"balance_after\":\"6000.50\"}', NULL, NULL, '2025-07-28 12:01:44', '2025-07-28 12:01:44'),
(95, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 45, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"213\",\"balance_before\":\"1388.30\",\"balance_after\":\"1601.30\"}', NULL, NULL, '2025-07-28 12:01:44', '2025-07-28 12:01:44'),
(96, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"4900.50\"},\"old\":{\"balance\":\"6000.50\"}}', NULL, 'updated', '2025-07-28 12:01:55', '2025-07-28 12:01:55'),
(97, 'default', 'Paid Electricity bill', 'App\\Models\\Transaction', 46, 'App\\Models\\User', 2, '{\"event\":\"payment_processed\",\"biller\":\"Electricity\",\"amount\":\"1000\",\"fee\":100,\"total\":1100,\"balance_before\":\"6000.50\",\"balance_after\":\"4900.50\"}', NULL, NULL, '2025-07-28 12:01:55', '2025-07-28 12:01:55'),
(98, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"4875.50\"},\"old\":{\"balance\":\"4900.50\"}}', NULL, 'updated', '2025-07-28 12:02:06', '2025-07-28 12:02:06'),
(99, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"1626.30\"},\"old\":{\"balance\":\"1601.30\"}}', NULL, 'updated', '2025-07-28 12:02:06', '2025-07-28 12:02:06'),
(100, 'default', 'Transfer sent to test', 'App\\Models\\Transaction', 47, 'App\\Models\\User', 2, '{\"event\":\"funds_sent\",\"recipient\":\"test@gmail.com\",\"amount\":\"25\",\"balance_before\":\"4900.50\",\"balance_after\":\"4875.50\"}', NULL, NULL, '2025-07-28 12:02:06', '2025-07-28 12:02:06'),
(101, 'default', 'Transfer received from test2', 'App\\Models\\Transaction', 48, 'App\\Models\\User', 2, '{\"event\":\"funds_received\",\"sender\":\"test2@gmail.com\",\"amount\":\"25\",\"balance_before\":\"1601.30\",\"balance_after\":\"1626.30\"}', NULL, NULL, '2025-07-28 12:02:06', '2025-07-28 12:02:06'),
(102, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"balance\":\"4995.50\"},\"old\":{\"balance\":\"4875.50\"}}', NULL, 'updated', '2025-07-28 12:03:18', '2025-07-28 12:03:18'),
(103, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 49, 'App\\Models\\User', 2, '{\"event\":\"topup_processed\",\"amount\":\"120\",\"balance_before\":\"4875.50\",\"balance_after\":\"4995.50\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 12:03:18', '2025-07-28 12:03:18'),
(104, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"balance\":\"1746.30\"},\"old\":{\"balance\":\"1626.30\"}}', NULL, 'updated', '2025-07-28 12:13:19', '2025-07-28 12:13:19'),
(105, 'default', 'Account top-up completed', 'App\\Models\\Transaction', 50, 'App\\Models\\User', 1, '{\"event\":\"topup_processed\",\"amount\":\"120\",\"balance_before\":\"1626.30\",\"balance_after\":\"1746.30\",\"method\":\"manual\"}', NULL, NULL, '2025-07-28 12:13:19', '2025-07-28 12:13:19'),
(106, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"balance\":\"1730.55\"},\"old\":{\"balance\":\"1746.30\"}}', NULL, 'updated', '2025-07-28 12:13:30', '2025-07-28 12:13:30'),
(107, 'default', 'Paid Water bill', 'App\\Models\\Transaction', 51, 'App\\Models\\User', 1, '{\"event\":\"payment_processed\",\"biller\":\"Water\",\"amount\":\"15\",\"fee\":0.75,\"total\":15.75,\"balance_before\":\"1746.30\",\"balance_after\":\"1730.55\"}', NULL, NULL, '2025-07-28 12:13:30', '2025-07-28 12:13:30'),
(108, 'user_activities', 'User test@gmail.com was updated', 'App\\Models\\User', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"balance\":\"1682.55\"},\"old\":{\"balance\":\"1730.55\"}}', NULL, 'updated', '2025-07-28 12:13:38', '2025-07-28 12:13:38'),
(109, 'user_activities', 'User test2@gmail.com was updated', 'App\\Models\\User', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"balance\":\"5043.50\"},\"old\":{\"balance\":\"4995.50\"}}', NULL, 'updated', '2025-07-28 12:13:38', '2025-07-28 12:13:38'),
(110, 'default', 'Transfer sent to test2', 'App\\Models\\Transaction', 52, 'App\\Models\\User', 1, '{\"event\":\"funds_sent\",\"recipient\":\"test2@gmail.com\",\"amount\":\"48\",\"balance_before\":\"1730.55\",\"balance_after\":\"1682.55\"}', NULL, NULL, '2025-07-28 12:13:38', '2025-07-28 12:13:38'),
(111, 'default', 'Transfer received from test', 'App\\Models\\Transaction', 53, 'App\\Models\\User', 1, '{\"event\":\"funds_received\",\"sender\":\"test@gmail.com\",\"amount\":\"48\",\"balance_before\":\"4995.50\",\"balance_after\":\"5043.50\"}', NULL, NULL, '2025-07-28 12:13:38', '2025-07-28 12:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_28_100140_add_balance_to_users_table', 2),
(5, '2025_07_28_100311_create_transactions_table', 3),
(6, '2025_07_28_100341_create_billers_table', 3),
(7, '2025_07_28_103837_create_activity_log_table', 4),
(8, '2025_07_28_104421_add_event_to_activity_log_table', 5);

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
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('R7jMgOAseEGTAG60jiMnDwUmUXaS35n5AJIJfumm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNEtzS2d1QWVGU1F0OTZ1amxKdkdRdTYzQ1E1czFUNk15UGpWSVZHdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1753707546),
('XqelKETYtu7XRfPxfGAVPOrpczjCu3R8W1imIrt3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSlZEenZSYVlyTHQxYUlkNHNSMkJaM2xkZ0JyRVdnZnNaSE5HRUZ5USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fX0=', 1753707459);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `related_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `type`, `amount`, `description`, `related_user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'topup', 343.00, 'Account Top-up', NULL, '2025-07-28 05:22:18', '2025-07-28 05:22:18'),
(2, 2, 'topup', 113.00, 'Account Top-up', NULL, '2025-07-28 05:23:40', '2025-07-28 05:23:40'),
(3, 2, 'transfer', 34.00, 'Transfer to test', 1, '2025-07-28 05:24:57', '2025-07-28 05:24:57'),
(4, 1, 'transfer', 34.00, 'Transfer from test2', 2, '2025-07-28 05:24:57', '2025-07-28 05:24:57'),
(5, 2, 'topup', 34.00, 'Account Top-up', NULL, '2025-07-28 05:26:23', '2025-07-28 05:26:23'),
(6, 2, 'transfer', 5.00, 'Transfer to test', 1, '2025-07-28 05:26:46', '2025-07-28 05:26:46'),
(7, 1, 'transfer', 5.00, 'Transfer from test2', 2, '2025-07-28 05:26:46', '2025-07-28 05:26:46'),
(8, 2, 'payment', 55.00, 'Payment to Electricity', NULL, '2025-07-28 05:32:55', '2025-07-28 05:32:55'),
(9, 2, 'payment', 110.00, 'Payment to Electricity', NULL, '2025-07-28 05:36:02', '2025-07-28 05:36:02'),
(10, 2, 'payment', 105.00, 'Payment to Water', NULL, '2025-07-28 05:36:15', '2025-07-28 05:36:15'),
(11, 2, 'topup', 775.00, 'Account Top-up', NULL, '2025-07-28 05:42:25', '2025-07-28 05:42:25'),
(12, 2, 'payment', 110.00, 'Payment to Electricity', NULL, '2025-07-28 05:42:44', '2025-07-28 05:42:44'),
(13, 2, 'transfer', 150.00, 'Transfer to test', 1, '2025-07-28 05:42:59', '2025-07-28 05:42:59'),
(14, 1, 'transfer', 150.00, 'Transfer from test2', 2, '2025-07-28 05:42:59', '2025-07-28 05:42:59'),
(15, 2, 'payment', 385.00, 'Payment to Electricity', NULL, '2025-07-28 05:43:10', '2025-07-28 05:43:10'),
(16, 2, 'payment', 500.00, 'Payment to Internet', NULL, '2025-07-28 05:43:33', '2025-07-28 05:43:33'),
(17, 2, 'transfer', 50.00, 'Transfer to test', 1, '2025-07-28 05:44:35', '2025-07-28 05:44:35'),
(18, 1, 'transfer', 50.00, 'Transfer from test2', 2, '2025-07-28 05:44:35', '2025-07-28 05:44:35'),
(19, 2, 'topup', 200.00, 'Account Top-up', NULL, '2025-07-28 05:44:42', '2025-07-28 05:44:42'),
(20, 2, 'payment', 27.50, 'Payment to Electricity', NULL, '2025-07-28 05:45:32', '2025-07-28 05:45:32'),
(21, 2, 'payment', 79.20, 'Payment to Electricity', NULL, '2025-07-28 05:47:34', '2025-07-28 05:47:34'),
(22, 2, 'topup', 7.00, 'Account Top-up', NULL, '2025-07-28 05:47:49', '2025-07-28 05:47:49'),
(23, 2, 'transfer', 100.00, 'Transfer to test', 1, '2025-07-28 05:47:58', '2025-07-28 05:47:58'),
(24, 1, 'transfer', 100.00, 'Transfer from test2', 2, '2025-07-28 05:47:58', '2025-07-28 05:47:58'),
(25, 2, 'transfer', 0.30, 'Transfer to test', 1, '2025-07-28 05:48:09', '2025-07-28 05:48:09'),
(26, 1, 'transfer', 0.30, 'Transfer from test2', 2, '2025-07-28 05:48:09', '2025-07-28 05:48:09'),
(27, 2, 'payment', 150.00, 'Payment to Internet', NULL, '2025-07-28 05:48:22', '2025-07-28 05:48:22'),
(28, 2, 'topup', 850.00, 'Account Top-up', NULL, '2025-07-28 05:49:01', '2025-07-28 05:49:01'),
(29, 2, 'payment', 200.00, 'Payment to Internet', NULL, '2025-07-28 05:49:10', '2025-07-28 05:49:10'),
(30, 2, 'transfer', 300.00, 'Transfer to test', 1, '2025-07-28 05:49:22', '2025-07-28 05:49:22'),
(31, 1, 'transfer', 300.00, 'Transfer from test2', 2, '2025-07-28 05:49:22', '2025-07-28 05:49:22'),
(32, 2, 'transfer', 45.00, 'Transfer to test', 1, '2025-07-28 05:50:44', '2025-07-28 05:50:44'),
(33, 1, 'transfer', 45.00, 'Transfer from test2', 2, '2025-07-28 05:50:44', '2025-07-28 05:50:44'),
(34, 2, 'topup', 5000.00, 'Account Top-up', NULL, '2025-07-28 05:51:44', '2025-07-28 05:51:44'),
(35, 2, 'topup', 65.00, 'Account Top-up', NULL, '2025-07-28 11:25:16', '2025-07-28 11:25:16'),
(36, 2, 'topup', 80.00, 'Account Top-up', NULL, '2025-07-28 11:25:29', '2025-07-28 11:25:29'),
(37, 2, 'transfer', 34.00, 'Transfer to test', 1, '2025-07-28 11:51:17', '2025-07-28 11:51:17'),
(38, 1, 'transfer', 34.00, 'Transfer from test2', 2, '2025-07-28 11:51:17', '2025-07-28 11:51:17'),
(39, 2, 'transfer', 45.00, 'Transfer to test', 1, '2025-07-28 11:52:15', '2025-07-28 11:52:15'),
(40, 1, 'transfer', 45.00, 'Transfer from test2', 2, '2025-07-28 11:52:15', '2025-07-28 11:52:15'),
(41, 2, 'payment', 52.50, 'Payment to Water', NULL, '2025-07-28 11:53:50', '2025-07-28 11:53:50'),
(42, 2, 'transfer', 255.00, 'Transfer to test', 1, '2025-07-28 12:01:33', '2025-07-28 12:01:33'),
(43, 1, 'transfer', 255.00, 'Transfer from test2', 2, '2025-07-28 12:01:33', '2025-07-28 12:01:33'),
(44, 2, 'transfer', 213.00, 'Transfer to test', 1, '2025-07-28 12:01:44', '2025-07-28 12:01:44'),
(45, 1, 'transfer', 213.00, 'Transfer from test2', 2, '2025-07-28 12:01:44', '2025-07-28 12:01:44'),
(46, 2, 'payment', 1100.00, 'Payment to Electricity', NULL, '2025-07-28 12:01:55', '2025-07-28 12:01:55'),
(47, 2, 'transfer', 25.00, 'Transfer to test', 1, '2025-07-28 12:02:06', '2025-07-28 12:02:06'),
(48, 1, 'transfer', 25.00, 'Transfer from test2', 2, '2025-07-28 12:02:06', '2025-07-28 12:02:06'),
(49, 2, 'topup', 120.00, 'Account Top-up', NULL, '2025-07-28 12:03:18', '2025-07-28 12:03:18'),
(50, 1, 'topup', 120.00, 'Account Top-up', NULL, '2025-07-28 12:13:19', '2025-07-28 12:13:19'),
(51, 1, 'payment', 15.75, 'Payment to Water', NULL, '2025-07-28 12:13:30', '2025-07-28 12:13:30'),
(52, 1, 'transfer', 48.00, 'Transfer to test2', 2, '2025-07-28 12:13:38', '2025-07-28 12:13:38'),
(53, 2, 'transfer', 48.00, 'Transfer from test', 1, '2025-07-28 12:13:38', '2025-07-28 12:13:38');

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
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `balance`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@gmail.com', NULL, '$2y$12$wyCi5VF5T7c3zAoPNQuD7eXLNMp8o0EpixYwstTum7PAm1N4joDd6', 1682.55, NULL, '2025-07-28 05:00:34', '2025-07-28 12:13:38'),
(2, 'test2', 'test2@gmail.com', NULL, '$2y$12$egrfQ78hAN4qqEgtr.4ZiecaEIytwPXJvwwL6Z.wScWD7beAUBxyK', 5043.50, NULL, '2025-07-28 05:10:16', '2025-07-28 12:13:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_related_user_id_foreign` (`related_user_id`);

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
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_related_user_id_foreign` FOREIGN KEY (`related_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
