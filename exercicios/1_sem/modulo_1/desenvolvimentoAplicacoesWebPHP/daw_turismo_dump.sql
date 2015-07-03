-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: daw_turismo
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

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
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `cidade_Cod` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_Nome` varchar(20) NOT NULL,
  PRIMARY KEY (`cidade_Cod`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (115,'Belem'),(120,'Porto Alegre'),(121,'Recife'),(122,'Fortaleza'),(124,'Belo Horizonte'),(131,'Sao Paulo'),(137,'Rio de Janeiro'),(155,'Brasilia'),(158,'Salvador');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cliente_Cod` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_Email` varchar(50) NOT NULL,
  `cliente_Senha` char(50) NOT NULL,
  `cliente_Cidade` int(11) NOT NULL,
  `cliente_Nome` varchar(50) NOT NULL,
  `cliente_Foto` varchar(50) NOT NULL,
  PRIMARY KEY (`cliente_Cod`),
  UNIQUE KEY `cliente_Email` (`cliente_Email`),
  UNIQUE KEY `cliente_Email_2` (`cliente_Email`),
  KEY `cliente_Cidade` (`cliente_Cidade`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`cliente_Cidade`) REFERENCES `cidades` (`cidade_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteis`
--

DROP TABLE IF EXISTS `hoteis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoteis` (
  `hotel_Cod` int(11) NOT NULL,
  `hotel_Nome` varchar(30) NOT NULL,
  `hotel_Categoria` int(11) NOT NULL COMMENT '1 para básico, 2 para luxo',
  `hotel_Cidade` int(11) NOT NULL,
  `hotel_Diaria` float NOT NULL,
  PRIMARY KEY (`hotel_Cod`),
  KEY `hotel_Cidade` (`hotel_Cidade`),
  CONSTRAINT `hoteis_ibfk_1` FOREIGN KEY (`hotel_Cidade`) REFERENCES `cidades` (`cidade_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteis`
--

LOCK TABLES `hoteis` WRITE;
/*!40000 ALTER TABLE `hoteis` DISABLE KEYS */;
INSERT INTO `hoteis` VALUES (7,'Golden Tulip Park Plaza',1,131,258),(8,'Hotel Plaza',2,131,325.56),(10,'Transamerica Prestige Beach Cl',2,121,315.79),(11,'Fator Palace Hotel',1,121,195),(30,'Athos Bulcao Hplus Executive',2,155,210),(31,'Manhattan',1,155,184),(38,'Marina Palace Hotel',1,137,150),(40,'Hotel Rio Lancaster',1,137,200),(45,'Abilita Suites Ipanema Tower',2,137,350),(50,'Monte Pascoal Praia Hotel Salv',2,158,274.55),(51,'Hotel Pousada da Mangueira',1,158,198.75),(101,'Hotel Luzeiros',2,122,319),(102,'Oasis Atlantico Fortaleza',2,122,226.8),(104,'Iracema Residence Flat',1,122,187),(105,'Eko Residence Hotel',1,120,139),(145,'Holiday Inn Express Belem',2,115,173.5),(151,'Acores Premium',2,120,179),(155,'Crowne Plaza Belem',1,115,110.58),(166,'Hotel Sol Belo Horizonte',2,124,367.5),(167,'Tulip Inn Savassi',1,124,189.05);
/*!40000 ALTER TABLE `hoteis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservashotel`
--

DROP TABLE IF EXISTS `reservashotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservashotel` (
  `reservasHotel_Cliente` int(11) NOT NULL,
  `reservasHotel_Hotel` int(11) NOT NULL,
  `reservasHotel_DataEntrada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reservasHotel_DataSaida` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reservasHotel_PrecoTotal` float NOT NULL,
  PRIMARY KEY (`reservasHotel_Cliente`,`reservasHotel_Hotel`,`reservasHotel_DataEntrada`,`reservasHotel_DataSaida`),
  KEY `reservasHotel_Hotel` (`reservasHotel_Hotel`),
  CONSTRAINT `reservashotel_ibfk_1` FOREIGN KEY (`reservasHotel_Cliente`) REFERENCES `clientes` (`cliente_Cod`),
  CONSTRAINT `reservashotel_ibfk_2` FOREIGN KEY (`reservasHotel_Hotel`) REFERENCES `hoteis` (`hotel_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservashotel`
--

LOCK TABLES `reservashotel` WRITE;
/*!40000 ALTER TABLE `reservashotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservashotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservasvoo`
--

DROP TABLE IF EXISTS `reservasvoo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservasvoo` (
  `reservasVoo_Cliente` int(11) NOT NULL,
  `reservasVoo_Voo` int(11) NOT NULL,
  `reservasVoo_QuantPassageiros` int(11) NOT NULL,
  `reservasVoo_PrecoTotal` float NOT NULL,
  PRIMARY KEY (`reservasVoo_Cliente`,`reservasVoo_Voo`),
  KEY `reservasVoo_Voo` (`reservasVoo_Voo`),
  CONSTRAINT `reservasvoo_ibfk_1` FOREIGN KEY (`reservasVoo_Cliente`) REFERENCES `clientes` (`cliente_Cod`),
  CONSTRAINT `reservasvoo_ibfk_2` FOREIGN KEY (`reservasVoo_Voo`) REFERENCES `voos` (`voo_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservasvoo`
--

LOCK TABLES `reservasvoo` WRITE;
/*!40000 ALTER TABLE `reservasvoo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservasvoo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voos`
--

DROP TABLE IF EXISTS `voos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voos` (
  `voo_Cod` int(11) NOT NULL,
  `voo_CidadeOrigem` int(11) NOT NULL,
  `voo_CidadeDestino` int(11) NOT NULL,
  `voo_Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voo_Preco` float NOT NULL,
  PRIMARY KEY (`voo_Cod`),
  KEY `voo_CidadeOrigem` (`voo_CidadeOrigem`,`voo_CidadeDestino`),
  KEY `voo_CidadeDestino` (`voo_CidadeDestino`),
  CONSTRAINT `voos_ibfk_1` FOREIGN KEY (`voo_CidadeOrigem`) REFERENCES `cidades` (`cidade_Cod`),
  CONSTRAINT `voos_ibfk_2` FOREIGN KEY (`voo_CidadeDestino`) REFERENCES `cidades` (`cidade_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos`
--

LOCK TABLES `voos` WRITE;
/*!40000 ALTER TABLE `voos` DISABLE KEYS */;
INSERT INTO `voos` VALUES (10,120,131,'2015-07-03 20:37:29',1250.65),(11,120,155,'2015-07-25 11:50:25',1750.75),(12,120,131,'2015-07-26 11:50:25',1750.75),(13,120,137,'2015-07-27 11:50:25',1850.75),(17,131,137,'2015-07-25 11:50:25',2570.85),(18,131,155,'2015-07-26 11:50:25',1540.85),(19,131,120,'2015-07-27 11:50:25',970.05),(25,137,131,'2015-07-25 12:50:25',1970.05),(26,137,120,'2015-07-26 12:50:25',2970.05),(27,137,155,'2015-07-27 12:50:25',950.1),(30,155,131,'2015-07-26 13:50:25',1950.1),(31,155,137,'2015-07-27 13:50:25',1950.1),(32,155,120,'2015-07-28 13:50:25',950.1);
/*!40000 ALTER TABLE `voos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-03 16:57:50
