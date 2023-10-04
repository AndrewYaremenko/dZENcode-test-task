-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: dzencode
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dzencode`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dzencode` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dzencode`;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 16:29:15','Check my text file!','1696436955_test.txt','text/plain','2023-10-04 13:29:15','2023-10-04 13:29:15'),(2,'Jhon','Jhon@examplemail.com',NULL,NULL,'2023-10-04 16:29:52','Check, it capybara!',NULL,NULL,'2023-10-04 13:29:52','2023-10-04 13:29:52'),(3,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 16:30:51','321',NULL,'1','2023-10-04 13:30:51','2023-10-04 13:30:51'),(4,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 16:31:27','321','1696437087_12.png','image','2023-10-04 13:31:26','2023-10-04 13:31:27'),(5,'321','Testmail11@spain.com',NULL,4,'2023-10-04 17:13:59','321',NULL,NULL,'2023-10-04 14:13:59','2023-10-04 14:13:59'),(6,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 17:26:01','test','1696440361_1.png','image','2023-10-04 14:26:01','2023-10-04 14:26:01'),(7,'Jhon','Jhon@examplemail.com','http://www.example.com',NULL,'2023-10-04 19:38:28','Hello!','1696448308_image.png','image','2023-10-04 16:38:28','2023-10-04 16:38:28'),(8,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 19:39:35','321',NULL,NULL,'2023-10-04 16:39:35','2023-10-04 16:39:35'),(9,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 19:39:43','321','1696448383_image(1).png','image','2023-10-04 16:39:43','2023-10-04 16:39:43'),(10,'Jhon','Testmail11@spain.com','http://www.example.com',NULL,'2023-10-04 21:40:39','321',NULL,NULL,'2023-10-04 18:40:39','2023-10-04 18:40:39'),(11,'Jhon','Testmail11@spain.com','http://www.example.com',NULL,'2023-10-04 21:40:47','321',NULL,NULL,'2023-10-04 18:40:47','2023-10-04 18:40:47'),(12,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 21:41:07','123',NULL,NULL,'2023-10-04 18:41:07','2023-10-04 18:41:07'),(13,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 21:41:19','321',NULL,NULL,'2023-10-04 18:41:19','2023-10-04 18:41:19'),(14,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 21:41:48','321','1696455708_1.png','image','2023-10-04 18:41:48','2023-10-04 18:41:48'),(15,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 21:42:45','123',NULL,NULL,'2023-10-04 18:42:45','2023-10-04 18:42:45'),(16,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 21:44:31','123','1696455871_1.png','image','2023-10-04 18:44:31','2023-10-04 18:44:31'),(17,'Jhon','Testmail11@spain.com',NULL,NULL,'2023-10-04 21:45:42','321','1696455942_12.png','image','2023-10-04 18:45:42','2023-10-04 18:45:42'),(18,'Jhontest','Testmail11@spain.com',NULL,17,'2023-10-04 21:56:16','312','1696456576_1.png','image','2023-10-04 18:56:16','2023-10-04 18:56:16'),(19,'123','123@gmail.com',NULL,17,'2023-10-04 21:57:48','321','1696456668_test.txt','text/plain','2023-10-04 18:57:48','2023-10-04 18:57:48'),(20,'test','Testmail11@spain.com',NULL,18,'2023-10-04 22:03:07','bara','1696456987_Аня.png','image','2023-10-04 19:03:07','2023-10-04 19:03:07'),(21,'еуые','Testmail11@spain.com',NULL,18,'2023-10-04 22:19:44','321','1696457984_photo_2023-09-23_21-13-37.jpg','image','2023-10-04 19:19:44','2023-10-04 19:19:44'),(22,'Jhon','Testmail11@spain.com',NULL,20,'2023-10-04 22:20:25','123','1696458025_test.txt','text/plain','2023-10-04 19:20:25','2023-10-04 19:20:25'),(23,'123','Testmail11321@spain.com',NULL,21,'2023-10-04 22:55:50','321','1696460150_test.txt','text/plain','2023-10-04 19:55:50','2023-10-04 19:55:50');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2023_09_23_134424_create_comments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05  2:06:43
