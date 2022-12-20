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
-- Table structure for table `user_pass_reset_request`
--

CREATE TABLE `user_pass_reset_request` (
  `User_ID` int(7) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `E_mail` varchar(30) NOT NULL,
  `Contact` varchar(11) NOT NULL,
  `UserType` varchar(20) NOT NULL,
  `new_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_pass_reset_request`
--

INSERT INTO `user_pass_reset_request` (`User_ID`, `Username`, `Name`, `E_mail`, `Contact`, `UserType`, `new_password`) VALUES
(2200130, 'rakib007', 'Rakib Hossain', 'raiyan.ahmed05@northsouth.edu', '01536129170', 'DONOR', ''),
(2200133, 'tahseen007', 'Tahseen', 'raiyan.ahmed05@northsouth.edu', '01536129173', 'DONOR', ''),
(2200139, 'raiyan2025@gmail.comj', 'Raiyan Ahmed', 'raiyan.ahmed05@northsouth.edu', '01536129173', 'DONOR', ''),
(2200140, 'howareyou007', 'Lovely sikda', 'lovely677@gmail.co', '01714426106', 'DONOR', ''),
(2200145, 'howareyou003', 'Rashed ganiiiiiiii', 'rashegani@yahoo.com', '01536129567', 'ACCEPTOR', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_pass_reset_request`
--
ALTER TABLE `user_pass_reset_request`
  ADD UNIQUE KEY `User_ID` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
