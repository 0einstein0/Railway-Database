-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 06:03 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Passenger_ID` int(11) NOT NULL,
  `Route_ID` int(11) NOT NULL,
  `Arrival_Station` int(11) NOT NULL,
  `Departure_Station` int(11) NOT NULL,
  `Travel_Date` date NOT NULL,
  `Booking_ID` int(11) NOT NULL,
  `Cabin` char(2) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Seat_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Passenger_ID`, `Route_ID`, `Arrival_Station`, `Departure_Station`, `Travel_Date`, `Booking_ID`, `Cabin`, `Seat_No`) VALUES
(95, 1, 15, 19, '2019-02-03', 31, 'EC', 8),
(97, 3, 14, 12, '2019-02-03', 32, 'EC', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cabin_price`
--

CREATE TABLE `cabin_price` (
  `Cabin` char(2) COLLATE utf8_general_mysql500_ci NOT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `cabin_price`
--

INSERT INTO `cabin_price` (`Cabin`, `Price`) VALUES
('AC', 1000),
('EC', 500),
('PC', 1500),
('SL', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `Passenger_ID` int(11) NOT NULL,
  `Passenger_Name` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `Phone_No` int(11) DEFAULT NULL,
  `CNIC` varchar(16) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`Passenger_ID`, `Passenger_Name`, `Phone_No`, `CNIC`) VALUES
(95, 'Mark', 38273831, '9827823179'),
(97, 'Tim', 336736, '3636376376');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Route_ID` int(11) NOT NULL,
  `Description` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`Route_ID`, `Description`) VALUES
(1, 'AZK-NRA'),
(2, 'NRA-AZK'),
(3, 'AZK-OLP'),
(4, 'OLP-AZK'),
(5, 'EMC-HWT'),
(6, 'HWT-EMC'),
(7, 'ELD-D12'),
(8, 'D12-ELD'),
(9, 'OLP-D12'),
(10, 'D12-OLP'),
(11, 'MDE-GTC'),
(12, 'GTC-MDE');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `Seat_No` int(11) NOT NULL,
  `Cabin` char(2) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`Seat_No`, `Cabin`) VALUES
(1, 'AC'),
(1, 'EC'),
(1, 'PC'),
(1, 'SL'),
(2, 'AC'),
(2, 'EC'),
(2, 'PC'),
(2, 'SL'),
(3, 'AC'),
(3, 'EC'),
(3, 'PC'),
(3, 'SL'),
(4, 'AC'),
(4, 'EC'),
(4, 'PC'),
(4, 'SL'),
(5, 'AC'),
(5, 'EC'),
(5, 'PC'),
(5, 'SL'),
(6, 'AC'),
(6, 'EC'),
(6, 'PC'),
(6, 'SL'),
(7, 'AC'),
(7, 'EC'),
(7, 'PC'),
(7, 'SL'),
(8, 'AC'),
(8, 'EC'),
(8, 'PC'),
(8, 'SL'),
(9, 'AC'),
(9, 'EC'),
(9, 'PC'),
(9, 'SL'),
(10, 'AC'),
(10, 'EC'),
(10, 'PC'),
(10, 'SL');

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `Station_ID` int(11) NOT NULL,
  `City` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`Station_ID`, `City`) VALUES
(1, 'Asgard'),
(2, 'Middle Earth'),
(3, 'District 12'),
(4, 'Townsville'),
(5, 'Wonderland'),
(6, 'Olympus'),
(7, 'Lilliput'),
(8, 'Capitol'),
(9, 'Gotham City'),
(10, 'El Dorado'),
(11, 'King\'s Landing'),
(12, 'Emerald City'),
(13, 'Far Far Away'),
(14, 'Springfield'),
(15, 'Azkaban'),
(16, 'The Shire'),
(17, 'Neverland'),
(18, 'Nok Kundi'),
(19, 'Narnia'),
(20, 'Hogwarts'),
(21, 'Metropolis'),
(22, 'Vice City'),
(23, 'Whoville'),
(24, 'Stars Hollow');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_ID` int(11) NOT NULL,
  `TName` varchar(80) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `EvenDayRoute` int(11) DEFAULT NULL,
  `OddDayRoute` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_ID`, `TName`, `EvenDayRoute`, `OddDayRoute`) VALUES
(1, 'Golden Eagle I', 1, 2),
(2, 'Golden Eagle II', 2, 1),
(3, 'Orient Express I', 3, 4),
(4, 'Orient Express II', 4, 3),
(5, 'Hogwarts Express I', 5, 6),
(6, 'Hogwarts Express II', 6, 5),
(7, 'Royal Express I', 7, 8),
(8, 'Royal Express II', 8, 7),
(9, 'Polar Express I', 9, 10),
(10, 'Polar Express II', 10, 9),
(11, 'Thomas the Tank Engine I', 11, 12),
(12, 'Thomas the Tank Engine II', 12, 11);

-- --------------------------------------------------------

--
-- Table structure for table `train_schedule`
--

CREATE TABLE `train_schedule` (
  `Route_ID` int(11) NOT NULL,
  `Station_ID` int(11) NOT NULL,
  `Station_Order` int(11) NOT NULL,
  `Arrival_Time` time DEFAULT NULL,
  `Departure_Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `train_schedule`
--

INSERT INTO `train_schedule` (`Route_ID`, `Station_ID`, `Station_Order`, `Arrival_Time`, `Departure_Time`) VALUES
(1, 15, 1, NULL, '10:10:00'),
(1, 16, 2, '11:00:00', '11:10:00'),
(1, 17, 3, '12:00:00', '12:10:00'),
(1, 18, 4, '13:00:00', '13:10:00'),
(1, 19, 5, '14:00:00', NULL),
(2, 15, 5, '14:00:00', NULL),
(2, 16, 4, '13:00:00', '13:10:00'),
(2, 17, 3, '12:00:00', '12:10:00'),
(2, 18, 2, '11:00:00', '11:10:00'),
(2, 19, 1, NULL, '10:10:00'),
(3, 6, 9, '16:00:00', NULL),
(3, 7, 8, '15:00:00', '15:10:00'),
(3, 8, 7, '14:00:00', '14:10:00'),
(3, 9, 6, '13:00:00', '13:10:00'),
(3, 10, 5, '12:00:00', '12:10:00'),
(3, 11, 4, '11:00:00', '11:10:00'),
(3, 12, 3, '10:00:00', '10:10:00'),
(3, 14, 2, '09:00:00', '09:10:00'),
(3, 15, 1, NULL, '08:10:00'),
(4, 6, 1, NULL, '08:10:00'),
(4, 7, 2, '09:00:00', '09:10:00'),
(4, 8, 3, '10:00:00', '10:10:00'),
(4, 9, 4, '11:00:00', '11:10:00'),
(4, 10, 5, '12:00:00', '12:10:00'),
(4, 11, 6, '13:00:00', '13:10:00'),
(4, 12, 7, '14:00:00', '14:10:00'),
(4, 14, 8, '15:00:00', '15:10:00'),
(4, 15, 9, '16:00:00', NULL),
(5, 12, 1, NULL, '06:10:00'),
(5, 13, 2, '07:00:00', '07:10:00'),
(5, 19, 3, '08:00:00', '08:10:00'),
(5, 20, 4, '09:00:00', NULL),
(6, 12, 4, '09:00:00', NULL),
(6, 13, 3, '08:00:00', '08:10:00'),
(6, 19, 2, '07:00:00', '07:10:00'),
(6, 20, 1, NULL, '06:10:00'),
(7, 3, 4, '16:00:00', NULL),
(7, 10, 1, NULL, '13:10:00'),
(7, 21, 2, '14:00:00', '14:10:00'),
(7, 22, 3, '15:00:00', '15:10:00'),
(8, 3, 1, NULL, '13:10:00'),
(8, 10, 4, '16:00:00', NULL),
(8, 21, 3, '15:00:00', '15:10:00'),
(8, 22, 2, '14:00:00', '14:10:00'),
(9, 1, 5, '20:00:00', '20:10:00'),
(9, 2, 4, '19:00:00', '19:10:00'),
(9, 3, 6, '21:00:00', NULL),
(9, 4, 3, '18:00:00', '18:10:00'),
(9, 5, 2, '17:00:00', '17:10:00'),
(9, 6, 1, NULL, '16:10:00'),
(10, 1, 2, '17:00:00', '17:10:00'),
(10, 2, 3, '18:00:00', '18:10:00'),
(10, 3, 1, NULL, '16:10:00'),
(10, 4, 4, '19:00:00', '19:10:00'),
(10, 5, 5, '20:00:00', '20:10:00'),
(10, 6, 6, '21:00:00', NULL),
(11, 2, 1, NULL, '01:10:00'),
(11, 4, 2, '02:00:00', '02:10:00'),
(11, 5, 3, '03:00:00', '03:10:00'),
(11, 6, 4, '04:00:00', '04:10:00'),
(11, 8, 7, '07:00:00', '07:10:00'),
(11, 9, 8, '08:00:00', NULL),
(11, 23, 5, '05:00:00', '05:10:00'),
(11, 24, 6, '06:00:00', '06:10:00'),
(12, 2, 8, '08:00:00', NULL),
(12, 4, 7, '07:00:00', '07:10:00'),
(12, 5, 6, '06:00:00', '06:10:00'),
(12, 6, 5, '05:00:00', '05:10:00'),
(12, 8, 2, '02:00:00', '02:10:00'),
(12, 9, 1, NULL, '01:10:00'),
(12, 23, 4, '04:00:00', '04:10:00'),
(12, 24, 3, '03:00:00', '03:10:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD UNIQUE KEY `Travel_Date` (`Travel_Date`,`Seat_No`,`Cabin`),
  ADD KEY `Seat_No` (`Seat_No`,`Cabin`),
  ADD KEY `Route_ID` (`Route_ID`),
  ADD KEY `Arrival_Station` (`Arrival_Station`),
  ADD KEY `Passenger_ID` (`Passenger_ID`),
  ADD KEY `Departure_Station` (`Departure_Station`);

--
-- Indexes for table `cabin_price`
--
ALTER TABLE `cabin_price`
  ADD PRIMARY KEY (`Cabin`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`Passenger_ID`),
  ADD UNIQUE KEY `CNIC` (`CNIC`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Route_ID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`Seat_No`,`Cabin`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`Station_ID`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_ID`),
  ADD UNIQUE KEY `TName` (`TName`),
  ADD UNIQUE KEY `EvenDayRoute` (`EvenDayRoute`),
  ADD UNIQUE KEY `OddDayRoute` (`OddDayRoute`);

--
-- Indexes for table `train_schedule`
--
ALTER TABLE `train_schedule`
  ADD PRIMARY KEY (`Route_ID`,`Station_ID`,`Station_Order`),
  ADD KEY `Station_ID` (`Station_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `Passenger_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Seat_No`,`Cabin`) REFERENCES `seat` (`Seat_No`, `Cabin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`Arrival_Station`) REFERENCES `station` (`Station_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`Departure_Station`) REFERENCES `station` (`Station_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`EvenDayRoute`) REFERENCES `route` (`Route_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`OddDayRoute`) REFERENCES `route` (`Route_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `train_schedule`
--
ALTER TABLE `train_schedule`
  ADD CONSTRAINT `train_schedule_ibfk_1` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `train_schedule_ibfk_2` FOREIGN KEY (`Station_ID`) REFERENCES `station` (`Station_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
