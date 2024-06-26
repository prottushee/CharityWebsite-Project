-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 06:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Aid` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` text NOT NULL,
  `location` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cloth_storage`
--

CREATE TABLE `cloth_storage` (
  `Fid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_donations`
--

CREATE TABLE `food_donations` (
  `Fid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `food` varchar(50) NOT NULL,
  `type` text NOT NULL,
  `category` text NOT NULL,
  `quantity` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `address` text NOT NULL,
  `location` varchar(50) NOT NULL,
  `phoneno` varchar(25) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `delivery_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kid_donate`
--

CREATE TABLE `kid_donate` (
  `Fid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storm_donate`
--

CREATE TABLE `storm_donate` (
  `Fid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_feedback`
--

CREATE TABLE `user_feedback` (
  `feedback_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Aid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cloth_storage`
--
ALTER TABLE `cloth_storage`
  ADD PRIMARY KEY (`Fid`);

--
-- Indexes for table `food_donations`
--
ALTER TABLE `food_donations`
  ADD PRIMARY KEY (`Fid`);

--
-- Indexes for table `kid_donate`
--
ALTER TABLE `kid_donate`
  ADD PRIMARY KEY (`Fid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `storm_donate`
--
ALTER TABLE `storm_donate`
  ADD PRIMARY KEY (`Fid`);

--
-- Indexes for table `user_feedback`
--
ALTER TABLE `user_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cloth_storage`
--
ALTER TABLE `cloth_storage`
  MODIFY `Fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_donations`
--
ALTER TABLE `food_donations`
  MODIFY `Fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kid_donate`
--
ALTER TABLE `kid_donate`
  MODIFY `Fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storm_donate`
--
ALTER TABLE `storm_donate`
  MODIFY `Fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_feedback`
--
ALTER TABLE `user_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
