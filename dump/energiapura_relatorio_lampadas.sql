-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: energiapura
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `relatorio_lampadas`
--

DROP TABLE IF EXISTS `relatorio_lampadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_lampadas` (
  `idRelatorio_lampadas` int(11) NOT NULL AUTO_INCREMENT,
  `bloco` varchar(2) DEFAULT 'B',
  `numSala` int(11) DEFAULT NULL,
  `numLampada` varchar(4) DEFAULT NULL,
  `quem` varchar(100) DEFAULT NULL,
  `on_off` varchar(45) DEFAULT NULL,
  `data_hora` varchar(30) DEFAULT NULL,
  `situacao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idRelatorio_lampadas`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_lampadas`
--

LOCK TABLES `relatorio_lampadas` WRITE;
/*!40000 ALTER TABLE `relatorio_lampadas` DISABLE KEYS */;
INSERT INTO `relatorio_lampadas` VALUES (1,'B',1,'1A','Fisico','1','2016-05-15 21:33:58','Ligado'),(2,'B',1,'1B','Fisico','1','2016-05-15 22:01:02','Ligado'),(3,'B',1,'1C','Fisico','1','2016-05-15 22:01:07','Ligado'),(4,'B',1,'1D','Fisico','1','2016-05-15 22:34:11','Ligado'),(5,'B',1,'1E','Fisico','1','2016-05-15 22:34:14','Ligado'),(6,'B',1,'1F','Fisico','1','2016-05-15 22:34:16','Ligado'),(7,'B',1,'1G','Fisico','1','2016-05-15 22:36:27','Ligado'),(8,'B',1,'1H','Fisico','1','2016-05-15 22:36:27','Ligado'),(9,'B',1,'1A','Fisico','0','2016-05-15 22:36:31','Desligado'),(10,'B',1,'1B','Fisico','0','2016-05-15 22:36:31','Desligado'),(11,'B',1,'1C','Fisico','0','2016-05-15 22:36:31','Desligado'),(12,'B',1,'1D','Fisico','0','2016-05-15 22:36:31','Desligado'),(13,'B',1,'1E','Fisico','0','2016-05-15 22:36:31','Desligado'),(14,'B',1,'1F','Fisico','0','2016-05-15 22:36:31','Desligado'),(15,'B',1,'1G','Fisico','0','2016-05-15 22:36:31','Desligado'),(16,'B',1,'1H','Fisico','0','2016-05-15 22:36:31','Desligado'),(17,'B',1,'1A','Fisico','1','2016-05-15 22:37:47','Ligado');
/*!40000 ALTER TABLE `relatorio_lampadas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-25 19:07:59
