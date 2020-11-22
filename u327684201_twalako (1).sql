-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 22, 2020 at 02:02 AM
-- Server version: 10.4.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u327684201_twalako`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_trips`
--

CREATE TABLE `active_trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `car_brand_id` bigint(20) UNSIGNED NOT NULL,
  `car_model_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `car_type_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `license_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `driver_id`, `car_brand_id`, `car_model_id`, `color_id`, `car_type_id`, `slug`, `year`, `license_plate`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 3, 3, 3, '-1', 2012, 'UBB 447Y', 1, '2020-09-25 00:18:09', '2020-09-25 00:18:09'),
(3, 3, 1, 2, 3, 5, '-2', 2010, 'UBB 378E', 1, '2020-10-11 17:51:58', '2020-10-11 17:51:58'),
(4, 4, 1, 2, 1, 3, '-3', 2002, 'UBB263E ', 1, '2020-10-11 21:43:01', '2020-10-11 21:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `car_brands`
--

CREATE TABLE `car_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_brands`
--

INSERT INTO `car_brands` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Toyota', 'toyota', '2019-11-21 12:13:40', '2019-11-21 12:13:40'),
(2, 'Audi', 'audi', '2019-11-21 12:13:55', '2019-11-21 12:13:55'),
(3, 'Ford', 'ford', '2019-11-21 12:14:06', '2019-11-21 12:14:06'),
(4, 'Isuzu', 'isuzu', '2019-11-21 12:30:48', '2019-11-21 12:30:48'),
(5, 'Mitsubishi', 'mitsubishi', '2019-11-21 12:31:05', '2019-11-21 12:31:05'),
(6, 'Mercedes Benz', 'mercedes-benz', '2019-12-29 09:09:29', '2019-12-29 09:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `car_models`
--

CREATE TABLE `car_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_models`
--

INSERT INTO `car_models` (`id`, `name`, `slug`, `car_brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Corona', 'corona', 1, '2019-11-21 12:23:10', '2019-11-21 12:23:10'),
(2, 'Noah', 'noah', 1, '2019-11-21 12:24:08', '2019-11-21 12:24:08'),
(3, 'Wish', 'wish', 1, '2019-11-21 12:24:23', '2019-11-21 12:24:23'),
(4, 'Hiace', 'hiace', 1, '2019-11-21 12:25:10', '2019-11-21 12:25:10'),
(5, 'Camry', 'camry', 1, '2019-11-21 12:25:46', '2019-11-21 12:25:46'),
(6, 'Pajero IO', 'pajero-io', 5, '2019-11-21 12:34:35', '2019-11-21 12:34:35'),
(7, 'Pajero', 'pajero', 5, '2019-11-21 12:35:21', '2019-11-21 12:35:21'),
(8, 'Outlander', 'outlander', 5, '2019-11-21 12:36:04', '2019-11-21 12:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `car_types`
--

CREATE TABLE `car_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_types`
--

INSERT INTO `car_types` (`id`, `name`, `slug`, `seats`, `created_at`, `updated_at`) VALUES
(1, 'Sedan', 'sedan', 4, '2019-11-27 06:17:18', '2019-11-27 06:17:18'),
(2, 'SUV', 'suv', 4, '2019-11-27 06:18:22', '2019-11-27 06:18:22'),
(3, 'Hatchback', 'hatchback', 4, '2019-11-27 06:18:44', '2019-11-27 06:18:44'),
(4, 'Pickup', 'pickup', 4, '2019-11-27 06:20:58', '2019-11-27 06:20:58'),
(5, 'Van', 'van', 7, '2019-11-27 06:22:28', '2019-11-27 06:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `email`, `phone_no`, `slug`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Evans', 'Busobozi', 'evarnel7@gmail.com', '+256785859163', 'evans-busobozi', '$2y$10$XzA5BEdkr0D.vJmER1aAEu7bhwIJMZitJWE14D8BrXLg.JGE07W1K', 1, '2020-09-22 02:39:01', '2020-10-11 21:04:20'),
(2, 'Jane', 'Doe', 'janedoe@gmail.com', '+256706551564', 'jane-doe', '$2y$10$RwE2.Nhy648fUg89knk0bu0gjiw58pcK5TC2hxhESHRIhw4CS9k1G', 1, '2020-09-24 16:35:17', '2020-09-24 17:47:04'),
(3, 'Andrew ', 'Bukenya ', 'andrewf.bukenya@gmail.com', '+256772122640', 'andrew-bukenya', '$2y$10$H/wrn9iS0pdV89nT74KuX.zOABPjwHO05k5x5Ya9x5ZdziOa6NOPe', 1, '2020-10-06 04:08:44', '2020-10-06 04:09:05'),
(4, 'Allan', 'Lule', 'allan1.lule@gmail.com', '+256702201357', 'allan-lule', '$2y$10$RyJkvCwvKN.f2qJNlt8vWOsJT8v0EySzZI0AVkxgEz.qi7cJ5k50.', 1, '2020-10-06 15:19:28', '2020-10-06 15:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `client_wallets`
--

CREATE TABLE `client_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_wallets`
--

INSERT INTO `client_wallets` (`id`, `client_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, '100.00', '2020-09-22 02:39:01', '2020-10-07 13:34:38'),
(2, 2, '0.00', '2020-09-24 16:35:17', '2020-09-24 16:35:17'),
(3, 3, '5000.00', '2020-10-06 04:08:44', '2020-10-06 04:13:01'),
(4, 4, '500.00', '2020-10-06 15:19:28', '2020-10-06 15:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Red', 'red', '2019-11-21 12:07:30', '2019-11-21 12:07:30'),
(2, 'Blue', 'blue', '2019-11-21 12:08:14', '2019-11-21 12:08:14'),
(3, 'Grey', 'grey', '2019-11-21 12:08:23', '2019-11-21 12:08:23'),
(4, 'White', 'white', '2019-11-21 12:08:41', '2019-11-21 12:08:41'),
(5, 'Black', 'black', '2019-11-21 12:09:07', '2019-11-21 12:09:07'),
(6, 'Green', 'green', '2019-11-21 12:09:23', '2019-11-21 12:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `license_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `license_no`, `license_photo`, `license_class`, `id_no`, `id_photo`, `driver_id`, `created_at`, `updated_at`) VALUES
(2, '45272836378', 'e8ae38a7425134bd00bb69148c22f060.jpg', 'B', 'rgdjdishsjwh', 'df029df34d8d554a1c705e7bc52a1de2.jpg', 2, '2020-09-25 00:18:09', '2020-09-25 00:18:09'),
(3, '356r44ry7888', '7e27edbcf4d826899e8c40296e23d684.jpg', 'B', 'CM92025101F5LJ', '6c71519c626d5bd1488c253e4a639114.jpg', 3, '2020-10-11 17:51:58', '2020-10-11 17:51:58'),
(4, '8606161714860', 'c6d9e981bb59602d95671758e5a41c6f.jpg', 'B', 'CM86012105LP9F', 'ad7b5102137e8ccd1220bb9693e0c18d.jpg', 4, '2020-10-11 21:43:01', '2020-10-11 21:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `firstname`, `lastname`, `email`, `phone_no`, `photo`, `slug`, `password`, `status`, `created_at`, `updated_at`) VALUES
(2, 'John', 'Doe', 'johndoe@gmail.com', '+256785859163', '9ed8f030f4622972e07b6d6717899470.jpg', 'john-doe', '$2y$10$lWQHKmBBtfhr/.S0armGoOWxOCjHc5K7BG6eSrMnJLFbEUMAerteS', 1, '2020-09-25 00:18:09', '2020-09-25 00:18:22'),
(3, 'John', 'Doe', 'johndoe1@email.com', '+256706551564', 'e4637d46320fd087f691d479e1957c29.jpg', 'john-doe-1', '$2y$10$QrSOgBUMyTW6//BNSsNsye3tPu9H8YiHVHj0zdAz1UJIc6uVVkZn.', 1, '2020-10-11 17:51:58', '2020-10-11 17:51:58'),
(4, 'Andrew ', 'Bukenya ', 'andrewf.bukenya@gmail.com', '+256704382291', '950ec4ba3ea68745e0547ac5ebdd2ddc.jpg', 'andrew-bukenya', '$2y$10$OAoPI8uJcnwilnWO5l6fLuYKWu5VrFamqRkXaLtWKoqMmwA/JYoSy', 1, '2020-10-11 21:42:55', '2020-10-11 21:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `driver_ratings`
--

CREATE TABLE `driver_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `rating` bigint(20) UNSIGNED NOT NULL,
  `review` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_ratings`
--

INSERT INTO `driver_ratings` (`id`, `driver_id`, `client_id`, `trip_id`, `rating`, `review`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 5, 'Excellent work, thank you.', '2020-09-28 14:43:47', '2020-09-28 14:43:47'),
(2, 2, 1, 3, 4, 'Thanks for the great service.', '2020-09-28 23:30:50', '2020-09-28 23:30:50'),
(3, 2, 1, 4, 3, 'Thank you for the nice work.', '2020-09-29 00:05:35', '2020-09-29 00:05:35'),
(4, 2, 1, 5, 4, 'Thanks for the professional driving.', '2020-09-29 00:21:24', '2020-09-29 00:21:24'),
(5, 2, 1, 10, 5, 'Great work', '2020-10-02 05:37:14', '2020-10-02 05:37:14'),
(6, 2, 1, 11, 4, 'Thanks for the good work.', '2020-10-02 05:59:42', '2020-10-02 05:59:42'),
(7, 2, 1, 14, 4, 'Excellent ', '2020-10-03 02:32:53', '2020-10-03 02:32:53'),
(8, 2, 1, 15, 4, 'Good work', '2020-10-03 02:48:43', '2020-10-03 02:48:43'),
(9, 2, 1, 16, 5, 'Great servive', '2020-10-03 03:04:04', '2020-10-03 03:04:04'),
(10, 2, 1, 17, 2, 'Bad attitude', '2020-10-03 03:21:32', '2020-10-03 03:21:32'),
(11, 2, 1, 18, 1, 'Incompetent ', '2020-10-03 03:31:24', '2020-10-03 03:31:24'),
(12, 2, 1, 19, 3, 'Thank you for the service ', '2020-10-03 03:34:46', '2020-10-03 03:34:46'),
(13, 2, 1, 20, 4, 'Good work', '2020-10-03 05:00:10', '2020-10-03 05:00:10'),
(14, 2, 1, 21, 4, 'Thanks for the ride.', '2020-10-03 05:30:47', '2020-10-03 05:30:47'),
(15, 2, 1, 23, 5, 'Thanks for the nice treatment.', '2020-10-07 13:07:45', '2020-10-07 13:07:45'),
(16, 2, 1, 24, 4, 'Excellent job', '2020-10-07 13:35:00', '2020-10-07 13:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `driver_wallets`
--

CREATE TABLE `driver_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_wallets`
--

INSERT INTO `driver_wallets` (`id`, `driver_id`, `amount`, `created_at`, `updated_at`) VALUES
(2, 2, '8800.00', '2020-09-25 00:18:09', '2020-10-07 13:34:38'),
(3, 3, '0.00', '2020-10-11 17:51:58', '2020-10-11 17:51:58'),
(4, 4, '0.00', '2020-10-11 21:43:01', '2020-10-11 21:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_lat` double NOT NULL,
  `origin_lng` double NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dest_lat` double NOT NULL,
  `dest_lng` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `driver_id`, `origin`, `origin_lat`, `origin_lng`, `destination`, `dest_lat`, `dest_lng`, `status`, `created_at`, `updated_at`) VALUES
(18, 4, 'MPERERWE TRADING CENTRE, Kampala, Uganda', 0.3798362, 32.5769, 'Cairo International Bank, Kampala Road, Kampala, Uganda', 0.3131869, 32.5801342, 1, '2020-10-14 08:49:22', '2020-10-14 08:49:22'),
(19, 2, 'MPERERWE TRADING CENTRE, Kampala, Uganda', 0.3798362, 32.5769, 'Gayaza -Kampala Road, Kampala, Uganda', 0.3920556, 32.5800253, 1, '2020-10-17 14:06:55', '2020-10-17 14:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `luggage`
--

CREATE TABLE `luggage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `luggage`
--

INSERT INTO `luggage` (`id`, `name`, `slug`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Suitcase', 'suitcase', 25, '500.00', '2019-11-25 08:49:09', '2019-11-25 08:49:09'),
(2, 'Sack', 'sack-50', 50, '800.00', '2019-11-25 11:08:21', '2019-11-25 11:08:21'),
(3, 'None', 'none', 0, '0.00', '2019-11-25 11:08:21', '2019-11-25 11:08:21');

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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tx_ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `tx_ref`, `name`, `phone_no`, `firstname`, `lastname`, `email`, `currency`, `amount`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TLKTREF-9pK7zmhieLyUm8InNA8Xq6vAz0FOUIxj-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '5800.00', 'DISBURSE FAILED: Insufficient funds in customer wallet', 'FAILED', '2020-09-27 04:15:21', '2020-09-27 04:15:21'),
(5, 'TLKTREF-3845bb78b68e207b581ff03188489259-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '52.00', 'Invalid amount- Amount less than 500', 'failed', '2020-09-27 04:49:05', '2020-09-27 04:49:40'),
(6, 'TLKTREF-FgtEZ23uUUJyNCpmLkxUzLFT8akPLXYy-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '5000.00', 'DISBURSE FAILED: Insufficient funds in customer wallet', 'FAILED', '2020-09-27 04:51:49', '2020-09-27 04:51:49'),
(7, 'TLKTREF-DL8Tz7pO5vYepOjz2vlFfClsFCDG1ycM-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '500.00', 'DISBURSE FAILED: Insufficient funds in customer wallet', 'FAILED', '2020-09-27 06:01:26', '2020-09-27 06:01:26'),
(8, 'TLKTREF-11db4c4262e59c232933758741f4d7e4-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '0.00', NULL, 'pending', '2020-09-27 16:47:20', '2020-09-27 16:47:20'),
(9, 'TLKTREF-63909950f8b01c3626c6eaa1a90c27f6-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'TARGET_AUTHORIZATION_ERROR', 'failed', '2020-09-28 13:49:51', '2020-09-28 13:51:38'),
(10, 'TLKTREF-96f572ff4af949eb946b98bbf22f44ca-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'TARGET_AUTHORIZATION_ERROR', 'failed', '2020-09-28 13:52:51', '2020-09-28 13:54:49'),
(11, 'TLKTREF-147298d6d30467293680c968f6aacaf6-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '2500.00', 'TARGET_AUTHORIZATION_ERROR', 'failed', '2020-09-28 13:59:57', '2020-09-28 14:01:36'),
(12, 'TLKTREF-a387bcfdf9d898ba4d82e53d7b55c394-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'TARGET_AUTHORIZATION_ERROR', 'failed', '2020-09-28 14:06:06', '2020-09-28 14:07:41'),
(13, 'TLKTREF-814644440d97f0ed81975e41574dc91f-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'TARGET_AUTHORIZATION_ERROR', 'failed', '2020-09-29 00:24:49', '2020-09-29 00:26:34'),
(14, 'TLKTREF-uj7jRRUyvHPCTgCJ6vHgyU0LX6UOx7hE-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '500.00', 'DISBURSE FAILED: Insufficient funds in customer wallet', 'FAILED', '2020-09-29 02:45:17', '2020-09-29 02:45:17'),
(15, 'TLKTREF-86ccc5b2e0c7d4621b294c83e06e75e0-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '1500.00', 'TARGET_AUTHORIZATION_ERROR', 'failed', '2020-09-29 15:22:19', '2020-09-29 15:23:39'),
(16, 'TLKTREF-6cefa44d610d6fa67f421433bd0b900e-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '1500.00', NULL, 'pending', '2020-09-30 22:44:32', '2020-09-30 22:44:32'),
(17, 'TLKTREF-1c03fe3a1fb252c55aabe13e16fa7d0c-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '1500.00', NULL, 'pending', '2020-09-30 23:10:07', '2020-09-30 23:10:07'),
(18, 'TLKTREF-a6178f49d1ca4a1efe09de3cd69b103d-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', NULL, 'pending', '2020-10-01 17:01:56', '2020-10-01 17:01:56'),
(19, 'TLKTREF-6a00be555891e755b37b45440f6767c3-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '2000.00', NULL, 'pending', '2020-10-01 20:43:45', '2020-10-01 20:43:45'),
(20, 'TLKTREF-GKdFVSzR0T1Tv7aG7noIbvZ0jTfgGc9I-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '500.00', 'Check Status Error: Missing fields in request', 'FAILED', '2020-10-01 20:53:37', '2020-10-01 20:53:37'),
(21, 'TLKTREF-cdfda2e99ec920dd777a2467618b5735-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '2000.00', NULL, 'pending', '2020-10-01 20:54:21', '2020-10-01 20:54:21'),
(22, 'TLKTREF-Ebdt0071W6TIGOxWYafPTdZAGmsaJO5G-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '500.00', 'Check Status Error: Missing fields in request', 'FAILED', '2020-10-01 21:04:30', '2020-10-01 21:04:30'),
(23, 'TLKTREF-c4e1a4103b231a761a60a4d442a652fb-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '2000.00', NULL, 'pending', '2020-10-01 21:23:37', '2020-10-01 21:23:37'),
(24, 'TLKTREF-QXl2TNp4ndvBrdIvz5q2e2wA0uXPq1e0-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '1000.00', 'Transaction was successful', 'SUCCESSFUL', '2020-10-02 14:18:10', '2020-10-02 14:18:10'),
(26, 'TLKTREF-2ad50765af64ec2b6d3f48a86f7e8219-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '3000.00', NULL, 'pending', '2020-10-02 14:23:39', '2020-10-02 14:23:39'),
(27, 'TLKTREF-973c08a45c41daefd5edd290d5971045-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '3000.00', NULL, 'pending', '2020-10-02 14:27:41', '2020-10-02 14:27:41'),
(28, 'TLKTREF-SureYG1n7vDvmFAcciQ8t0vmrvlQIAkr-X', 'Withdraw', '+256785859163', 'John', 'Doe', 'johndoe@gmail.com', 'UGX', '1000.00', 'Transaction was successful', 'SUCCESSFUL', '2020-10-02 14:53:27', '2020-10-02 14:53:27'),
(30, 'TLKTREF-06a4a27717e9859cd39cc5c672441e32-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '5000.00', NULL, 'pending', '2020-10-02 16:50:46', '2020-10-02 16:50:46'),
(31, 'TLKTREF-c5880361b91165bd349f3d03ec7a3c63-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '5000.00', NULL, 'pending', '2020-10-02 16:51:20', '2020-10-02 16:51:20'),
(32, 'TLKTREF-4f1b5403c17674e3791acd14462b3fbb-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '5000.00', NULL, 'pending', '2020-10-02 16:53:47', '2020-10-02 16:53:47'),
(33, 'TLKTREF-a223849cef44eb6d1f09910c3c7cbca5-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '5000.00', NULL, 'pending', '2020-10-02 22:52:18', '2020-10-02 22:52:18'),
(34, 'TLKTREF-b7325fb66a1955387280dd53310b7d41-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '5000.00', NULL, 'pending', '2020-10-03 17:38:10', '2020-10-03 17:38:10'),
(35, 'TLKTREF-4058357128c85f505f285e8d00215336-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', NULL, 'pending', '2020-10-03 18:46:36', '2020-10-03 18:46:36'),
(36, 'TLKTREF-3f5a15e564602cc6edd8e2e0201aee75-X', 'Top up', '+256772122640', 'Andrew ', 'Bukenya ', 'andrewf.bukenya@gmail.com', 'UGX', '5000.00', 'Approved Or Completed Successfully', 'successful', '2020-10-06 04:11:44', '2020-10-06 04:13:01'),
(37, 'TLKTREF-6ba2fe70f7c54a0192da5afdb694fd59-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'Timed out', 'failed', '2020-10-06 10:41:35', '2020-10-06 10:50:58'),
(38, 'TLKTREF-9586a9214788d775ec934084eb741476-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'Timed out', 'failed', '2020-10-06 14:31:50', '2020-10-06 14:40:49'),
(39, 'TLKTREF-65ead19130550d215bf111ce626354d8-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'Timed out', 'failed', '2020-10-06 14:38:50', '2020-10-06 14:53:53'),
(40, 'TLKTREF-c2f52f237a54eb1bcd404c2a4061a6e6-X', 'Top up', '+256785859163', 'Evans', 'Busobozi', 'evarnel7@gmail.com', 'UGX', '500.00', 'Timed out', 'failed', '2020-10-06 14:55:32', '2020-10-06 15:04:27'),
(41, 'TLKTREF-db3151828fe4a15075789efb5228613a-X', 'Top up', '+256702201357', 'Allan', 'Lule', 'allan1.lule@gmail.com', 'UGX', '2000.00', 'Timeout', 'failed', '2020-10-06 15:21:07', '2020-10-06 15:47:36'),
(42, 'TLKTREF-e34e79abcf70cf483ec5b87f5c90245e-X', 'Top up', '+256702201357', 'Allan', 'Lule', 'allan1.lule@gmail.com', 'UGX', '500.00', 'Approved Or Completed Successfully', 'successful', '2020-10-06 15:22:23', '2020-10-06 15:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_lat` double NOT NULL,
  `origin_lng` double NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dest_lat` double NOT NULL,
  `dest_lng` double NOT NULL,
  `travellers` int(11) NOT NULL,
  `luggage_id` bigint(20) UNSIGNED NOT NULL,
  `distance` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `client_id`, `driver_id`, `origin`, `origin_lat`, `origin_lng`, `destination`, `dest_lat`, `dest_lng`, `travellers`, `luggage_id`, `distance`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Wandegeya Market, Kampala, Uganda', 0.3302103, 32.5737441, 'Stretcher Road, Kampala, Uganda', 0.3423713, 32.6179826, 1, 3, 5, '1500.00', 'complete', '2020-09-28 14:37:01', '2020-10-02 03:51:36'),
(3, 1, 2, 'Kawempe-Tula Road, Kampala, Uganda', 0.3618281, 32.5721829, 'Makindye Military Baracks, Kampala, Uganda', 0.2885878, 32.5803992, 1, 3, 8, '2400.00', 'complete', '2020-09-28 15:58:05', '2020-09-28 22:14:26'),
(4, 1, 2, 'Youth Alive Uganda, Old Kira Road, Kampala, Uganda', 0.3446971, 32.5930595, 'Mulago Hospital, Kampala, Uganda', 0.3380637, 32.5761312, 1, 3, 2, '600.00', 'complete', '2020-09-29 00:03:23', '2020-09-29 00:03:23'),
(5, 1, 2, 'Makerere University Main Gate, Kampala, Uganda', 0.3291851, 32.5709892, 'Kibuye Market, Nkrumah Road, Kampala, Uganda', 0.2933887, 32.5717592, 1, 3, 4, '1200.00', 'complete', '2020-09-29 00:09:33', '2020-09-29 00:39:02'),
(7, 1, NULL, 'Kampala Road, Kampala, Uganda', 0.3133012, 32.5809105, 'Jinja Nile Resort, Jinja, Uganda', 0.4607637, 33.1761471, 1, 3, 68, '20400.00', 'cancelled', '2020-09-29 00:41:19', '2020-09-29 00:56:51'),
(8, 1, NULL, 'Youth Alive Uganda, Old Kira Road, Kampala, Uganda', 0.3446971, 32.5930595, 'Kasubi Market, Kampala, Uganda', 0.3329317, 32.5558343, 1, 3, 4, '1200.00', 'cancelled', '2020-09-29 00:58:23', '2020-09-29 01:13:52'),
(9, 1, NULL, 'Kamwokya Center, Kampala, Uganda', 0.343503, 32.5902501, 'Mulago Hospital, Kampala, Uganda', 0.3380637, 32.5761312, 1, 3, 2, '600.00', 'cancelled', '2020-09-29 01:14:48', '2020-09-29 01:15:35'),
(10, 1, 2, 'Kobil Kamwokya Service Station, Kampala, Uganda', 0.3423873, 32.5893116, 'Makerere Full Gospel Church, Sir Apollo Kaggwa Road, Kampala, Uganda', 0.3274444, 32.5655441, 1, 3, 3, '900.00', 'complete', '2020-09-29 02:48:16', '2020-10-02 05:16:44'),
(11, 1, 2, 'Youth Alive Uganda, Old Kira Road, Kampala, Uganda', 0.3446971, 32.5930595, 'Mulago Round About, Kampala, Uganda', 0.3338067, 32.5769927, 1, 3, 2, '600.00', 'complete', '2020-10-02 05:39:00', '2020-10-02 05:59:12'),
(12, 1, 2, 'Kobil Kamwokya Service Station, Kampala, Uganda', 0.3423873, 32.5893116, 'Wandegeya Market, Kampala, Uganda', 0.3302103, 32.5737441, 1, 3, 2, '600.00', 'cancelled', '2020-10-03 01:51:33', '2020-10-03 01:58:57'),
(13, 1, 2, 'Youth Alive Uganda, Old Kira Road, Kampala, Uganda', 0.3446971, 32.5930595, 'YMCA Kampala Branch, Wandegeya Road, Kampala, Uganda', 0.3283153, 32.5744481, 1, 3, 3, '900.00', 'cancelled', '2020-10-03 02:24:59', '2020-10-03 02:30:26'),
(14, 1, 2, 'Youth Alive Uganda, Old Kira Road, Kampala, Uganda', 0.3446971, 32.5930595, 'YMCA Kampala Branch, Wandegeya Road, Kampala, Uganda', 0.3283153, 32.5744481, 1, 3, 3, '900.00', 'complete', '2020-10-03 02:31:47', '2020-10-03 02:32:28'),
(15, 1, 2, 'Kobil Kamwokya Service Station, Kampala, Uganda', 0.3423873, 32.5893116, 'Mulago Round About, Kampala, Uganda', 0.3338067, 32.5769927, 1, 3, 2, '600.00', 'complete', '2020-10-03 02:47:42', '2020-10-03 02:48:00'),
(16, 1, 2, 'Wandegeya Market, Kampala, Uganda', 0.3302103, 32.5737441, 'Kalerwe Market, Kampala, Uganda', 0.3505552, 32.5716519, 1, 3, 2, '600.00', 'complete', '2020-10-03 03:02:44', '2020-10-03 03:03:12'),
(17, 1, 2, 'Mulago Hospital, Kampala, Uganda', 0.3380637, 32.5761312, 'Bwaise Round About, Kampala- Northern Bypass Highway, Kampala, Uganda', 0.3497892, 32.5629973, 1, 3, 2, '600.00', 'complete', '2020-10-03 03:14:06', '2020-10-03 03:14:26'),
(18, 1, 2, 'Mulago Hospital, Kampala, Uganda', 0.3380637, 32.5761312, 'Ntinda, Kamokya Taxi Stage, Stretcher Rd, Kampala, Uganda', 0.3342067, 32.6173246, 1, 3, 5, '1500.00', 'complete', '2020-10-03 03:22:38', '2020-10-03 03:23:07'),
(19, 1, 2, 'Bukoto Heights Apartments, Moyo Close, Kampala, Uganda', 0.3478024, 32.5943497, 'Nakawa Business Park, Kampala Rd, Kampala, Uganda', 0.3274198, 32.6123364, 1, 3, 3, '900.00', 'complete', '2020-10-03 03:33:26', '2020-10-03 03:33:52'),
(20, 1, 2, 'Kamwokya Center, Kampala, Uganda', 0.343503, 32.5902501, 'Nsambya Sharing Youth Center, Nsambya Road, Kampala, Uganda', 0.3035674, 32.58411, 1, 3, 4, '1200.00', 'complete', '2020-10-03 03:59:33', '2020-10-03 04:59:42'),
(21, 1, 2, 'CITY Oil Kamwokya Service Station, Kira Road, Kampala, Uganda', 0.3382961, 32.585463, 'Garden City Shopping Mall, Kampala, Uganda', 0.320358, 32.5910695, 1, 3, 2, '600.00', 'complete', '2020-10-03 05:29:50', '2020-10-03 05:30:22'),
(22, 3, NULL, 'Kampala Hospital, Kampala, Uganda', 0.3326896, 32.584661, 'MPERERWE TRADING CENTRE, Kampala, Uganda', 0.3798362, 32.5769, 2, 2, 5, '3800.00', 'cancelled', '2020-10-06 04:19:14', '2020-10-06 04:20:11'),
(23, 1, 2, 'Makindye Military Baracks, Kampala, Uganda', 0.2885878, 32.5803992, 'Kibuye Market, Nkrumah Road, Kampala, Uganda', 0.2933887, 32.5717592, 1, 3, 1, '300.00', 'complete', '2020-10-07 13:06:16', '2020-10-07 13:07:02'),
(24, 1, 2, 'Kawempe-Tula Road, Kampala, Uganda', 0.3618281, 32.5721829, 'Bwaise Round About, Kampala- Northern Bypass Highway, Kampala, Uganda', 0.3497892, 32.5629973, 1, 3, 2, '600.00', 'complete', '2020-10-07 13:34:08', '2020-10-07 13:34:38'),
(25, 3, 4, 'Mpererwe Super Market, Kampala, Uganda', 0.3809259, 32.5766442, 'Mapeera House, Kampala, Uganda', 0.314444, 32.578333, 1, 3, 7, '2100.00', 'cancelled', '2020-10-14 08:51:06', '2020-10-17 12:27:47'),
(26, 3, 4, 'MPERERWE TRADING CENTRE, Kampala, Uganda', 0.3798362, 32.5769, 'Gayaza -Kampala Road, Kampala, Uganda', 0.3920556, 32.5800253, 4, 2, 1, '2000.00', 'cancelled', '2020-10-17 13:59:01', '2020-10-17 14:04:44'),
(27, 3, 2, 'MPERERWE TRADING CENTRE, Kampala, Uganda', 0.3798362, 32.5769, 'Kasangati police station, Gayaza -Kampala Road, Kasangati, Uganda', 0.4391098, 32.6029709, 1, 1, 7, '2600.00', 'cancelled', '2020-10-17 14:18:59', '2020-10-18 11:19:51'),
(28, 3, NULL, 'MPERERWE TRADING CENTRE, Kampala, Uganda', 0.3798362, 32.5769, 'Cairo International Bank, Kampala Road, Kampala, Uganda', 0.3131869, 32.5801342, 2, 3, 7, '4200.00', 'cancelled', '2020-10-25 11:04:43', '2020-10-25 11:04:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_trips`
--
ALTER TABLE `active_trips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `active_trips_trip_id_unique` (`trip_id`),
  ADD KEY `active_trips_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cars_slug_unique` (`slug`),
  ADD UNIQUE KEY `cars_license_plate_unique` (`license_plate`),
  ADD KEY `cars_driver_id_foreign` (`driver_id`),
  ADD KEY `cars_car_brand_id_foreign` (`car_brand_id`),
  ADD KEY `cars_car_model_id_foreign` (`car_model_id`),
  ADD KEY `cars_color_id_foreign` (`color_id`),
  ADD KEY `cars_car_type_id_foreign` (`car_type_id`);

--
-- Indexes for table `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `car_brands_slug_unique` (`slug`);

--
-- Indexes for table `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `car_models_slug_unique` (`slug`),
  ADD KEY `car_models_car_brand_id_foreign` (`car_brand_id`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `car_types_slug_unique` (`slug`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `clients_slug_unique` (`slug`);

--
-- Indexes for table `client_wallets`
--
ALTER TABLE `client_wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_wallets_client_id_unique` (`client_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_slug_unique` (`slug`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documents_license_no_unique` (`license_no`),
  ADD UNIQUE KEY `documents_id_no_unique` (`id_no`),
  ADD KEY `documents_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drivers_email_unique` (`email`),
  ADD UNIQUE KEY `drivers_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `drivers_slug_unique` (`slug`);

--
-- Indexes for table `driver_ratings`
--
ALTER TABLE `driver_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_ratings_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_ratings_client_id_foreign` (`client_id`),
  ADD KEY `driver_ratings_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `driver_wallets`
--
ALTER TABLE `driver_wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `driver_wallets_driver_id_unique` (`driver_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locations_driver_id_unique` (`driver_id`);

--
-- Indexes for table `luggage`
--
ALTER TABLE `luggage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `luggage_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_tx_ref_unique` (`tx_ref`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_client_id_foreign` (`client_id`),
  ADD KEY `trips_driver_id_foreign` (`driver_id`),
  ADD KEY `trips_luggage_id_foreign` (`luggage_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_trips`
--
ALTER TABLE `active_trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `car_models`
--
ALTER TABLE `car_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_wallets`
--
ALTER TABLE `client_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_ratings`
--
ALTER TABLE `driver_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `driver_wallets`
--
ALTER TABLE `driver_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `luggage`
--
ALTER TABLE `luggage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_trips`
--
ALTER TABLE `active_trips`
  ADD CONSTRAINT `active_trips_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `active_trips_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_car_brand_id_foreign` FOREIGN KEY (`car_brand_id`) REFERENCES `car_brands` (`id`),
  ADD CONSTRAINT `cars_car_model_id_foreign` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`id`),
  ADD CONSTRAINT `cars_car_type_id_foreign` FOREIGN KEY (`car_type_id`) REFERENCES `car_types` (`id`),
  ADD CONSTRAINT `cars_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `cars_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`);

--
-- Constraints for table `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_car_brand_id_foreign` FOREIGN KEY (`car_brand_id`) REFERENCES `car_brands` (`id`);

--
-- Constraints for table `client_wallets`
--
ALTER TABLE `client_wallets`
  ADD CONSTRAINT `client_wallets_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`);

--
-- Constraints for table `driver_ratings`
--
ALTER TABLE `driver_ratings`
  ADD CONSTRAINT `driver_ratings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `driver_ratings_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `driver_ratings_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `driver_wallets`
--
ALTER TABLE `driver_wallets`
  ADD CONSTRAINT `driver_wallets_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `trips_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `trips_luggage_id_foreign` FOREIGN KEY (`luggage_id`) REFERENCES `luggage` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
