-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 10:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` varchar(32) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `isbn`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `stok`, `id_kategori`) VALUES
(1, 637354373, 'Buku 1', 'Valentia Gaitone', 'Eelementum', '1998', 3, 1),
(2, 931995533, 'Buku 2', 'Mandie Werndley', 'Erlangga', '2001', 2, 4),
(3, 495161673, 'Buku 3', 'June Eskriet', 'Gramedia', '2000', 4, 2),
(4, 553150542, 'Buku 4', 'Darby Allsepp', 'Pustaka Bintang', '2007', 1, 5),
(5, 543885874, 'Buku 5', 'Abdul Majid', 'Kenanga Pustaka', '2010', 6, 3),
(6, 543899974, 'Buku 6', 'Budi Setiadi', 'Erlangga Bintang', '2003', 2, 5),
(7, 123885874, 'Buku 7', 'Kamal Muara', 'Hisana Karya', '2010', 8, 1),
(8, 543785824, 'Buku 8', 'Jia Fauziah', 'Gemilang Fajar', '2013', 4, 2),
(9, 54111114, 'Buku 9', 'Fajar Kuntjoro', 'Fajar Pustaka', '2020', 5, 4),
(10, 596285874, 'Buku 10', 'Maisaroh', 'Erlangga', '2020', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Kategori 1'),
(2, 'Kategori 2'),
(3, 'Kategori 3'),
(4, 'Kategori 4'),
(5, 'Kategori 5');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_buku`
--

CREATE TABLE `pinjam_buku` (
  `id` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `no_ktp_user` bigint(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `batas_pinjam` date NOT NULL,
  `denda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pinjam_buku`
--

INSERT INTO `pinjam_buku` (`id`, `id_buku`, `no_ktp_user`, `tgl_pinjam`, `tgl_kembali`, `batas_pinjam`, `denda`) VALUES
(1, 1, 3276052010980001, '2022-12-27', '2023-01-01', '2023-01-03', NULL),
(2, 2, 3276052010980001, '2022-12-20', '2022-12-23', '2022-12-27', NULL),
(3, 3, 3276052010980001, '2022-12-17', '2022-12-20', '2022-12-24', NULL),
(4, 4, 3276055108010005, '2022-05-10', '2022-05-12', '2022-05-17', NULL),
(5, 5, 3276055108010005, '2022-11-14', '2022-11-18', '2022-11-21', NULL),
(6, 6, 3276055108010005, '2022-04-12', '2022-04-18', '2022-04-19', NULL),
(7, 7, 3276050403020005, '2022-12-21', '2023-01-02', '2022-12-28', 5000),
(8, 8, 3276050403020005, '2022-11-08', '2022-11-10', '2022-11-15', NULL),
(9, 9, 3276050403020005, '2022-09-06', '2022-09-12', '2022-09-13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `no_ktp` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `no_ktp`, `nama`, `email`, `no_hp`, `alamat`) VALUES
(3, 3276050403020005, 'User 3', 'user3@gmail.com', '085988774632', 'Tangerang'),
(4, 3276051008010001, 'User 4', 'user4@gmail.com', '081233554477', 'Bekasi'),
(5, 3276051012010001, 'User 5', 'user5@gmail.com', '085973648202', 'Bogor'),
(1, 3276052010980001, 'User 1', 'user1@gmail.com', '081211002121', 'Depok'),
(2, 3276055108010005, 'User 2', 'user2@gmail.com', '085710104455', 'Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pinjam_buku`
--
ALTER TABLE `pinjam_buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `no_ktp_user` (`no_ktp_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`no_ktp`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `no_ktp` (`no_ktp`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`);

--
-- Constraints for table `pinjam_buku`
--
ALTER TABLE `pinjam_buku`
  ADD CONSTRAINT `pinjam_buku_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id`),
  ADD CONSTRAINT `pinjam_buku_ibfk_2` FOREIGN KEY (`no_ktp_user`) REFERENCES `users` (`no_ktp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
