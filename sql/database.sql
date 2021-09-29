-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 12:38 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pajak`
--

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'pajakapikey123', 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bayar`
--

CREATE TABLE `tb_bayar` (
  `id_bayar` int(11) NOT NULL,
  `id_wp_ref` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1. Terhutang, 2. Lunas',
  `tgl_setor` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bayar`
--

INSERT INTO `tb_bayar` (`id_bayar`, `id_wp_ref`, `tgl_bayar`, `status`, `tgl_setor`) VALUES
(15, 302, '2020-01-17', '1', '2020-01-18');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `id_login` int(11) NOT NULL,
  `login_username` varchar(10) NOT NULL,
  `login_password` varchar(100) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1. Aktif, 2. Nonaktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`id_login`, `login_username`, `login_password`, `status`) VALUES
(2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rayon`
--

CREATE TABLE `tb_rayon` (
  `id_rayon` int(11) NOT NULL,
  `nama_rayon` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rayon`
--

INSERT INTO `tb_rayon` (`id_rayon`, `nama_rayon`) VALUES
(10, 'Miftachul C');

-- --------------------------------------------------------
--
-- Table structure for table `tb_setting`
--

CREATE TABLE `tb_setting` (
  `id_setting` int(11) NOT NULL DEFAULT 1,
  `kode_provinsi` varchar(5) NOT NULL,
  `nama_provinsi` varchar(100) NOT NULL,
  `kode_kabupaten` varchar(5) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `kode_kecamatan` varchar(5) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `kode_desa` varchar(5) NOT NULL,
  `nama_desa` varchar(100) NOT NULL,
  `logo_surat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Table structure for table `tb_rt`
--
-- --------------------------------------------------------

CREATE TABLE `tb_rt` (
  `id_rt` int(11) NOT NULL,
  `nama_rt` varchar(15) NOT NULL,
  `id_rayon_ref` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rt`
--

INSERT INTO `tb_rt` (`id_rt`, `nama_rt`, `id_rayon_ref`) VALUES
(9, 'RT 01', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_wp`
--

CREATE TABLE `tb_wp` (
  `id_wp` int(11) NOT NULL,
  `nomor_wp` varchar(30) NOT NULL,
  `nama_wp` varchar(100) NOT NULL,
  `id_rt_ref` int(11) DEFAULT NULL,
  `pagu_wp` varchar(10) NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1. Terhutang, 2. Lunas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_wp`
--

INSERT INTO `tb_wp` (`id_wp`, `nomor_wp`, `nama_wp`, `id_rt_ref`, `pagu_wp`, `status`) VALUES
(302, '351709000900100050', 'MARJAI B SRIATI', 9, '12300', '2'),
(304, '351709000900100000', 'Komar P Jaenal Aripin', 9, '24806', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `wp_id_wp` (`id_wp_ref`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `tb_rayon`
--
ALTER TABLE `tb_rayon`
  ADD PRIMARY KEY (`id_rayon`);

--
-- Indexes for table `tb_rt`
--
ALTER TABLE `tb_rt`
  ADD PRIMARY KEY (`id_rt`),
  ADD KEY `nama_rayon` (`id_rayon_ref`);

  --
-- Indexes for table `tb_setting`
--
ALTER TABLE `tb_setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `tb_wp`
--
ALTER TABLE `tb_wp`
  ADD PRIMARY KEY (`id_wp`),
  ADD KEY `fk_wp_rt_ref` (`id_rt_ref`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_bayar`
--
ALTER TABLE `tb_bayar`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_rayon`
--
ALTER TABLE `tb_rayon`
  MODIFY `id_rayon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_rt`
--
ALTER TABLE `tb_rt`
  MODIFY `id_rt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_wp`
--
ALTER TABLE `tb_wp`
  MODIFY `id_wp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_bayar`
--
ALTER TABLE `tb_bayar`
  ADD CONSTRAINT `tb_bayar_ibfk_1` FOREIGN KEY (`id_wp_ref`) REFERENCES `tb_wp` (`id_wp`);

--
-- Constraints for table `tb_rt`
--
ALTER TABLE `tb_rt`
  ADD CONSTRAINT `fk_rt_rayon_ref` FOREIGN KEY (`id_rayon_ref`) REFERENCES `tb_rayon` (`id_rayon`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_wp`
--
ALTER TABLE `tb_wp`
  ADD CONSTRAINT `fk_wp_rt_ref` FOREIGN KEY (`id_rt_ref`) REFERENCES `tb_rt` (`id_rt`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
