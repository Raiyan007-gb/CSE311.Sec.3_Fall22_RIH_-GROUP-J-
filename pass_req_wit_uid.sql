-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 02:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bddbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `pass_req_wit_uid`
--

CREATE TABLE `pass_req_wit_uid` (
  `User_ID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pass_req_wit_uid`
--

INSERT INTO `pass_req_wit_uid` (`User_ID`) VALUES
(2200133),
(2200139),
(2200140),
(2200145);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pass_req_wit_uid`
--
ALTER TABLE `pass_req_wit_uid`
  ADD UNIQUE KEY `User_ID` (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pass_req_wit_uid`
--
ALTER TABLE `pass_req_wit_uid`
  ADD CONSTRAINT `pass_req_wit_uid_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
