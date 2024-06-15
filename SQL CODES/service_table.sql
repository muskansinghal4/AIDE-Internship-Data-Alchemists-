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
-- Table structure for table `service_table`
--

DROP TABLE IF EXISTS `service_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_table` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `service_duration` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `segmentation_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `package_id_idx` (`package_id`),
  KEY `segmentation_type_id_idx` (`segmentation_type_id`),
  CONSTRAINT `fk_package_id` FOREIGN KEY (`package_id`) REFERENCES `package_table` (`package_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_segmentation_type_id` FOREIGN KEY (`segmentation_type_id`) REFERENCES `segmentation_table` (`segmentation_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_table`
--

LOCK TABLES `service_table` WRITE;
/*!40000 ALTER TABLE `service_table` DISABLE KEYS */;
INSERT INTO `service_table` VALUES (1111,'package',111,239,30,NULL,11111),(1112,'package',112,49,10,NULL,11111),(1113,'package',113,249,30,NULL,11111),(1114,'package',114,169,30,NULL,11111),(1115,'package',115,79,30,NULL,11111),(1116,'package',116,119,15,NULL,11111),(1117,'package',117,179,15,NULL,11111),(1118,'package',118,179,15,NULL,11111),(1119,'package',119,89,30,NULL,11112),(1120,'package',120,69,30,NULL,11112),(1121,'package',121,319,60,NULL,11112),(1122,'package',122,99,10,NULL,11112),(1123,'package',123,89,30,NULL,11112),(1124,'package',124,149,60,NULL,11112),(1125,'package',125,109,30,NULL,11112),(1126,'package',126,49,30,NULL,11112),(1127,'package',127,129,30,NULL,11113),(1128,'package',128,69,30,NULL,11113),(1129,'package',129,99,30,NULL,11113),(1130,'package',130,69,90,NULL,11113),(1131,'package',131,69,20,NULL,11113),(1132,'package',132,129,20,NULL,11113),(1133,'Lighting upto 10 meters wiring',133,159,30,NULL,11113),(1134,'Lighting upto 15 meters wiring',133,209,30,NULL,11113),(1135,'Lighting upto 5 meters wiring',133,89,30,NULL,11113),(1136,'package',134,99,30,NULL,11113),(1137,'package',135,99,30,NULL,11113),(1138,'Up to 6 bulbs',136,549,60,NULL,11113),(1139,'More than 6 bulbs',136,1099,90,NULL,11113),(1140,'package',137,89,30,NULL,11114),(1141,'package',138,209,60,NULL,11114),(1142,'package',139,159,60,NULL,11114),(1143,'package',140,79,30,NULL,11115),(1144,'package',141,59,30,NULL,11115),(1145,'package',142,79,30,NULL,11116),(1146,'package',143,219,60,NULL,11116),(1147,'package',144,149,60,NULL,11116),(1148,'package',145,249,30,NULL,11116),(1149,'package',146,99,60,NULL,11116),(1150,'package',147,99,60,NULL,11117),(1151,'Single battery inverter servicing',148,139,30,NULL,11117),(1152,'Double battery inverter servicing New',148,309,30,NULL,11117),(1153,'Single Battery',149,369,90,NULL,11117),(1154,'Double Battery',149,449,90,NULL,11117),(1155,'package',150,119,30,NULL,11117),(1156,'package',151,399,60,NULL,11118),(1157,'TV installation (up to 48 inches)',152,379,30,NULL,11118),(1158,'TV installation (48-55 inches)',152,499,45,NULL,11118),(1159,'TV installation (55-70 inches)',152,599,45,NULL,11118),(1161,'package',153,139,30,NULL,11118),(1162,'package',154,229,30,NULL,11118),(1163,'package',155,219,60,NULL,11118),(1164,'package',156,549,45,NULL,11118),(1165,'No grinding, no motor sound',157,210,60,NULL,11118),(1166,'Burning smell/smoke',157,210,60,NULL,11118),(1167,'Not sure of the issur',157,210,60,NULL,11118),(1168,'Noise issue',157,210,60,NULL,11118),(1169,'No grinding, motor sound',157,210,60,NULL,11118),(1170,'Water leakage',157,210,60,NULL,11118),(1171,'package',158,239,90,NULL,11118),(1172,'package',159,750,90,NULL,11118),(1173,'package',160,69,30,NULL,11119),(1174,'Shower(Ceiling Mounted)',161,119,30,NULL,11119),(1175,'Shower(Wall mounted/Hand Held)',161,89,30,NULL,11119),(1176,'package',162,349,60,NULL,11120),(1177,'package',163,89,90,NULL,11120),(1178,'package',164,119,30,NULL,11120),(1179,'package',165,1299,120,NULL,11121),(1180,'package',166,879,60,NULL,11121),(1181,'package',167,79,10,NULL,11122),(1182,'package',168,129,10,NULL,11122),(1183,'package',169,299,120,NULL,11123),(1184,'package',170,99,30,NULL,11123),(1185,'package',171,189,30,NULL,11123),(1186,'package',172,79,30,NULL,11124),(1187,'package',173,99,60,NULL,11124),(1188,'package',174,569,90,NULL,11124),(1189,'package',175,1099,130,NULL,11124),(1190,'package',176,79,90,NULL,11124),(1191,'Floor Mounted Western Toilet(Replacement)',177,1499,90,NULL,11124),(1192,'Wall Mounted Western Toilet(Replacement)',177,1799,120,NULL,11124),(1193,'package',178,1499,150,NULL,11124),(1194,'package',179,409,60,NULL,11124),(1195,'Floor mounted westren toilet(installation)',180,1349,120,NULL,11124),(1196,'wall mounted western toilet(installation)',180,1599,120,NULL,11124),(1197,'package',181,69,10,NULL,11125),(1198,'package',182,49,5,NULL,11125),(1199,'Basin/Kitchen Hot & Cold water mixer',183,349,40,NULL,11125),(1200,'Bath Hot & Cold water mixer installation',183,329,40,NULL,11125),(1201,'package',184,59,10,NULL,11125),(1202,'package',185,179,25,NULL,11125),(1203,'package',186,49,5,NULL,11125),(1204,'Water tank pipeline repair',187,309,90,NULL,11126),(1205,'Water overflow repair',187,169,60,NULL,11126),(1206,'Overhead Tank upto 500L (Installation)',188,499,90,NULL,11126),(1207,'Overhead Tank upto 500L-2000L (Installation)',188,1049,90,NULL,11126),(1208,'package',189,199,90,NULL,11126),(1209,'package',190,299,60,NULL,11126),(1210,'package',191,99,90,NULL,11127),(1211,'package',192,349,60,NULL,11127),(1212,'package',193,429,90,NULL,11127),(1213,'package',194,89,30,NULL,11128),(1214,'package',195,79,30,NULL,11128),(1215,'package',196,399,90,NULL,11129),(1216,'package',197,139,30,NULL,11129),(1217,'package',198,319,60,NULL,11130),(1218,'package',199,199,60,NULL,11130),(1219,'package',200,129,30,NULL,11131),(1220,'package',201,109,30,NULL,11131),(1221,'package',202,149,30,NULL,11131),(1222,'package',203,49,30,NULL,11131),(1223,'package',204,249,30,NULL,11131),(1224,'package',205,89,30,NULL,11131),(1225,'package',206,139,30,NULL,11131),(1226,'package',207,79,30,NULL,11132),(1227,'package',208,99,30,NULL,11132),(1228,'package',209,549,150,NULL,11132),(1229,'package',210,199,30,NULL,11132),(1230,'package',211,129,30,NULL,11132),(1231,'package',212,199,30,NULL,11132),(1232,'package',213,239,60,NULL,11132),(1233,'package',214,399,60,NULL,11132),(1234,'package',215,319,30,NULL,11132),(1235,'package',216,149,90,NULL,11132),(1236,'package',217,329,60,NULL,11132),(1237,'package',218,209,60,NULL,11132),(1238,'package',219,179,30,NULL,11132),(1239,'package',220,349,90,NULL,11132),(1240,'package',221,269,60,NULL,11132),(1241,'package',222,69,30,NULL,11133),(1242,'package',223,49,10,NULL,11133),(1243,'package',224,79,30,NULL,11133),(1244,'package',225,89,30,NULL,11133),(1245,'package',226,179,60,NULL,11133),(1246,'package',227,299,30,NULL,11133),(1247,'package',228,299,30,NULL,11133),(1248,'package',229,699,30,NULL,11133),(1249,'package',230,79,30,NULL,11134),(1250,'package',231,89,30,NULL,11134),(1251,'package',232,49,30,NULL,11134),(1252,'package',233,69,60,NULL,11135),(1253,'package',234,129,30,NULL,11135),(1254,'package',235,139,30,NULL,11135),(1255,'package',236,209,30,NULL,11135),(1256,'package',237,159,30,NULL,11135),(1257,'package',238,269,90,NULL,11135),(1258,'package',239,139,90,NULL,11135),(1259,'package',240,169,30,NULL,11135);
/*!40000 ALTER TABLE `service_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-15 12:02:51
