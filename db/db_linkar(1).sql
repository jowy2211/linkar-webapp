-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2020 at 10:46 AM
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
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `channel_id`, `create_at`) VALUES
(1, 'Netflix', 'UCWOA1ZGywLbqmigxE4Qlvuw', '2020-05-04 21:07:09'),
(2, 'HBO', 'UCVTQuK2CaWaTgSsoNkn5AiQ', '2020-05-04 21:07:09'),
(3, 'Movie Clips Trailers', 'UCi8e0iOVk1fEOogdfu4YgfA', '2020-05-04 21:11:23'),
(4, 'Cinemax', 'UCYbinjMxWwjRpp4WqgDqEDA', '2020-05-04 21:11:23'),
(5, 'Sony Pictures Entertaiment', 'UCz97F7dMxBNOfGYu3rx8aCw', '2020-05-04 21:18:25'),
(6, 'Movie Trailer Source', 'UCpJN7kiUkDrH11p0GQhLyFw', '2020-05-04 21:21:02');

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
(1, 1, 'admin', '::1', '2020-05-25 20:13:56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:76.0) Gecko/20100101 Firefox/76.0', 0, 'Username & Password is matching!');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `name`, `image`, `create_by`) VALUES
(2, 'Horror', 'https://images.immediate.co.uk/production/volatile/sites/3/2019/09/rev-1-IT2-TRLR-0002_High_Res_JPEG-2a85b17.jpeg?quality=90&resize=620,413', NULL),
(3, 'Science Fiction', 'https://qph.fs.quoracdn.net/main-qimg-6a912f05550ff6be7f8f8e49d0ce54b0', NULL),
(4, 'Comedy', 'https://img.cinemablend.com/filter:scale/quill/f/0/b/b/7/d/f0bb7df4d1c46850250a0e811fad7890c5033830.jpg?fw=1200', NULL),
(5, 'Thiller', 'https://i.ytimg.com/vi/DkVyaFPQF3k/maxresdefault.jpg', NULL),
(6, 'Romance', 'https://s3-us-west-2.amazonaws.com/flx-editorial-wordpress/wp-content/uploads/2018/02/13141814/700.jpg', NULL),
(7, 'Adventure', 'https://s3-us-west-2.amazonaws.com/flx-editorial-wordpress/wp-content/uploads/2017/06/12085359/600Raiders2.jpg', NULL),
(8, 'Action', 'https://cms.qz.com/wp-content/uploads/2018/07/skyscraper-epk-SKR_Adv1Sheet2_RGB_1_rgb-e1531408211288.jpg?quality=75&strip=all&w=410&h=230', NULL),
(9, 'Crime', 'https://miro.medium.com/max/12000/0*xD3UP3i5kAifT1z7', NULL),
(10, 'Documentary', 'https://s3.amazonaws.com/pbblogassets/uploads/2016/05/Types-of-Documentary-Cover.jpg', NULL),
(11, 'Drama', 'https://cdn.idntimes.com/content-images/community/2020/03/fullsizephoto1020417-3a0ffa77bac36eb3ac29407a7b05f3ac_600x400.jpg', NULL),
(12, 'Fantasy', 'https://img1.looper.com/img/gallery/the-best-fantasy-movies-of-all-time-according-to-rotten-tomatoes/intro-1584539545.jpg', NULL),
(13, 'Biographical', 'https://cdn.osxdaily.com/wp-content/uploads/2011/10/steve-jobs-movie.jpg', NULL),
(14, 'Superhero', 'https://nofilmschool.com/sites/default/files/styles/article_wide/public/avengers_2.jpg?itok=h4ROSUNs', NULL),
(15, 'Experimental', 'https://thoughtsofathirdworldfilmmaker.files.wordpress.com/2016/06/un-chien-andalou-1.gif', NULL),
(16, 'Mistery', 'https://www.culturewhisper.com/images/uploads/cw-19663.jpg', NULL),
(17, 'Musical', 'https://www.rollingstone.com/wp-content/uploads/2019/12/Cats.jpg', NULL);

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
(1, 'admin', 'admin@linkar.id', 'Administrator', 'e69dc2c09e8da6259422d987ccbe95b5', 'ADMIN', '2020-05-25 13:03:25', NULL),
(2, 'unjust', 'unjust.orono@gmail.com', 'Unjust Orono', 'e69dc2c09e8da6259422d987ccbe95b5', 'USER', '2020-05-25 13:50:24', NULL);

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

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`user_interest_id`, `user_id`, `interest_id`, `create_at`) VALUES
(1, 2, 4, '2020-05-25 13:50:51'),
(2, 2, 5, '2020-05-25 13:50:51'),
(3, 2, 13, '2020-05-25 13:50:51'),
(4, 2, 2, '2020-05-25 13:50:51');

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
(1, 1, 13, 'Inside Bill&#39;s Brain: Decoding Bill Gates | Official Trailer | Netflix', 'This three-part documentary tells Bill Gates\' life story, in-depth and unfiltered, as he pursues unique solutions to some of the world\'s most complex problems.', 'aCv29JKmHNY', 'https://i.ytimg.com/vi/aCv29JKmHNY/hqdefault.jpg', 0, 0, '2019-08-29 15:01:54', '2020-05-25 13:31:56', 'VERIFIED', 1, 'https://i.ytimg.com/vi/aCv29JKmHNY/hqdefault.jpg', 0.0, 0, '', ''),
(2, 1, 13, 'The Great Hack | Official Trailer | Netflix', 'They took your data. Then they took control. The Great Hack uncovers the dark world of data exploitation through the compelling personal journeys of players on ...', 'iX8GxLP1FHo', 'https://i.ytimg.com/vi/iX8GxLP1FHo/hqdefault.jpg', 0, 2, '2019-07-11 13:00:05', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/iX8GxLP1FHo/hqdefault.jpg', 0.0, 0, '', ''),
(3, 1, 13, 'Stronger Official Trailer #1 (2017) Jake Gyllenhaal Biography Movie HD', 'Stronger Trailer 1 (2017) Jake Gyllenhaal Biography Movie HD [Official Trailer]', 'XkoM5r9LR14', 'https://i.ytimg.com/vi/XkoM5r9LR14/hqdefault.jpg', 0, 0, '2017-06-22 16:24:09', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/XkoM5r9LR14/hqdefault.jpg', 0.0, 0, '', ''),
(4, 1, 13, 'Miss Americana | Official Trailer', 'From Emmy Winning Director Lana Wilson and Academy Award Winning Filmmakers Behind 20 Feet From Stardom. The Netflix Original Documentary is out ...', '40RsbcFRwNA', 'https://i.ytimg.com/vi/40RsbcFRwNA/hqdefault.jpg', 0, 2, '2020-01-22 15:45:12', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/40RsbcFRwNA/hqdefault.jpg', 0.0, 0, '', ''),
(5, 1, 13, 'BIKRAM: YOGI, GURU, PREDATOR | Official Trailer | Netflix', 'BIKRAM: YOGI, GURU, PREDATOR releases globally on Netflix on November 20, 2019. BIKRAM: YOGI, GURU, PREDATOR explores the dramatic rise and fall ...', 'AbsaUHdxGHg', 'https://i.ytimg.com/vi/AbsaUHdxGHg/hqdefault.jpg', 0, 0, '2019-11-07 18:00:01', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/AbsaUHdxGHg/hqdefault.jpg', 0.0, 0, '', ''),
(6, 1, 13, 'The Current War Official Trailer #1 (2017) Benedict Cumberbatch, Tom Holland Biography Movie HD', 'The Current War Trailer 1 (2017) Benedict Cumberbatch, Tom Holland Biography Movie HD [Official Trailer]', '2FTxKFsWz60', 'https://i.ytimg.com/vi/2FTxKFsWz60/hqdefault.jpg', 0, 0, '2017-09-07 17:45:37', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/2FTxKFsWz60/hqdefault.jpg', 0.0, 0, '', ''),
(7, 1, 13, 'Quincy | Official Trailer [HD] | Netflix', 'Artist. Father. Visionary. QUINCY is an intimate look at musical icon and influential legend, Quincy Jones. Available on Netflix September 21st. Beyond his own ...', 'WT7gn6nhsAc', 'https://i.ytimg.com/vi/WT7gn6nhsAc/hqdefault.jpg', 0, 0, '2018-09-06 16:30:01', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/WT7gn6nhsAc/hqdefault.jpg', 0.0, 0, '', ''),
(8, 1, 13, 'Steve Jobs - Official Trailer (HD)', 'Set backstage at three iconic product launches and ending in 1998 with the unveiling of the iMac, Steve Jobs takes us behind the scenes of the digital revolution ...', 'aEr6K1bwIVs', 'https://i.ytimg.com/vi/aEr6K1bwIVs/hqdefault.jpg', 0, 0, '2015-07-01 14:58:08', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/aEr6K1bwIVs/hqdefault.jpg', 0.0, 0, '', ''),
(9, 1, 13, 'Delhi Crime | Official Trailer [HD] | Netflix', 'In 2012, a heinous crime enraged a whole country. Based on the case files of the Delhi Police, the story follows the unfailing determination of Varthika ...', 'jNuKwlKJx2E', 'https://i.ytimg.com/vi/jNuKwlKJx2E/hqdefault.jpg', 0, 0, '2019-03-11 05:30:00', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/jNuKwlKJx2E/hqdefault.jpg', 0.0, 0, '', ''),
(10, 1, 13, 'MISS AMERICANA | Official Trailer | Netflix', 'Behind the fame, behind the songs and beyond everything you think you know about Taylor Swift. Miss Americana, watch now, only on Netflix. Watch Miss ...', 'q07_k5VKuaQ', 'https://i.ytimg.com/vi/q07_k5VKuaQ/hqdefault.jpg', 0, 0, '2020-01-31 14:00:00', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/q07_k5VKuaQ/hqdefault.jpg', 0.0, 0, '', ''),
(11, 1, 13, 'The Dirt | Official Trailer [HD] | Netflix', 'Their music made them famous. Their lives made them infamous. Watch #TheDirt on #Netflix March 22, 2019. Based on Mötley Crüe\'s 2001 best-selling ...', '-NOp5ROn1HE', 'https://i.ytimg.com/vi/-NOp5ROn1HE/hqdefault.jpg', 0, 0, '2019-02-19 15:00:00', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/-NOp5ROn1HE/hqdefault.jpg', 0.0, 0, '', ''),
(12, 1, 13, 'Molly&#39;s Game Official Trailer #1 (2017) Idris Elba, Jessica Chastain Biography Movie HD', 'Molly\'s Game Trailer 1 (2017) Idris Elba, Jessica Chastain Biography Movie HD [Official Trailer]', 'Mb2hMVDD8fs', 'https://i.ytimg.com/vi/Mb2hMVDD8fs/hqdefault.jpg', 0, 0, '2017-08-15 14:17:53', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/Mb2hMVDD8fs/hqdefault.jpg', 0.0, 0, '', ''),
(13, 1, 13, 'Atypical | Official Trailer [HD] | Netflix', 'Watch Atypical on Netflix: https://www.netflix.com/title/80117540 SUBSCRIBE: http://bit.ly/29qBUt7 About Netflix: Netflix is the world\'s leading internet ...', 'ieHh4U-QYwU', 'https://i.ytimg.com/vi/ieHh4U-QYwU/hqdefault.jpg', 0, 0, '2017-07-18 15:00:43', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/ieHh4U-QYwU/hqdefault.jpg', 0.0, 0, '', ''),
(14, 1, 13, 'Bird Box | Official Trailer [HD] | Netflix', 'Never lose sight of survival. Watch BirdBox on Netflix on December 21, 2018. When a mysterious force decimates the world\'s population, only one thing is ...', 'o2AsIXSh2xo', 'https://i.ytimg.com/vi/o2AsIXSh2xo/hqdefault.jpg', 0, 0, '2018-10-24 14:00:11', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/o2AsIXSh2xo/hqdefault.jpg', 0.0, 0, '', ''),
(15, 1, 13, 'The Crown | Official Trailer | Netflix', 'At a time when Britain was recovering from war and her empire was in decline, a young woman took the throne as a matter of duty not desire. Prepare for a world ...', 'JWtnJjn6ng0', 'https://i.ytimg.com/vi/JWtnJjn6ng0/hqdefault.jpg', 0, 0, '2016-09-27 11:30:32', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/JWtnJjn6ng0/hqdefault.jpg', 0.0, 0, '', ''),
(16, 1, 13, 'Conversations with a Killer: The Ted Bundy Tapes | Official Trailer [HD] | Netflix', 'I\'m not an animal and I\'m not crazy… I\'m just a normal individual.” - Ted Bundy Get inside the twisted mind of America\'s most notorious serial killer in his own ...', 'n1UJgrNRcvI', 'https://i.ytimg.com/vi/n1UJgrNRcvI/hqdefault.jpg', 0, 0, '2019-01-14 17:30:08', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/n1UJgrNRcvI/hqdefault.jpg', 0.0, 0, '', ''),
(17, 1, 13, 'The Man Who Knew Infinity Official Trailer #1 (2016) - Dev Patel, Jeremy Irons Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Like us on FACEBOOK: http://bit.ly/1QyRMsE The Man Who Knew ...', 'oXGm9Vlfx4w', 'https://i.ytimg.com/vi/oXGm9Vlfx4w/hqdefault.jpg', 0, 0, '2016-02-26 18:00:01', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/oXGm9Vlfx4w/hqdefault.jpg', 0.0, 0, '', ''),
(18, 1, 13, 'Wild Wild Country | Official Trailer [HD] | Netflix', 'You have to see to be a believer. A Netflix Original documentary series about a controversial cult leader who builds a utopian city in the Oregon desert, resulting ...', 'hBLS_OM6Puk', 'https://i.ytimg.com/vi/hBLS_OM6Puk/hqdefault.jpg', 0, 0, '2018-02-28 18:16:26', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/hBLS_OM6Puk/hqdefault.jpg', 0.0, 0, '', ''),
(19, 1, 13, 'Homecoming: A Film By Beyoncé | Official Trailer | Netflix', 'Homecoming: A Film By Beyoncé is a 2019 Emmy® Awards Nominee. This intimate, in-depth look at Beyoncé\'s celebrated 2018 Coachella performance reveals ...', 'fB8qvx0HOlI', 'https://i.ytimg.com/vi/fB8qvx0HOlI/hqdefault.jpg', 0, 0, '2019-04-08 13:00:05', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/fB8qvx0HOlI/hqdefault.jpg', 0.0, 0, '', ''),
(20, 1, 13, 'THE SOCIAL NETWORK - Official Trailer (HD)', 'David Fincher\'s The Social Network is the stunning tale of a new breed of cultural insurgent: a punk genius who sparked a revolution and changed the face of ...', 'lB95KLmpLR4', 'https://i.ytimg.com/vi/lB95KLmpLR4/hqdefault.jpg', 0, 0, '2010-07-16 23:46:40', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/lB95KLmpLR4/hqdefault.jpg', 0.0, 0, '', ''),
(21, 1, 13, 'Breathe Official Trailer #1 (2017) Andrew Garfield, Claire Foy Biography Movie HD', 'Breathe Trailer 1 (2017) Andrew Garfield, Claire Foy Biography Movie HD [Official Trailer]', '7_YnYrLfjxA', 'https://i.ytimg.com/vi/7_YnYrLfjxA/hqdefault.jpg', 0, 0, '2017-06-29 11:14:29', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/7_YnYrLfjxA/hqdefault.jpg', 0.0, 0, '', ''),
(22, 1, 13, 'Kingdom | Official Trailer [HD] | Netflix', 'In a kingdom defeated by corruption and famine, a mysterious plague spreads to turn the infected into monsters. The crown prince, framed for treason and ...', '4l-yByZpaaM', 'https://i.ytimg.com/vi/4l-yByZpaaM/hqdefault.jpg', 0, 0, '2018-12-18 00:00:01', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/4l-yByZpaaM/hqdefault.jpg', 0.0, 0, '', ''),
(23, 1, 13, '1922 | Official Trailer [HD] | Netflix', 'Life is rarely fair. Based on the novella by Stephen King, comes a new Netflix Film, 1922. Now streaming. Watch 1922 on Netflix: https://www.netflix.com/ ...', '3E_fT0aTsjI', 'https://i.ytimg.com/vi/3E_fT0aTsjI/hqdefault.jpg', 0, 0, '2017-09-22 15:30:14', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/3E_fT0aTsjI/hqdefault.jpg', 0.0, 0, '', ''),
(24, 1, 13, 'Race Official Trailer #1 (2016) Stephan James, Jason Sudeikis Biographical Drama Movie HD', 'Race Trailer 1 (2016) Stephan James, Jason Sudeikis Biographical Drama Movie HD [Official Trailer]', '6ygu45dU3U4', 'https://i.ytimg.com/vi/6ygu45dU3U4/hqdefault.jpg', 0, 0, '2015-10-14 19:15:24', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/6ygu45dU3U4/hqdefault.jpg', 0.0, 0, '', ''),
(25, 1, 13, 'Walt Before Mickey Official Trailer 1 (2014) - Jon Heder, David Henrie Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Subscribe to INDIE & FILM FESTIVALS: http://bit.ly/1wbkfYg Like ...', 'MaOZiu-hnTM', 'https://i.ytimg.com/vi/MaOZiu-hnTM/hqdefault.jpg', 0, 0, '2014-10-09 15:00:06', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/MaOZiu-hnTM/hqdefault.jpg', 0.0, 0, '', ''),
(26, 1, 13, 'The Edge of Democracy | Official Trailer | Netflix', 'The Edge of Democracy releases globally on Netflix on June 19, 2019. A cautionary tale for these times of democracy in crisis - the personal and political fuse to ...', 'xLe24M_PB5E', 'https://i.ytimg.com/vi/xLe24M_PB5E/hqdefault.jpg', 0, 0, '2019-06-05 17:30:08', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/xLe24M_PB5E/hqdefault.jpg', 0.0, 0, '', ''),
(27, 1, 13, 'Pelé: Birth of a Legend Official Trailer #1 (2016) Biographical Movie HD', 'Pelé: Birth of a Legend Trailer 1 (2016) Biographical Movie HD [Official Trailer]', 'pwBXs2B2ZbI', 'https://i.ytimg.com/vi/pwBXs2B2ZbI/hqdefault.jpg', 0, 0, '2016-03-24 22:46:56', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/pwBXs2B2ZbI/hqdefault.jpg', 0.0, 0, '', ''),
(28, 1, 13, 'Bohemian Rhapsody | Official Trailer [HD] | 20th Century FOX', 'Now On Digital: https://fox.co/2R1S9W5 Now On Blu-ray & DVD: http://bit.ly/BohemRhapsody Bohemian Rhapsody is a foot-stomping celebration of Queen, their ...', 'mP0VHJYFOAU', 'https://i.ytimg.com/vi/mP0VHJYFOAU/hqdefault.jpg', 0, 0, '2018-07-17 13:00:41', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/mP0VHJYFOAU/hqdefault.jpg', 0.0, 0, '', ''),
(29, 1, 13, 'Diego Maradona (2019): Official Trailer | HBO', 'From Oscar Award winning documentarian Asif Kapadia, Diego Maradona premieres Tuesday, October 1 on HBO. #HBO #HBODocs #DiegoMaradona ...', 'Pmm7r4ynyIQ', 'https://i.ytimg.com/vi/Pmm7r4ynyIQ/hqdefault.jpg', 0, 0, '2019-09-13 18:00:42', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/Pmm7r4ynyIQ/hqdefault.jpg', 0.0, 0, '', ''),
(30, 1, 13, 'Tiger King: Murder, Mayhem and Madness | Official Trailer | Netflix', 'Among the eccentrics and cult personalities in the stranger-than-fiction world of big cat owners, few stand out more than Joe Exotic, a mulleted, gun-toting ...', 'acTdxsoa428', 'https://i.ytimg.com/vi/acTdxsoa428/hqdefault.jpg', 0, 0, '2020-03-10 16:00:01', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/acTdxsoa428/hqdefault.jpg', 0.0, 0, '', ''),
(31, 1, 13, 'Walt Before Mickey - Trailer', 'The true story of a boy whose dreams built a kingdom. The legendary Walt Disney had a tumultuous childhood, yet he was determined to overcome obstacles in ...', '90Cv3HJ39J4', 'https://i.ytimg.com/vi/90Cv3HJ39J4/hqdefault.jpg', 0, 0, '2015-10-23 21:39:27', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/90Cv3HJ39J4/hqdefault.jpg', 0.0, 0, '', ''),
(32, 1, 13, 'Death Note | Official Trailer [HD] | Netflix', 'Intoxicated by the power of a supernatural notebook, a young man begins killing those he deems unworthy of life. Based on the famous Japanese manga. Death ...', 'gvxNaSIB_WI', 'https://i.ytimg.com/vi/gvxNaSIB_WI/hqdefault.jpg', 0, 0, '2017-06-29 14:02:33', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/gvxNaSIB_WI/hqdefault.jpg', 0.0, 0, '', ''),
(33, 1, 13, 'Nicky Jam: El Ganador | Official Trailer | Netflix', 'From his humble and troubled start in Boston, to his downfall on the streets, to becoming the king of one of the most popular musical genres, this is not only the ...', 'qMRpelMtbes', 'https://i.ytimg.com/vi/qMRpelMtbes/hqdefault.jpg', 0, 0, '2020-03-31 20:00:00', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/qMRpelMtbes/hqdefault.jpg', 0.0, 0, '', ''),
(34, 1, 13, 'Bohemian Rhapsody - The Movie: Official Trailer', 'We\'re all legends…” Bohemian Rhapsody is a foot-stomping celebration of Queen, their music and their extraordinary lead singer Freddie Mercury. Freddie ...', 'cN10tfVW0UY', 'https://i.ytimg.com/vi/cN10tfVW0UY/hqdefault.jpg', 0, 0, '2018-07-17 13:00:05', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/cN10tfVW0UY/hqdefault.jpg', 0.0, 0, '', ''),
(35, 1, 13, 'The Perfection | Official Trailer [HD] | Netflix', 'It\'s time to face the music. Watch The Perfection only on Netflix on May 24, 2019. A troubled musical prodigy (Allison Williams) seeks out the new star pupil of her ...', 'q57D6kF5B1k', 'https://i.ytimg.com/vi/q57D6kF5B1k/hqdefault.jpg', 0, 0, '2019-04-15 15:02:54', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/q57D6kF5B1k/hqdefault.jpg', 0.0, 0, '', ''),
(36, 1, 13, 'Killer Inside: The Mind of Aaron Hernandez | Main Trailer | Netflix', 'Killer Inside: The Mind of Aaron Hernandez is a three-part documentary series examining what led to the murderous fall and shocking death of former NFL ...', '8Kr8j2YNE3Q', 'https://i.ytimg.com/vi/8Kr8j2YNE3Q/hqdefault.jpg', 0, 0, '2020-01-07 16:00:02', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/8Kr8j2YNE3Q/hqdefault.jpg', 0.0, 0, '', ''),
(37, 1, 13, 'The Kissing Booth | Official Trailer | Netflix', 'A pretty, teenage girl, who has never been kissed, finds her life turned totally upside down when she decides to run a kissing booth and unexpectedly ends up ...', '7bfS6seiLhk', 'https://i.ytimg.com/vi/7bfS6seiLhk/hqdefault.jpg', 0, 0, '2018-05-01 15:00:01', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/7bfS6seiLhk/hqdefault.jpg', 0.0, 0, '', ''),
(38, 1, 13, 'Messiah | Season 1 Official Trailer | Netflix', 'Who do you think he is? Watch Messiah on Netflix https://www.netflix.com/title/80117558 SUBSCRIBE: https://bit.ly/29qBUt7 About Netflix: Netflix is the world\'s ...', 'mjLWuzGVyew', 'https://i.ytimg.com/vi/mjLWuzGVyew/hqdefault.jpg', 0, 0, '2019-12-03 15:00:03', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/mjLWuzGVyew/hqdefault.jpg', 0.0, 0, '', ''),
(39, 1, 13, 'The Spy – starring Sacha Baron Cohen | Official Trailer | Netflix', 'THE SPY, starring Sacha Baron Cohen, is inspired by the real-life story of former notorious Mossad agent, Eli Cohen, who successfully goes undercover in Syria ...', '5UijUOy0MmE', 'https://i.ytimg.com/vi/5UijUOy0MmE/hqdefault.jpg', 0, 0, '2019-08-28 13:29:20', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/5UijUOy0MmE/hqdefault.jpg', 0.0, 0, '', ''),
(40, 1, 13, 'Barry l Official Trailer [HD] l Netflix', 'A young Barack Obama, known to his friends as “Barry,” arrives in New York City in the fall of 1981 to begin his junior year at Columbia University.', 'i6qlPeS1kGY', 'https://i.ytimg.com/vi/i6qlPeS1kGY/hqdefault.jpg', 0, 0, '2016-11-21 14:30:11', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/i6qlPeS1kGY/hqdefault.jpg', 0.0, 0, '', ''),
(41, 1, 13, 'To The Bone | Official Trailer [HD] | Netflix', 'Ellen is an unruly, 20-year-old young woman with anorexia nervosa who spent the better part of her teenage years being shepherded through various recovery ...', '705yRfs6Dbs', 'https://i.ytimg.com/vi/705yRfs6Dbs/hqdefault.jpg', 0, 0, '2017-06-20 16:02:15', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/705yRfs6Dbs/hqdefault.jpg', 0.0, 0, '', ''),
(42, 1, 13, 'The Trials of Gabriel Fernandez | Official Trailer | Netflix', 'From the Director of Nobody Speak: Trials of the Free Press, witness an unflinching look at the case that put the system on trial. Only on Netflix February 26.', '-T7VXlB4qUI', 'https://i.ytimg.com/vi/-T7VXlB4qUI/hqdefault.jpg', 0, 0, '2020-02-19 17:00:00', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/-T7VXlB4qUI/hqdefault.jpg', 0.0, 0, '', ''),
(43, 1, 13, 'Mercury 13 | Official Trailer [HD] | Netflix', '\"If we\'re going to send a human being to space, we should send the one most qualified.\" Mercury 13 tells the remarkable true story of the women who fought for ...', 'jpiVx2mQhKI', 'https://i.ytimg.com/vi/jpiVx2mQhKI/hqdefault.jpg', 0, 0, '2018-04-09 17:00:04', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/jpiVx2mQhKI/hqdefault.jpg', 0.0, 0, '', ''),
(44, 1, 13, 'MESSIAH Official Trailer (2020) Michelle Monaghan, Mehdi Dehbi Netflix TV Series HD', 'MESSIAH Official Trailer (2020) Michelle Monaghan, Mehdi Dehbi Netflix TV Series HD © 2019 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, ...', 'mG93_GyabHc', 'https://i.ytimg.com/vi/mG93_GyabHc/hqdefault.jpg', 0, 0, '2019-12-03 15:08:58', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/mG93_GyabHc/hqdefault.jpg', 0.0, 0, '', ''),
(45, 1, 13, 'Rocketman (2019) - Official Trailer - Paramount Pictures', 'The only way to tell his story is to live his fantasy. ✨ Taron Egerton is Elton John in #Rocketman, in theatres May 31. Watch the new trailer now! Get tickets: ...', 'S3vO8E2e6G0', 'https://i.ytimg.com/vi/S3vO8E2e6G0/hqdefault.jpg', 0, 0, '2019-02-21 13:39:25', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/S3vO8E2e6G0/hqdefault.jpg', 0.0, 0, '', ''),
(46, 1, 13, 'The New Mutants | Official Trailer | 20th Century FOX', '20th Century Fox in association with Marvel Entertainment presents “The New Mutants,” an original horror thriller set in an isolated hospital where a group of ...', 'W_vJhUAOFpI', 'https://i.ytimg.com/vi/W_vJhUAOFpI/hqdefault.jpg', 0, 0, '2020-01-06 14:00:06', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/W_vJhUAOFpI/hqdefault.jpg', 0.0, 0, '', ''),
(47, 1, 13, 'The King - Timothée Chalamet, Robert Pattinson | Final Trailer | Netflix Film', 'Are you ready for what awaits? Watch The King in select theaters and on Netflix. Hal (Timothée Chalamet), wayward prince and reluctant heir to the English ...', 'svVykTznk9Q', 'https://i.ytimg.com/vi/svVykTznk9Q/hqdefault.jpg', 0, 0, '2019-10-24 13:00:01', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/svVykTznk9Q/hqdefault.jpg', 0.0, 0, '', ''),
(48, 1, 13, 'Tony Robbins: I AM NOT YOUR GURU | Official Trailer [HD] | Netflix', 'At Date With Destiny, Tony Robbins spends six days tearing down peoples\' walls in order to build them up again into their authentic selves. Witness the first-ever ...', 'HUHMZf3qwsQ', 'https://i.ytimg.com/vi/HUHMZf3qwsQ/hqdefault.jpg', 0, 0, '2016-06-16 15:29:05', '2020-05-25 13:31:56', 'VERIFIED', 0, 'https://i.ytimg.com/vi/HUHMZf3qwsQ/hqdefault.jpg', 0.0, 0, '', ''),
(49, 1, 13, 'MORBIUS - Teaser Trailer (HD)', 'MORBIUS - watch the teaser trailer now. In theaters March 19, 2021. One of Marvel\'s most compelling and conflicted characters comes to the big screen as ...', 'jLMBLuGJTsA', 'https://i.ytimg.com/vi/jLMBLuGJTsA/hqdefault.jpg', 0, 0, '2020-01-13 17:00:07', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/jLMBLuGJTsA/hqdefault.jpg', 0.0, 0, '', ''),
(50, 1, 13, 'ANON Official Trailer (2018) Amanda Seyfried, Clive Owen Netflix Sci Fi Movie HD', 'ANON Official Trailer (2018) Amanda Seyfried, Clive Owen Sci Fi Movie HD © 2018 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action ...', 'xuaa4hJVC5s', 'https://i.ytimg.com/vi/xuaa4hJVC5s/hqdefault.jpg', 0, 0, '2018-02-28 18:13:37', '2020-05-25 13:31:56', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/xuaa4hJVC5s/hqdefault.jpg', 0.0, 0, '', ''),
(51, 1, 2, 'THE HAUNTING OF HILL HOUSE Official Trailer (2018) Netflix, Horror Movie', 'THE HAUNTING OF HILL HOUSE Official Trailer Movie in theatre 12 October 2018. © 2018 - Netflix.', '3eqxXqJDmcY', 'https://i.ytimg.com/vi/3eqxXqJDmcY/hqdefault.jpg', 0, 0, '2018-09-19 16:32:37', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/3eqxXqJDmcY/hqdefault.jpg', 0.0, 0, '', ''),
(52, 1, 2, 'CAM Official Trailer (2018) Netflix, Horror Movie', 'CAM Official Trailer Movie in theatre 16 November 2018. © 2018 - Netflix.', 'Y9x5ImTWK5s', 'https://i.ytimg.com/vi/Y9x5ImTWK5s/hqdefault.jpg', 0, 0, '2018-11-08 20:47:36', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/Y9x5ImTWK5s/hqdefault.jpg', 0.0, 0, '', ''),
(53, 1, 2, 'ELI Official Trailer (2019) Horror Movie Netflix', 'ELI Official Trailer Movie in streaming October 18. © 2019 - Netflix.', 'qRdJnx1k4H8', 'https://i.ytimg.com/vi/qRdJnx1k4H8/hqdefault.jpg', 0, 0, '2019-10-03 16:29:07', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/qRdJnx1k4H8/hqdefault.jpg', 0.0, 0, '', ''),
(54, 1, 2, 'Eli | Official Trailer | Netflix', 'As a last resort to cure their son\'s auto-immune disorder, the Millers move into a sterile manor during his treatments. Eli is tormented by terrifying visions ...', 'qfSTiAw1rkM', 'https://i.ytimg.com/vi/qfSTiAw1rkM/hqdefault.jpg', 0, 0, '2019-10-03 16:00:03', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/qfSTiAw1rkM/hqdefault.jpg', 0.0, 0, '', ''),
(55, 1, 2, 'CHAMBERS Official Trailer (2019) Netflix, Horror Series HD', 'CHAMBERS Official Trailer (2019) Netflix, Horror Series HD Subscribe to Rapid Trailer For All The Latest Movie Trailers! ▷ https://goo.gl/dAgvgK Follow us on ...', 'w2DpPN_7IbE', 'https://i.ytimg.com/vi/w2DpPN_7IbE/hqdefault.jpg', 0, 0, '2019-04-10 14:11:48', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/w2DpPN_7IbE/hqdefault.jpg', 0.0, 0, '', ''),
(56, 1, 2, 'MALEVOLENT Official Trailer (2018) Netflix, Horror Movie', 'MALEVOLENT Official Trailer Movie in theatre 5 October 2018. © 2018 - Netflix.', 't7ifLGDAPg8', 'https://i.ytimg.com/vi/t7ifLGDAPg8/hqdefault.jpg', 0, 0, '2018-10-01 18:45:12', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/t7ifLGDAPg8/hqdefault.jpg', 0.0, 0, '', ''),
(57, 1, 2, 'The Babysitter Official Trailer #1 (2017) Bella Thorne Netflix Horror Comedy Movie HD', 'The Babysitter Trailer 1 (2017) Bella Thorne Netflix Horror Comedy Movie HD [Official Trailer]', 'qibY77AWlUc', 'https://i.ytimg.com/vi/qibY77AWlUc/hqdefault.jpg', 0, 0, '2017-10-03 17:25:28', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/qibY77AWlUc/hqdefault.jpg', 0.0, 0, '', ''),
(58, 1, 2, 'LOCKE &amp; KEY Official Trailer (2020) Netflix, Fantasy Horror Movie HD', 'LOCKE & KEY Official Trailer (2020) Netflix, Fantasy Horror Movie HD Subscribe to Rapid Trailer For All The Latest Movie Trailers! ▷ http://bit.ly/39CsLvK Like ...', 'p_8LiMcBabk', 'https://i.ytimg.com/vi/p_8LiMcBabk/hqdefault.jpg', 0, 0, '2020-01-08 15:18:00', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/p_8LiMcBabk/hqdefault.jpg', 0.0, 0, '', ''),
(59, 1, 2, 'The Ritual | Official Trailer [HD] | Netflix', 'A NETFLIX FILM. The deeper you go, the scarier it becomes. SUBSCRIBE: http://bit.ly/29qBUt7 About Netflix: Netflix is the world\'s leading internet entertainment ...', 'Vfugwq2uoa0', 'https://i.ytimg.com/vi/Vfugwq2uoa0/hqdefault.jpg', 0, 0, '2018-01-26 18:00:19', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/Vfugwq2uoa0/hqdefault.jpg', 0.0, 0, '', ''),
(60, 1, 2, 'ELI Official Trailer (2019) Sadie Sink, Netflix Horror Movie HD', 'ELI Official Trailer (2019) Sadie Sink, Netflix Horror Movie HD Subscribe to Rapid Trailer For All The Latest Movie Trailers! ▷ https://goo.gl/dAgvgK Follow us on ...', '9WXuVU_oYJA', 'https://i.ytimg.com/vi/9WXuVU_oYJA/hqdefault.jpg', 0, 0, '2019-10-03 16:53:50', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/9WXuVU_oYJA/hqdefault.jpg', 0.0, 0, '', ''),
(61, 1, 2, 'MARIANNE Official Trailer (2019) Netflix, Horror Movie HD', 'MARIANNE Official Trailer (2019) Netflix, Horror Movie HD Subscribe HERE for NEW movie trailers ▻ https://goo.gl/o12wZ3 © 2019 - Netflix ...', 'RMrNY7VJp44', 'https://i.ytimg.com/vi/RMrNY7VJp44/hqdefault.jpg', 0, 0, '2019-08-27 14:09:16', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/RMrNY7VJp44/hqdefault.jpg', 0.0, 0, '', ''),
(62, 1, 2, 'In the Tall Grass | Official Trailer | Netflix', 'Some places have a mind of their own. Based on the novella by Stephen King and Joe Hill, when siblings Becky and Cal hear the cries of a young boy lost ...', '7afc9gTbVFI', 'https://i.ytimg.com/vi/7afc9gTbVFI/hqdefault.jpg', 0, 0, '2019-09-17 15:00:02', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/7afc9gTbVFI/hqdefault.jpg', 0.0, 0, '', ''),
(63, 1, 2, '???? VERONICA (2017) | Full Movie Trailer in Full HD | 1080p', 'Madrid, 1991. A teen girl finds herself besieged by an evil supernatural force after she played Ouija with two classmates. ---------------- Cast: Sandra Escacena ...', 'lQW5I5tCy28', 'https://i.ytimg.com/vi/lQW5I5tCy28/hqdefault.jpg', 0, 0, '2018-03-17 14:00:03', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/lQW5I5tCy28/hqdefault.jpg', 0.0, 0, '', ''),
(64, 1, 2, 'APOSTLE Official Trailer (2018) Horror Movie, Netflix', 'APOSTLE Official Trailer Movie on Netflix October 13. © 2018 - Netflix.', 'gI2W6zOnKBA', 'https://i.ytimg.com/vi/gI2W6zOnKBA/hqdefault.jpg', 0, 0, '2018-09-17 14:09:29', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/gI2W6zOnKBA/hqdefault.jpg', 0.0, 0, '', ''),
(65, 1, 2, '???? THE RITUAL (2017) | Full Movie Trailer in HD | 720p', 'A group of college friends reunite for a trip to the forest, but encounter a menacing presence in the woods that\'s stalking them. ---------------- Cast: Rafe Spall ...', 'hiwiNU63I-E', 'https://i.ytimg.com/vi/hiwiNU63I-E/hqdefault.jpg', 0, 0, '2018-03-01 15:00:03', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/hiwiNU63I-E/hqdefault.jpg', 0.0, 0, '', ''),
(66, 1, 2, 'Malevolent | Official Trailer [HD] | Netflix', 'Brother and sister team Angela (Florence Pugh) and Jackson (Ben Lloyd-Hughes) are nothing more than scam artists. Preying on the grief stricken and the ...', 'kJ3tMPVvE6w', 'https://i.ytimg.com/vi/kJ3tMPVvE6w/hqdefault.jpg', 0, 0, '2018-10-01 18:00:09', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/kJ3tMPVvE6w/hqdefault.jpg', 0.0, 0, '', ''),
(67, 1, 2, 'THE GRUDGE - Official Trailer (HD)', 'It will never let you go. Watch the new trailer for the R-rated, new vision of #TheGrudge - in theaters January 3. Visit our site: ...', 'O2NKzO-fxwQ', 'https://i.ytimg.com/vi/O2NKzO-fxwQ/hqdefault.jpg', 0, 0, '2019-10-28 14:00:03', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/O2NKzO-fxwQ/hqdefault.jpg', 0.0, 0, '', ''),
(68, 1, 2, 'THE BABYSITTER Official Trailer (2017) Bella Thorne Netflix Comedy Horror Movie HD', 'THE BABYSITTER Official Trailer (2017) Bella Thorne Netflix Comedy Horror Movie HD Subscribe to Rapid Trailer For All The Latest Trailers!', 'hMFIbeVBZFo', 'https://i.ytimg.com/vi/hMFIbeVBZFo/hqdefault.jpg', 0, 0, '2017-10-03 15:35:30', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/hMFIbeVBZFo/hqdefault.jpg', 0.0, 0, '', ''),
(69, 1, 2, 'Bird Box | Official Trailer [HD] | Netflix', 'Never lose sight of survival. Watch BirdBox on Netflix on December 21, 2018. When a mysterious force decimates the world\'s population, only one thing is ...', 'o2AsIXSh2xo', 'https://i.ytimg.com/vi/o2AsIXSh2xo/hqdefault.jpg', 0, 0, '2018-10-24 14:00:11', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/o2AsIXSh2xo/hqdefault.jpg', 0.0, 0, '', ''),
(70, 1, 2, 'Apostle | Official Trailer [HD] | Netflix', 'The promise of the divine is but an illusion. From Gareth Evans, writer and director of The Raid franchise, comes Apostle. A Netflix film starring Dan Stevens and ...', 'J1JdWOqc9Q8', 'https://i.ytimg.com/vi/J1JdWOqc9Q8/hqdefault.jpg', 0, 0, '2018-09-17 14:00:01', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/J1JdWOqc9Q8/hqdefault.jpg', 0.0, 0, '', ''),
(71, 1, 2, 'The Turning - Official Trailer', 'Keeping the lights on won\'t keep you safe. Watch the trailer for #TheTurningMovie, in theaters January 24. Facebook: https://www.facebook.com/turningmovie ...', 'rl33gU2APIs', 'https://i.ytimg.com/vi/rl33gU2APIs/hqdefault.jpg', 0, 0, '2019-10-09 16:00:11', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/rl33gU2APIs/hqdefault.jpg', 0.0, 0, '', ''),
(72, 1, 2, 'RELIC Official Trailer (2020) Horror Movie', 'First trailer for RELIC starring Emily Mortimer.', 'ESe4p1E2ugQ', 'https://i.ytimg.com/vi/ESe4p1E2ugQ/hqdefault.jpg', 0, 0, '2020-05-21 15:15:46', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/ESe4p1E2ugQ/hqdefault.jpg', 0.0, 0, '', ''),
(73, 1, 2, 'FANTASY ISLAND - Official Trailer (HD)', 'Screams come true. Watch the new trailer for #Blumhouse\'s #FantasyIslandMovie, in theaters Valentine\'s Day. #NeverComingHome Visit Site: ...', 'a6O30nJ02PU', 'https://i.ytimg.com/vi/a6O30nJ02PU/hqdefault.jpg', 0, 0, '2019-11-11 17:00:01', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/a6O30nJ02PU/hqdefault.jpg', 0.0, 0, '', ''),
(74, 1, 2, 'The Silence | Official Trailer [HD] | Netflix', 'When the world is under attack from terrifying creatures who hunt their human prey by sound, 16-year old Ally Andrews (Kiernan Shipka), who lost her hearing at ...', 'Y-ufZuqTd5c', 'https://i.ytimg.com/vi/Y-ufZuqTd5c/hqdefault.jpg', 0, 0, '2019-03-29 15:00:04', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/Y-ufZuqTd5c/hqdefault.jpg', 0.0, 0, '', ''),
(75, 1, 2, 'BIRD BOX Official Trailer (2018) Sandra Bullock, Sarah Paulson Movie, Netflix HD', 'BIRD BOX Official Trailer (2018) Sandra Bullock, Sarah Paulson Movie, Netflix HD © 2018 -Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action ...', 'mjFXxHDbhus', 'https://i.ytimg.com/vi/mjFXxHDbhus/hqdefault.jpg', 0, 0, '2018-10-24 14:07:51', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/mjFXxHDbhus/hqdefault.jpg', 0.0, 0, '', ''),
(76, 1, 2, 'CAM Official Trailer (2018) Netflix Horror Movie HD', 'CAM Official Trailer (2018) Netflix Horror Movie HD Subscribe to Rapid Trailer For All The Latest Movie Trailers! ▷ https://goo.gl/dAgvgK Follow us on Twitter ...', 'VnJCvVFl3JU', 'https://i.ytimg.com/vi/VnJCvVFl3JU/hqdefault.jpg', 0, 0, '2018-11-08 20:56:47', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/VnJCvVFl3JU/hqdefault.jpg', 0.0, 0, '', ''),
(77, 1, 2, 'SPUTNIK Official Trailer (2020) Alien Horror Movie', 'First trailer for SPUTNIK starring.', 'jLn2xeJgQeM', 'https://i.ytimg.com/vi/jLn2xeJgQeM/hqdefault.jpg', 0, 0, '2020-05-20 21:01:19', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/jLn2xeJgQeM/hqdefault.jpg', 0.0, 0, '', ''),
(78, 1, 2, 'Locke &amp; Key | Official Trailer | Netflix', 'Official Trailer for Locke & Key Season 1, coming to Netflix on February 7, 2020. Based on the best-selling graphic novels, Locke & Key follows 3 siblings who, ...', '_EonRi0yQOE', 'https://i.ytimg.com/vi/_EonRi0yQOE/hqdefault.jpg', 0, 0, '2020-01-08 15:00:02', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/_EonRi0yQOE/hqdefault.jpg', 0.0, 0, '', ''),
(79, 1, 2, 'It Follows Official Trailer 1 (2015) - Horror Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Subscribe to INDIE & FILM FESTIVALS: http://bit.ly/1wbkfYg Like ...', 'HkZYbOH0ujw', 'https://i.ytimg.com/vi/HkZYbOH0ujw/hqdefault.jpg', 0, 0, '2014-12-18 19:59:00', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/HkZYbOH0ujw/hqdefault.jpg', 0.0, 0, '', ''),
(80, 1, 2, 'MARIANNE Official Trailer (2019) French Horror Netflix', 'MARIANNE Official Trailer (2019) French Horror Netflix PLOT: When a novelist realizes her terrifying stories are coming true, she returns to her hometown to face ...', 'UbqyURbesYE', 'https://i.ytimg.com/vi/UbqyURbesYE/hqdefault.jpg', 0, 0, '2019-08-27 09:51:06', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/UbqyURbesYE/hqdefault.jpg', 0.0, 0, '', ''),
(81, 1, 2, 'The Platform | Main Trailer | Netflix', 'Inside a vertical prison system, inmates are assigned to a level and forced to ration food from a platform that moves between the floors. Directed by Galder ...', 'RlfooqeZcdY', 'https://i.ytimg.com/vi/RlfooqeZcdY/hqdefault.jpg', 0, 0, '2020-03-06 15:00:00', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/RlfooqeZcdY/hqdefault.jpg', 0.0, 0, '', ''),
(82, 1, 2, 'Creep Official Trailer 1 (2015) - Mark Duplass Horror Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Subscribe to INDIE TRAILERS: http://goo.gl/iPUuo Like us on ...', 'Gp7tBypjwDo', 'https://i.ytimg.com/vi/Gp7tBypjwDo/hqdefault.jpg', 0, 0, '2015-06-05 21:47:20', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/Gp7tBypjwDo/hqdefault.jpg', 0.0, 0, '', ''),
(83, 1, 2, 'Halloween - Official Trailer (HD)', 'Universal Pictures will release Trancas International Films, Blumhouse Productions and Miramax\'s Halloween on Friday, October 19, 2018. Jamie Lee Curtis ...', 'ek1ePFp-nBI', 'https://i.ytimg.com/vi/ek1ePFp-nBI/hqdefault.jpg', 0, 0, '2018-06-08 14:00:03', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/ek1ePFp-nBI/hqdefault.jpg', 0.0, 0, '', ''),
(84, 1, 2, 'FOUR KIDS AND IT Official Trailer (2020) Sci-Fi Movie', 'First trailer for Four Kids and It .', 'WW-GiZzjeXE', 'https://i.ytimg.com/vi/WW-GiZzjeXE/hqdefault.jpg', 0, 0, '2020-05-22 16:46:40', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/WW-GiZzjeXE/hqdefault.jpg', 0.0, 0, '', ''),
(85, 1, 2, 'Ragnarok | Official Trailer | Netflix', 'No one has taken up the fight against the Giants since Ragnarok - until now. A hero will rise, January 31. Watch Ragnarok, Only on Netflix: ...', '7H9AaiBLHCo', 'https://i.ytimg.com/vi/7H9AaiBLHCo/hqdefault.jpg', 0, 0, '2020-01-10 08:00:00', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/7H9AaiBLHCo/hqdefault.jpg', 0.0, 0, '', ''),
(86, 1, 2, 'Cargo | Official Trailer [HD] | Netflix', 'From the producer of The Babadook, and starring Martin Freeman, comes Cargo. Based on the viral short film, this is the story of a man and his infant daughter ...', 'W5QJW0M5pik', 'https://i.ytimg.com/vi/W5QJW0M5pik/hqdefault.jpg', 0, 0, '2018-04-03 15:00:04', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/W5QJW0M5pik/hqdefault.jpg', 0.0, 0, '', ''),
(87, 1, 2, 'The Remaining Official Trailer #1 (2014) - Alexa Vega Horror Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Subscribe to INDIE TRAILERS: http://goo.gl/iPUuo Like us on ...', 'N3pyDaNoY6s', 'https://i.ytimg.com/vi/N3pyDaNoY6s/hqdefault.jpg', 0, 0, '2014-08-07 17:48:17', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/N3pyDaNoY6s/hqdefault.jpg', 0.0, 0, '', ''),
(88, 1, 2, 'The Rain | Official Trailer [HD] | Netflix', 'You never know when your life is going to change.” After a brutal virus wipes out most of the population, two young siblings embark on a perilous search for ...', 'st6r-8mLW_o', 'https://i.ytimg.com/vi/st6r-8mLW_o/hqdefault.jpg', 0, 0, '2018-04-23 16:00:53', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/st6r-8mLW_o/hqdefault.jpg', 0.0, 0, '', ''),
(89, 1, 2, 'Contagion (2011) Official Exclusive 1080p HD Trailer', '\"Contagion\" follows the rapid progress of a lethal airborne virus that kills within days. As the fast-moving epidemic grows, the worldwide medical community ...', '4sYSyuuLk5g', 'https://i.ytimg.com/vi/4sYSyuuLk5g/hqdefault.jpg', 0, 0, '2011-07-14 01:02:51', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/4sYSyuuLk5g/hqdefault.jpg', 0.0, 0, '', ''),
(90, 1, 2, 'Chilling Adventures of Sabrina | Official Trailer | Netflix', 'Her name is Sabrina Spellman. Half witch. Half mortal. On her 16th birthday, Sabrina (Kiernan Shipka) has to make a choice between the witch world of her ...', 'ybKUX6thF8Q', 'https://i.ytimg.com/vi/ybKUX6thF8Q/hqdefault.jpg', 0, 0, '2018-10-03 14:30:09', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/ybKUX6thF8Q/hqdefault.jpg', 0.0, 0, '', ''),
(91, 1, 2, 'Close | Official Trailer [HD] | Netflix', 'Trained to protect. Born to Survive. Watch Close on Netflix - January 18th, 2019. To protect an heiress from highly trained kidnappers, a lone security expert ...', 'qWKsiHEpiJM', 'https://i.ytimg.com/vi/qWKsiHEpiJM/hqdefault.jpg', 0, 0, '2019-01-03 16:48:30', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/qWKsiHEpiJM/hqdefault.jpg', 0.0, 0, '', ''),
(92, 1, 2, 'THE LAST DAYS OF AMERICAN CRIME Official Trailer (2020) Netflix, Action Movie HD', 'THE LAST DAYS OF AMERICAN CRIME Official Trailer (2020) Netflix, Action Movie HD Subscribe to Rapid Trailer For All The Latest Movie Trailers!', 'O_7PWR4njKc', 'https://i.ytimg.com/vi/O_7PWR4njKc/hqdefault.jpg', 0, 0, '2020-05-19 17:35:39', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/O_7PWR4njKc/hqdefault.jpg', 0.0, 0, '', ''),
(93, 1, 2, 'SPUTNIK Trailer (2020) Sci-Fi Horror Movie HD', 'SPUTNIK Trailer (2020) Sci-Fi Horror Movie HD PLOT: The lone survivor of an enigmatic spaceship incident hasn\'t returned back home alone-hiding inside his ...', 'bzaIIywAgKM', 'https://i.ytimg.com/vi/bzaIIywAgKM/hqdefault.jpg', 0, 0, '2020-05-21 18:51:12', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/bzaIIywAgKM/hqdefault.jpg', 0.0, 0, '', ''),
(94, 1, 2, 'Wounds | Official Trailer | Netflix', 'When bartender Will discovers a cell phone after a violent brawl, he begins to receive ominous messages and his life quickly descends into a nightmare.', '81uxmIO_lps', 'https://i.ytimg.com/vi/81uxmIO_lps/hqdefault.jpg', 0, 0, '2019-09-30 14:00:00', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/81uxmIO_lps/hqdefault.jpg', 0.0, 0, '', ''),
(95, 1, 2, 'MA - Official Trailer', 'MA - In Theaters May 31 https://www.mamovie.com/ #MAmovie Everybody\'s welcome at Ma\'s. But good luck getting home safe. Oscar® winner Octavia Spencer ...', 'eIvbEC8N3cA', 'https://i.ytimg.com/vi/eIvbEC8N3cA/hqdefault.jpg', 0, 0, '2019-02-13 15:59:26', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/eIvbEC8N3cA/hqdefault.jpg', 0.0, 0, '', ''),
(96, 1, 2, 'Run (2020 Movie) Official Trailer – Sarah Paulson, Kiera Allen', 'Run – Coming Soon. Starring Sarah Paulson, introducing Kiera Allen. #RunFilm Subscribe to the LIONSGATE YouTube Channel for the latest movie trailers, ...', '0Dhh7q9Us5c', 'https://i.ytimg.com/vi/0Dhh7q9Us5c/hqdefault.jpg', 0, 0, '2020-02-20 16:00:56', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/0Dhh7q9Us5c/hqdefault.jpg', 0.0, 0, '', ''),
(97, 1, 2, 'October Faction | Season 1 Official Trailer | Netflix', '17-year-old twins\' lives are turned upside down when they discover their seemingly unremarkable insurance sales rep parents are, in fact, (spoiler alert!) trained ...', 'RexcOKt3k9k', 'https://i.ytimg.com/vi/RexcOKt3k9k/hqdefault.jpg', 0, 0, '2020-01-09 02:00:00', '2020-05-25 13:34:24', 'VERIFIED', 0, 'https://i.ytimg.com/vi/RexcOKt3k9k/hqdefault.jpg', 0.0, 0, '', ''),
(98, 1, 2, 'The Boy Official Trailer #1 (2016) - Lauren Cohan Horror Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Like us on FACEBOOK: http://bit.ly/1QyRMsE Follow us on ...', 'X1U21VBSbSs', 'https://i.ytimg.com/vi/X1U21VBSbSs/hqdefault.jpg', 0, 0, '2015-10-17 17:00:00', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/X1U21VBSbSs/hqdefault.jpg', 0.0, 0, '', ''),
(99, 1, 2, 'The Babadook Official Trailer #1 (2014) - Essie Davis Horror Movie HD', 'Subscribe to TRAILERS: http://bit.ly/sxaw6h Subscribe to COMING SOON: http://bit.ly/H2vZUn Like us on FACEBOOK: http://goo.gl/dHs73 The Babadook Official ...', 'k5WQZzDRVtw', 'https://i.ytimg.com/vi/k5WQZzDRVtw/hqdefault.jpg', 0, 0, '2014-01-22 15:59:14', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/k5WQZzDRVtw/hqdefault.jpg', 0.0, 0, '', ''),
(100, 1, 2, 'GRETA | Official Trailer | Focus Features', 'A sweet, naïve young woman trying to make it on her own in New York City, Frances (Chloë Grace Moretz) doesn\'t think twice about returning the handbag she ...', 'WAEoJkL_8zU', 'https://i.ytimg.com/vi/WAEoJkL_8zU/hqdefault.jpg', 0, 0, '2018-12-20 16:00:20', '2020-05-25 13:34:24', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/WAEoJkL_8zU/hqdefault.jpg', 0.0, 0, '', ''),
(101, 1, 4, 'THE PACKAGE Official Trailer (2018) Teen Comedy Netflix Movie HD', 'THE PACKAGE Official Trailer (2018) Teen Comedy Netflix Movie HD © 2018 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema, ...', '2VfmnoiraDQ', 'https://i.ytimg.com/vi/2VfmnoiraDQ/hqdefault.jpg', 0, 0, '2018-07-12 15:17:13', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/2VfmnoiraDQ/hqdefault.jpg', 0.0, 0, '', ''),
(102, 1, 4, 'THE WRONG MISSY Official Trailer (2020) David Spade, Netflix Comedy Movie HD', 'THE WRONG MISSY Official Trailer (2020) David Spade, Netflix Comedy Movie HD © 2020 - Netflix.', '-d-Flm0fJDk', 'https://i.ytimg.com/vi/-d-Flm0fJDk/hqdefault.jpg', 0, 0, '2020-04-21 14:34:40', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/-d-Flm0fJDk/hqdefault.jpg', 0.0, 0, '', ''),
(103, 1, 4, 'THE LAST LAUGH Official Trailer (2019) Netflix, Comedy Movie HD', 'THE LAST LAUGH Official Trailer (2019) Netflix, Comedy Movie HD Subscribe to Rapid Trailer For All The Latest Movie Trailers! ▷ https://goo.gl/dAgvgK Follow ...', 'vziPV9plxV4', 'https://i.ytimg.com/vi/vziPV9plxV4/hqdefault.jpg', 0, 0, '2019-01-02 16:45:52', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/vziPV9plxV4/hqdefault.jpg', 0.0, 0, '', ''),
(104, 1, 4, 'GAME OVER, MAN ! Official Trailer (2018) Netflix Comedy Movie HD', 'GAME OVER, MAN! Official Trailer © 2017 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema, Blockbuster, Scifi Movie or Fantasy ...', 'ZLiKFMXJoNw', 'https://i.ytimg.com/vi/ZLiKFMXJoNw/hqdefault.jpg', 0, 0, '2018-01-04 16:41:51', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/ZLiKFMXJoNw/hqdefault.jpg', 0.0, 0, '', ''),
(105, 1, 4, 'Set It Up | Official Trailer [HD] | Netflix', 'New York assistants, Harper (Zoey Deutch) and Charlie (Glen Powell), are used to going above and beyond for their high-powered (and highly demanding) ...', 'X-eRc9PF3TU', 'https://i.ytimg.com/vi/X-eRc9PF3TU/hqdefault.jpg', 0, 0, '2018-05-15 14:30:09', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/X-eRc9PF3TU/hqdefault.jpg', 0.0, 0, '', ''),
(106, 1, 4, 'GIRLBOSS Official Trailer (HD) Britt Robertson Netflix Comedy Series (2017)', 'GIRLBOSS Official Trailer (HD) Britt Robertson Netflix Comedy Series (2017) SUBSCRIBE for more TV Trailers HERE: https://goo.gl/TL21HZ Let\'s do this. Netflix ...', 'Jyr8R8cSGdo', 'https://i.ytimg.com/vi/Jyr8R8cSGdo/hqdefault.jpg', 0, 0, '2017-04-03 14:59:08', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/Jyr8R8cSGdo/hqdefault.jpg', 0.0, 0, '', ''),
(107, 1, 4, 'The Package | Official Trailer #1  [HD] | Netflix', 'When five teens go on a spring break camping trip, an unfortunate accident sets off a race against time to save their friend\'s most prized possession. From the ...', 'FA_K9QPuKuM', 'https://i.ytimg.com/vi/FA_K9QPuKuM/hqdefault.jpg', 0, 0, '2018-07-12 15:01:01', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/FA_K9QPuKuM/hqdefault.jpg', 0.0, 0, '', ''),
(108, 1, 4, 'The Wrong Missy | Official Trailer | Netflix', 'When Tim Morris meets his dream girl and their relationship quickly escalates through texts, he throws caution to the wind and invites her to his company\'s ...', '2Cwaneq2w-4', 'https://i.ytimg.com/vi/2Cwaneq2w-4/hqdefault.jpg', 0, 0, '2020-04-21 14:00:02', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/2Cwaneq2w-4/hqdefault.jpg', 0.0, 0, '', ''),
(109, 1, 4, 'MURDER MYSTERY Official Trailer (2019) Jennifer Aniston, Adam Sandler Netflix Comedy Movie HD', 'MURDER MYSTERY Official Trailer (2019) Jennifer Aniston, Adam Sandler Netflix Comedy Movie HD © 2019 - Netflix Comedy, Kids, Family and Animated Film, ...', 'wabdIOtfFOc', 'https://i.ytimg.com/vi/wabdIOtfFOc/hqdefault.jpg', 0, 0, '2019-04-26 17:08:24', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/wabdIOtfFOc/hqdefault.jpg', 0.0, 0, '', ''),
(110, 1, 4, 'GAME OVER, MAN! | Official Trailer [HD] | Netflix', 'Three friends must level-up and become heroes when their workplace, a Los Angeles hotel, is taken hostage by evil gunmen seeking a large ransom. Game ...', 'u7ZHi_dDSnQ', 'https://i.ytimg.com/vi/u7ZHi_dDSnQ/hqdefault.jpg', 0, 0, '2018-01-04 16:00:05', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/u7ZHi_dDSnQ/hqdefault.jpg', 0.0, 0, '', ''),
(111, 1, 4, 'STEP SISTERS Official Trailer (2018) Netflix Dance Comedy Movie HD', 'STEP SISTERS Official Trailer (2018) Netflix Dance Comedy Movie HD SUBSCRIBE for more Movie Trailers HERE: https://goo.gl/Yr3O86 Jamilah seems to ...', 'dduxPlKIZHA', 'https://i.ytimg.com/vi/dduxPlKIZHA/hqdefault.jpg', 0, 0, '2018-01-02 16:48:26', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/dduxPlKIZHA/hqdefault.jpg', 0.0, 0, '', ''),
(112, 1, 4, 'DUMPLIN&#39; Official Trailer (2018) Jennifer Aniston, Netflix Movie HD', 'DUMPLIN Official Trailer (2018) Jennifer Aniston, Netflix Movie HD © 2018 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema, ...', 'u1cdJA6jxtA', 'https://i.ytimg.com/vi/u1cdJA6jxtA/hqdefault.jpg', 0, 0, '2018-11-14 15:10:06', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/u1cdJA6jxtA/hqdefault.jpg', 0.0, 0, '', ''),
(113, 1, 4, 'The Last Summer | Official Trailer [HD] | Netflix', 'Standing on the precipice of adulthood, a group of friends navigate new relationships, while reexamining others, during their final summer before college.', 'Qe9B8kzlFjM', 'https://i.ytimg.com/vi/Qe9B8kzlFjM/hqdefault.jpg', 0, 0, '2019-04-09 21:00:31', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/Qe9B8kzlFjM/hqdefault.jpg', 0.0, 0, '', ''),
(114, 1, 4, 'The After Party | Official Trailer [HD] | Netflix', 'When an aspiring rapper goes viral for all the wrong reasons, he thinks his career is over. But when his best friend gets them into a wild NYC after party, he gets ...', 'coG5LwaHp3c', 'https://i.ytimg.com/vi/coG5LwaHp3c/hqdefault.jpg', 0, 0, '2018-08-06 14:30:05', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/coG5LwaHp3c/hqdefault.jpg', 0.0, 0, '', ''),
(115, 1, 4, 'Murder Mystery | Trailer | Netflix', 'When an NYC cop (Adam Sandler) finally takes his wife (Jennifer Aniston) on a long promised European trip, a chance meeting on the flight gets them invited to ...', '5YEVQDr2f3Q', 'https://i.ytimg.com/vi/5YEVQDr2f3Q/hqdefault.jpg', 0, 0, '2019-04-26 17:06:25', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/5YEVQDr2f3Q/hqdefault.jpg', 0.0, 0, '', ''),
(116, 1, 4, 'GLOW Official Trailer (2017) Alison Brie Netflix New TV Series HD', 'GLOW Trailer (2017) Netflix New TV Series HD © 2017 - Netflix.', 'wnKEoXbBTEw', 'https://i.ytimg.com/vi/wnKEoXbBTEw/hqdefault.jpg', 0, 0, '2017-05-15 14:42:31', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/wnKEoXbBTEw/hqdefault.jpg', 0.0, 0, '', ''),
(117, 1, 4, 'Klaus | Official Trailer | Netflix', 'This holiday season, discover the unlikely friendship that launched a legend. Watch Klaus on #Netflix November 15th, 2019. #KlausNetflix When Jesper (Jason ...', 'taE3PwurhYM', 'https://i.ytimg.com/vi/taE3PwurhYM/hqdefault.jpg', 0, 0, '2019-10-07 13:00:03', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/taE3PwurhYM/hqdefault.jpg', 0.0, 0, '', '');
INSERT INTO `videos` (`id`, `channel_id`, `interest_id`, `title`, `description`, `url`, `thumbnails`, `ratings`, `views`, `publish_at`, `create_at`, `flag`, `is_featured`, `cover`, `rating`, `runtime`, `director`, `writer`) VALUES
(118, 1, 4, 'ALEXA AND KATIE Official Trailer (2018) Netflix Comedy Series HD', 'ALEXA AND KATIE Official Trailer (2018) Netflix Comedy Series HD Subscribe to Rapid Trailer For All The Latest Trailers! ▷ https://goo.gl/dAgvgK Follow us on ...', 'y1glH2y8rW0', 'https://i.ytimg.com/vi/y1glH2y8rW0/hqdefault.jpg', 0, 0, '2018-03-12 15:21:58', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/y1glH2y8rW0/hqdefault.jpg', 0.0, 0, '', ''),
(119, 1, 4, 'THE BIG SHOW SHOW Official Trailer (2020) Netflix Comedy Series HD', 'THE BIG SHOW SHOW Official Trailer (2020) Netflix Comedy Series HD © 2020 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema, ...', 'BHC5rLnwVzY', 'https://i.ytimg.com/vi/BHC5rLnwVzY/hqdefault.jpg', 0, 0, '2020-03-24 17:10:19', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/BHC5rLnwVzY/hqdefault.jpg', 0.0, 0, '', ''),
(120, 1, 4, 'When We First Met | Official Trailer [HD] | Netflix', 'Using a magical photo booth that sends him back in time, Noah relives the night he met Avery over and over, trying to persuade her to fall for him Watch When ...', 'd2sJNee7FQ4', 'https://i.ytimg.com/vi/d2sJNee7FQ4/hqdefault.jpg', 0, 0, '2018-01-29 14:30:18', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/d2sJNee7FQ4/hqdefault.jpg', 0.0, 0, '', ''),
(121, 1, 4, 'LET IT SNOW Official Trailer (2019) Odeya Rush, Isabela Moner Netflix Christmas Movie HD', 'LET IT SNOW Official Trailer (2019) Isabela Moner Merced, Kiernan Shipka, Teen, Christmas Netlfix Movie HD © 2019 - Netflix Comedy, Kids, Family and ...', 'sE0M07omzOw', 'https://i.ytimg.com/vi/sE0M07omzOw/hqdefault.jpg', 0, 0, '2019-10-22 15:28:18', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/sE0M07omzOw/hqdefault.jpg', 0.0, 0, '', ''),
(122, 1, 4, 'The Kissing Booth | Official Trailer | Netflix', 'A pretty, teenage girl, who has never been kissed, finds her life turned totally upside down when she decides to run a kissing booth and unexpectedly ends up ...', '7bfS6seiLhk', 'https://i.ytimg.com/vi/7bfS6seiLhk/hqdefault.jpg', 0, 0, '2018-05-01 15:00:01', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/7bfS6seiLhk/hqdefault.jpg', 0.0, 0, '', ''),
(123, 1, 4, 'MEDICAL POLICE Official Trailer (2020) Comedy, Netflix Series HD', 'MEDICAL POLICE Official Trailer (2020) Netflix TV Series HD © 2019 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema, ...', 'DOhwiIoFNKI', 'https://i.ytimg.com/vi/DOhwiIoFNKI/hqdefault.jpg', 0, 0, '2019-12-19 16:08:29', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/DOhwiIoFNKI/hqdefault.jpg', 0.0, 0, '', ''),
(124, 1, 4, 'SPACE FORCE Official Trailer (2020) Steve Carell, Lisa Kudrow Netflix Comedy Series HD', 'SPACE FORCE Official Trailer (2020) Steve Carell, Lisa Kudrow Netflix Comedy Series HD © 2020 - Netflix.', 'q_9fLqiwx7E', 'https://i.ytimg.com/vi/q_9fLqiwx7E/hqdefault.jpg', 0, 0, '2020-05-05 13:27:09', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/q_9fLqiwx7E/hqdefault.jpg', 0.0, 0, '', ''),
(125, 1, 4, 'The Perfect Date | Official Trailer [HD] | Netflix', 'To save up for college, Brooks Rattigan (Noah Centineo) creates an app where anyone can pay him to play the perfect stand-in boyfriend for any occasion.', 'Hld-7oBn3Rk', 'https://i.ytimg.com/vi/Hld-7oBn3Rk/hqdefault.jpg', 0, 0, '2019-03-26 17:00:43', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/Hld-7oBn3Rk/hqdefault.jpg', 0.0, 0, '', ''),
(126, 1, 4, 'Space Force | Official Trailer | Netflix', 'Space is...hard. From the crew who brought you The Office, Space Force premieres May 29 only on Netflix. SUBSCRIBE: http://bit.ly/29qBUt7 About Netflix: ...', 'l4mY2asIjWk', 'https://i.ytimg.com/vi/l4mY2asIjWk/hqdefault.jpg', 0, 0, '2020-05-19 13:00:01', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/l4mY2asIjWk/hqdefault.jpg', 0.0, 0, '', ''),
(127, 1, 4, 'Turn Up Charlie | Official Trailer [HD] | Netflix', 'Starring Idris Elba. Turn Up Charlie follows a down-and-out DJ who plots to rebuild his music career whilst working as a nanny for his famous best friend\'s wild ...', 'IOsU1RoI6CM', 'https://i.ytimg.com/vi/IOsU1RoI6CM/hqdefault.jpg', 0, 0, '2019-02-28 13:57:57', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/IOsU1RoI6CM/hqdefault.jpg', 0.0, 0, '', ''),
(128, 1, 4, 'THE KISSING BOOTH Official Trailer (2018) Joey King Netflix Comedy Movie HD', 'THE KISSING BOOTH Official Trailer (2018) Joey King Netflix Comedy Movie HD Subscribe to Rapid Trailer For All The Latest Trailers! ▷ https://goo.gl/dAgvgK ...', 'r9jJTyr-Wwc', 'https://i.ytimg.com/vi/r9jJTyr-Wwc/hqdefault.jpg', 0, 0, '2018-05-01 15:30:18', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/r9jJTyr-Wwc/hqdefault.jpg', 0.0, 0, '', ''),
(129, 1, 4, 'Someone Great | Official Trailer [HD] | Netflix', 'Aspiring music journalist Jenny (Gina Rodriguez) has just landed her dream job at an iconic magazine and is about to move to San Francisco. Rather than do ...', 'BBd9gcrj2Wk', 'https://i.ytimg.com/vi/BBd9gcrj2Wk/hqdefault.jpg', 0, 0, '2019-03-06 16:30:03', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/BBd9gcrj2Wk/hqdefault.jpg', 0.0, 0, '', ''),
(130, 1, 4, 'Space Force | Official Teaser | Netflix', 'Steve Carell, welcome to Space Force. From the crew that brought you The Office, Space Force is coming soon to Netflix. SUBSCRIBE: http://bit.ly/29qBUt7 ...', 'bdpYpulGCKc', 'https://i.ytimg.com/vi/bdpYpulGCKc/hqdefault.jpg', 0, 0, '2020-05-05 13:00:04', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/bdpYpulGCKc/hqdefault.jpg', 0.0, 0, '', ''),
(131, 1, 4, 'Unbelievable | Official Trailer | Netflix', 'Inspired by real events, a teen reports and eventually recants her reported rape, while two female detectives, states away, investigate evidence that could reveal ...', 'QTIkUzkbzQk', 'https://i.ytimg.com/vi/QTIkUzkbzQk/hqdefault.jpg', 0, 0, '2019-07-18 15:00:05', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/QTIkUzkbzQk/hqdefault.jpg', 0.0, 0, '', ''),
(132, 1, 4, 'SPACE FORCE Trailer (2020) Netflix', 'A four-star general begrudgingly teams up with an eccentric scientist to get the U.S. military\'s newest agency — Space Force — ready for lift-off.', 'USdyC0h-kAU', 'https://i.ytimg.com/vi/USdyC0h-kAU/hqdefault.jpg', 0, 0, '2020-05-19 14:45:21', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/USdyC0h-kAU/hqdefault.jpg', 0.0, 0, '', ''),
(133, 1, 4, 'TURN UP CHARLIE Official Trailer (2019) Idris Elba, Netflix TV Series HD', 'TURN UP CHARLIE Official Trailer (2019) Idris Elba, Netflix TV Series HD © 2019 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema ...', 'dpOf4VMZb1w', 'https://i.ytimg.com/vi/dpOf4VMZb1w/hqdefault.jpg', 0, 0, '2019-02-28 14:08:04', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/dpOf4VMZb1w/hqdefault.jpg', 0.0, 0, '', ''),
(134, 1, 4, 'The Politician | Official Trailer | Netflix', 'Payton (Ben Platt) has always known that he\'s going to be president. First he\'ll have to navigate the most treacherous political landscape: high school. A new ...', '6-kdBlzCG7w', 'https://i.ytimg.com/vi/6-kdBlzCG7w/hqdefault.jpg', 0, 0, '2019-08-19 14:00:00', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/6-kdBlzCG7w/hqdefault.jpg', 0.0, 0, '', ''),
(135, 1, 4, 'THE HUSTLE | Official Trailer | MGM', 'Now Playing. In the hilarious new comedy THE HUSTLE, Anne Hathaway and Rebel Wilson star as female scam artists, one low rent and the other high class, ...', '_j5hwooOHVE', 'https://i.ytimg.com/vi/_j5hwooOHVE/hqdefault.jpg', 0, 0, '2019-02-12 14:10:42', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/_j5hwooOHVE/hqdefault.jpg', 0.0, 0, '', ''),
(136, 1, 4, 'Sextuplets | Official Trailer | Netflix', 'Marlon Wayans stars in Sextuplets. From the people who brought you “Naked”, father-to-be Alan is shocked to learn that he was born a sextuplet. With his ...', 'e0LJNn-GcnY', 'https://i.ytimg.com/vi/e0LJNn-GcnY/hqdefault.jpg', 0, 0, '2019-08-02 14:00:01', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/e0LJNn-GcnY/hqdefault.jpg', 0.0, 0, '', ''),
(137, 1, 4, 'Feel Good | Official Trailer | Netflix', 'Mae Martin stars as herself, a Canadian comedian living in London, navigating a relationship with her new girlfriend, George and dealing with sobriety. Watch ...', 'IA6zm_kt5iM', 'https://i.ytimg.com/vi/IA6zm_kt5iM/hqdefault.jpg', 0, 0, '2020-02-18 15:30:00', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/IA6zm_kt5iM/hqdefault.jpg', 0.0, 0, '', ''),
(138, 1, 4, 'SPACE FORCE Official Trailer #2 (2020) Steve Carell, Netflix Series HD', 'SPACE FORCE Official Trailer #2 (2020) Steve Carell, Netflix Series HD Subscribe to Rapid Trailer For All The Latest Movie Trailers! ▷ http://bit.ly/39CsLvK Like ...', 'oeBiOt7Zs70', 'https://i.ytimg.com/vi/oeBiOt7Zs70/hqdefault.jpg', 0, 0, '2020-05-19 13:45:55', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/oeBiOt7Zs70/hqdefault.jpg', 0.0, 0, '', ''),
(139, 1, 4, 'Insatiable | Official Trailer | Netflix', 'A coming of rage story. Insatiable, starring Debby Ryan, arrives August 10 on Netflix. Watch Insatiable on Netflix: https://www.netflix.com/in/title/80179905 ...', 'z-81WVD8xTs', 'https://i.ytimg.com/vi/z-81WVD8xTs/hqdefault.jpg', 0, 0, '2018-07-19 15:01:13', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/z-81WVD8xTs/hqdefault.jpg', 0.0, 0, '', ''),
(140, 1, 4, 'Little Evil | Official Trailer [HD] | Netflix', 'Meet Gary. He just married Samantha, the woman of his dreams. There\'s one problem, his stepson is the antichrist. Adam Scott and Evangeline Lilly star in the ...', 'Mnj-MXs1yVU', 'https://i.ytimg.com/vi/Mnj-MXs1yVU/hqdefault.jpg', 0, 0, '2017-08-22 14:00:04', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/Mnj-MXs1yVU/hqdefault.jpg', 0.0, 0, '', ''),
(141, 1, 4, 'Nappily Ever After | Official Trailer [HD] | Netflix', 'Violet Jones has a seemingly flawless life – a great job, a handsome doctor boyfriend, and a meticulously maintained perfect coiffure. But after an accident at the ...', '3xh9XFxo2Hg', 'https://i.ytimg.com/vi/3xh9XFxo2Hg/hqdefault.jpg', 0, 0, '2018-08-02 15:00:07', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/3xh9XFxo2Hg/hqdefault.jpg', 0.0, 0, '', ''),
(142, 1, 4, 'SEXTUPLETS Official Trailer (2019) Marlon Wayans, Netflix Comedy Movie HD', 'SEXTUPLETS Official Trailer (2019) Marlon Wayans, Netflix Comedy Movie HD © 2019 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action ...', 'pvYymGtFJtE', 'https://i.ytimg.com/vi/pvYymGtFJtE/hqdefault.jpg', 0, 0, '2019-08-02 14:08:24', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/pvYymGtFJtE/hqdefault.jpg', 0.0, 0, '', ''),
(143, 1, 4, 'The Half of It | Official Trailer | Netflix', 'Shy, straight-A student Ellie is hired by sweet but inarticulate jock Paul, who needs help winning over a popular girl. But their new and unlikely friendship gets ...', 'B-yhF7IScUE', 'https://i.ytimg.com/vi/B-yhF7IScUE/hqdefault.jpg', 0, 0, '2020-04-09 15:00:00', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/B-yhF7IScUE/hqdefault.jpg', 0.0, 0, '', ''),
(144, 1, 4, 'SPACE FORCE Trailer 2 (NEW 2020) Steve Carell Netflix Comedy Series HD', 'SPACE FORCE Trailer 2 (NEW 2020) Steve Carell Netflix Comedy Series HD © 2020 - Netflix.', 'LSkV6K5U3J8', 'https://i.ytimg.com/vi/LSkV6K5U3J8/hqdefault.jpg', 0, 0, '2020-05-19 13:16:21', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/LSkV6K5U3J8/hqdefault.jpg', 0.0, 0, '', ''),
(145, 1, 4, 'Cheer | Official Trailer | Netflix', 'The stakes on the mat are high, but for these cheerleaders, the only thing more brutal than their workouts and more exceptional than their performances are the ...', 'dhXRx_lva18', 'https://i.ytimg.com/vi/dhXRx_lva18/hqdefault.jpg', 0, 0, '2020-01-06 16:00:00', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/dhXRx_lva18/hqdefault.jpg', 0.0, 0, '', ''),
(146, 1, 4, 'SANDY WEXLER Official Trailer (2017) Adam Sandler Netflix Comedy Movie HD', 'SANDY WEXLER Trailer (2017) Adam Sandler Netflix Comedy Movie HD [Official Trailer] © 2017 - Netflix.', 'hQFOQrSOl7Q', 'https://i.ytimg.com/vi/hQFOQrSOl7Q/hqdefault.jpg', 0, 0, '2017-02-16 15:08:06', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/hQFOQrSOl7Q/hqdefault.jpg', 0.0, 0, '', ''),
(147, 1, 4, 'HAPPY ANNIVERSARY Official Trailer (2018) Netflix Comedy Movie HD', 'HAPPY ANNIVERSARY Official Trailer (2018) Ben Schwartz, Netflix Comedy Movie HD © 2018 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, ...', 'HBj6x81Rd0g', 'https://i.ytimg.com/vi/HBj6x81Rd0g/hqdefault.jpg', 0, 0, '2018-03-15 19:27:54', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/HBj6x81Rd0g/hqdefault.jpg', 0.0, 0, '', ''),
(148, 1, 4, 'Candy Jar | Official Trailer [HD] | Netflix', 'An introverted high school girl from a working-class background and her wealthy, debate-team nemesis can\'t agree on anything. But when they\'re forced to work ...', '1lXLGwe_DUU', 'https://i.ytimg.com/vi/1lXLGwe_DUU/hqdefault.jpg', 0, 0, '2018-04-19 14:59:49', '2020-05-25 13:35:16', 'VERIFIED', 0, 'https://i.ytimg.com/vi/1lXLGwe_DUU/hqdefault.jpg', 0.0, 0, '', ''),
(149, 1, 4, 'EVERYTHING SUCKS! Official Trailer (2018) Netflix Comedy Series HD', 'EVERYTHING SUCKS! Official Trailer (2018) Netflix Comedy Series HD Subscribe HERE for NEW movie trailers ➤ https://goo.gl/o12wZ3 In 1990s Oregon, ...', 'qcDYc9Ci7Xc', 'https://i.ytimg.com/vi/qcDYc9Ci7Xc/hqdefault.jpg', 0, 0, '2018-02-06 15:46:15', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/qcDYc9Ci7Xc/hqdefault.jpg', 0.0, 0, '', ''),
(150, 1, 4, 'ON MY BLOCK Official Trailer (2018) Netflix Teen Comedy HD', 'ON MY BLOCK Official Trailer (2018) Netflix Teen Comedy HD © 2018 - Netflix Comedy, Kids, Family and Animated Film, Blockbuster, Action Cinema, ...', 'us_AXwJKjjY', 'https://i.ytimg.com/vi/us_AXwJKjjY/hqdefault.jpg', 0, 0, '2018-01-30 15:07:10', '2020-05-25 13:35:16', 'UNVERIFIED', 0, 'https://i.ytimg.com/vi/us_AXwJKjjY/hqdefault.jpg', 0.0, 0, '', '');

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
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_login`
--
ALTER TABLE `history_login`
  MODIFY `history_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `user_interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
