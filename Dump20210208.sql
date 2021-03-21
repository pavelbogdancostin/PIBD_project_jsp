-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: tema_pibd
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `angajati`
--

DROP TABLE IF EXISTS `angajati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `angajati` (
  `idangajat` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `functie` varchar(45) DEFAULT NULL,
  `experienta` int DEFAULT NULL,
  `salariu` float DEFAULT NULL,
  PRIMARY KEY (`idangajat`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angajati`
--

LOCK TABLES `angajati` WRITE;
/*!40000 ALTER TABLE `angajati` DISABLE KEYS */;
INSERT INTO `angajati` VALUES (19,'Popescu','Ion','manager',5,2000),(20,'Ionescu','Dorel','Economist',8,900);
/*!40000 ALTER TABLE `angajati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewuri`
--

DROP TABLE IF EXISTS `reviewuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewuri` (
  `idreview` bigint NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `comentariu` text,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`idreview`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewuri`
--

LOCK TABLES `reviewuri` WRITE;
/*!40000 ALTER TABLE `reviewuri` DISABLE KEYS */;
INSERT INTO `reviewuri` VALUES (9,6,'A facut treaba buna !!!','2021-02-08'),(10,4,'Trebuie sa acorde mai multa atentie la detalii.','2020-01-10');
/*!40000 ALTER TABLE `reviewuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarcini`
--

DROP TABLE IF EXISTS `sarcini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarcini` (
  `idsarcina` bigint NOT NULL AUTO_INCREMENT,
  `idangajat` bigint DEFAULT NULL,
  `idreview` bigint DEFAULT NULL,
  `sarcina` text,
  `dificultate` text,
  PRIMARY KEY (`idsarcina`),
  KEY `fk_1_idx` (`idangajat`),
  KEY `fk_2_idx` (`idreview`),
  CONSTRAINT `fk_1` FOREIGN KEY (`idangajat`) REFERENCES `angajati` (`idangajat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_2` FOREIGN KEY (`idreview`) REFERENCES `reviewuri` (`idreview`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarcini`
--

LOCK TABLES `sarcini` WRITE;
/*!40000 ALTER TABLE `sarcini` DISABLE KEYS */;
INSERT INTO `sarcini` VALUES (6,20,10,'sa se ocupe de economii !!!','greu'),(7,19,9,'gestioneasa afacerea','ridicata');
/*!40000 ALTER TABLE `sarcini` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08  1:54:52
