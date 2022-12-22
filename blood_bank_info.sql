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
(1100126, '$2y$10$rUFeYTMvICp2qGxsmnEfO.WQsZ4dvPzMe1/hu4xTnsJQjmG2ss9Lq', 'BLOODBANK4', '1234567890', '01930679928', 'rashed2980@yahoo.com', 'Khulna', 45, 'We have facilities', 'Verified'),
(1100127, '$2y$10$8HTXo3b5aR9WUF8ssYN/0.RXH9aLF9jQSdeiLbrhN5YMfRv/2.Lzi', 'BLOODBANK5', '123456789', '01856659345', 'raiyan2980@yahoo.com', 'Dhaka,Bangladesh', 56, 'Various', 'Verified'),
(1100130, '$2y$10$8HTXo3b5aR9WUF8ssYN/0.RXH9aLF9jQSdeiLbrhN5YMfRv/2.Lzi', 'BLOODBANK5', '123456789', '01856659345', 'raiyan2980@yahoo.com', 'Dhaka,Bangladesh', 56, 'Various', 'Verified'),
(1100131, '$2y$10$qmClbdpBT9TjGWoREq/dUeZmUv/1iyaaK3XA1paTJs6ml7Fs.nQHy', 'BLOODBANK5', '123456789', '01856659345', 'raiyan2980@yahoo.com', 'Dhaka,Bangladesh', 56, 'Various', 'Not Verified');

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
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100132;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
