CREATE DATABASE  IF NOT EXISTS `studying_registration_management` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `studying_registration_management`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: studying_registration_management
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblsinhvienkhoa`
--

DROP TABLE IF EXISTS `tblsinhvienkhoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `tblsinhvienkhoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nienkhoa` varchar(255) NOT NULL,
  `tblSinhVienId` int(11) NOT NULL,
  `tblKhoaId` int(11) NOT NULL,
  `danghoc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sinhvienkhoa_khoa` (`tblKhoaId`),
  KEY `fk_sinhvienkhoa_sinhvien` (`tblSinhVienId`),
  CONSTRAINT `fk_sinhvienkhoa_khoa` FOREIGN KEY (`tblKhoaId`) REFERENCES `tblkhoa` (`id`),
  CONSTRAINT `fk_sinhvienkhoa_sinhvien` FOREIGN KEY (`tblSinhVienId`) REFERENCES `tblsinhvien` (`tblthanhvienid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsinhvienkhoa`
--

LOCK TABLES `tblsinhvienkhoa` WRITE;
/*!40000 ALTER TABLE `tblsinhvienkhoa` DISABLE KEYS */;
INSERT INTO `tblsinhvienkhoa` VALUES (1,'2018-2022',1,1,1);
/*!40000 ALTER TABLE `tblsinhvienkhoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-26 15:50:05
