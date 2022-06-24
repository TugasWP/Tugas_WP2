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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_barang: ~2 rows (approximately)
REPLACE INTO `tbl_barang` (`id_barang`, `kode_barang`, `nama_barang`, `harga_barang`, `satuan`, `id_operator`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '001', 'Marlboro', 10000, 'Pcs', 1, '2022-06-15 19:05:54', '2022-06-15 19:05:54', '2022-06-22 00:08:07'),
	(2, '002', 'LA', 12000, 'Pcs', 1, '2022-06-15 21:10:43', '2022-06-15 21:10:43', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_barang_keluar: ~1 rows (approximately)
REPLACE INTO `tbl_barang_keluar` (`id_barang_keluar`, `qty_keluar`, `id_barang`, `id_operator`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4, 12, 1, 1, '2022-06-21 23:44:56', '2022-06-21 23:44:56', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_barang_masuk: ~2 rows (approximately)
REPLACE INTO `tbl_barang_masuk` (`id_barang_masuk`, `qty_masuk`, `id_barang`, `id_operator`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4, 200, 2, 1, '2022-06-21 23:58:19', '2022-06-21 23:58:19', '2022-06-22 00:02:48'),
	(5, 12, 2, 1, '2022-06-22 00:40:41', '2022-06-22 00:40:41', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table wpa_inventory.tbl_operator: ~2 rows (approximately)
REPLACE INTO `tbl_operator` (`id_operator`, `nama_operator`, `username`, `password`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'ucup', 'hlukma12', 'hellowq', 'surucup@gmail.com', '2022-06-16 15:19:07', '2022-06-16 15:19:07', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
