-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 17, 2020 at 04:02 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_linkar`
--

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `channel_id`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES
(1, 'Netflix', 'UCWOA1ZGywLbqmigxE4Qlvuw', NULL, '2020-05-04 21:07:09', NULL, NULL),
(2, 'HBO', 'UCVTQuK2CaWaTgSsoNkn5AiQ', NULL, '2020-05-04 21:07:09', NULL, NULL),
(3, 'Movie Clips Trailers', 'UCi8e0iOVk1fEOogdfu4YgfA', NULL, '2020-05-04 21:11:23', NULL, NULL),
(4, 'Cinemax', 'UCYbinjMxWwjRpp4WqgDqEDA', NULL, '2020-05-04 21:11:23', NULL, NULL),
(5, 'Sony Pictures Entertaiment', 'UCz97F7dMxBNOfGYu3rx8aCw', NULL, '2020-05-04 21:18:25', NULL, NULL),
(6, 'Movie Trailer Source', 'UCpJN7kiUkDrH11p0GQhLyFw', NULL, '2020-05-04 21:21:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` set('PUBLISH','UNPUBLISH') NOT NULL DEFAULT 'PUBLISH'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `video_id`, `user_id`, `text`, `created_at`, `status`) VALUES
(1, 5, 2, 'Great Movie :)', '2020-05-10 09:10:01', 'PUBLISH'),
(2, 14, 2, 'This is insane :)', '2020-05-10 09:21:02', 'PUBLISH'),
(3, 1, 4, 'test', '2020-05-17 09:59:21', 'PUBLISH');

-- --------------------------------------------------------

--
-- Table structure for table `history_login`
--

CREATE TABLE `history_login` (
  `history_login_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `ip_address` varchar(191) NOT NULL,
  `login_date` datetime NOT NULL,
  `login_detail` text NOT NULL,
  `login_status` int(11) NOT NULL,
  `login_note` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_login`
--

INSERT INTO `history_login` (`history_login_id`, `user_id`, `username`, `ip_address`, `login_date`, `login_detail`, `login_status`, `login_note`) VALUES
(1, NULL, 'asd', '::1', '2020-05-09 20:35:37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(2, 2, 'unjust', '::1', '2020-05-09 20:50:00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(3, 2, 'unjust', '::1', '2020-05-09 20:59:05', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(4, NULL, 'unjust', '::1', '2020-05-09 21:01:48', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(5, 2, 'unjust', '::1', '2020-05-09 21:02:32', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(6, 2, 'unjust', '::1', '2020-05-09 21:06:40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(7, 2, 'unjust', '::1', '2020-05-09 21:07:42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(8, 2, 'unjust', '::1', '2020-05-09 21:09:55', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(9, 2, 'unjust', '::1', '2020-05-09 21:11:26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(10, 2, 'unjust', '::1', '2020-05-09 21:12:21', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(11, 2, 'unjust', '::1', '2020-05-09 21:13:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(12, 2, 'unjust', '::1', '2020-05-09 21:14:46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(13, 2, 'unjust', '::1', '2020-05-09 21:16:28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(14, NULL, 'unjust', '::1', '2020-05-09 21:18:01', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(15, NULL, 'unjust', '::1', '2020-05-09 21:18:57', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(16, 2, 'unjust', '::1', '2020-05-09 21:19:27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(17, NULL, 'unjust', '::1', '2020-05-09 21:20:08', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(18, NULL, 'unjust', '::1', '2020-05-09 21:20:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(19, NULL, 'unjust', '::1', '2020-05-09 21:21:37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(20, NULL, 'unjust', '::1', '2020-05-09 21:22:26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(21, NULL, 'unjust', '::1', '2020-05-09 21:22:36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Username or password is incorrect!'),
(22, 2, 'unjust', '::1', '2020-05-09 21:22:39', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(23, 2, 'unjust', '::1', '2020-05-09 21:26:13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(24, NULL, 'asdljk', '::1', '2020-05-10 12:57:52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(25, NULL, 'asdqwe', '::1', '2020-05-10 13:12:07', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(26, 2, 'unjust', '::1', '2020-05-10 13:12:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(27, 2, 'unjust', '::1', '2020-05-10 13:18:20', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(28, 3, 'user', '::1', '2020-05-10 13:42:51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(29, 1, 'admin', '::1', '2020-05-10 13:47:58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(30, 2, 'unjust', '::1', '2020-05-10 13:50:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(31, NULL, 'asdas', '::1', '2020-05-10 13:58:04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(32, NULL, 'asdasd', '::1', '2020-05-10 13:58:48', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(33, NULL, 'asdasd', '::1', '2020-05-10 13:59:19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(34, 2, 'unjust', '::1', '2020-05-10 14:03:51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(35, 2, 'unjust', '::1', '2020-05-10 14:08:55', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(36, 2, 'unjust', '::1', '2020-05-10 15:25:43', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(37, 2, 'unjust', '::1', '2020-05-10 15:40:53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(38, NULL, 'admin', '127.0.0.1', '2020-05-17 14:28:48', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(39, NULL, 'admin', '127.0.0.1', '2020-05-17 14:28:51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(40, NULL, 'admin123', '127.0.0.1', '2020-05-17 14:28:55', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(41, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:29:10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(42, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:30:23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(43, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:30:26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(44, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:30:29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(45, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:30:32', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(46, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:31:13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(47, NULL, 'admin@lingkar.app', '127.0.0.1', '2020-05-17 14:31:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 2, 'Account is not found!'),
(48, NULL, 'vincwestley', '127.0.0.1', '2020-05-17 14:34:20', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(49, 4, 'vincwestley', '127.0.0.1', '2020-05-17 14:34:25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(50, NULL, 'admin', '127.0.0.1', '2020-05-17 14:35:27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(51, NULL, 'admin', '127.0.0.1', '2020-05-17 14:35:32', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(52, 1, 'admin', '127.0.0.1', '2020-05-17 14:36:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(53, NULL, 'vincwestley', '127.0.0.1', '2020-05-17 16:58:41', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(54, 4, 'vincwestley', '127.0.0.1', '2020-05-17 16:58:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!'),
(55, NULL, 'vincwestley', '127.0.0.1', '2020-05-17 16:59:13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 1, 'Password is incorrect!'),
(56, 4, 'vincwestley', '127.0.0.1', '2020-05-17 16:59:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `name`, `create_by`, `create_at`, `update_by`, `update_at`) VALUES
(2, 'Horror', NULL, NULL, NULL, NULL),
(3, 'Science Fiction', NULL, NULL, NULL, NULL),
(4, 'Comedy', NULL, NULL, NULL, NULL),
(5, 'Thiller', NULL, NULL, NULL, NULL),
(6, 'Romance', NULL, NULL, NULL, NULL),
(7, 'Adventure', NULL, NULL, NULL, NULL),
(8, 'Action', NULL, NULL, NULL, NULL),
(9, 'Crime', NULL, NULL, NULL, NULL),
(10, 'Documentary', NULL, NULL, NULL, NULL),
(11, 'Drama', NULL, NULL, NULL, NULL),
(12, 'Fantasy', NULL, NULL, NULL, NULL),
(13, 'Biographical', NULL, NULL, NULL, NULL),
(14, 'Superhero', NULL, NULL, NULL, NULL),
(15, 'Experimental', NULL, NULL, NULL, NULL),
(16, 'Mistery', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(191) CHARACTER SET latin1 DEFAULT NULL,
  `level` set('ADMIN','USER') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `fullname`, `password`, `level`, `create_at`, `last_login`) VALUES
(1, 'admin', 'admin@lingkar.app', 'administrator', 'e69dc2c09e8da6259422d987ccbe95b5', 'ADMIN', '2020-05-09 11:43:43', NULL),
(2, 'unjust', 'unjust.orono@gmail.com', 'unjust orono', 'e69dc2c09e8da6259422d987ccbe95b5', 'USER', '2020-05-09 12:34:39', NULL),
(3, 'user', 'user@user.com', 'user 1', 'e69dc2c09e8da6259422d987ccbe95b5', 'USER', '2020-05-10 06:42:43', NULL),
(4, 'vincwestley', 'vincwestley11@gmail.com', 'Westley', '0192023a7bbd73250516f069df18b500', 'USER', '2020-05-17 07:33:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `user_interest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  `title` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnails` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ratings` float DEFAULT 0,
  `views` int(11) DEFAULT 0,
  `publish_at` datetime DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `flag` set('VERIFIED','UNVERIFIED') COLLATE utf8mb4_unicode_ci DEFAULT 'VERIFIED',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `cover` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` float(2,1) NOT NULL DEFAULT 0.0,
  `runtime` int(11) NOT NULL,
  `director` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `writer` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `channel_id`, `interest_id`, `title`, `description`, `url`, `thumbnails`, `ratings`, `views`, `publish_at`, `create_at`, `flag`, `is_featured`, `cover`, `rating`, `runtime`, `director`, `writer`) VALUES
(1, 1, 13, 'Birds of Prey', 'Setelah berpisah dengan Joker, Harley Quinn (Margot Robbie) bergabung dengan Black Canary (Jurnee Smollett-Bell), Huntress (Mary Elizabeth Winstead) dan Renee Montoya (Rosie Perez) untuk menyelamatkan seorang gadis muda bernama Cassandra Cain (Ella Jay Basco) dari sosok penguasa kejahatan yang dikenal sebagai Black Mask (Ewan McGregor).', 'kGM4uYZzfu0', 'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1580978144/cka0ypdtsvxesh5fmeya.png', 0, 67, '2019-08-29 15:01:54', '2020-05-05 08:59:25', 'VERIFIED', 0, 'https://sm.ign.com/t/ign_ap/feature/b/birds-of-p/birds-of-prey-closing-credits-scene-batman-and-suicide-squad_5gv4.1200.jpg', 6.2, 109, '', ''),
(2, 1, 13, 'La La Land', 'La La Land adalah film drama komedi musikal romansa Amerika Serikat tahun 2016 yang ditulis dan disutradarai Damien Chazelle dan dibintangi Ryan Gosling, Emma Stone, John Legend, dan Rosemarie DeWitt. Film ini berkisah tentang seorang musisi dan calon aktris yang bertemu dan jatuh cinta di Los Angeles.', '0pdqf4P9MB8', 'https://lh3.googleusercontent.com/pw/ACtC-3cbIgSL2oi2M5hK_KrhfQykC3sjtsI1aSEw1Bn0wR1ObzoEGsaZ4-GZgHWOQO7dKhpF8BIqcmf-MyiIYk2XnVUrv2FHjPfsA12obw4c6pKkcXrP1vKJ0uYsSnCFNi7VU0e7nXfHlzc6yN1g6bXbNAhy=w409-h606-no', 3, 306, '2018-12-18 00:00:01', '2020-05-05 08:59:25', 'VERIFIED', 1, 'https://lh3.googleusercontent.com/pw/ACtC-3d_swm6W_U9_G5KbSjvHcP-PJUkoSnlSqKgjJI_nLIGvvGfxVnUFRGYPFE7dTFDXNodr_K67oXwuwxugLK5qxn7ahJAsBOuNvixTBLOSGpf8vaw6yFv86NHGZK6nBFjL7DQGta1pk-90L_CNMhaarRh=w1365-h764-no', 8.0, 128, 'Damien Chazelle', 'Damien Chazelle');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `history_login`
--
ALTER TABLE `history_login`
  ADD PRIMARY KEY (`history_login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`user_interest_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interest_id` (`interest_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history_login`
--
ALTER TABLE `history_login`
  MODIFY `history_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `user_interest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
