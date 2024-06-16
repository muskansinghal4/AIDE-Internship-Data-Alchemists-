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
-- Table structure for table `warranty_table`
--

DROP TABLE IF EXISTS `warranty_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warranty_table` (
  `warranty_id` int(11) NOT NULL AUTO_INCREMENT,
  `warranty_name` varchar(100) NOT NULL,
  `warranty_duration` int(11) NOT NULL,
  `warranty_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`warranty_id`),
  UNIQUE KEY `warranty_id_UNIQUE` (`warranty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11111117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranty_table`
--

LOCK TABLES `warranty_table` WRITE;
/*!40000 ALTER TABLE `warranty_table` DISABLE KEYS */;
INSERT INTO `warranty_table` VALUES (11111111,'Basic Warranty',30,'Covers basic repairs and maintenance for 30 days on electrical appliances.'),(11111112,'Standard Warranty',45,'Includes extended supoort and parts replacement for 45 days.'),(11111113,'Premium Warranty',60,'Provides comprehensive coverage for 60 days.'),(11111114,'Gold Warranty',90,'Includes priority services and free check-ups(in case of problem) for 90 days.'),(11111115,'Platinum Warranty',120,'Includes free replacement of major parts for 120 days.'),(11111116,'Diamond Warranty',180,'Includes free repairs and replacement of major parts for 180 days.');
/*!40000 ALTER TABLE `warranty_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16  8:43:36
