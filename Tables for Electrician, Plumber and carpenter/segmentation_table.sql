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
  `segmentation_type_name` varchar(45) NOT NULL,
  `sc_id` int(11) NOT NULL,
  PRIMARY KEY (`segmentation_type_id`),
  UNIQUE KEY `segmentation_type_id_UNIQUE` (`segmentation_type_id`),
  KEY `sc_id_idx` (`sc_id`),
  CONSTRAINT `sc_id` FOREIGN KEY (`sc_id`) REFERENCES `sub_category_table` (`sc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmentation_table`
--

LOCK TABLES `segmentation_table` WRITE;
/*!40000 ALTER TABLE `segmentation_table` DISABLE KEYS */;
INSERT INTO `segmentation_table` VALUES (11111,'Switch & Socket',11),(11112,'Fan',11),(11113,'Light',11),(11114,'Wiring',11),(11115,'Door Bell',11),(11116,'MCB & Fuse',11),(11117,'Inverter & Stabilizer',11),(11118,'Appliance',11),(11119,'Bath Fitting',12),(11120,'Basin & Sink',12),(11121,'Grouting',12),(11122,'Water Filter',12),(11123,'Drainage Pipes',12),(11124,'Toilet',12),(11125,'Tap & Mixer',12),(11126,'Water Tank',12),(11127,'Motor',12),(11128,'Water Pipe Connections',12),(11129,'Balcony',13),(11130,'Bed',13),(11131,'Cupboard & Drawer',13),(11132,'Door',13),(11133,'Drill & Hang',13),(11134,'Furniture Repair',13),(11135,'Window & Curtain',13),(11136,'AC Super Saver Pack',15),(11137,'AC Service',15),(11138,'AC Repair & Gas Refill',15),(11139,'AC Install & Uninstall',15),(11140,'Basic/Wall Mounted Chimney',16),(11141,'Island Chimney',16),(11142,'Microwave Repair',17),(11143,'Single door',18),(11144,'Double door',18),(11145,'Side-by-side door',18),(11146,'Water Purifier Service',19),(11147,'Water Purifier Repair',19),(11148,'Water Purifier Installation/Uninstallation',19),(11149,'Washing Machine Repair',20),(11150,'Washing Machine Installation',20),(11151,'Washing Machine Uninstallation',20),(11152,'Bathroom Cleaning',21),(11153,'Kitchen Cleaning',21),(11154,'Mini Services',21),(11155,'Furnished Apartment',22),(11156,'Unfinished Apartment',22),(11157,'Book by room',22),(11158,'Furnished Bungalow',22),(11159,'Unfinished Bungalow',22),(11160,'Mini Services',22),(11161,'Sofa Cleaning',23),(11162,'Carpet Cleaning',23),(11163,'Mini Services',23),(11164,'Hair styling',24),(11165,'Hair spa',24),(11166,'Head massage',25),(11167,'Foot massage',25),(11168,'Body massage',25),(11169,'Facial',26),(11170,'Waxing',27),(11171,'Pedicure',27),(11172,'Manicure',27);
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

-- Dump completed on 2024-06-16  8:41:06
