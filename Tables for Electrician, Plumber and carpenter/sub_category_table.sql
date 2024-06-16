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
-- Table structure for table `sub_category_table`
--

DROP TABLE IF EXISTS `sub_category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category_table` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(100) NOT NULL,
  `mc_id` int(11) NOT NULL,
  PRIMARY KEY (`sc_id`),
  UNIQUE KEY `sc_id_UNIQUE` (`sc_id`),
  UNIQUE KEY `sc_name_UNIQUE` (`sc_name`),
  KEY `mc_id_idx` (`mc_id`),
  CONSTRAINT `fk_mc_id` FOREIGN KEY (`mc_id`) REFERENCES `major_category_table` (`mc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT=' ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category_table`
--

LOCK TABLES `sub_category_table` WRITE;
/*!40000 ALTER TABLE `sub_category_table` DISABLE KEYS */;
INSERT INTO `sub_category_table` VALUES (11,'Electrician',4),(12,'Plumber',4),(13,'Carpenter',4),(15,'AC Repair & Service',2),(16,'Chimney Repair',2),(17,'Microwave Repair',2),(18,'Refrigerator Repair',2),(19,'Water Purifier',2),(20,'Washing Machine Repair',2),(21,'Bathroom & Kitchen Cleaning',3),(22,'Full Home Cleaning',3),(23,'Sofa & Carpet Cleaning',3),(24,'Hair',1),(25,'Massage',1),(26,'Facial',1),(27,'Grooming',1);
/*!40000 ALTER TABLE `sub_category_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16  8:41:45
