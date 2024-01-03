-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 10:16 AM
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
-- Database: `mikinibro_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(18, 2, 3, 'Miki Overload', 70, 1, 'Miki3.png'),
(20, 1, 8, 'Overload Mami', 70, 1, 'Mami overload.jpg'),
(21, 1, 10, 'Miki with Chicharon', 50, 1, 'mchicharon.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'Henry Lazo', '09065680244', 'cash on delivery', 'flat no.poblacion NOrte, maharlika30 - 2705', 'Miki Special ( 300 x 1 ) - ', 300, '2023-11-23', 'completed'),
(2, 1, 'Daryll Francisco', '0966630309', 'paypal', 'flat no.poblacion NOrte, maharlika30 - 1234', 'Overload Mami ( 70 x 1 ) - ', 70, '2023-11-23', 'completed'),
(3, 1, 'xy', '888897', 'paypal', 'flat no.doon, apatot - 1234', 'Miki With Chicken and Toppings ( 55 x 2 ) - Coca-cola (1liter) ( 35 x 1 ) - Water Wilkins Plastic Bottle (1lt) ( 25 x 1 ) - ', 170, '2023-11-23', 'completed'),
(4, 2, 'Daryll Francisco', '0987654321', 'paytm', 'flat no.poblacion NOrte, maharlika30 - 1234', 'Miki With Chicken and Toppings ( 55 x 1 ) - Water Wilkins Plastic Bottle (1lt) ( 25 x 1 ) - ', 80, '2023-11-24', 'completed'),
(5, 2, 'Emerlyn lazo', '88888', 'paypal', 'flat no.apatot, maharlika30 - 2706', 'Miki with Egg ( 50 x 1 ) - Pepsi (1.5l) ( 55 x 1 ) - Miki with Chicharon ( 50 x 1 ) - Coca-cola (300ml) ( 15 x 1 ) - ', 170, '2023-11-24', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(1, 'Miki with Egg', 50, 'miki1.png'),
(2, 'Miki With Chicken and Toppings', 55, 'Miki2.png'),
(3, 'Miki Overload', 70, 'Miki3.png'),
(4, 'Pancit Miki Special ', 70, 'miki4.png'),
(5, 'Original Mami', 50, 'Original.png'),
(6, 'Chicken Mami', 65, 'Chicken.png'),
(7, 'Beef Mami', 65, 'Beff.png'),
(8, 'Overload Mami', 70, 'Mami overload.jpg'),
(10, 'Miki with Chicharon', 50, 'mchicharon.png'),
(11, 'Coca-cola Small Bottle', 17, 'cokesmall.jpeg'),
(12, 'Coca-cola (300ml)', 15, '300ml.png'),
(14, 'Coca-cola (1.5l)', 55, 'cocacola_1.5.png'),
(15, 'Pepsi (300ml)', 15, 'pepsi12oz.jpeg'),
(16, 'Pepsi (1.5l)', 55, 'Pepsi-1-5-Litre.jpg'),
(19, 'Sprite (500ml)', 17, 'sprite_bottle_500ml.jpg'),
(20, 'Water Wilkins Plastic Bottle (small)', 10, 'water.jpg'),
(21, 'Water Wilkins Plastic Bottle (1lt)', 25, 'water 1L.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `review` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'HenryLazo', 'lazohenry08@gmail.com', 'aa9a87e57f6fac8b242f69aff856216ce4eb6797'),
(2, 'DaryllFrancisco', 'daryllfrancisco82@gmail.com', '7eaf596f5d231d0bbb07cbc5ddcab8089d1390bd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
