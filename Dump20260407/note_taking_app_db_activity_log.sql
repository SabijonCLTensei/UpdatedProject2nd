-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: note_taking_app_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,2,'CREATE_NOTE','Created daily plan','2026-04-06 17:18:42'),(2,2,'CREATE_NOTE','Added meeting note','2026-04-06 17:18:42'),(3,2,'COMMENT','Commented on study note','2026-04-06 17:18:42'),(4,2,'UPDATE_NOTE','Updated project outline','2026-04-06 17:18:42'),(5,2,'SET_REMINDER','Reminder for bill','2026-04-06 17:18:42'),(6,2,'CREATE_NOTE','Added travel idea','2026-04-06 17:18:42'),(7,2,'ADD_TAG','Tagged note as important','2026-04-06 17:18:42'),(8,2,'COMMENT','Added reflection','2026-04-06 17:18:42'),(9,2,'UPDATE_NOTE','Edited SQL practice','2026-04-06 17:18:42'),(10,2,'CREATE_NOTE','Added coding note','2026-04-06 17:18:42'),(11,1,'CREATE_NOTE','Created daily plan','2026-04-06 17:20:22'),(12,1,'CREATE_NOTE','Added meeting note','2026-04-06 17:20:22'),(13,1,'COMMENT','Commented on study note','2026-04-06 17:20:22'),(14,1,'UPDATE_NOTE','Updated project outline','2026-04-06 17:20:22'),(15,1,'SET_REMINDER','Reminder for bill','2026-04-06 17:20:22'),(16,1,'CREATE_NOTE','Added travel idea','2026-04-06 17:20:22'),(17,1,'ADD_TAG','Tagged note as important','2026-04-06 17:20:22'),(18,1,'COMMENT','Added reflection','2026-04-06 17:20:22'),(19,1,'UPDATE_NOTE','Edited SQL practice','2026-04-06 17:20:22'),(20,1,'CREATE_NOTE','Added coding note','2026-04-06 17:20:22'),(21,1,'CREATE_CATEGORY','Created category: fsafaw','2026-04-06 17:40:55'),(22,1,'CREATE_CATEGORY','Created category: hahahaha','2026-04-06 17:41:01'),(23,1,'CREATE_NOTE','Created note: sgsg','2026-04-06 17:41:13');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-07 16:15:35
