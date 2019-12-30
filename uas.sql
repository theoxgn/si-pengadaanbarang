-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2018 at 03:27 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL,
  `kategori` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori_barang`, `kategori`, `dihapus`) VALUES
(1, 'Sepatu', 'ya'),
(2, 'Tas', 'tidak'),
(3, 'Baju', 'tidak'),
(4, 'Celana', 'tidak'),
(5, 'Topi', 'ya'),
(6, 'Gelang', 'ya'),
(7, 'Jam', 'ya'),
(8, 'Topi', 'tidak'),
(10, 'Parka', 'tidak'),
(11, 'Sweater', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `merk_barang`
--

CREATE TABLE `merk_barang` (
  `id_merk_barang` mediumint(1) UNSIGNED NOT NULL,
  `merk` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merk_barang`
--

INSERT INTO `merk_barang` (`id_merk_barang`, `merk`, `dihapus`) VALUES
(1, 'Adidas', 'tidak'),
(2, 'Nike', 'tidak'),
(3, 'BodyPack', 'tidak'),
(4, 'Jansport', 'tidak'),
(5, 'Nevada', 'tidak'),
(6, 'Jackloth', 'tidak'),
(9, 'Pierro', 'ya'),
(10, 'Converse', 'tidak'),
(11, 'Piero', 'ya'),
(12, 'Teen', 'ya'),
(20, 'Supreme', 'tidak'),
(19, 'vans', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `description` text NOT NULL,
  `id_kategori_barang` int(5) DEFAULT NULL,
  `id_merk_barang` int(5) DEFAULT NULL,
  `id_supplier_barang` int(5) DEFAULT NULL,
  `stok` int(5) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `image`, `description`, `id_kategori_barang`, `id_merk_barang`, `id_supplier_barang`, `stok`, `satuan`) VALUES
('5c0a96984f4bc', 'Vans oldskool pro', 1100000, '5c0a96984f4bc.jpg', 'Vans oldskool pro', 1, 19, 11, 10, 'pair   '),
('5c0b9521a007d', 'Vans oldskool Flame', 1000000, '5c0b9521a007d.jpg', 'Vans oldskool Flame', 1, 19, 11, 3, 'pair'),
('5c0ba65875b24', 'Vans auth micky mouse', 1000000, '5c0ba65875b24.jpg', 'Vans auth micky mouse', 1, 19, 11, 5, 'pair '),
('5c0ba9079c446', 'Supreme logo tape n 3b parka', 15000000, '5c0ba9079c446.jpg', 'Supreme logo tape n 3b parka', 10, 20, 12, 2, 'Buah '),
('5c0bbd2d89896', 'Supreme cat in the hat hooded sweatshirt', 3500000, '5c0bbd2d89896.jpg', 'Supreme cat in the hat hooded sweatshirt', 11, 20, 12, 5, 'Buah ');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_barang`
--

CREATE TABLE `supplier_barang` (
  `id_supplier_barang` mediumint(1) UNSIGNED NOT NULL,
  `supplier` varchar(40) NOT NULL,
  `alamat_supplier` varchar(50) NOT NULL,
  `tlp_supplier` varchar(15) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_barang`
--

INSERT INTO `supplier_barang` (`id_supplier_barang`, `supplier`, `alamat_supplier`, `tlp_supplier`, `dihapus`) VALUES
(11, 'Vans Indonesia', 'Jakarta', '082301525003', 'tidak'),
(12, 'Supreme', 'New york', '183800375', 'tidak');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori_barang`);

--
-- Indexes for table `merk_barang`
--
ALTER TABLE `merk_barang`
  ADD PRIMARY KEY (`id_merk_barang`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `id_kategori_barang` (`id_kategori_barang`,`id_merk_barang`,`id_supplier_barang`);

--
-- Indexes for table `supplier_barang`
--
ALTER TABLE `supplier_barang`
  ADD PRIMARY KEY (`id_supplier_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `merk_barang`
--
ALTER TABLE `merk_barang`
  MODIFY `id_merk_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `supplier_barang`
--
ALTER TABLE `supplier_barang`
  MODIFY `id_supplier_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
