-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 May 2019, 14:38:34
-- Sunucu sürümü: 10.1.38-MariaDB
-- PHP Sürümü: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `stys`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `login_id` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `pass_key` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `security` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `level` int(2) NOT NULL,
  `name` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `auth_user`
--

INSERT INTO `auth_user` (`id`, `login_id`, `pass_key`, `security`, `level`, `name`) VALUES
(1001, 'admin', 'admin', 'admin', 5, 'Administrator'),
(1002, 'aliakat', 'aliakat', 'Ali AKAT', 5, 'Ali AKAT'),
(1003, 'user', 'user', 'user', 4, 'User Name'),
(1004, 'user1', 'user1', 'user1', 4, 'User1 Name'),
(1005, 'user2', 'user2', 'user2', 4, 'User2 Surname');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_user_log`
--

CREATE TABLE `auth_user_log` (
  `id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `firstenter` datetime NOT NULL,
  `lastenter` datetime DEFAULT NULL,
  `lastexit` datetime DEFAULT NULL,
  `totalenter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `auth_user_log`
--

INSERT INTO `auth_user_log` (`id`, `mem_id`, `firstenter`, `lastenter`, `lastexit`, `totalenter`) VALUES
(1, 1003, '2019-05-23 01:55:18', '2019-05-25 15:34:39', '2019-05-25 15:34:46', 17),
(2, 1005, '2019-05-23 02:35:58', '2019-05-25 14:29:24', '2019-05-25 14:29:27', 5),
(4, 1004, '2019-05-23 13:46:17', '2019-05-23 15:20:56', '2019-05-23 15:22:28', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `healthstatus`
--

CREATE TABLE `healthstatus` (
  `id` int(7) NOT NULL,
  `mem_id` int(20) NOT NULL,
  `date1` date NOT NULL,
  `bodyfat` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `water` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `muscle` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `calorie` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `bone` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `healthstatus`
--

INSERT INTO `healthstatus` (`id`, `mem_id`, `date1`, `bodyfat`, `water`, `muscle`, `calorie`, `bone`, `remarks`) VALUES
(1, 1003, '2019-05-23', '177', '76', '34', '23', '45', '26.2'),
(3, 1004, '2019-05-30', '177', '80', '45', '34', '45', '28.1'),
(4, 1005, '2019-05-23', '189', '89', '23', '25', '55', '24.3');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mem_types`
--

CREATE TABLE `mem_types` (
  `id` int(11) NOT NULL,
  `mem_type_id` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `days` int(11) NOT NULL,
  `fee` int(11) NOT NULL COMMENT 'paket ücreti',
  `details` mediumtext COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mem_types`
--

INSERT INTO `mem_types` (`id`, `mem_type_id`, `name`, `days`, `fee`, `details`) VALUES
(1, 'Aylik', 'Aylık', 30, 50, 'Bir Aylık Abonelik'),
(2, 'AltiAylik', 'Altı Aylık', 180, 250, 'Altı Aylık Abonelik'),
(3, 'Yillik', 'Yıllık', 365, 500, 'Bir Yıllık Abonelik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subsciption`
--

CREATE TABLE `subsciption` (
  `id` int(7) NOT NULL,
  `mem_id` int(20) NOT NULL,
  `sub_type` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `paid_date` date NOT NULL,
  `expiry` date NOT NULL,
  `total` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `invoice` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `sub_type_name` mediumtext COLLATE utf8_turkish_ci NOT NULL,
  `bal` int(11) NOT NULL,
  `exp_time` bigint(20) NOT NULL,
  `renewal` varchar(10) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `subsciption`
--

INSERT INTO `subsciption` (`id`, `mem_id`, `sub_type`, `paid_date`, `expiry`, `total`, `paid`, `invoice`, `sub_type_name`, `bal`, `exp_time`, `renewal`) VALUES
(1, 1003, 'Yillik', '2019-05-23', '2020-05-22', 500, 250, '58564663t0c', 'Yıllık', 250, 1590094800, 'yes'),
(2, 1004, 'Yillik', '2019-05-23', '2020-05-22', 500, 300, '58567167mgv', 'Yıllık', 0, 1590094800, 'yes'),
(3, 1005, 'AltiAylik', '2019-05-23', '2019-11-19', 250, 80, '58567757mbu', 'Altı Aylık', 100, 1574110800, 'yes');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `time_table`
--

CREATE TABLE `time_table` (
  `id` int(11) NOT NULL,
  `mem_id` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `details` mediumtext COLLATE utf8_turkish_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `time_table`
--

INSERT INTO `time_table` (`id`, `mem_id`, `details`, `date`) VALUES
(1, '1003', 'spor 1\r\nspor 2\r\nspor 3', '2019-05-23'),
(2, '1004', 'fitnes 1\r\nfitnes 2\r\nfitnes 3\r\ncardio', '2019-05-23'),
(3, '1005', 'spor 4\r\nspor 5\r\nspor 6', '2019-05-23'),
(4, '1005', 'cardio 1\r\ncardio 2', '2019-05-23');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_data`
--

CREATE TABLE `user_data` (
  `id` int(7) NOT NULL,
  `wait` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `mem_id` int(20) NOT NULL,
  `address` mediumtext COLLATE utf8_turkish_ci NOT NULL,
  `birthdate` date NOT NULL,
  `contact` bigint(20) NOT NULL,
  `email` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `pic_add` varchar(200) COLLATE utf8_turkish_ci NOT NULL DEFAULT '../images/profile.png',
  `height` float NOT NULL,
  `weight` int(11) NOT NULL,
  `joining` date NOT NULL,
  `sex` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `proof` mediumtext COLLATE utf8_turkish_ci NOT NULL,
  `other_proof` mediumtext COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `user_data`
--

INSERT INTO `user_data` (`id`, `wait`, `mem_id`, `address`, `birthdate`, `contact`, `email`, `pic_add`, `height`, `weight`, `joining`, `sex`, `proof`, `other_proof`) VALUES
(1, 'no', 1003, 'user adresi', '1987-06-15', 5321232323, 'user@user.com', '../images/1003.jpg', 175, 76, '2019-05-23', 'Kadın', 'Öğrenci Belgesi', ' '),
(2, 'no', 1004, 'user1 adresi', '1990-06-29', 5361234567, 'user1@user1.com', '../images/1004.jpg', 172, 67, '2019-04-02', 'Kadın', 'Ehliyet', ' '),
(3, 'no', 1005, 'user2 adresimi', '1985-05-18', 5071234566, 'user2@user2.com', '../images/1005.jpg', 190, 90, '2019-05-23', 'Kadın', 'Pasaport', ' ');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `auth_user_log`
--
ALTER TABLE `auth_user_log`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `healthstatus`
--
ALTER TABLE `healthstatus`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `mem_types`
--
ALTER TABLE `mem_types`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `subsciption`
--
ALTER TABLE `subsciption`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- Tablo için AUTO_INCREMENT değeri `auth_user_log`
--
ALTER TABLE `auth_user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `healthstatus`
--
ALTER TABLE `healthstatus`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `mem_types`
--
ALTER TABLE `mem_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `subsciption`
--
ALTER TABLE `subsciption`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `time_table`
--
ALTER TABLE `time_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
