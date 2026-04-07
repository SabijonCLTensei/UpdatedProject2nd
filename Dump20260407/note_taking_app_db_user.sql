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
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'yettie','RESERVED','admin@dev.local','Master Developer','2026-04-06 17:01:57'),(2,'joe','45e03bb3c816a0c38af6a25192694092','joemama@example.com','joe mama','2026-04-06 17:11:03'),(4,'alex21','45e03bb3c816a0c38af6a25192694092','alex21@email.com','Alex Ramirez','2026-04-06 17:34:00'),(5,'maria_dev','45e03bb3c816a0c38af6a25192694092','maria.dev@email.com','Maria Santos','2026-04-06 17:34:00'),(6,'john_writer','45e03bb3c816a0c38af6a25192694092','john.writer@email.com','John Cruz','2026-04-06 17:34:00'),(7,'lisa_notes','45e03bb3c816a0c38af6a25192694092','lisa.notes@email.com','Lisa Mendoza','2026-04-06 17:34:00'),(8,'kevin_dev','45e03bb3c816a0c38af6a25192694092','kevin.dev@email.com','Kevin Tan','2026-04-06 17:34:00'),(9,'sarah_blog','45e03bb3c816a0c38af6a25192694092','sarah.blog@email.com','Sarah Lim','2026-04-06 17:34:00'),(10,'dan_codes','45e03bb3c816a0c38af6a25192694092','dan.codes@email.com','Dan Flores','2026-04-06 17:34:00'),(11,'nina_study','45e03bb3c816a0c38af6a25192694092','nina.study@email.com','Nina Reyes','2026-04-06 17:34:00'),(12,'paul_tasks','45e03bb3c816a0c38af6a25192694092','paul.tasks@email.com','Paul Garcia','2026-04-06 17:34:00'),(13,'anna_daily','45e03bb3c816a0c38af6a25192694092','anna.daily@email.com','Anna Lopez','2026-04-06 17:34:00'),(14,'mark_builder','45e03bb3c816a0c38af6a25192694092','mark.builder@email.com','Mark Bautista','2026-04-06 17:34:00'),(15,'ella_design','45e03bb3c816a0c38af6a25192694092','ella.design@email.com','Ella Navarro','2026-04-06 17:34:00'),(16,'ryan_debug','45e03bb3c816a0c38af6a25192694092','ryan.debug@email.com','Ryan Castillo','2026-04-06 17:34:00'),(17,'luke_writer','45e03bb3c816a0c38af6a25192694092','luke.writer@email.com','Luke Dela Cruz','2026-04-06 17:34:00'),(18,'maya_notes','45e03bb3c816a0c38af6a25192694092','maya.notes@email.com','Maya Ramos','2026-04-06 17:34:00'),(19,'jake_project','45e03bb3c816a0c38af6a25192694092','jake.project@email.com','Jake Fernandez','2026-04-06 17:34:00'),(20,'sofia_plan','45e03bb3c816a0c38af6a25192694092','sofia.plan@email.com','Sofia Alvarez','2026-04-06 17:34:00'),(21,'leo_tasks','45e03bb3c816a0c38af6a25192694092','leo.tasks@email.com','Leo Mendoza','2026-04-06 17:34:00'),(22,'claire_read','45e03bb3c816a0c38af6a25192694092','claire.read@email.com','Claire Torres','2026-04-06 17:34:00'),(23,'ivan_logic','45e03bb3c816a0c38af6a25192694092','ivan.logic@email.com','Ivan Reyes','2026-04-06 17:34:00'),(24,'oliver_dev','45e03bb3c816a0c38af6a25192694092','oliver.dev@email.com','Oliver Santos','2026-04-06 17:34:00'),(25,'emma_writer','45e03bb3c816a0c38af6a25192694092','emma.writer@email.com','Emma Flores','2026-04-06 17:34:00'),(26,'noah_build','45e03bb3c816a0c38af6a25192694092','noah.build@email.com','Noah Navarro','2026-04-06 17:34:00'),(27,'ava_notes','45e03bb3c816a0c38af6a25192694092','ava.notes@email.com','Ava Cruz','2026-04-06 17:34:00'),(28,'liam_tasks','45e03bb3c816a0c38af6a25192694092','liam.tasks@email.com','Liam Ramos','2026-04-06 17:34:00'),(29,'mia_daily','45e03bb3c816a0c38af6a25192694092','mia.daily@email.com','Mia Castillo','2026-04-06 17:34:00'),(30,'ethan_logic','45e03bb3c816a0c38af6a25192694092','ethan.logic@email.com','Ethan Torres','2026-04-06 17:34:00'),(31,'lucas_code','45e03bb3c816a0c38af6a25192694092','lucas.code@email.com','Lucas Bautista','2026-04-06 17:34:00'),(32,'amelia_study','45e03bb3c816a0c38af6a25192694092','amelia.study@email.com','Amelia Garcia','2026-04-06 17:34:00'),(33,'harper_plan','45e03bb3c816a0c38af6a25192694092','harper.plan@email.com','Harper Lopez','2026-04-06 17:34:00'),(34,'jack_builder','45e03bb3c816a0c38af6a25192694092','jack.builder@email.com','Jack Mendoza','2026-04-06 17:34:00'),(35,'grace_notes','45e03bb3c816a0c38af6a25192694092','grace.notes@email.com','Grace Reyes','2026-04-06 17:34:00'),(36,'henry_debug','45e03bb3c816a0c38af6a25192694092','henry.debug@email.com','Henry Navarro','2026-04-06 17:34:00'),(37,'victoria_read','45e03bb3c816a0c38af6a25192694092','victoria.read@email.com','Victoria Santos','2026-04-06 17:34:00'),(38,'daniel_tasks','45e03bb3c816a0c38af6a25192694092','daniel.tasks@email.com','Daniel Flores','2026-04-06 17:34:00'),(39,'scarlett_code','45e03bb3c816a0c38af6a25192694092','scarlett.code@email.com','Scarlett Cruz','2026-04-06 17:34:00'),(40,'sebastian_plan','45e03bb3c816a0c38af6a25192694092','sebastian.plan@email.com','Sebastian Ramos','2026-04-06 17:34:00'),(41,'chloe_design','45e03bb3c816a0c38af6a25192694092','chloe.design@email.com','Chloe Castillo','2026-04-06 17:34:00'),(42,'owen_project','45e03bb3c816a0c38af6a25192694092','owen.project@email.com','Owen Torres','2026-04-06 17:34:00'),(43,'zoe_daily','45e03bb3c816a0c38af6a25192694092','zoe.daily@email.com','Zoe Bautista','2026-04-06 17:34:00'),(44,'isaac_dev','45e03bb3c816a0c38af6a25192694092','isaac.dev@email.com','Isaac Garcia','2026-04-06 17:34:00'),(45,'hannah_notes','45e03bb3c816a0c38af6a25192694092','hannah.notes@email.com','Hannah Lopez','2026-04-06 17:34:00'),(46,'julian_code','45e03bb3c816a0c38af6a25192694092','julian.code@email.com','Julian Mendoza','2026-04-06 17:34:00'),(47,'nora_plan','45e03bb3c816a0c38af6a25192694092','nora.plan@email.com','Nora Reyes','2026-04-06 17:34:00'),(48,'levi_tasks','45e03bb3c816a0c38af6a25192694092','levi.tasks@email.com','Levi Navarro','2026-04-06 17:34:00'),(49,'lily_design','45e03bb3c816a0c38af6a25192694092','lily.design@email.com','Lily Santos','2026-04-06 17:34:00'),(50,'david_debug','45e03bb3c816a0c38af6a25192694092','david.debug@email.com','David Flores','2026-04-06 17:34:00'),(51,'ella_reader','45e03bb3c816a0c38af6a25192694092','ella.reader@email.com','Ella Cruz','2026-04-06 17:34:00'),(52,'logan_build','45e03bb3c816a0c38af6a25192694092','logan.build@email.com','Logan Ramos','2026-04-06 17:34:00'),(53,'aria_notes','45e03bb3c816a0c38af6a25192694092','aria.notes@email.com','Aria Castillo','2026-04-06 17:34:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
