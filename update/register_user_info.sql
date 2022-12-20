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
  `Blood_Type` enum('AB+','AB-','A+','A-','B+','B-','O+','O-') DEFAULT NULL,
  `Health_Problem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_user_info`
--

INSERT INTO `register_user_info` (`User_ID`, `Name`, `Username`, `Password`, `Age`, `Phone`, `E_mail`, `Location`, `Last_Donation`, `UserType`, `Preferred_Date`, `Blood_Type`, `Health_Problem`) VALUES
(2200128, 'Raiyan Ahmed', 'raiyan2025@gmail.com9', '$2y$10$XqFfis9AZxXjoq1xDL37RuoGzS2V7M8cQR4Nlr686cSOstXp6yGOG', 23, '01536129173', 'raiyan.ahmed05@northsouth', 'ganderia sharafat ganj lane ganderia dhaka', 365, 'DONOR', '2023-01-07', 'O+', 'no health problem'),
(2200133, 'Tahseen', 'tahseen007', '$2y$10$kFENS8umsjN6snPd65W4l.7vKS4wzpktXGhhGZkUIpj2T18b9C6wW', 19, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'DONOR', '2022-11-27', 'O+', 'no health problem'),
(2200139, 'Raiyan Ahmed', 'raiyan2025@gmail.comj', '$2y$10$VKvCuDC00RB2ffNgKx4BJOuOlULrTqMsFse31.QGKCFFlqsEwpWdi', 23, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 58, 'DONOR', '2022-12-06', 'AB+', 'dsfsd fdsf s df dfa'),
(2200140, 'Lovely sikda', 'howareyou007', '$2y$10$zHacUHFSILdm37u9u0pLeuMx5/XXaUxvtrV4SwQOfS3u.RZ5//dtS', 46, '01714426106', 'lovely677@gmail.co', 'Dhakaa', 67, 'DONOR', '2022-12-06', 'O-', 'there is no health'),
(2200145, 'Rashed ganiiiiiiii', 'howareyou003', '$2y$10$YVZ5Q3tYMkQ2jE9KMpLute.Xac9scyAAYnj/kFClGsX1xM.ygPGqG', 43, '01536129567', 'rashegani@yahoo.com', 'it dhaka bangaldesh', 45, 'DONOR', '2022-12-06', 'B+', 'nooooo');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register_user_info`
--
ALTER TABLE `register_user_info`
  MODIFY `User_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2200148;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
