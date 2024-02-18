-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for assignment_project
CREATE DATABASE IF NOT EXISTS `assignment_project` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `assignment_project`;

-- Dumping structure for table assignment_project.class_a
CREATE TABLE IF NOT EXISTS `class_a` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `nilai` decimal(10,1) DEFAULT NULL,
  `lulus` tinyint(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumping data for table assignment_project.class_a: ~41 rows (approximately)
DELETE FROM `class_a`;
/*!40000 ALTER TABLE `class_a` DISABLE KEYS */;
INSERT INTO `class_a` (`id_student`, `nama`, `umur`, `nilai`, `lulus`, `last_modified`) VALUES
	(1, 'Rizky', 17, 9.0, 1, NULL),
	(2, 'Jonah', 18, 7.0, 1, NULL),
	(3, 'Rizky', 19, 9.0, 1, NULL),
	(4, 'Jonah', 22, 4.0, 0, '2021-08-28 18:14:26'),
	(5, 'Rizky', 20, 2.0, 0, NULL),
	(6, 'Jonah', 19, 5.0, 1, '2021-08-29 01:19:13'),
	(7, 'Jonah', 19, 5.0, 1, '2021-08-29 01:23:16'),
	(8, 'Rizky', 17, 9.0, 1, '2021-08-29 01:24:58'),
	(9, 'Jonah', 17, 8.0, 1, '2021-08-29 01:25:56'),
	(10, 'Jonah', 17, 2.0, 0, '2021-08-29 01:26:15'),
	(11, 'Jonah', 20, 2.0, 0, '2021-08-29 01:31:23'),
	(12, 'Rizky', 17, 7.0, 1, '2021-08-29 01:33:55'),
	(13, 'Jonah', 19, 1.0, 0, '2021-08-29 01:40:45'),
	(14, 'Rizky', 19, 9.0, 1, '2021-08-29 01:41:45'),
	(15, 'Jonah', 17, 7.0, 1, '2021-08-29 01:42:24'),
	(16, 'Jonah', 17, 9.0, 1, '2021-08-29 01:44:50'),
	(17, 'Jonah', 17, 9.0, 1, '2021-08-29 01:46:26'),
	(18, 'Rizky', 17, 2.0, 0, '2021-08-29 01:46:57'),
	(19, 'Jonah', 17, 2.0, 0, '2021-08-29 01:48:10'),
	(20, 'Jonah', 17, 2.0, 0, '2021-08-29 01:50:04'),
	(21, 'Jonah', 17, 9.0, 1, '2021-08-29 01:51:55'),
	(22, 'Jonah', 17, 2.0, 1, '2021-08-29 02:11:47'),
	(23, 'Jonah', 17, 3.0, 0, '2021-08-29 02:18:12'),
	(24, 'Jonah', 17, 6.0, 1, '2021-08-29 02:19:13'),
	(25, 'Jonah', 17, 2.0, 1, '2021-08-29 02:22:45'),
	(26, 'Jonah', 17, 1.8, 0, '2021-08-29 02:23:24'),
	(27, 'Jonah', 17, 5.4, 0, '2021-08-29 02:49:31'),
	(28, 'Rizky', 19, 8.2, 1, '2021-08-29 04:30:36'),
	(29, 'Rizky', 19, 8.2, 1, '2021-08-29 04:31:55'),
	(30, 'Jonah', 17, 3.0, 0, '2021-08-29 04:33:34'),
	(31, 'Rizky', 17, 7.8, 1, '2021-08-29 04:33:58'),
	(32, 'Jonah', 17, 1.5, 1, '2021-08-29 04:35:15'),
	(33, 'Jonah', 17, 7.0, 1, '2021-08-29 04:36:13'),
	(34, 'Jonah', 17, 0.4, 0, '2021-08-29 04:36:27'),
	(35, 'Rizky', 17, 9.5, 1, '2021-08-29 04:36:47'),
	(36, 'Jonah', 17, 3.5, 0, '2021-08-29 04:51:38'),
	(37, 'Rizky', 17, 8.2, 1, '2021-08-29 04:52:00'),
	(38, 'Jonah', 17, 4.3, 0, '2021-08-29 07:51:03'),
	(39, 'Jonah', 17, 3.2, 0, '2021-08-29 07:57:44'),
	(40, 'Jonah', 17, 8.5, 1, '2021-08-29 07:59:22'),
	(41, 'Rizky', 19, 2.2, 0, '2021-08-29 08:17:38');
/*!40000 ALTER TABLE `class_a` ENABLE KEYS */;

-- Dumping structure for table assignment_project.class_b
CREATE TABLE IF NOT EXISTS `class_b` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `nilai` decimal(10,1) DEFAULT NULL,
  `lulus` tinyint(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table assignment_project.class_b: ~10 rows (approximately)
DELETE FROM `class_b`;
/*!40000 ALTER TABLE `class_b` DISABLE KEYS */;
INSERT INTO `class_b` (`id_student`, `nama`, `umur`, `nilai`, `lulus`, `last_modified`) VALUES
	(1, 'Jonah', 17, 3.1, 0, '2021-08-29 04:47:20'),
	(2, 'Rizky', 17, 2.0, 1, '2021-08-29 04:50:34'),
	(3, 'Rizky', 17, 3.3, 0, '2021-08-29 04:51:04'),
	(4, 'Jonah', 17, 5.6, 0, '2021-08-29 04:55:31'),
	(5, 'Rizky', 20, 7.7, 1, '2021-08-29 07:39:36'),
	(6, 'Jonah', 17, 4.3, 0, '2021-08-29 07:50:20'),
	(7, 'Jonah', 17, 8.5, 1, '2021-08-29 07:59:15'),
	(8, 'Jonah', 17, 2.6, 0, '2021-08-29 08:09:37'),
	(9, 'Jonah', 17, 4.4, 0, '2021-08-29 08:25:28'),
	(10, 'Jonah', 17, 4.4, 0, '2021-08-29 08:26:15');
/*!40000 ALTER TABLE `class_b` ENABLE KEYS */;

-- Dumping structure for table assignment_project.input_string
CREATE TABLE IF NOT EXISTS `input_string` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_string` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table assignment_project.input_string: ~24 rows (approximately)
DELETE FROM `input_string`;
/*!40000 ALTER TABLE `input_string` DISABLE KEYS */;
INSERT INTO `input_string` (`id`, `text_string`) VALUES
	(1, 'tes1'),
	(2, 'tes2'),
	(3, 'tes3'),
	(4, 'tes4'),
	(5, 'tes5'),
	(6, 'tes6'),
	(7, 'tes7'),
	(8, 'tes8'),
	(9, 'tes9'),
	(10, 'tes10'),
	(11, 'tes11'),
	(12, 'tes13'),
	(13, 'tes14'),
	(14, 'tes14'),
	(15, 'tes15'),
	(16, 'tes15'),
	(17, 'tes15'),
	(18, ''),
	(19, 'tes19'),
	(20, 'tes19'),
	(21, 'tes20'),
	(22, 'tes22'),
	(23, 'tes22'),
	(24, 'tes23');
/*!40000 ALTER TABLE `input_string` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
