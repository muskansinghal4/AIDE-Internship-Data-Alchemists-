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
-- Table structure for table `user_bookings`
--

DROP TABLE IF EXISTS `user_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bookings` (
  `user_email` varchar(100) NOT NULL,
  `slot_date` varchar(20) NOT NULL,
  `slot_time` varchar(20) NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `location` varchar(200) NOT NULL,
  `tech_id` int(11) DEFAULT NULL,
  `service_status` varchar(45) NOT NULL,
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`),
  KEY `user_email_idx` (`user_email`),
  KEY `tech_id_idx` (`tech_id`),
  KEY `offer_id_idx` (`offer_id`),
  KEY `user_email_idx_new` (`user_email`),
  KEY `tech_id_idx_new` (`tech_id`),
  KEY `offer_id_idx_new` (`offer_id`),
  CONSTRAINT `fk_new_table_offer_id_new` FOREIGN KEY (`offer_id`) REFERENCES `offers_table` (`offer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_new_table_tech_id_new` FOREIGN KEY (`tech_id`) REFERENCES `technician_table` (`tech_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_new_table_user_email_new` FOREIGN KEY (`user_email`) REFERENCES `users_table` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111111111112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bookings`
--

LOCK TABLES `user_bookings` WRITE;
/*!40000 ALTER TABLE `user_bookings` DISABLE KEYS */;
INSERT INTO `user_bookings` VALUES ('akshatgreninja@gmail.com','10','9-10',NULL,'Kanpur',NULL,'PENDING',111111111111);
/*!40000 ALTER TABLE `user_bookings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16  8:42:53
