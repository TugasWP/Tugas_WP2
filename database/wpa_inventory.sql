-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table wpa_inventory.tbl_barang
DROP TABLE IF EXISTS `tbl_barang`;
CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(8) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `satuan` enum('Pcs','Unit','Box') DEFAULT 'Pcs',
  `id_operator` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_barang: ~3 rows (approximately)
REPLACE INTO `tbl_barang` (`id_barang`, `kode_barang`, `nama_barang`, `harga_barang`, `satuan`, `id_operator`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(7, '001', 'boneka', 25000, 'Pcs', 1, '2022-07-27 18:34:57', '2022-07-27 18:34:57', NULL),
	(8, '002', 'wafer', 15000, 'Pcs', 1, '2022-07-27 18:35:27', '2022-07-27 18:35:27', NULL),
	(9, '003', 'penggaris', 5000, 'Pcs', 1, '2022-07-27 18:35:54', '2022-07-27 18:35:54', NULL);

-- Dumping structure for table wpa_inventory.tbl_barang_keluar
DROP TABLE IF EXISTS `tbl_barang_keluar`;
CREATE TABLE IF NOT EXISTS `tbl_barang_keluar` (
  `id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `qty_keluar` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_operator` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_barang_keluar`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_barang_keluar: ~5 rows (approximately)
REPLACE INTO `tbl_barang_keluar` (`id_barang_keluar`, `qty_keluar`, `id_barang`, `id_operator`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(9, 50, 7, 1, '2022-07-27 18:37:57', '2022-07-27 18:37:57', NULL),
	(10, 30, 8, 1, '2022-07-27 18:45:09', '2022-07-27 18:45:09', NULL),
	(11, 23, 7, 1, '2022-07-27 18:51:45', '2022-07-27 18:51:45', NULL),
	(12, 200, 9, 1, '2022-08-28 17:53:06', '2022-08-28 17:53:06', NULL),
	(13, 50, 9, 1, '2022-09-28 19:03:13', '2022-09-28 19:03:13', NULL);

-- Dumping structure for table wpa_inventory.tbl_barang_masuk
DROP TABLE IF EXISTS `tbl_barang_masuk`;
CREATE TABLE IF NOT EXISTS `tbl_barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT,
  `qty_masuk` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_operator` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_barang_masuk`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_barang_masuk: ~5 rows (approximately)
REPLACE INTO `tbl_barang_masuk` (`id_barang_masuk`, `qty_masuk`, `id_barang`, `id_operator`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(7, 100, 7, 1, '2022-07-27 18:37:04', '2022-07-27 18:37:04', NULL),
	(8, 200, 8, 1, '2022-07-27 18:37:14', '2022-07-27 18:37:14', NULL),
	(9, 50, 9, 1, '2022-07-27 18:37:26', '2022-07-27 18:37:26', NULL),
	(10, 200, 9, 1, '2022-08-28 19:03:01', '2022-08-28 19:03:01', NULL),
	(11, 30, 7, 1, '2022-09-28 19:03:42', '2022-09-28 19:03:42', NULL);

-- Dumping structure for table wpa_inventory.tbl_operator
DROP TABLE IF EXISTS `tbl_operator`;
CREATE TABLE IF NOT EXISTS `tbl_operator` (
  `id_operator` int(11) NOT NULL AUTO_INCREMENT,
  `nama_operator` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_operator`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_operator: ~1 rows (approximately)
REPLACE INTO `tbl_operator` (`id_operator`, `nama_operator`, `username`, `password`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'ucup', 'ucup12', 'hellowq', 'surucup@gmail.com', '2022-06-16 15:19:07', '2022-06-16 15:19:07', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
