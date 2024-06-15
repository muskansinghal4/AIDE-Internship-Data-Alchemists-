CREATE DATABASE  IF NOT EXISTS `group-project-1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `group-project-1`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: group-project-1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `segmentation_table`
--

DROP TABLE IF EXISTS `segmentation_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmentation_table` (
  `segmentation_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `segmentation_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`segmentation_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmentation_table`
--

LOCK TABLES `segmentation_table` WRITE;
/*!40000 ALTER TABLE `segmentation_table` DISABLE KEYS */;
INSERT INTO `segmentation_table` VALUES (11111,'Switch & Socket'),(11112,'Fan'),(11113,'Light'),(11114,'Wiring'),(11115,'Door Bell'),(11116,'MCB & Fuse'),(11117,'Inverter & Stabilizer'),(11118,'Appliance'),(11119,'Bath Fitting'),(11120,'Basin & Sink'),(11121,'Grouting'),(11122,'Water Filter'),(11123,'Drainage Pipes'),(11124,'Toilet'),(11125,'Tap & Mixer'),(11126,'Water Tank'),(11127,'Motor'),(11128,'Water Pipe Connections'),(11129,'Balcony'),(11130,'Bed'),(11131,'Cupboard & Drawer'),(11132,'Door'),(11133,'Drill & Hang'),(11134,'Furniture Repair'),(11135,'Window & Curtain');
/*!40000 ALTER TABLE `segmentation_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-15 12:02:37
