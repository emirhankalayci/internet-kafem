-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: sql200.byethost31.com
-- Üretim Zamanı: 01 Oca 2021, 19:00:09
-- Sunucu sürümü: 5.6.48-88.0
-- PHP Sürümü: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `b31_24938894_users`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cafe`
--

CREATE TABLE `cafe` (
  `cafe_id` int(8) NOT NULL,
  `cafe_name` text NOT NULL,
  `price` text NOT NULL,
  `bos_masa` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `cafe`
--

INSERT INTO `cafe` (`cafe_id`, `cafe_name`, `price`, `bos_masa`) VALUES
(1, 'Adeks internet kafe', '7', 7),
(2, 'Nazar internet kafe', '5', 7),
(3, 'Gezegen internet kafe', '6', 8),
(4, 'Sky internet kafe', '4.50', 6),
(5, 'Chatlak internet kafe', '3.75', 3),
(6, 'Matrix internet kafe', '5', 5),
(7, 'Daisy internet kafe', '2.50', 7),
(8, 'Aksu internet kafe', '3', 6),
(9, 'Arc internet kafe', '2.50', 4),
(10, 'Truva internet kafe', '3.50', 1),
(11, 'Vizyon internet kafe', '4', 8),
(12, 'Everest internet kafe', '4', 3),
(13, '3K internet kafe', '3', 8),
(14, 'Master internet kafe', '4', 9),
(15, 'Duman internet kafe', '5', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

CREATE TABLE `city` (
  `city_id` int(8) NOT NULL,
  `city_name` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(8) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `score_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`comment_id`, `comment`, `user_id`, `cafe_id`, `score_id`) VALUES
(1, 'Ekipmanlari cok guzel', 2, 4, 4),
(2, 'Bu sene cikan butun oyunlar var', 2, 8, 5),
(3, 'ucretler biraz pahali', 3, 1, 3),
(4, 'Oturdugum masada kulaklik yoktu', 3, 7, 2),
(11, 'gayet iyi', 4, 15, 4),
(13, 'oldukca uygun fiyat', 2, 2, 5),
(18, 'begenmedim', 2, 5, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reservation`
--

CREATE TABLE `reservation` (
  `hour` text NOT NULL,
  `date` text NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `reservation`
--

INSERT INTO `reservation` (`hour`, `date`, `cafe_id`, `user_id`) VALUES
('17.00', '01.01.2021', 1, 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `score`
--

CREATE TABLE `score` (
  `score_id` int(8) NOT NULL,
  `mean` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `score`
--

INSERT INTO `score` (`score_id`, `mean`) VALUES
(1, 'Cok Kotu'),
(2, 'Kotu'),
(3, 'Orta'),
(4, 'Guzel'),
(5, 'Cok Guzel');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sorun_bildir`
--

CREATE TABLE `sorun_bildir` (
  `user_id` int(11) NOT NULL,
  `user_e_email` text COLLATE utf8_turkish_ci NOT NULL,
  `topic` text COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sorun_bildir`
--

INSERT INTO `sorun_bildir` (`user_id`, `user_e_email`, `topic`, `aciklama`) VALUES
(6, 'fatih-yarligan@outlook.com', 'Deneme', 'Deneme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `user_id` int(8) NOT NULL,
  `e_mail` text NOT NULL,
  `password` text NOT NULL,
  `user_type` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`user_id`, `e_mail`, `password`, `user_type`, `cafe_id`) VALUES
(1, 'laxer61@hotmail.com', '123456', 1, 0),
(2, 'eskikurt001@hotmail.com', '123456', 2, 0),
(3, 'emirhankalayci6161@gmail.com', '123456', 2, 0),
(4, 'stormscream61@hotmail.com', '123456', 3, 3),
(5, 'toskagamesofficial@gmail.com', '123456', 3, 4),
(6, 'fatih-yarligan@outlook.com', '1234', 1, 1),
(7, 'aktogan.rusen@gmail.com', '1234', 1, 1),
(9, 'deneme@gmail.com', '1234', 3, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_type`
--

CREATE TABLE `user_type` (
  `type_id` int(8) NOT NULL,
  `type_name` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `user_type`
--

INSERT INTO `user_type` (`type_id`, `type_name`) VALUES
(1, 'admin'),
(2, 'musteri'),
(3, 'kafe_sahibi');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cafe`
--
ALTER TABLE `cafe`
  ADD PRIMARY KEY (`cafe_id`);

--
-- Tablo için indeksler `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Tablo için indeksler `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Tablo için indeksler `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cafe`
--
ALTER TABLE `cafe`
  MODIFY `cafe_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `user_type`
--
ALTER TABLE `user_type`
  MODIFY `type_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
