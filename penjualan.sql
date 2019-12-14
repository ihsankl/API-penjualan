-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2019 at 07:29 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `harga_pokok` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `sisa_stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_barang`, `nama_barang`, `kategori`, `harga_pokok`, `harga_jual`, `sisa_stok`) VALUES
(2, 'B0001', 'Pepsodin', 'Pasta Gigi', 3000, 5000, 0),
(6, 'B0003', 'Pepsamen', 'Permen', 3000, 6000, 35),
(7, 'B0002', 'Hitz', 'Obat Nyamuk', 5000, 6000, 65),
(8, 'B0099', 'Hi', 'Obat', 6000, 8000, 85);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `tgl_exp` date NOT NULL,
  `qty_beli` int(11) NOT NULL,
  `total_pembelian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_supplier`, `id_barang`, `tgl_pembelian`, `tgl_exp`, `qty_beli`, `total_pembelian`) VALUES
(4, 2, 2, '2019-12-07', '2019-12-31', 40, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `qty_beli` int(11) NOT NULL,
  `total_pembelian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_barang`, `tgl_penjualan`, `qty_beli`, `total_pembelian`) VALUES
(3, 6, '2019-12-11', 3, 18000),
(4, 6, '2019-12-11', 3, 18000),
(5, 2, '2019-12-11', 1, 5000),
(6, 6, '2019-12-11', 3, 18000),
(7, 2, '2019-12-11', 1, 5000),
(8, 2, '2019-12-11', 1, 5000),
(9, 2, '2019-12-11', 1, 5000),
(10, 6, '2019-12-11', 3, 18000),
(11, 6, '2019-12-11', 3, 18000),
(12, 6, '2019-12-11', 3, 18000),
(13, 2, '2019-12-11', 1, 5000),
(14, 2, '2019-12-11', 1, 5000),
(15, 2, '2019-12-11', 1, 5000),
(16, 6, '2019-12-11', 3, 18000),
(17, 6, '2019-12-11', 3, 18000),
(18, 6, '2019-12-11', 3, 18000),
(19, 2, '2019-12-11', 1, 5000),
(20, 2, '2019-12-11', 1, 5000),
(21, 2, '2019-12-11', 1, 5000),
(22, 6, '2019-12-11', 3, 18000),
(23, 6, '2019-12-11', 3, 18000),
(24, 6, '2019-12-11', 3, 18000),
(25, 6, '2019-12-11', 3, 18000),
(26, 2, '2019-12-11', 1, 5000),
(27, 2, '2019-12-11', 1, 5000),
(28, 2, '2019-12-11', 1, 5000),
(29, 6, '2019-12-11', 3, 18000),
(30, 6, '2019-12-11', 3, 18000),
(31, 2, '2019-12-11', 1, 5000),
(32, 6, '2019-12-11', 3, 18000),
(33, 2, '2019-12-11', 1, 5000),
(34, 6, '2019-12-11', 3, 18000),
(35, 6, '2019-12-11', 3, 18000),
(36, 2, '2019-12-11', 1, 5000),
(37, 2, '2019-12-11', 1, 5000),
(38, 2, '2019-12-11', 1, 5000),
(39, 2, '2019-12-11', 1, 5000),
(40, 2, '2019-12-11', 1, 5000),
(41, 2, '2019-12-11', 1, 5000),
(42, 6, '2019-12-11', 1, 6000),
(43, 2, '2019-12-11', 1, 5000),
(44, 6, '2019-12-11', 1, 6000),
(45, 6, '2019-12-11', 1, 6000),
(46, 2, '2019-12-11', 1, 5000),
(47, 2, '2019-12-11', 1, 5000),
(48, 6, '2019-12-11', 1, 6000),
(49, 6, '2019-12-11', 1, 6000),
(50, 2, '2019-12-11', 1, 5000),
(51, 6, '2019-12-11', 1, 6000),
(52, 2, '2019-12-12', 1, 5000),
(53, 6, '2019-12-12', 3, 18000),
(54, 2, '2019-12-12', 1, 5000),
(55, 2, '2019-12-12', 1, 5000),
(56, 6, '2019-12-12', 3, 18000),
(57, 6, '2019-12-12', 3, 18000),
(58, 2, '2019-12-13', 1, 5000),
(59, 2, '2019-12-13', 2, 10000),
(60, 2, '2019-12-13', 2, 10000),
(61, 6, '2019-12-13', 2, 12000),
(62, 6, '2019-12-13', 2, 12000),
(63, 2, '2019-12-13', 2, 10000),
(64, 6, '2019-12-13', 2, 12000),
(65, 6, '2019-12-13', 2, 12000),
(66, 6, '2019-12-13', 1, 6000),
(67, 2, '2019-12-13', 3, 15000),
(68, 2, '2019-12-13', 2, 10000),
(69, 6, '2019-12-13', 2, 12000),
(70, 6, '2019-12-13', 2, 12000),
(71, 6, '2019-12-13', 1, 6000),
(72, 2, '2019-12-13', 3, 15000),
(73, 7, '2019-12-13', 5, 30000),
(74, 2, '2019-12-13', 5, 25000),
(75, 6, '2019-12-13', 5, 30000),
(76, 7, '2019-12-13', 5, 30000),
(77, 8, '2019-12-13', 5, 40000),
(78, 2, '2019-12-13', 5, 25000),
(79, 2, '2019-12-13', 5, 25000),
(80, 2, '2019-12-13', 5, 25000),
(81, 6, '2019-12-13', 5, 30000),
(82, 7, '2019-12-13', 5, 30000),
(83, 8, '2019-12-13', 5, 40000),
(84, 2, '2019-12-13', 5, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`) VALUES
(2, 'Media Asih'),
(8, 'Mediatama');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `FK_01` (`id_barang`),
  ADD KEY `FK_2` (`id_supplier`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `FK_03` (`id_barang`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `FK_01` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `FK_03` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
