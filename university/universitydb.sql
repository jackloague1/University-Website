-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2023 at 11:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `cNumber` int(4) NOT NULL,
  `title` varchar(128) NOT NULL,
  `textbook` varchar(128) NOT NULL,
  `units` int(2) NOT NULL,
  `dNumber` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`cNumber`, `title`, `textbook`, `units`, `dNumber`) VALUES
(1, 'English', 'Writing Fundamentals', 4, 2),
(2, 'History', 'History Textbook', 3, 3),
(3, 'Algebra', 'Algebra Textbook', 4, 5),
(4, 'Earth Science', 'Science Textbook', 3, 4),
(5, 'Intro to Computer Science', 'Computer Science Textbook', 3, 1),
(6, 'English 2', 'Writing Fundamentals 2', 3, 2),
(7, 'History 2', 'History Textbook 2', 3, 3),
(8, 'Algebra 2', 'Algebra Textbook 2', 4, 5),
(9, 'Earth Science 2', 'Science Textbook 2', 4, 4),
(10, 'Intro to Computer Science 2', 'Computer Science Textbook 2', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dNumber` int(3) NOT NULL,
  `name` varchar(128) NOT NULL,
  `telephone` int(10) NOT NULL,
  `officeLocation` varchar(128) NOT NULL,
  `chairSsn` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dNumber`, `name`, `telephone`, `officeLocation`, `chairSsn`) VALUES
(1, 'Computer Science', 1112223333, '12345 Road Way', 1),
(2, 'English', 1112223333, '23456 Road Way', 2),
(3, 'History', 1112223333, '34567 Road Way', 3),
(4, 'Science', 1111111111, '23432 Road Way', 5),
(5, 'Mathematics', 444444555, '45454 Road Way', 4);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `cwid` int(11) NOT NULL,
  `cNumber` int(4) NOT NULL,
  `sNumber` int(3) NOT NULL,
  `grade` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`cwid`, `cNumber`, `sNumber`, `grade`) VALUES
(2, 1, 1, 'A'),
(3, 2, 10, 'A'),
(1, 2, 10, 'A'),
(1, 1, 1, 'B'),
(1, 1, 1, 'B'),
(2, 2, 10, 'B'),
(2, 5, 25, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `ssn` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `state` varchar(128) NOT NULL,
  `zipCode` int(6) NOT NULL,
  `areaCode` int(4) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `title` varchar(128) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`ssn`, `name`, `address`, `city`, `state`, `zipCode`, `areaCode`, `sex`, `title`, `salary`) VALUES
(1, 'Shawn Wang', '12345 Way Way', 'City', 'California', 12345, 949, 'M', 'Computer Science Professor', 100000),
(2, 'Jessica Budica', '12345 Road Way', 'City', 'California', 23456, 949, 'F', 'English Professor', 100000),
(3, 'Michael Grant', '45632 Street Street', 'City2', 'California', 34567, 949, 'M', 'History Professor', 80000),
(4, 'William McCarthy', '54321 Street Street', 'City', 'California', 45678, 949, 'M', 'Computer Science Professor', 120000),
(5, 'Gary Larson', '23432 Road Way', 'City', 'California', 12345, 12345, 'M', 'Geography Professor', 70000);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `cNumber` int(4) NOT NULL,
  `sNumber` int(3) NOT NULL,
  `classroom` varchar(128) NOT NULL,
  `numSeats` int(4) NOT NULL,
  `meetingDays` varchar(128) NOT NULL,
  `startTime` varchar(128) NOT NULL,
  `endTime` varchar(128) NOT NULL,
  `profSsn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`cNumber`, `sNumber`, `classroom`, `numSeats`, `meetingDays`, `startTime`, `endTime`, `profSsn`) VALUES
(1, 1, 'BGS-14', 30, 'MonWed', '10:00am', '11:15am', 2),
(5, 2, 'BGS-104', 30, 'MonWed', '10:00am', '11:15am', 1),
(2, 10, 'BGS-22', 30, 'TuesThur', '12:00pm', '2:00pm', 3),
(4, 15, 'BGS-44', 20, 'TuesThurs', '4:00pm', '5:15pm', 5),
(7, 22, 'BGS-11', 20, 'MonWed', '4:00pm', '5:15pm', 2),
(5, 25, 'CPSC-30', 30, 'MonWedFri', '10:00am', '11:30am', 4),
(6, 30, 'BGS-15', 22, 'TuesThurs', '2:00pm', '3:15pm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `cwid` int(11) NOT NULL,
  `firstName` varchar(128) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `telephoneNumber` int(10) NOT NULL,
  `majorDNumber` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`cwid`, `firstName`, `lastName`, `address`, `telephoneNumber`, `majorDNumber`) VALUES
(1, 'Jack', 'Loague', '26102 Lorri Drive', 5589609, 1),
(2, 'Gerard', 'Andrade', '45610 Road Way', 2357168, 4),
(3, 'Chris', 'Norris', '55678 Road Way', 1113454, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`cNumber`),
  ADD KEY `dNumber` (`dNumber`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dNumber`),
  ADD KEY `chairSsn` (`chairSsn`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD KEY `cwid` (`cwid`),
  ADD KEY `cNumber` (`cNumber`),
  ADD KEY `sNumber` (`sNumber`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sNumber`),
  ADD KEY `cNumber` (`cNumber`),
  ADD KEY `profSsn` (`profSsn`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`cwid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`dNumber`) REFERENCES `departments` (`dNumber`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`chairSsn`) REFERENCES `professors` (`ssn`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`cwid`) REFERENCES `students` (`cwid`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`cNumber`) REFERENCES `sections` (`cNumber`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`sNumber`) REFERENCES `sections` (`sNumber`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`cNumber`) REFERENCES `courses` (`cNumber`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`profSsn`) REFERENCES `professors` (`ssn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
