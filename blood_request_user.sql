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
-- Table structure for table `blood_request_user`
--

CREATE TABLE `blood_request_user` (
  `Blood_Type` enum('AB+','AB-','A+','A-','B+','B-','O+','O-') NOT NULL,
  `User_ID` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Preferred_Date` date NOT NULL,
  `Time` time NOT NULL,
  `Age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_request_user`
--

INSERT INTO `blood_request_user` (`Blood_Type`, `User_ID`, `Name`, `Location`, `Phone`, `Preferred_Date`, `Time`, `Age`) VALUES
('AB+', 2200139, 'Raiyan Ahmed', 'ganderia sharafat ganj lane ganderia dhaka', '01536129173', '2022-11-29', '23:23:00', 23),
('AB+', 2200140, 'Lovely sikda', 'Dhakaa', '01714426106', '2022-12-06', '03:32:00', 46);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_request_user`
--
ALTER TABLE `blood_request_user`
  ADD UNIQUE KEY `User_ID` (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_request_user`
--
ALTER TABLE `blood_request_user`
  ADD CONSTRAINT `blood_request_user_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
