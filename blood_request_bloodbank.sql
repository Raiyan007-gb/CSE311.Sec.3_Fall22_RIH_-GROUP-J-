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
-- Table structure for table `blood_request_bloodbank`
--

CREATE TABLE `blood_request_bloodbank` (
  `blood_bank_Name` varchar(30) NOT NULL,
  `blood_bank_ID` int(7) NOT NULL,
  `Blood_type` varchar(5) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Volunteers_ID's` int(7) NOT NULL,
  `Preferred_time` date NOT NULL,
  `E_Mail` varchar(30) NOT NULL,
  `Contact` varchar(11) NOT NULL,
  `Verification` enum('Verified','Not Verified') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
