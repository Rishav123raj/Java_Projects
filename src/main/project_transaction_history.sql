-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_history` (
  `accountno` varchar(45) NOT NULL,
  `transaction_type` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_history`
--

LOCK TABLES `transaction_history` WRITE;
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
INSERT INTO `transaction_history` VALUES ('4001','Credited','100.0','2024-01-19 11:50:45'),('4001','Credited','500.0','2024-01-19 11:51:43'),('4002','Credited','400.0','2024-01-19 12:17:47'),('4001','Debited','200.0','2024-01-19 12:22:22'),('4002','TransferFrom','300.0','2024-01-19 12:37:51'),('4001','TransferFrom','200.0','2024-01-19 12:40:39'),('4001','TransferFrom','200.0','2024-01-19 12:42:32'),('4001','Credited','400.0','2024-01-19 12:44:05'),('4001','Credited','200.0','2024-01-19 13:40:55'),('4001','TransferFrom','200.0','2024-01-19 13:50:01'),('4001','TransferFrom','200.0','2024-01-19 13:52:12'),('4001','TransferFrom','10.0','2024-01-19 13:52:58'),('4001','TransferFrom','10.0','2024-01-19 13:57:37'),('4002','TransferTo','10.0','2024-01-19 13:57:37'),('4002','TransferFrom','20.0','2024-01-19 13:58:38'),('4001','TransferTo','20.0','2024-01-19 13:58:38'),('4001','Credited','200.0','2024-01-19 17:01:14'),('4001','Credited','400.0','2024-01-19 17:34:13'),('4001','Credited','450.0','2024-01-27 15:06:00'),('4001','Debited','250.0','2024-01-27 15:06:06'),('4001','TransferFrom','250.0','2024-01-27 15:06:15'),('4002','TransferTo','250.0','2024-01-27 15:06:15');
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-27 20:54:01
