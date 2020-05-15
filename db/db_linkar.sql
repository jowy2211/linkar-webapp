-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2020 at 11:27 AM
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
(2, 14, 2, 'This is insane :)', '2020-05-10 09:21:02', 'PUBLISH');

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
(37, 2, 'unjust', '::1', '2020-05-10 15:40:53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 0, 'Username & Password is matching!');

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
(3, 'user', 'user@user.com', 'user 1', 'e69dc2c09e8da6259422d987ccbe95b5', 'USER', '2020-05-10 06:42:43', NULL);

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
  `flag` set('VERIFIED','UNVERIFIED') COLLATE utf8mb4_unicode_ci DEFAULT 'VERIFIED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `channel_id`, `interest_id`, `title`, `description`, `url`, `thumbnails`, `ratings`, `views`, `publish_at`, `create_at`, `flag`) VALUES
(1, 1, 13, 'Inside Bill&#39;s Brain: Decoding Bill Gates | Official Trailer | Netflix', 'This three-part documentary tells Bill Gates\' life story, in-depth and unfiltered, as he pursues unique solutions to some of the world\'s most complex problems.', 'aCv29JKmHNY', 'https://i.ytimg.com/vi/aCv29JKmHNY/hqdefault.jpg', 0, 21, '2019-08-29 15:01:54', '2020-05-05 08:59:25', 'VERIFIED'),
(2, 1, 13, 'Kingdom | Official Trailer [HD] | Netflix', 'In a kingdom defeated by corruption and famine, a mysterious plague spreads to turn the infected into monsters. The crown prince, framed for treason and ...', '4l-yByZpaaM', 'https://i.ytimg.com/vi/4l-yByZpaaM/hqdefault.jpg', 3, 180, '2018-12-18 00:00:01', '2020-05-05 08:59:25', 'VERIFIED'),
(3, 1, 13, 'The Crown | Official Trailer | Netflix', 'At a time when Britain was recovering from war and her empire was in decline, a young woman took the throne as a matter of duty not desire. Prepare for a world ...', 'JWtnJjn6ng0', 'https://i.ytimg.com/vi/JWtnJjn6ng0/hqdefault.jpg', 0, 14, '2016-09-27 11:30:32', '2020-05-05 08:59:25', 'VERIFIED'),
(4, 1, 13, 'The Dirt | Official Trailer [HD] | Netflix', 'Their music made them famous. Their lives made them infamous. Watch #TheDirt on #Netflix March 22, 2019. Based on Mötley Crüe\'s 2001 best-selling ...', '-NOp5ROn1HE', 'https://i.ytimg.com/vi/-NOp5ROn1HE/hqdefault.jpg', 0, 88, '2019-02-19 15:00:00', '2020-05-05 08:59:25', 'VERIFIED'),
(5, 1, 13, 'MISS AMERICANA | Official Trailer | Netflix', 'Behind the fame, behind the songs and beyond everything you think you know about Taylor Swift. Miss Americana, watch now, only on Netflix. Watch Miss ...', 'q07_k5VKuaQ', 'https://i.ytimg.com/vi/q07_k5VKuaQ/hqdefault.jpg', 0, 119, '2020-01-31 14:00:00', '2020-05-05 08:59:25', 'VERIFIED'),
(6, 1, 13, 'Wild Wild Country | Official Trailer [HD] | Netflix', 'You have to see to be a believer. A Netflix Original documentary series about a controversial cult leader who builds a utopian city in the Oregon desert, resulting ...', 'hBLS_OM6Puk', 'https://i.ytimg.com/vi/hBLS_OM6Puk/hqdefault.jpg', 0, 76, '2018-02-28 18:16:26', '2020-05-05 08:59:25', 'VERIFIED'),
(7, 1, 13, 'One of Us | Official Trailer [HD] | Netflix', '\"Nobody leaves the Hasidic community, unless they\'re willing to pay the price.\" One of Us offers a look into the secretive world of Hasidic Judaism and those who ...', 'uBPn5oQNutI', 'https://i.ytimg.com/vi/uBPn5oQNutI/hqdefault.jpg', 0, 7, '2017-09-07 13:30:31', '2020-05-05 08:59:25', 'VERIFIED'),
(8, 1, 13, 'The Trials of Gabriel Fernandez | Official Trailer | Netflix', 'From the Director of Nobody Speak: Trials of the Free Press, witness an unflinching look at the case that put the system on trial. Only on Netflix February 26.', '-T7VXlB4qUI', 'https://i.ytimg.com/vi/-T7VXlB4qUI/hqdefault.jpg', 0, 0, '2020-02-19 17:00:00', '2020-05-05 08:59:25', 'VERIFIED'),
(9, 1, 13, 'BIKRAM: YOGI, GURU, PREDATOR | Official Trailer | Netflix', 'BIKRAM: YOGI, GURU, PREDATOR releases globally on Netflix on November 20, 2019. BIKRAM: YOGI, GURU, PREDATOR explores the dramatic rise and fall ...', 'AbsaUHdxGHg', 'https://i.ytimg.com/vi/AbsaUHdxGHg/hqdefault.jpg', 0, 0, '2019-11-07 18:00:01', '2020-05-05 08:59:25', 'VERIFIED'),
(10, 1, 13, 'Delhi Crime | Official Trailer [HD] | Netflix', 'In 2012, a heinous crime enraged a whole country. Based on the case files of the Delhi Police, the story follows the unfailing determination of Varthika ...', 'jNuKwlKJx2E', 'https://i.ytimg.com/vi/jNuKwlKJx2E/hqdefault.jpg', 0, 12, '2019-03-11 05:30:00', '2020-05-05 08:59:25', 'VERIFIED'),
(11, 1, 13, 'Love Alarm | Official Trailer | Netflix', 'He loves me, she loves me not - there is an app for that. Do you trust the app or your own heart? Love Alarm premieres August 22, only on Netflix. Watch Love ...', '8sXTfzaLmiQ', 'https://i.ytimg.com/vi/8sXTfzaLmiQ/hqdefault.jpg', 0, 237, '2019-08-07 00:00:00', '2020-05-05 08:59:25', 'VERIFIED'),
(12, 1, 13, 'Quincy | Official Trailer [HD] | Netflix', 'Artist. Father. Visionary. QUINCY is an intimate look at musical icon and influential legend, Quincy Jones. Available on Netflix September 21st. Beyond his own ...', 'WT7gn6nhsAc', 'https://i.ytimg.com/vi/WT7gn6nhsAc/hqdefault.jpg', 0, 0, '2018-09-06 16:30:01', '2020-05-05 08:59:25', 'VERIFIED'),
(13, 1, 13, 'The King - Timothée Chalamet, Robert Pattinson | Final Trailer | Netflix Film', 'Are you ready for what awaits? Watch The King in select theaters and on Netflix. Hal (Timothée Chalamet), wayward prince and reluctant heir to the English ...', 'svVykTznk9Q', 'https://i.ytimg.com/vi/svVykTznk9Q/hqdefault.jpg', 0, 0, '2019-10-24 13:00:01', '2020-05-05 08:59:25', 'VERIFIED'),
(14, 1, 13, 'Death Note | Official Trailer [HD] | Netflix', 'Intoxicated by the power of a supernatural notebook, a young man begins killing those he deems unworthy of life. Based on the famous Japanese manga. Death ...', 'gvxNaSIB_WI', 'https://i.ytimg.com/vi/gvxNaSIB_WI/hqdefault.jpg', 3, 30, '2017-06-29 14:02:33', '2020-05-05 08:59:25', 'VERIFIED'),
(15, 1, 13, 'Homecoming: A Film By Beyoncé | Official Trailer | Netflix', 'Homecoming: A Film By Beyoncé is a 2019 Emmy® Awards Nominee. This intimate, in-depth look at Beyoncé\'s celebrated 2018 Coachella performance reveals ...', 'fB8qvx0HOlI', 'https://i.ytimg.com/vi/fB8qvx0HOlI/hqdefault.jpg', 0, 10, '2019-04-08 13:00:05', '2020-05-05 08:59:25', 'VERIFIED'),
(16, 1, 13, 'Bird Box | Official Trailer [HD] | Netflix', 'Never lose sight of survival. Watch BirdBox on Netflix on December 21, 2018. When a mysterious force decimates the world\'s population, only one thing is ...', 'o2AsIXSh2xo', 'https://i.ytimg.com/vi/o2AsIXSh2xo/hqdefault.jpg', 0, 0, '2018-10-24 14:00:11', '2020-05-05 08:59:25', 'VERIFIED'),
(17, 1, 13, 'The Perfection | Official Trailer [HD] | Netflix', 'It\'s time to face the music. Watch The Perfection only on Netflix on May 24, 2019. A troubled musical prodigy (Allison Williams) seeks out the new star pupil of her ...', 'q57D6kF5B1k', 'https://i.ytimg.com/vi/q57D6kF5B1k/hqdefault.jpg', 0, 31, '2019-04-15 15:02:54', '2020-05-05 08:59:25', 'VERIFIED'),
(18, 1, 13, 'Tiger King: Murder, Mayhem and Madness | Official Trailer | Netflix', 'Among the eccentrics and cult personalities in the stranger-than-fiction world of big cat owners, few stand out more than Joe Exotic, a mulleted, gun-toting ...', 'acTdxsoa428', 'https://i.ytimg.com/vi/acTdxsoa428/hqdefault.jpg', 0, 0, '2020-03-10 16:00:01', '2020-05-05 08:59:25', 'VERIFIED'),
(19, 1, 13, 'The Edge of Democracy | Official Trailer | Netflix', 'The Edge of Democracy releases globally on Netflix on June 19, 2019. A cautionary tale for these times of democracy in crisis - the personal and political fuse to ...', 'xLe24M_PB5E', 'https://i.ytimg.com/vi/xLe24M_PB5E/hqdefault.jpg', 0, 0, '2019-06-05 17:30:08', '2020-05-05 08:59:25', 'VERIFIED'),
(20, 1, 13, 'To The Bone | Official Trailer [HD] | Netflix', 'Ellen is an unruly, 20-year-old young woman with anorexia nervosa who spent the better part of her teenage years being shepherded through various recovery ...', '705yRfs6Dbs', 'https://i.ytimg.com/vi/705yRfs6Dbs/hqdefault.jpg', 0, 0, '2017-06-20 16:02:15', '2020-05-05 08:59:25', 'VERIFIED'),
(21, 1, 13, 'Atypical | Official Trailer [HD] | Netflix', 'Watch Atypical on Netflix: https://www.netflix.com/title/80117540 SUBSCRIBE: http://bit.ly/29qBUt7 About Netflix: Netflix is the world\'s leading internet ...', 'ieHh4U-QYwU', 'https://i.ytimg.com/vi/ieHh4U-QYwU/hqdefault.jpg', 0, 0, '2017-07-18 15:00:43', '2020-05-05 08:59:25', 'VERIFIED'),
(22, 1, 13, '1922 | Official Trailer [HD] | Netflix', 'Life is rarely fair. Based on the novella by Stephen King, comes a new Netflix Film, 1922. Now streaming. Watch 1922 on Netflix: https://www.netflix.com/ ...', '3E_fT0aTsjI', 'https://i.ytimg.com/vi/3E_fT0aTsjI/hqdefault.jpg', 0, 8, '2017-09-22 15:30:14', '2020-05-05 08:59:25', 'VERIFIED'),
(23, 1, 13, 'The Kissing Booth | Official Trailer | Netflix', 'A pretty, teenage girl, who has never been kissed, finds her life turned totally upside down when she decides to run a kissing booth and unexpectedly ends up ...', '7bfS6seiLhk', 'https://i.ytimg.com/vi/7bfS6seiLhk/hqdefault.jpg', 0, 6, '2018-05-01 15:00:01', '2020-05-05 08:59:25', 'VERIFIED'),
(24, 1, 13, 'The Spy – starring Sacha Baron Cohen | Official Trailer | Netflix', 'THE SPY, starring Sacha Baron Cohen, is inspired by the real-life story of former notorious Mossad agent, Eli Cohen, who successfully goes undercover in Syria ...', '5UijUOy0MmE', 'https://i.ytimg.com/vi/5UijUOy0MmE/hqdefault.jpg', 0, 18, '2019-08-28 13:29:20', '2020-05-05 08:59:25', 'VERIFIED'),
(25, 1, 13, 'Killer Inside: The Mind of Aaron Hernandez | Main Trailer | Netflix', 'Killer Inside: The Mind of Aaron Hernandez is a three-part documentary series examining what led to the murderous fall and shocking death of former NFL ...', '8Kr8j2YNE3Q', 'https://i.ytimg.com/vi/8Kr8j2YNE3Q/hqdefault.jpg', 0, 4, '2020-01-07 16:00:02', '2020-05-05 08:59:25', 'VERIFIED'),
(26, 1, 13, 'Eli | Official Trailer | Netflix', 'As a last resort to cure their son\'s auto-immune disorder, the Millers move into a sterile manor during his treatments. Eli is tormented by terrifying visions ...', 'qfSTiAw1rkM', 'https://i.ytimg.com/vi/qfSTiAw1rkM/hqdefault.jpg', 0, 0, '2019-10-03 16:00:03', '2020-05-05 08:59:25', 'VERIFIED'),
(27, 1, 13, 'The King - Timothée Chalamet | Official Teaser Trailer | Netflix Film', 'All hail. Watch The King in select theaters and on Netflix this fall. Hal (Timothée Chalamet), wayward prince and reluctant heir to the English throne, has turned ...', 'yMJnsTx-TBg', 'https://i.ytimg.com/vi/yMJnsTx-TBg/hqdefault.jpg', 0, 0, '2019-08-27 13:00:11', '2020-05-05 08:59:25', 'VERIFIED'),
(28, 1, 13, 'Freud | Official Trailer | Netflix', 'When you see this posting you will feel the immense desire to watch FREUD. March 23rd on NETFLIX. Watch Freud, Only on Netflix: ...', 'VQfcZ9Ak2nU', 'https://i.ytimg.com/vi/VQfcZ9Ak2nU/hqdefault.jpg', 0, 0, '2020-02-20 10:00:00', '2020-05-05 08:59:25', 'VERIFIED'),
(29, 1, 13, 'Roxanne Roxanne | Official Trailer [HD] | Netflix', 'Life is a battle. In the early 1980s, the most feared battle MC in Queens, New York, was a fierce teenage girl with the weight of the world on her shoulders. At the ...', 'IKA8H_LolNM', 'https://i.ytimg.com/vi/IKA8H_LolNM/hqdefault.jpg', 0, 27, '2018-02-22 15:30:27', '2020-05-05 08:59:25', 'VERIFIED'),
(30, 2, 8, 'Deadwood: The Movie (2019) | Official Trailer | HBO', 'Former rivalries are reignited, alliances are tested and old wounds are reopened, as all are left to navigate the inevitable changes that modernity and time have ...', 'ejqSTxm8Fws', 'https://i.ytimg.com/vi/ejqSTxm8Fws/hqdefault.jpg', 0, 0, '2019-06-13 22:03:05', '2020-05-05 09:00:33', 'VERIFIED'),
(31, 2, 8, 'The Outsider: Official Trailer | HBO', 'Based on the best-selling novel by Stephen King, The Outsider premieres January 12 at 9pm on HBO. #HBO #TheOutsiderHBO The 10-episode series follows ...', 'eNDKWr3Xmjk', 'https://i.ytimg.com/vi/eNDKWr3Xmjk/hqdefault.jpg', 0, 0, '2019-12-05 17:00:00', '2020-05-05 09:00:33', 'VERIFIED'),
(32, 2, 8, 'Grisse (HBO Asia) | Official Trailer | HBO', 'GRISSE, HBO® Asia\'s original period drama series, will be available to US Subscribers on HBO NOW®, HBO GO®, HBO On Demand and partners\' streaming ...', 'lmjemLXhWSg', 'https://i.ytimg.com/vi/lmjemLXhWSg/hqdefault.jpg', 0, 0, '2019-03-06 20:48:41', '2020-05-05 09:00:33', 'VERIFIED'),
(33, 2, 8, 'Native Son (2019) | Official Trailer | HBO', 'Based on the Richard Wright novel, Native Son is the tale of an African-American man in Chicago who is hired to be the driver a wealthy businessman.', 'ghfwH5jWTbc', 'https://i.ytimg.com/vi/ghfwH5jWTbc/hqdefault.jpg', 0, 0, '2019-03-07 18:04:21', '2020-05-05 09:00:33', 'VERIFIED'),
(34, 2, 8, 'Native Son (2019) | Official Tease | HBO', 'A young African-American man comes of age in the south side of Chicago. Directed by Rashid Johnson, from a screenplay by Suzan-Lori Parks. Starring Ashton ...', 'iUwPGxaVunQ', 'https://i.ytimg.com/vi/iUwPGxaVunQ/hqdefault.jpg', 0, 0, '2019-02-22 19:00:03', '2020-05-05 09:00:33', 'VERIFIED'),
(35, 2, 8, 'O.G. (2019): Official Trailer ft. Jeffrey Wright | HBO', 'O.G. follows Louis (Jeffrey Wright) a maximum-security prison inmate whose impending release is upended when he takes a new arrival under his wing. Starring ...', 'oVZevJr-WQ8', 'https://i.ytimg.com/vi/oVZevJr-WQ8/hqdefault.jpg', 0, 0, '2019-01-18 17:59:41', '2020-05-05 09:00:33', 'VERIFIED'),
(36, 2, 8, 'Bad Education: Official Trailer | HBO', 'Bad Education, debuting Saturday, April 25 on HBO, stars Academy Award nominee Hugh Jackman, Academy Award winner Allison Janney and Emmy winner ...', 'ZVffM3OZkH8', 'https://i.ytimg.com/vi/ZVffM3OZkH8/hqdefault.jpg', 0, 0, '2020-03-26 17:00:02', '2020-05-05 09:00:33', 'VERIFIED'),
(37, 2, 8, 'Avenue 5: Official Trailer | HBO', 'Can\'t spell space without spa. From Veep creator Armando Iannucci, Avenue 5 lifts off January 19 on HBO. #HBO #Avenue5 #Avenue5HBO Subscribe to HBO ...', 'w8Zr3f-_Ft8', 'https://i.ytimg.com/vi/w8Zr3f-_Ft8/hqdefault.jpg', 0, 0, '2019-12-08 17:00:14', '2020-05-05 09:00:33', 'VERIFIED'),
(38, 2, 8, 'The Plot Against America: Official Trailer | HBO', 'From creators David Simon and Ed Burns comes The Plot Against America, an alternate American history story of the country\'s turn to fascism told through the ...', 'RwMwrft7So8', 'https://i.ytimg.com/vi/RwMwrft7So8/hqdefault.jpg', 0, 0, '2020-02-18 18:00:06', '2020-05-05 09:00:33', 'VERIFIED'),
(39, 2, 8, 'Brexit (2019) | Official Trailer | HBO', 'Everyone knows who won. Not everyone knows how. Brexit premieres January 19, 2019 on HBO. #Brexit Subscribe to the HBO YouTube Channel: ...', 'E5S1EMmCWAE', 'https://i.ytimg.com/vi/E5S1EMmCWAE/hqdefault.jpg', 0, 0, '2018-12-14 17:59:40', '2020-05-05 09:00:33', 'VERIFIED'),
(40, 2, 8, 'His Dark Materials: Season 1 | Official Trailer | HBO', 'HBO and BBC present His Dark Materials, a new original series based on the global bestsellers, premiering Monday, November 4 on HBO. #HBO ...', 'APduGe1eLVI', 'https://i.ytimg.com/vi/APduGe1eLVI/hqdefault.jpg', 0, 2, '2019-10-03 17:03:01', '2020-05-05 09:00:33', 'VERIFIED'),
(41, 2, 8, 'His Dark Materials: Season 1 | San Diego Comic-Con Trailer | HBO', 'HBO and BBC present His Dark Materials, a new original series based on the global bestsellers, premiering this fall. #HBO #HisDarkMaterials Subscribe to HBO ...', '1yuIE1OYnVI', 'https://i.ytimg.com/vi/1yuIE1OYnVI/hqdefault.jpg', 0, 0, '2019-07-18 23:56:05', '2020-05-05 09:00:33', 'VERIFIED'),
(42, 2, 8, 'Share (2019): Official Trailer | HBO', 'Based on Pippa Bianco\'s Cannes Film Festival award-winning short of the same name, this feature-length drama stars Rhianne Barreto as 16-year-old Mandy, ...', 'FaiaD8wRNV8', 'https://i.ytimg.com/vi/FaiaD8wRNV8/hqdefault.jpg', 0, 41, '2019-06-20 17:00:05', '2020-05-05 09:00:33', 'VERIFIED'),
(43, 2, 8, 'The Scheme (2020): Official Trailer | HBO', 'There\'s more to the story. Documenting Christian Dawkin\'s involvement in the biggest criminal case in collegiate sports history, The Scheme premieres March 31 ...', 'ylAG1MBDzb0', 'https://i.ytimg.com/vi/ylAG1MBDzb0/hqdefault.jpg', 0, 0, '2020-03-12 17:00:25', '2020-05-05 09:00:33', 'VERIFIED'),
(44, 2, 8, 'Beforeigners: Official Trailer | HBO', 'Beforeigners, a six-part genre-crossing drama from HBO Europe, premieres in the U.S. on Tuesday, February 18th on HBO NOW®, HBO GO®, and partner ...', 'ASr0n5LnWnU', 'https://i.ytimg.com/vi/ASr0n5LnWnU/hqdefault.jpg', 0, 0, '2020-02-18 23:32:17', '2020-05-05 09:00:33', 'VERIFIED');

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
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history_login`
--
ALTER TABLE `history_login`
  MODIFY `history_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
