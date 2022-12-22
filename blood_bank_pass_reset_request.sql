-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 02:05 PM
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
-- Table structure for table `blood_bank_pass_reset_request`
--

CREATE TABLE `blood_bank_pass_reset_request` (
  `user_id` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Security_code` varchar(10) NOT NULL,
  `Contact` varchar(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Storage_capacity` int(5) NOT NULL,
  `Verification` enum('Not Verified','Verified') NOT NULL DEFAULT 'Not Verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_bank_pass_reset_request`
--

INSERT INTO `blood_bank_pass_reset_request` (`user_id`, `Name`, `Security_code`, `Contact`, `Email`, `Location`, `Storage_capacity`, `Verification`) VALUES
(1100131, 'BLOODBANK5', '123456789', '01856659345', 'raiyan2980@yahoo.com', 'Dhaka,Bangladesh', 56, 'Verified');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_bank_pass_reset_request`
--
ALTER TABLE `blood_bank_pass_reset_request`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_bank_pass_reset_request`
--
ALTER TABLE `blood_bank_pass_reset_request`
  ADD CONSTRAINT `blood_bank_pass_reset_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `blood_bank_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
