-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2022 at 11:01 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `blood_request_user`
--

CREATE TABLE `blood_request_user` (
  `Blood_Type` int(5) NOT NULL,
  `User_ID` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `E_Mail` varchar(30) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Last_Donation` int(4) NOT NULL,
  `Sent_Text` text NOT NULL,
  `Age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `register_user_info`
--

CREATE TABLE `register_user_info` (
  `User_ID` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Age` int(3) NOT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `E_mail` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Last_Donation` int(4) NOT NULL,
  `UserType` enum('ACCEPTOR','DONOR') NOT NULL,
  `Preferred_Date` date NOT NULL,
  `Blood_Type` varchar(5) NOT NULL,
  `Health_Problem` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_user_info`
--

INSERT INTO `register_user_info` (`User_ID`, `Name`, `Username`, `Password`, `Age`, `Phone`, `E_mail`, `Location`, `Last_Donation`, `UserType`, `Preferred_Date`, `Blood_Type`, `Health_Problem`) VALUES
(2200100, '', 'raiyan2012', '$2y$10$b6tOqR6PgD77YrbeiFUI5OBUWuaXe/edwmG9g/JtKtItf0Xhwqn4q', 22, '01536129152', 'raiyN@GM.COM', 'ganderia,dhaka 1204', 54, 'ACCEPTOR', '2022-12-01', 'O+', 'no health issues ,i am mr. perfect'),
(2200101, '', 'raiyan2012s', '$2y$10$b6tOqR6PgD77YrbeiFUI5OBUWuaXe/edwmG9g/JtKtItf0Xhwqn4q', 22, '01536129152', 'raiyN@GM.COM', 'ganderia,dhaka 1204', 54, 'ACCEPTOR', '2022-12-01', 'O+', 'no health issues ,i am mr. perfect'),
(2200102, 'RAIYAN', 'raiyan2012ds', '$2y$10$b6tOqR6PgD77YrbeiFUI5OBUWuaXe/edwmG9g/JtKtItf0Xhwqn4q', 22, '01536129152', 'raiyN@GM.COM', 'ganderia,dhaka 1204', 54, 'ACCEPTOR', '2022-12-01', 'O+', 'no health issues ,i am mr. perfect'),
(2200104, 'RAIYAN', 'raiyan2012dss', '$2y$10$b6tOqR6PgD77YrbeiFUI5OBUWuaXe/edwmG9g/JtKtItf0Xhwqn4q', 22, '01536129152', 'raiyN@GM.COM', 'ganderia,dhaka 1204', 54, 'ACCEPTOR', '2022-12-01', 'O+', 'no health issues ,i am mr. perfect');

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
-- Dumping data for table `see_ownuser_info`
--

INSERT INTO `see_ownuser_info` (`ID`, `Name`, `Age`, `Blood_Type`, `Phone`, `E_Mail`, `Last_Donation`, `Preferred_Date`, `Location`, `Health_Problem`) VALUES
(2200100, 'RAIYAN', 0, '', '', '', 0, '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `Name` varchar(30) NOT NULL,
  `ID` int(7) NOT NULL,
  `Blood_type` varchar(5) NOT NULL,
  `Health_Problem` varchar(500) NOT NULL,
  `Age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `register_user_info`
--
ALTER TABLE `register_user_info`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `see_ownuser_info`
--
ALTER TABLE `see_ownuser_info`
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register_user_info`
--
ALTER TABLE `register_user_info`
  MODIFY `User_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2200105;

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
