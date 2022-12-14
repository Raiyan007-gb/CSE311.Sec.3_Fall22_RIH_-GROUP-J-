-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 03:12 PM
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
-- Table structure for table `blood_bank_info`
--

CREATE TABLE `blood_bank_info` (
  `user_id` int(7) NOT NULL,
  `Bpassword` varchar(255) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Security_code` varchar(10) NOT NULL,
  `Contact` varchar(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Storage_capacity` int(5) NOT NULL,
  `facilities` varchar(50) DEFAULT NULL,
  `Verification` enum('Not Verified','Verified') NOT NULL DEFAULT 'Not Verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_bank_info`
--

INSERT INTO `blood_bank_info` (`user_id`, `Bpassword`, `Name`, `Security_code`, `Contact`, `Email`, `Location`, `Storage_capacity`, `facilities`, `Verification`) VALUES
(1100122, '$2y$10$7ch6bF/Es2adWly2wxuWFObkHrjPvuLPbeUkZvllUXxVGKXiO0REu', 'Bloodbank1', '1234567898', '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia', 567, 'yes we have', 'Verified');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_bank_info`
--
ALTER TABLE `blood_bank_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_bank_info`
--
ALTER TABLE `blood_bank_info`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
