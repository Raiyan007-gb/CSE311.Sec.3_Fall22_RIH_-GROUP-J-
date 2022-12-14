-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 03:13 PM
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
-- Table structure for table `see_ownuser_info`
--

CREATE TABLE `see_ownuser_info` (
  `ID` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Age` int(11) NOT NULL,
  `Blood_Type` varchar(5) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `E_Mail` varchar(30) NOT NULL,
  `Last_Donation` int(4) NOT NULL,
  `Preferred_Date` date NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Health_Problem` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `see_ownuser_info`
--
ALTER TABLE `see_ownuser_info`
  ADD KEY `ID` (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `see_ownuser_info`
--
ALTER TABLE `see_ownuser_info`
  ADD CONSTRAINT `see_ownuser_info_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
