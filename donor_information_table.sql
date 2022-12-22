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
('O+', 2200133, 'Tahseen', 19, 56, 'ganderia sharafat ganj lane ganderia dhaka', 'DONOR', 'raiyan.ahmed05@northsouth.edu', '01536129173', 'no health problem'),
('AB+', 2200139, 'Raiyan Ahmed', 23, 58, 'ganderia sharafat ganj lane ganderia dhaka', 'DONOR', 'raiyan.ahmed05@northsouth.edu', '01536129173', 'dsfsd fdsf s df dfa'),
('O-', 2200140, 'Lovely sikda', 46, 67, 'Dhakaa', 'DONOR', 'lovely677@gmail.co', '01714426106', 'there is no health'),
('B+', 2200145, 'Rashed ganiiiiiiii', 44, 88, 'it dhaka bangaldesh', 'DONOR', 'rashegani@yahoo.com', '01536129567', 'nooooo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor_information_table`
--
ALTER TABLE `donor_information_table`
  ADD UNIQUE KEY `User_ID` (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donor_information_table`
--
ALTER TABLE `donor_information_table`
  ADD CONSTRAINT `donor_information_table_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `register_user_info` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
