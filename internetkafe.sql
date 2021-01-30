-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Ara 2020, 10:23:44
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `yarligan_internetkafe`
--
CREATE DATABASE IF NOT EXISTS `yarligan_internetkafe` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `yarligan_internetkafe`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cafe`
--

CREATE TABLE `cafe` (
  `cafe_id` int(11) NOT NULL,
  `cafe_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `cafe`
--

INSERT INTO `cafe` (`cafe_id`, `cafe_name`) VALUES
(1, 'Adeks internet kafe'),
(2, 'Nazar internet kafe'),
(3, 'Gezegen internet kafe'),
(4, 'Sky internet kafe'),
(5, 'Chatlak internet kafe'),
(6, 'Matrix internet kafe'),
(7, 'Daisy internet kafe'),
(8, 'Aksu internet kafe'),
(0, 'Arc internet kafe'),
(10, 'Truva internet kafe'),
(11, 'Vizyon internet kafe'),
(12, 'Everest internet kafe'),
(13, '3K internet kafe'),
(14, 'Master internet kafe'),
(15, 'Duman internet kafe');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'istanbul'),
(2, 'ankara'),
(3, 'izmir'),
(4, 'bursa'),
(5, 'trabzon');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city_cafe`
--

CREATE TABLE `city_cafe` (
  `city_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `city_cafe`
--

INSERT INTO `city_cafe` (`city_id`, `cafe_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `score_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`comment_id`, `comment`, `user_id`, `cafe_id`, `score_id`) VALUES
(1, 'Ekipmanları çok güzel', 2, 4, 4),
(2, 'Bu sene çıkan bütün oyunlar var', 2, 8, 5),
(3, 'Saat başı ücret çok pahallı', 3, 1, 3),
(4, 'Oturduğum masada kulaklık yoktu', 3, 7, 2),
(5, 'Oldukça uygun ücretler', 3, 15, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reservation`
--

CREATE TABLE `reservation` (
  `hour` double NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `reservation`
--

INSERT INTO `reservation` (`hour`, `cafe_id`, `user_id`) VALUES
(20.3, 3, 2),
(14, 7, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `mean` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `score`
--

INSERT INTO `score` (`score_id`, `mean`) VALUES
(1, 'Çok Kötü'),
(2, 'Kötü'),
(3, 'Orta'),
(4, 'Güzel'),
(5, 'Çok Güzel');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `e-mail` text NOT NULL,
  `password` text NOT NULL,
  `user_type` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`user_id`, `e-mail`, `password`, `user_type`, `cafe_id`) VALUES
(1, 'lazer61@hotmail.com', '123456', 1, 0),
(2, 'eskikurt001@hotmail.com', '123456', 2, 0),
(3, 'emirhankalayci6161@gmail.com', '123456', 2, 0),
(4, 'stormscream61@hotmail.com', '123456', 3, 3),
(5, 'toskagamesofficial@gmail.com', '123456', 3, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_type`
--

CREATE TABLE `user_type` (
  `type_id` int(11) NOT NULL,
  `type_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `user_type`
--

INSERT INTO `user_type` (`type_id`, `type_name`) VALUES
(1, 'admin'),
(2, 'musteri'),
(3, 'kafe_sahibi');
COMMIT;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `members`
--
ALTER TABLE `cafe`
  ADD PRIMARY KEY (`cafe_id`);
  
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);
  
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);
  
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`);
  
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);
  
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `members`
--
ALTER TABLE `cafe`
  MODIFY `cafe_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

ALTER TABLE `city`
  MODIFY `city_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

ALTER TABLE `comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

ALTER TABLE `score`
  MODIFY `score_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

ALTER TABLE `users`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

ALTER TABLE `user_type`
  MODIFY `type_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
