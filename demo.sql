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
-- Database: `demo`
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
  `Blood_Type` enum('AB+','AB-','A+','A-','B+','B-','O+','O-') DEFAULT NULL,
  `Health_Problem` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_user_info`
--

INSERT INTO `register_user_info` (`User_ID`, `Name`, `Username`, `Password`, `Age`, `Phone`, `E_mail`, `Location`, `Last_Donation`, `UserType`, `Preferred_Date`, `Blood_Type`, `Health_Problem`) VALUES
(2200117, 'Raiyan Ahmed', 'raiyan2025@gmail.comj', '$2y$10$xDKzcwWYBRZ98NX4b4HtwOMnWPJieDwZW2g7tZtypn3LVjmlCy6f6', 88, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'ACCEPTOR', '2022-12-12', 'AB+', 'there is no health problem with me there is no health problem with me there is no health problem with methere is no health problem with me '),
(2200118, 'Raiyan Ahmed', 'raiyan2012s', '$2y$10$hw7QgMU9PgWJTYbs8XWaR.tABrNWvIsJor0kBDKvL1D8uyMCjEGku', 22, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'ACCEPTOR', '0000-00-00', 'AB+', 'there is no health problem with me there is no health problem with me there is no health problem with methere is no health problem with me '),
(2200119, 'Raiyan Ahmed', 'raiyan2012sh', '$2y$10$aTCz.yyUoRHesVFsoHIux.1ay59.wCjUmZ7VbEAPTinSL4ad5RQUq', 22, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'ACCEPTOR', '2022-12-11', 'B+', 'there is no health problem with me there is no health problem with me there is no health problem with methere is no health problem with me '),
(2200120, 'Raiyan Ahmed', 'admin', '$2y$10$seX1tAOHA7lnMl4a628DEeSk7NXt4IL21FH9i9HEWxizsle.GOawe', 23, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'ACCEPTOR', '2022-12-28', 'O-', 'there is no health problem with me there is no health problem with me there is no health problem with methere is no health problem with me ');

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register_user_info`
--
ALTER TABLE `register_user_info`
  MODIFY `User_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2200121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
