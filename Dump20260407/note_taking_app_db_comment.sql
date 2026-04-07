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
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,2,'Important reminder','2026-04-06 17:12:59'),(2,2,2,'Meeting preparation needed','2026-04-06 17:12:59'),(3,3,2,'Excited for the weekend','2026-04-06 17:12:59'),(4,4,2,'Need to review more SQL','2026-04-06 17:12:59'),(5,5,2,'Interesting idea','2026-04-06 17:12:59'),(6,6,2,'Project looks promising','2026-04-06 17:12:59'),(7,7,2,'Time to stay healthy','2026-04-06 17:12:59'),(8,8,2,'Study harder for exams','2026-04-06 17:12:59'),(9,9,2,'Must pay this soon','2026-04-06 17:12:59'),(10,10,2,'Bug fixed successfully','2026-04-06 17:12:59'),(11,11,2,'Japan would be great','2026-04-06 17:12:59'),(12,12,2,'Lecture was informative','2026-04-06 17:12:59'),(13,13,2,'Remember to call','2026-04-06 17:12:59'),(14,14,2,'Client will like this','2026-04-06 17:12:59'),(15,15,2,'Cooking tonight','2026-04-06 17:12:59'),(16,16,2,'Assignment deadline approaching','2026-04-06 17:12:59'),(17,17,2,'Motivational quote','2026-04-06 17:12:59'),(18,18,2,'Sprint planning ready','2026-04-06 17:12:59'),(19,19,2,'Good reading list','2026-04-06 17:12:59'),(20,20,2,'Practice makes perfect','2026-04-06 17:12:59'),(21,21,2,'Daily reflection','2026-04-06 17:12:59'),(22,22,2,'Dark mode is cool','2026-04-06 17:12:59'),(23,23,2,'Buy gift soon','2026-04-06 17:12:59'),(24,24,2,'Indexing helps performance','2026-04-06 17:12:59'),(25,25,2,'Design looks good','2026-04-06 17:12:59'),(26,26,2,'Workflow documented','2026-04-06 17:12:59'),(27,27,2,'Movie marathon soon','2026-04-06 17:12:59'),(28,28,2,'Researching databases','2026-04-06 17:12:59'),(29,29,2,'Coffee first','2026-04-06 17:12:59'),(30,30,2,'Optimize queries','2026-04-06 17:12:59'),(31,31,2,'Learn new hobby','2026-04-06 17:12:59'),(32,32,2,'Lecture summary helpful','2026-04-06 17:12:59'),(33,33,2,'Call team soon','2026-04-06 17:12:59'),(34,34,2,'Prepare deployment','2026-04-06 17:12:59'),(35,35,2,'Stay healthy','2026-04-06 17:12:59'),(36,36,2,'Checklist ready','2026-04-06 17:12:59'),(37,37,2,'Thinking about goals','2026-04-06 17:12:59'),(38,38,2,'Documentation done','2026-04-06 17:12:59'),(39,39,2,'Fitness progress','2026-04-06 17:12:59'),(40,40,2,'Study important','2026-04-06 17:12:59'),(41,41,2,'Brainstorming ideas','2026-04-06 17:12:59'),(42,42,2,'Backend almost done','2026-04-06 17:12:59'),(43,43,2,'Family visit soon','2026-04-06 17:12:59'),(44,44,2,'Database tuning','2026-04-06 17:12:59'),(45,45,2,'Startup potential','2026-04-06 17:12:59'),(46,46,2,'Report submission','2026-04-06 17:12:59'),(47,47,2,'Dinner planning','2026-04-06 17:12:59'),(48,48,2,'Trigger practice','2026-04-06 17:12:59'),(49,49,2,'Reflection time','2026-04-06 17:12:59'),(50,50,2,'Code improvement','2026-04-06 17:12:59'),(51,1,1,'Important reminder','2026-04-06 17:16:54'),(52,2,1,'Meeting preparation needed','2026-04-06 17:16:54'),(53,3,1,'Excited for the weekend','2026-04-06 17:16:54'),(54,4,1,'Need to review more SQL','2026-04-06 17:16:54'),(55,5,1,'Interesting idea','2026-04-06 17:16:54'),(56,6,1,'Project looks promising','2026-04-06 17:16:54'),(57,7,1,'Time to stay healthy','2026-04-06 17:16:54'),(58,8,1,'Study harder for exams','2026-04-06 17:16:54'),(59,9,1,'Must pay this soon','2026-04-06 17:16:54'),(60,10,1,'Bug fixed successfully','2026-04-06 17:16:54'),(61,11,1,'Japan would be great','2026-04-06 17:16:54'),(62,12,1,'Lecture was informative','2026-04-06 17:16:54'),(63,13,1,'Remember to call','2026-04-06 17:16:54'),(64,14,1,'Client will like this','2026-04-06 17:16:54'),(65,15,1,'Cooking tonight','2026-04-06 17:16:54'),(66,16,1,'Assignment deadline approaching','2026-04-06 17:16:54'),(67,17,1,'Motivational quote','2026-04-06 17:16:54'),(68,18,1,'Sprint planning ready','2026-04-06 17:16:54'),(69,19,1,'Good reading list','2026-04-06 17:16:54'),(70,20,1,'Practice makes perfect','2026-04-06 17:16:54'),(71,21,1,'Daily reflection','2026-04-06 17:16:54'),(72,22,1,'Dark mode is cool','2026-04-06 17:16:54'),(73,23,1,'Buy gift soon','2026-04-06 17:16:54'),(74,24,1,'Indexing helps performance','2026-04-06 17:16:54'),(75,25,1,'Design looks good','2026-04-06 17:16:54'),(76,26,1,'Workflow documented','2026-04-06 17:16:54'),(77,27,1,'Movie marathon soon','2026-04-06 17:16:54'),(78,28,1,'Researching databases','2026-04-06 17:16:54'),(79,29,1,'Coffee first','2026-04-06 17:16:54'),(80,30,1,'Optimize queries','2026-04-06 17:16:54'),(81,31,1,'Learn new hobby','2026-04-06 17:16:54'),(82,32,1,'Lecture summary helpful','2026-04-06 17:16:54'),(83,33,1,'Call team soon','2026-04-06 17:16:54'),(84,34,1,'Prepare deployment','2026-04-06 17:16:54'),(85,35,1,'Stay healthy','2026-04-06 17:16:54'),(86,36,1,'Checklist ready','2026-04-06 17:16:54'),(87,37,1,'Thinking about goals','2026-04-06 17:16:54'),(88,38,1,'Documentation done','2026-04-06 17:16:54'),(89,39,1,'Fitness progress','2026-04-06 17:16:54'),(90,40,1,'Study important','2026-04-06 17:16:54'),(91,41,1,'Brainstorming ideas','2026-04-06 17:16:54'),(92,42,1,'Backend almost done','2026-04-06 17:16:54'),(93,43,1,'Family visit soon','2026-04-06 17:16:54'),(94,44,1,'Database tuning','2026-04-06 17:16:54'),(95,45,1,'Startup potential','2026-04-06 17:16:54'),(96,46,1,'Report submission','2026-04-06 17:16:54'),(97,47,1,'Dinner planning','2026-04-06 17:16:54'),(98,48,1,'Trigger practice','2026-04-06 17:16:54'),(99,49,1,'Reflection time','2026-04-06 17:16:54'),(100,50,1,'Code improvement','2026-04-06 17:16:54');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
