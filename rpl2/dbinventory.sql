-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2023 at 02:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbinventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `brgkode` char(10) NOT NULL,
  `brgnama` varchar(100) NOT NULL,
  `brgkatid` int(10) UNSIGNED NOT NULL,
  `brgsatid` int(10) UNSIGNED NOT NULL,
  `brgharga` double NOT NULL,
  `brggambar` varchar(200) DEFAULT NULL,
  `brgstok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`brgkode`, `brgnama`, `brgkatid`, `brgsatid`, `brgharga`, `brggambar`, `brgstok`) VALUES
('DE0001', 'Arelis Gamis by Papermea', 1, 1, 235400, 'upload/DE0001_1.png', 7),
('DE0002', 'Gamis Lora', 1, 1, 240750, 'upload/DE0002_1.png', 2),
('DE0003', 'Gamis Crincle', 1, 1, 206510, 'upload/DE0003_1.png', 3),
('DE0004', 'Gamis Ardelia', 1, 1, 160500, 'upload/DE0004_1.png', 4),
('DE0005', 'Gamis Pesta', 1, 1, 160500, 'upload/DE0005_1.png', 3),
('DE0006', 'Gamis Papermea Deqila', 1, 1, 235400, 'upload/DE0006_1.png', 1),
('DE0007', 'Gamis Salur', 1, 1, 149800, 'upload/DE0007_1.png', 2),
('DE0008', 'Amera Gamis by Papermea', 1, 1, 235400, 'upload/DE0008_1.png', 3),
('DE0009', 'Gamis X2 Flanel', 1, 1, 187250, 'upload/DE0009_1.png', 3),
('DE0010', 'Set Panjang', 2, 1, 128400, 'upload/DE0010.png', 2),
('DE0011', 'Set Rok Import', 2, 1, 208650, 'upload/DE0011.png', 2),
('DE0012', 'Midi Dress', 3, 1, 160500, 'upload/DE0012.png', 2),
('DE0013', 'Dress Rajut', 3, 1, 114490, 'upload/DE0013.png', 2),
('DE0014', 'Tartan Dress', 3, 1, 187250, 'upload/DE0014.png', 1),
('DE0015', 'Dress Liona', 3, 1, 160500, 'upload/DE0015.png', 4),
('DE0016', 'Midi Flower', 3, 1, 160500, 'upload/DE0016.png', 1),
('DE0017', 'Set Shakila Anak', 4, 1, 74900, 'upload/DE0017.png', 2),
('DE0018', 'Set Polka', 4, 1, 128400, 'upload/DE0018.png', 2),
('DE0019', 'Set Jeans Pendek', 4, 1, 133750, 'upload/DE0019.png', 3),
('DE0020', 'Set Jeans Panjang', 4, 1, 149800, 'upload/DE0020.png', 3),
('DE0021', 'Midi Dress Anak', 6, 1, 71690, 'upload/DE0021.png', 2),
('DE0022', 'Dress Anak Crinkle', 6, 1, 101650, 'upload/DE0022.png', 2),
('DE0023', 'Renda Tartan', 6, 1, 128400, 'upload/DE0023.png', 3),
('DE0024', 'Renda Jeans Dress', 6, 1, 117700, 'upload/DE0024.png', 3),
('DE0025', 'Bunny Dress', 6, 1, 128400, 'upload/DE0025.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `barangkeluar`
--

CREATE TABLE `barangkeluar` (
  `faktur` char(20) NOT NULL,
  `tglfaktur` date DEFAULT NULL,
  `idpel` int(11) DEFAULT NULL,
  `totalharga` double DEFAULT NULL,
  `jumlahuang` double DEFAULT NULL,
  `sisauang` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barangkeluar`
--

INSERT INTO `barangkeluar` (`faktur`, `tglfaktur`, `idpel`, `totalharga`, `jumlahuang`, `sisauang`) VALUES
('1607220001', '2022-07-16', 1, 877400, 877400, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barangmasuk`
--

CREATE TABLE `barangmasuk` (
  `faktur` char(20) NOT NULL,
  `tglfaktur` date DEFAULT NULL,
  `totalharga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barangmasuk`
--

INSERT INTO `barangmasuk` (`faktur`, `tglfaktur`, `totalharga`) VALUES
('DE-005', '2022-07-27', 660000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_barangkeluar`
--

CREATE TABLE `detail_barangkeluar` (
  `id` bigint(20) NOT NULL,
  `detfaktur` char(20) DEFAULT NULL,
  `detbrgkode` char(10) DEFAULT NULL,
  `dethargajual` double DEFAULT NULL,
  `detjumlah` int(11) DEFAULT NULL,
  `detsubtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detail_barangkeluar`
--

INSERT INTO `detail_barangkeluar` (`id`, `detfaktur`, `detbrgkode`, `dethargajual`, `detjumlah`, `detsubtotal`) VALUES
(7, '1607220001', 'DE0004', 160500, 4, 642000),
(8, '1607220001', 'DE0006', 235400, 1, 235400);

--
-- Triggers `detail_barangkeluar`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok_barangkeluar` AFTER INSERT ON `detail_barangkeluar` FOR EACH ROW UPDATE
barang
SET
brgstok = brgstok - new.detjumlah WHERE brgkode = new.detbrgkode
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah_stok_barangkeluar` AFTER DELETE ON `detail_barangkeluar` FOR EACH ROW UPDATE
barang
SET
brgstok = brgstok + old.detjumlah WHERE brgkode = old.detbrgkode
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_barangkeluar` AFTER UPDATE ON `detail_barangkeluar` FOR EACH ROW UPDATE
barang
SET
brgstok = (brgstok + old.detjumlah) - new.detjumlah WHERE brgkode = new.detbrgkode
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_barangmasuk`
--

CREATE TABLE `detail_barangmasuk` (
  `iddetail` bigint(20) NOT NULL,
  `detfaktur` char(20) DEFAULT NULL,
  `detbrgkode` char(10) DEFAULT NULL,
  `dethargamasuk` double DEFAULT NULL,
  `dethargajual` double DEFAULT NULL,
  `detjumlah` int(11) DEFAULT NULL,
  `detsubtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detail_barangmasuk`
--

INSERT INTO `detail_barangmasuk` (`iddetail`, `detfaktur`, `detbrgkode`, `dethargamasuk`, `dethargajual`, `detjumlah`, `detsubtotal`) VALUES
(8, 'DE-005', 'DE0001', 220000, 235400, 3, 660000);

--
-- Triggers `detail_barangmasuk`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok_barang` AFTER DELETE ON `detail_barangmasuk` FOR EACH ROW UPDATE
barang
SET
brgstok = brgstok - old.detjumlah WHERE brgkode = old.detbrgkode
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah_stok_barang` AFTER INSERT ON `detail_barangmasuk` FOR EACH ROW UPDATE
barang
SET
barang.brgstok = barang.brgstok + new.detjumlah WHERE barang.brgkode = new.detbrgkode
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_barang` AFTER UPDATE ON `detail_barangmasuk` FOR EACH ROW UPDATE
barang
SET
brgstok = (brgstok - old.detjumlah) + new.detjumlah WHERE brgkode = new.detbrgkode
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `katid` int(10) UNSIGNED NOT NULL,
  `katnama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`katid`, `katnama`) VALUES
(1, 'Gamis Dewasa'),
(2, 'Set Dewasa'),
(3, 'Dress Dewasa'),
(4, 'Set Anak'),
(6, 'Dress Anak');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `levelid` int(11) NOT NULL,
  `levelnama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`levelid`, `levelnama`) VALUES
(1, 'Admin'),
(2, 'Gudang');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-07-15-164457', 'App\\Database\\Migrations\\Kategori', 'default', 'App', 1657903677, 1),
(2, '2022-07-15-164613', 'App\\Database\\Migrations\\Satuan', 'default', 'App', 1657903677, 1),
(3, '2022-07-15-164647', 'App\\Database\\Migrations\\Barang', 'default', 'App', 1657903677, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `pelid` int(11) NOT NULL,
  `pelnama` varchar(100) DEFAULT NULL,
  `peltelp` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`pelid`, `pelnama`, `peltelp`) VALUES
(1, 'Sella Yuri Handayani', '081213765643'),
(3, 'Meisya Dwi Putri', '081213547899');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `satid` int(10) UNSIGNED NOT NULL,
  `satnama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`satid`, `satnama`) VALUES
(1, 'PCS');

-- --------------------------------------------------------

--
-- Table structure for table `temp_barangkeluar`
--

CREATE TABLE `temp_barangkeluar` (
  `id` bigint(20) NOT NULL,
  `detfaktur` char(20) DEFAULT NULL,
  `detbrgkode` char(10) DEFAULT NULL,
  `dethargajual` double DEFAULT NULL,
  `detjumlah` int(11) DEFAULT NULL,
  `detsubtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_barangmasuk`
--

CREATE TABLE `temp_barangmasuk` (
  `iddetail` bigint(20) NOT NULL,
  `detfaktur` char(20) DEFAULT NULL,
  `detbrgkode` char(10) DEFAULT NULL,
  `dethargamasuk` double DEFAULT NULL,
  `dethargajual` double DEFAULT NULL,
  `detjumlah` int(11) DEFAULT NULL,
  `detsubtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` char(50) NOT NULL,
  `usernama` varchar(100) DEFAULT NULL,
  `userpassword` varchar(100) DEFAULT NULL,
  `userlevelid` int(11) DEFAULT NULL,
  `useraktif` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `usernama`, `userpassword`, `userlevelid`, `useraktif`) VALUES
('admin', 'Prastika', '$2y$10$AeClykLFuil06oW1.vzqeueiKYTR6zkpes/K3CycjRfZCj8w6OTYW', 1, '1'),
('gudang', 'Monika', '$2y$10$AeClykLFuil06oW1.vzqeueiKYTR6zkpes/K3CycjRfZCj8w6OTYW', 2, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`brgkode`),
  ADD KEY `barang_brgkatid_foreign` (`brgkatid`),
  ADD KEY `barang_brgsatid_foreign` (`brgsatid`);

--
-- Indexes for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD PRIMARY KEY (`faktur`),
  ADD KEY `idpel` (`idpel`);

--
-- Indexes for table `barangmasuk`
--
ALTER TABLE `barangmasuk`
  ADD PRIMARY KEY (`faktur`);

--
-- Indexes for table `detail_barangkeluar`
--
ALTER TABLE `detail_barangkeluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detfaktur` (`detfaktur`),
  ADD KEY `detbrgkode` (`detbrgkode`);

--
-- Indexes for table `detail_barangmasuk`
--
ALTER TABLE `detail_barangmasuk`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `detfaktur` (`detfaktur`),
  ADD KEY `detbrgkode` (`detbrgkode`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD KEY `katid` (`katid`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`levelid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`pelid`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD KEY `satid` (`satid`);

--
-- Indexes for table `temp_barangkeluar`
--
ALTER TABLE `temp_barangkeluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_barangmasuk`
--
ALTER TABLE `temp_barangmasuk`
  ADD PRIMARY KEY (`iddetail`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `userlevelid` (`userlevelid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_barangkeluar`
--
ALTER TABLE `detail_barangkeluar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `detail_barangmasuk`
--
ALTER TABLE `detail_barangmasuk`
  MODIFY `iddetail` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `katid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `levelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `pelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `satid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `temp_barangkeluar`
--
ALTER TABLE `temp_barangkeluar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `temp_barangmasuk`
--
ALTER TABLE `temp_barangmasuk`
  MODIFY `iddetail` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_brgkatid_foreign` FOREIGN KEY (`brgkatid`) REFERENCES `kategori` (`katid`),
  ADD CONSTRAINT `barang_brgsatid_foreign` FOREIGN KEY (`brgsatid`) REFERENCES `satuan` (`satid`);

--
-- Constraints for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD CONSTRAINT `barangkeluar_ibfk_1` FOREIGN KEY (`idpel`) REFERENCES `pelanggan` (`pelid`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_barangkeluar`
--
ALTER TABLE `detail_barangkeluar`
  ADD CONSTRAINT `detail_barangkeluar_ibfk_1` FOREIGN KEY (`detbrgkode`) REFERENCES `barang` (`brgkode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_barangkeluar_ibfk_2` FOREIGN KEY (`detfaktur`) REFERENCES `barangkeluar` (`faktur`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_barangmasuk`
--
ALTER TABLE `detail_barangmasuk`
  ADD CONSTRAINT `detail_barangmasuk_ibfk_1` FOREIGN KEY (`detfaktur`) REFERENCES `barangmasuk` (`faktur`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_barangmasuk_ibfk_2` FOREIGN KEY (`detbrgkode`) REFERENCES `barang` (`brgkode`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userlevelid`) REFERENCES `levels` (`levelid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
