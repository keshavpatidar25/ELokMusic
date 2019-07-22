-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2014 at 07:35 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `omsdb`
--
CREATE DATABASE IF NOT EXISTS `omsdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `omsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `FEEDBACK_ID` int(6) NOT NULL AUTO_INCREMENT,
  `USER_FROM` varchar(100) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PHONE` bigint(10) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `MESSAGE` varchar(255) NOT NULL,
  `DATE` date NOT NULL,
  PRIMARY KEY (`FEEDBACK_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FEEDBACK_ID`, `USER_FROM`, `EMAIL`, `PHONE`, `SUBJECT`, `MESSAGE`, `DATE`) VALUES
(2, 'ABC DEF', 'abc@def.com', 8888899999, 'GOOD WORK', 'ITS BEEN NICE TO BE PART OF YOUR WEBSITE.', '2014-03-10'),
(3, 'PQR STU', 'pqr@stu.com', 1122334455, 'NEW CONCEPT', 'ITS REALLY NEW CONCEPT WHAT YOU HAVE BROUGHT.', '2014-03-10'),
(4, 'GHI JKL', 'ghi@jkl.com', 3747584930, 'GOOD COLLECTION', 'YOU HAVE GOOD COLLECTION OF SONGS.\r\nI ALWAYS USE THIS WEBSITE TO DOWNLOAD SONGS.', '2014-03-10'),
(5, 'PRATHMESH DUBEY', 'prathmesh@e-music.com', 6767676767, 'GADAR SONGS', 'Pleas Upload Songs of Movie Gadar.', '2014-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `MOVIE_ID` int(5) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `YEAR` int(4) NOT NULL,
  PRIMARY KEY (`MOVIE_ID`),
  UNIQUE KEY `NAME` (`NAME`,`YEAR`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`MOVIE_ID`, `NAME`, `YEAR`) VALUES
(21, '13B', 2008),
(22, '3 IDIOTS', 2010),
(2, 'AARTI', 2008),
(20, 'AGENT VINOD', 2014),
(5, 'BADAL', 2005),
(4, 'BETA', 2002),
(6, 'CHAMATKAR', 1999),
(8, 'DEHEK', 2000),
(9, 'DIL', 2002),
(11, 'EK LADKA EK LADKI', 1994),
(10, 'EK RISHTA', 2000),
(12, 'GADAR', 2010),
(13, 'GHAYAL', 2012),
(16, 'JAAN', 1999),
(19, 'RAJA BHAIYA', 2014);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `SONG_ID` int(6) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(500) NOT NULL,
  `LOCATION` varchar(1500) NOT NULL,
  `MOVIE_ID` int(5) DEFAULT NULL,
  PRIMARY KEY (`SONG_ID`),
  UNIQUE KEY `NAME` (`NAME`,`MOVIE_ID`),
  KEY `songs_ibfk_2` (`MOVIE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`SONG_ID`, `NAME`, `LOCATION`, `MOVIE_ID`) VALUES
(6, 'Sikandar ne porus se.mp3', 'Songs/All/A/AARTI', 2),
(7, 'Jiya le gayo ji mora sanwariya.mp3', 'Songs/All/A/AARTI', 2),
(8, 'Rang birangi rakhee lekar.mp3', 'Songs/All/A/AARTI', 2),
(9, 'Hai isi mein pyar ki abroo.mp3', 'Songs/All/A/AARTI', 2),
(10, 'Woh dekho jala ghar kisi ka.mp3', 'Songs/All/A/AARTI', 2),
(11, '01 NAMILO HUMSE JYADA.mp3', 'Songs/All/B/BADAL', 5),
(12, '02 YAAR MERE YARE MERE.mp3', 'Songs/All/B/BADAL', 5),
(13, '03 TUJHE DEKH KE DIL.mp3', 'Songs/All/B/BADAL', 5),
(14, '01 DHAK DHAK KARNE LAGA.mp3', 'Songs/All/B/BETA', 4),
(15, '02 KHUSHIYO KA DIN (SAD).mp3', 'Songs/All/B/BETA', 4),
(17, '04 KOYAL SI TERI BOLI.mp3', 'Songs/All/B/BETA', 4),
(18, '03 KHUSHIYO KA DIN.mp3', 'Songs/All/B/BETA', 4),
(22, '01 BISHOO O BISHOO.mp3', 'Songs/All/C/CHAMATKAR', 6),
(23, '02 IS PYAR SE MERI TARAF NA DEHKO.mp3', 'Songs/All/C/CHAMATKAR', 6),
(24, '01.JAB SE TUMHEIN.mp3', 'Songs/All/D/DEHEK', 8),
(25, '02.SAVAN BARSE TARSE DIL.mp3', 'Songs/All/D/DEHEK', 8),
(26, '01.JAB SE TUMHEIN.mp3', 'Songs/All/D/DIL', 9),
(27, '06.MERI JAAN HAI TU.mp3', 'Songs/All/D/DIL', 9),
(28, '01- I Will Do The Talking Tonight .mp3', 'Songs/All/A/AGENT VINOD', 20),
(29, '02 Pungi.mp3', 'Songs/All/A/AGENT VINOD', 20),
(30, '03 Raabta.mp3', 'Songs/All/A/AGENT VINOD', 20),
(31, '04 Agent Vinod (Theme).mp3', 'Songs/All/A/AGENT VINOD', 20),
(32, '10 Dil Mera Muft Ka.mp3', 'Songs/All/A/AGENT VINOD', 20),
(33, '01 UDJA KALE KAWA.mp3', 'Songs/All/G/GADAR', 12),
(34, '02 MUSAFIR JANEWALE.mp3', 'Songs/All/G/GADAR', 12),
(35, '03 MAIN NIKLA GADI LEKE.mp3', 'Songs/All/G/GADAR', 12),
(36, '13B Theme.mp3', 'Songs/All/1/13B', 21),
(37, 'Aasma Odh Kar.mp3', 'Songs/All/1/13B', 21),
(41, 'All Izz Well.mp3', 'Songs/All/3/3 IDIOTS', 22),
(42, 'Give Me Some Sunshine.mp3', 'Songs/All/3/3 IDIOTS', 22),
(43, 'Jaane Nahin Denge.mp3', 'Songs/All/3/3 IDIOTS', 22);

-- --------------------------------------------------------

--
-- Table structure for table `song_user`
--

CREATE TABLE IF NOT EXISTS `song_user` (
  `SONG_ID` int(6) NOT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`SONG_ID`,`USER_NAME`),
  KEY `USER_NAME` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `song_user`
--

INSERT INTO `song_user` (`SONG_ID`, `USER_NAME`) VALUES
(7, 'ASHWINI'),
(13, 'ASHWINI'),
(15, 'ASHWINI'),
(17, 'ASHWINI'),
(29, 'NEWUSER'),
(36, 'NEWUSER'),
(42, 'NEWUSER'),
(43, 'NEWUSER'),
(15, 'PRATHMESH'),
(34, 'PRATHMESH');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USER_NAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ROLE` varchar(10) NOT NULL,
  `SECRET_QUES` varchar(255) NOT NULL,
  `SECRET_ANS` varchar(50) NOT NULL,
  PRIMARY KEY (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_NAME`, `PASSWORD`, `NAME`, `ROLE`, `SECRET_QUES`, `SECRET_ANS`) VALUES
('ADMIN', '4a7d1ed414474e4033ac29ccb8653d9b', 'KESHAV PATIDAR', 'ADMIN', 'WHAT IS YOUR FIRST PET NAME?', 'SANDY'),
('ASHWINI', '934b535800b1cba8f96a5d72f72f1611', 'ASHWINI VARMA', 'User', 'WHAT IS YOUR MOTHER''S MAIDEN NAME?', 'VARMA'),
('NEWUSER', '2be9bd7a3434f7038ca27d1918de58bd', 'NEW USER', 'USER', 'WHAT IS YOUR FAVOURITE COLOUR?', 'BLUE'),
('PRATHMESH', 'b59c67bf196a4758191e42f76670ceba', 'PRATHMESH DUBEY', 'User', 'WHAT IS YOUR FIRST SCHOOL NAME?', 'SARAFA');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movies` (`MOVIE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `song_user`
--
ALTER TABLE `song_user`
  ADD CONSTRAINT `song_user_ibfk_1` FOREIGN KEY (`SONG_ID`) REFERENCES `songs` (`SONG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `song_user_ibfk_2` FOREIGN KEY (`USER_NAME`) REFERENCES `user` (`USER_NAME`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
