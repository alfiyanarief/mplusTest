-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2017 at 02:21 
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test_code`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `date_published` date DEFAULT NULL,
  `number_of_pages` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_book`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id_book`, `title`, `author`, `date_published`, `number_of_pages`, `id_type`) VALUES
(1, 'the lord of the rings', 'okelah', '2017-12-01', 123, 1),
(2, 'asdfasdf asdfasdf', 'asdfasdf werwer', '2017-12-01', 234, 2),
(3, 'asdasda', 'asdasdads', '0000-00-00', 4, 1),
(4, 'asd', 'asd', '2017-12-01', 4, 1),
(5, 'asdfasdf', 'asdfasdf', '2017-12-08', 6, 2),
(6, 'sdfasdf', 'asdfasdfasdf', '0000-00-00', 9, 2),
(7, 'sdfasdf', 'asdfasdfasdf', '2017-12-08', 9, 2),
(8, 'adas', 'asdasd', '2017-12-08', 3, 1),
(9, 'aaaaaaaaa', 'aaaaaaaaa', '2017-12-01', 55555, 2),
(10, 'qqqqqqq', 'qqqqqqqqqqq', '2017-12-08', 2, 1),
(11, 'asd', 'asd', '2017-12-08', 3, 1),
(12, 'qqqqqqqqq', 'qqqqqqqqqqqq', '2017-12-08', 3, 1),
(13, 'asd', 'asd', '2017-12-08', 4, 1),
(14, 'asd', 'asd', '2017-12-08', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL,
  `type_content` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `type_content`) VALUES
(1, 'Novel'),
(2, 'Folklore');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
