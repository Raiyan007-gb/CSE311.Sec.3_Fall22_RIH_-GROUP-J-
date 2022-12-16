-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2022 at 03:54 PM
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
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_own_info`
--

INSERT INTO `admin_own_info` (`Admin_ID`, `Name`, `Contact_info`, `E_Mail`, `password`) VALUES
(2013130, 'RAIYANA', '01536129173', 'raiyan.ahmed05@northsouth.edu', '$2y$10$XOIs4tY/IH0PqNgeVZJY8Ok/Swu7J6sQcfJaUELUEFVwTrWWl9UBi'),
(2013132, 'AMRITA', '01536129171', 'amrita@northsouth.edu', '$2y$10$GY1Etz9byDmDV1stuZ1Be.wpVmS.BQ.nOUNk/hMI6rdj0QUUOWkp2'),
(2013135, 'Noushin', '01830659228', 'noushin@northsouth.edu', '$2y$10$Y.lYF3pTcZwc3j7Je4tKNuH98fQ0VG.ZfQ6GBaY.YNqfQT0rHSp0i'),
(2013136, 'TAHSEEN', '01536129173', 'raiyan.ahmed05@northsouth.edu', '$2y$10$hRNd2kdnWYQzO63PVAwa5evSif1nAkJntKBGj0J9iUfvYYHFifw5i'),
(2013137, 'Raiyan Ahmed', '01536129173', 'raiyan.ahmed05@northsouth.edu', '$2y$10$kU7gy56Lnjca/OV5DwoXzuH3TYJzsx0aFIr9ZyyBCdepXjZLALJGe');

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
(1100122, '$2y$10$cQLR048NKMLQ1vKAO1OI/e0xbgs5obZdyeDvczPfCfx5MIUN4CA4u', 'Bloodbank1', '1234567898', '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia', 567, 'yes we have', 'Verified');

-- --------------------------------------------------------

--
-- Table structure for table `blood_info`
--

CREATE TABLE `blood_info` (
  `Security_code` varchar(20) NOT NULL,
  `Blood_type` varchar(10) NOT NULL,
  `Storage_capacity` int(5) NOT NULL,
  `Available_bags` int(5) NOT NULL,
  `Bags_needed` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('AB+', 2200139, 'Raiyan Ahmed', 'ganderia sharafat ganj lane ganderia dhaka', '01536129173', '2022-12-20', '22:00:00', 23),
('O+', 2200140, 'Lovely sikda', 'Dhakaa', '01714426106', '2022-12-14', '22:00:00', 46),
('AB+', 2200141, 'Anika Rumman', 'ganderia 1204', '01536129173', '2022-12-19', '19:04:00', 23);

-- --------------------------------------------------------

--
-- Table structure for table `donor_information_table`
--

CREATE TABLE `donor_information_table` (
  `Blood_Type` varchar(5) NOT NULL,
  `User_ID` int(7) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Age` int(3) NOT NULL,
  `Last_Donation` int(4) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `UserType` varchar(10) NOT NULL,
  `E_mail` varchar(30) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Health_Problem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor_information_table`
--

INSERT INTO `donor_information_table` (`Blood_Type`, `User_ID`, `Name`, `Age`, `Last_Donation`, `Location`, `UserType`, `E_mail`, `Phone`, `Health_Problem`) VALUES
('AB+', 2200139, 'Raiyan Ahmed', 23, 58, 'ganderia sharafat ganj lane ganderia dhaka', 'DONOR', 'raiyan.ahmed05@northsouth.edu', '01536129173', 'dsfsd fdsf s df dfa'),
('O-', 2200140, 'Lovely sikda', 46, 67, 'Dhakaa', 'DONOR', 'lovely677@gmail.co', '01714426106', 'there is no health'),
('AB+', 2200141, 'Anika Rumman', 23, 88, 'ganderia 1204', 'DONOR', 'raiyan.ahmed05@northsouth.edu', '01536129173', 'no health problem'),
('B+', 2200145, 'Rashed ganiiiiiiii', 44, 88, 'it dhaka bangaldesh', 'DONOR', 'rashegani@yahoo.com', '01536129567', 'nooooo');

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
  `Health_Problem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_user_info`
--

INSERT INTO `register_user_info` (`User_ID`, `Name`, `Username`, `Password`, `Age`, `Phone`, `E_mail`, `Location`, `Last_Donation`, `UserType`, `Preferred_Date`, `Blood_Type`, `Health_Problem`) VALUES
(2200128, 'Raiyan Ahmed', 'raiyan2025@gmail.com9', '$2y$10$XqFfis9AZxXjoq1xDL37RuoGzS2V7M8cQR4Nlr686cSOstXp6yGOG', 23, '01536129173', 'raiyan.ahmed05@northsouth', 'ganderia sharafat ganj lane ganderia dhaka', 365, 'DONOR', '2023-01-07', 'O+', 'no health problem'),
(2200130, 'Rakib Hossain', 'rakib007', '$2y$10$FK8.WpQUvFZ.iRFM9ttZVe/wXQKhv70B4.8oEP4W8IbQ2RHP4E2Mm', 23, '01536129170', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'DONOR', '2022-12-18', 'O+', 'Good'),
(2200133, 'Tahseen', 'tahseen007', '$2y$10$nrJYTX4giK6vjdtKLb.j1.jCKXSdsTRtWf3HZ5ikQusG5HEB3i9g6', 0, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 56, 'DONOR', '2023-01-01', 'O+', 'no health problem'),
(2200139, 'Raiyan Ahmed', 'raiyan2025@gmail.comj', '$2y$10$50r/4wU4EZBabyIMOGPa5uegYtlYL/SCgralCGPtERCHAge5.jk5O', 23, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia sharafat ganj lane ganderia dhaka', 58, 'DONOR', '2022-12-06', 'AB+', 'dsfsd fdsf s df dfa'),
(2200140, 'Lovely sikda', 'howareyou007', '$2y$10$3qlibfbQ/mIuqhPasVEioO15fYZrh5GdAQQMvTifpB8KWaNHVsjni', 46, '01714426106', 'lovely677@gmail.co', 'Dhakaa', 67, 'DONOR', '2022-12-06', 'O-', 'there is no health'),
(2200141, 'Anika Rumman', 'raiyan2025@gmail.comjj', '$2y$10$/TLcIuN6gRcYfOzBvcXWSOA35nmN1wcsnCsdT1QwI4WsSe6yRTqKy', 23, '01536129173', 'raiyan.ahmed05@northsouth.edu', 'ganderia 1204', 88, 'DONOR', '2022-12-06', 'AB+', 'no health problem'),
(2200145, 'Rashed ganiiiiiiii', 'howareyou003', '$2y$10$IcPzV/PxuTpZfDaYdxBOAeUMw0/Erj6NhwE/c1/e12z92ftCQu.i6', 43, '01536129567', 'rashegani@yahoo.com', 'it dhaka bangaldesh', 88, 'ACCEPTOR', '2022-12-18', 'B+', 'nooooo');

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
-- Indexes for table `admin_own_info`
--
ALTER TABLE `admin_own_info`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `blood_bank_info`
--
ALTER TABLE `blood_bank_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `blood_request_user`
--
ALTER TABLE `blood_request_user`
  ADD UNIQUE KEY `User_ID` (`User_ID`);

--
-- Indexes for table `donor_information_table`
--
ALTER TABLE `donor_information_table`
  ADD UNIQUE KEY `User_ID` (`User_ID`);

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
-- AUTO_INCREMENT for table `admin_own_info`
--
ALTER TABLE `admin_own_info`
  MODIFY `Admin_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2013138;

--
-- AUTO_INCREMENT for table `blood_bank_info`
--
ALTER TABLE `blood_bank_info`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100124;

--
-- AUTO_INCREMENT for table `register_user_info`
--
ALTER TABLE `register_user_info`
  MODIFY `User_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2200146;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_request_user`
--
ALTER TABLE `blood_request_user`
  ADD CONSTRAINT `blood_request_user_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donor_information_table`
--
ALTER TABLE `donor_information_table`
  ADD CONSTRAINT `donor_information_table_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `see_ownuser_info`
--
ALTER TABLE `see_ownuser_info`
  ADD CONSTRAINT `see_ownuser_info_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
