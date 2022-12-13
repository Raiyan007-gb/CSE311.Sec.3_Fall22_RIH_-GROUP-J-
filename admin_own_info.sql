-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 03:11 PM
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
-- Table structure for table `admin_own_info`
--

CREATE TABLE `admin_own_info` (
  `Admin_ID` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Contact_info` varchar(11) NOT NULL,
  `E_Mail` varchar(30) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_own_info`
--

INSERT INTO `admin_own_info` (`Admin_ID`, `Name`, `Contact_info`, `E_Mail`, `Password`) VALUES
(2013130, 'RAIYAN AHMED', '01536129173', 'raiyan.ahmed05@northsouth.edu', '$2y$10$wvDoVfdC877FgMtKTRKvKOa7XCtKUL7PVn430l9clqqExS.P95vwq'),
(2013131, 'TAHSEEN', '01536129172', 'tahseen@northsouth.edu', '$2y$10$MYkC32PxNYwaalP8FyPhKeXazCyA6TNTA.d/lP/Fn6OEQzImTqLeu'),
(2013132, 'AMRITA', '01536129171', 'amrita@northsouth.edu', '$2y$10$GY1Etz9byDmDV1stuZ1Be.wpVmS.BQ.nOUNk/hMI6rdj0QUUOWkp2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_own_info`
--
ALTER TABLE `admin_own_info`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_own_info`
--
ALTER TABLE `admin_own_info`
  MODIFY `Admin_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2013133;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
