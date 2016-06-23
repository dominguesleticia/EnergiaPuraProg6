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
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salas` (
  `numSala` int(11) DEFAULT NULL,
  `bloco` varchar(2) DEFAULT 'B',
  `tipo_de_lampada` int(11) DEFAULT NULL,
  `numLampada` varchar(4) DEFAULT NULL,
  `on_off_Servidor` int(1) DEFAULT '0',
  `on_off_Fisico` int(1) DEFAULT '0',
  `on_off_Sistema` int(1) DEFAULT '0',
  KEY `fk_salas_tipo_de_lampada_idx` (`tipo_de_lampada`),
  CONSTRAINT `fk_salas_tipo_de_lampada` FOREIGN KEY (`tipo_de_lampada`) REFERENCES `tipo_de_lampada` (`idtipo_de_lampada`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (10,'B',1,'10A',0,0,0),(10,'B',1,'10B',0,0,0),(10,'B',1,'10C',0,0,0),(10,'B',1,'10D',0,0,0),(10,'B',1,'10E',0,0,0),(10,'B',1,'10F',0,0,0),(10,'B',2,'10G',0,0,0),(10,'B',1,'10H',0,0,0),(10,'B',1,'10I',0,0,0),(10,'B',1,'10J',0,0,0),(10,'B',2,'10K',0,0,0),(10,'B',2,'10L',0,0,0),(10,'B',2,'10M',0,0,0),(10,'B',2,'10N',0,0,0),(10,'B',2,'10O',0,0,0),(1,'B',1,'1A',0,1,0),(1,'B',1,'1B',0,0,0),(1,'B',1,'1C',0,0,0),(1,'B',1,'1D',0,0,0),(1,'B',1,'1E',0,0,0),(1,'B',1,'1F',0,0,0),(1,'B',1,'1G',0,0,0),(1,'B',1,'1H',0,0,0),(2,'B',1,'2A',0,0,0),(2,'B',1,'2B',0,0,0),(2,'B',1,'2C',0,0,0),(2,'B',1,'2D',0,0,0),(2,'B',1,'2E',0,0,0),(2,'B',1,'2F',0,0,0),(2,'B',1,'2G',0,0,0),(2,'B',1,'2H',0,0,0),(3,'B',1,'3A',0,0,0),(3,'B',1,'3B',0,0,0),(3,'B',1,'3C',0,0,0),(3,'B',1,'3D',0,0,0),(3,'B',1,'3E',0,0,0),(3,'B',1,'3F',0,0,0),(3,'B',1,'3G',0,0,0),(3,'B',1,'3H',0,0,0),(4,'B',1,'4A',0,0,0),(4,'B',1,'4B',0,0,0),(4,'B',1,'4C',0,0,0),(4,'B',1,'4D',0,0,0),(4,'B',1,'4E',0,0,0),(4,'B',1,'4F',0,0,0),(4,'B',1,'4G',0,0,0),(4,'B',1,'4H',0,0,0),(5,'B',1,'5A',0,0,0),(5,'B',1,'5B',0,0,0),(5,'B',1,'5C',0,0,0),(5,'B',1,'5D',0,0,0),(5,'B',1,'5E',0,0,0),(5,'B',1,'5F',0,0,0),(5,'B',1,'5G',0,0,0),(5,'B',1,'5H',0,0,0),(6,'B',1,'6A',0,0,0),(6,'B',1,'6B',0,0,0),(6,'B',1,'6C',0,0,0),(6,'B',1,'6D',0,0,0),(6,'B',1,'6E',0,0,0),(6,'B',1,'6F',0,0,0),(6,'B',1,'6G',0,0,0),(6,'B',1,'6H',0,0,0),(7,'B',1,'7A',0,0,0),(7,'B',1,'7B',0,0,0),(7,'B',1,'7C',0,0,0),(7,'B',1,'7D',0,0,0),(7,'B',1,'7E',0,0,0),(7,'B',1,'7F',0,0,0),(7,'B',1,'7G',0,0,0),(7,'B',1,'7H',0,0,0),(8,'B',1,'8A',0,0,0),(8,'B',1,'8B',0,0,0),(8,'B',1,'8C',0,0,0),(8,'B',1,'8D',0,0,0),(8,'B',1,'8E',0,0,0),(8,'B',1,'8F',0,0,0),(8,'B',1,'8G',0,0,0),(8,'B',1,'8H',0,0,0),(9,'B',1,'9A',0,0,0),(9,'B',1,'9B',0,0,0),(9,'B',1,'9C',0,0,0),(9,'B',1,'9D',0,0,0);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-25 19:08:00
