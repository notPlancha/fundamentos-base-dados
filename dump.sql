-- MariaDB dump 10.19  Distrib 10.10.1-MariaDB, for Win64 (AMD64)
--
-- Host: 194.210.86.10    Database: aluno_105289_hoteldb
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Numero_Cliente` int(11) NOT NULL,
  `Nome_Cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Numero_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`Numero_Cliente`, `Nome_Cliente`) VALUES (1,'Ana'),
(2,'ISCTE'),
(3,'Pedro'),
(4,'ONU'),
(5,'Luis'),
(6,'NASA'),
(7,'Carlos'),
(8,'CE'),
(9,'Sofia'),
(10,'TAP'),
(11,'Luisa'),
(12,'Antonio'),
(13,'Continente');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `Numero_Reserva` int(11) NOT NULL,
  `Numero_Factura` int(11) NOT NULL,
  `Data_Factura` datetime DEFAULT NULL,
  `Valor_Factura` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`Numero_Factura`),
  KEY `FK_Factura_FacturaReserva_Reserva` (`Numero_Reserva`),
  CONSTRAINT `FK_Factura_FacturaReserva_Reserva` FOREIGN KEY (`Numero_Reserva`) REFERENCES `reserva` (`Numero_Reserva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` (`Numero_Reserva`, `Numero_Factura`, `Data_Factura`, `Valor_Factura`) VALUES (1,1,'2012-11-18 00:00:00',400.00),
(3,2,'2012-11-17 00:00:00',400.00),
(5,3,'2012-12-18 00:00:00',400.00),
(6,4,'2012-09-18 00:00:00',400.00),
(8,5,'2012-11-11 00:00:00',400.00),
(10,6,'2012-11-10 00:00:00',400.00),
(12,7,'2012-11-18 00:00:00',400.00),
(13,8,'2012-11-18 00:00:00',400.00),
(14,9,'2012-11-18 00:00:00',400.00),
(16,10,'2012-11-18 00:00:00',400.00),
(17,11,'2012-11-18 00:00:00',400.00),
(20,12,'2012-11-18 00:00:00',400.00),
(21,13,'2012-11-18 00:00:00',400.00),
(25,14,'2012-11-18 00:00:00',400.00),
(27,15,'2012-11-18 00:00:00',400.00),
(29,16,'2012-11-18 00:00:00',400.00);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `Sigla_Hotel` varchar(10) NOT NULL,
  `Designacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Sigla_Hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` (`Sigla_Hotel`, `Designacao`) VALUES ('AL','Alfa'),
('BH','Baia'),
('LS','Lisboa'),
('MJ','Majestic'),
('MN','Mundial'),
('RM','Roma'),
('SH','Sheraton');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `individual` (
  `Numero_Cliente` int(11) NOT NULL,
  `BI` int(11) DEFAULT NULL,
  PRIMARY KEY (`Numero_Cliente`),
  CONSTRAINT `FK_Individual_Cliente` FOREIGN KEY (`Numero_Cliente`) REFERENCES `cliente` (`Numero_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` (`Numero_Cliente`, `BI`) VALUES (1,589595),
(3,585985),
(5,375895),
(7,836137),
(9,767676),
(11,NULL),
(12,NULL);
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;

--
-- Table structure for table `organizacao`
--

DROP TABLE IF EXISTS `organizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizacao` (
  `Numero_Cliente` int(11) NOT NULL,
  `Ramo_Actividade` varchar(100) DEFAULT NULL,
  `Nome_Contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Numero_Cliente`),
  CONSTRAINT `FK_Organizacao_Cliente` FOREIGN KEY (`Numero_Cliente`) REFERENCES `cliente` (`Numero_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacao`
--

/*!40000 ALTER TABLE `organizacao` DISABLE KEYS */;
INSERT INTO `organizacao` (`Numero_Cliente`, `Ramo_Actividade`, `Nome_Contacto`) VALUES (2,'Ensino',NULL),
(4,'Internacional','Evaristo'),
(6,'Defesa',NULL),
(8,'Governacao','Joao'),
(10,'Transportes',NULL),
(13,'Alimentar',NULL);
/*!40000 ALTER TABLE `organizacao` ENABLE KEYS */;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quarto` (
  `Sigla_Hotel` varchar(10) NOT NULL,
  `Numero_Quarto` int(11) NOT NULL,
  `Numero_Camas` int(11) DEFAULT NULL,
  `Preco` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Sigla_Hotel`,`Numero_Quarto`),
  CONSTRAINT `FK_Quarto_HotelQuarto_Hotel` FOREIGN KEY (`Sigla_Hotel`) REFERENCES `hotel` (`Sigla_Hotel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` (`Sigla_Hotel`, `Numero_Quarto`, `Numero_Camas`, `Preco`) VALUES ('AL',1,2,10.00),
('AL',2,4,NULL),
('AL',3,4,20.00),
('AL',4,2,10.00),
('AL',5,2,NULL),
('AL',6,4,15.00),
('AL',7,2,15.00),
('AL',8,4,NULL),
('LS',1,2,12.00),
('LS',2,2,20.00),
('LS',3,3,16.00),
('LS',4,1,14.00),
('LS',5,1,20.00),
('LS',6,4,20.00),
('MJ',1,2,10.00),
('MJ',2,3,15.00),
('MJ',3,4,22.00),
('MJ',4,1,10.00),
('MN',1,2,10.00),
('MN',2,2,20.00),
('MN',3,4,26.00),
('MN',4,1,10.00),
('MN',5,3,NULL),
('MN',6,4,15.00),
('MN',7,2,15.00),
('MN',8,4,NULL),
('MN',9,1,10.00),
('MN',10,2,8.00),
('MN',11,3,10.00),
('MN',12,1,NULL),
('RM',1,2,10.00),
('RM',2,3,25.00),
('RM',3,4,20.00),
('RM',4,1,10.00),
('RM',5,2,NULL),
('RM',6,2,20.00),
('RM',7,2,15.00),
('RM',8,4,NULL),
('RM',9,1,10.00),
('RM',10,4,13.00),
('SH',1,2,10.00),
('SH',2,2,20.00),
('SH',3,4,20.00),
('SH',4,1,10.00),
('SH',5,2,NULL),
('SH',6,3,15.00),
('SH',7,2,15.00),
('SH',8,4,NULL),
('SH',9,1,10.00),
('SH',10,1,5.00);
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `Numero_Cliente` int(11) NOT NULL,
  `Numero_Reserva` int(11) NOT NULL,
  `Dia_Entrada` datetime DEFAULT NULL,
  `Dia_Saida` datetime DEFAULT NULL,
  PRIMARY KEY (`Numero_Reserva`),
  KEY `FK_Reserva_ClienteReserva_Cliente` (`Numero_Cliente`),
  CONSTRAINT `FK_Reserva_ClienteReserva_Cliente` FOREIGN KEY (`Numero_Cliente`) REFERENCES `cliente` (`Numero_Cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` (`Numero_Cliente`, `Numero_Reserva`, `Dia_Entrada`, `Dia_Saida`) VALUES (4,1,'2012-07-17 00:00:00','2012-07-19 00:00:00'),
(4,2,'2012-07-17 00:00:00','2012-07-18 00:00:00'),
(1,3,'2012-07-18 00:00:00','2012-07-21 00:00:00'),
(2,4,'2012-07-18 00:00:00','2012-07-21 00:00:00'),
(2,5,'2012-06-17 00:00:00','2012-06-17 00:00:00'),
(4,6,'2012-06-17 00:00:00','2012-06-11 00:00:00'),
(2,7,'2012-06-17 00:00:00','2012-06-18 00:00:00'),
(3,8,'2012-06-17 00:00:00','2012-06-18 00:00:00'),
(3,9,'2012-09-10 00:00:00','2012-09-12 00:00:00'),
(4,10,'2012-09-11 00:00:00','2012-09-13 00:00:00'),
(4,11,'2012-08-12 00:00:00','2012-08-15 00:00:00'),
(4,12,'2012-08-13 00:00:00','2012-08-14 00:00:00'),
(4,13,'2012-08-14 00:00:00','2012-08-19 00:00:00'),
(4,14,'2012-08-17 00:00:00','2012-08-21 00:00:00'),
(5,15,'2012-06-18 00:00:00','2012-06-28 00:00:00'),
(5,16,'2012-06-21 00:00:00','2012-06-22 00:00:00'),
(5,17,'2012-06-20 00:00:00','2012-06-25 00:00:00'),
(8,18,'2012-06-17 00:00:00','2012-06-18 00:00:00'),
(8,19,'2012-06-17 00:00:00','2012-06-19 00:00:00'),
(9,20,'2012-05-17 00:00:00','2012-05-20 00:00:00'),
(9,21,'2012-05-01 00:00:00','2012-05-11 00:00:00'),
(10,22,'2012-05-02 00:00:00','2012-05-04 00:00:00'),
(10,23,'2012-05-01 00:00:00','2012-05-03 00:00:00'),
(11,24,'2012-04-10 00:00:00','2012-04-13 00:00:00'),
(11,25,'2012-04-10 00:00:00','2012-04-13 00:00:00'),
(11,26,'2012-04-09 00:00:00','2012-04-12 00:00:00'),
(12,27,'2012-06-20 00:00:00','2012-06-28 00:00:00'),
(12,28,'2012-03-21 00:00:00','2012-03-22 00:00:00'),
(12,29,'2012-03-17 00:00:00','2012-03-18 00:00:00');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;

--
-- Table structure for table `reserva_quartos`
--

DROP TABLE IF EXISTS `reserva_quartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva_quartos` (
  `Sigla_Hotel` varchar(10) NOT NULL,
  `Numero_Quarto` int(11) NOT NULL,
  `Numero_Reserva` int(11) NOT NULL,
  `Cama_Extra` int(11) DEFAULT NULL,
  `Numero_Pessoas` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sigla_Hotel`,`Numero_Quarto`,`Numero_Reserva`),
  KEY `FK_Reserva_Reserva_Quartos_Quarto` (`Numero_Reserva`),
  CONSTRAINT `FK_Quarto_Reserva_Quartos_Reserva` FOREIGN KEY (`Sigla_Hotel`, `Numero_Quarto`) REFERENCES `quarto` (`Sigla_Hotel`, `Numero_Quarto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reserva_Reserva_Quartos_Quarto` FOREIGN KEY (`Numero_Reserva`) REFERENCES `reserva` (`Numero_Reserva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_quartos`
--

/*!40000 ALTER TABLE `reserva_quartos` DISABLE KEYS */;
INSERT INTO `reserva_quartos` (`Sigla_Hotel`, `Numero_Quarto`, `Numero_Reserva`, `Cama_Extra`, `Numero_Pessoas`) VALUES ('AL',1,3,NULL,1),
('AL',2,4,NULL,2),
('AL',4,2,NULL,1),
('AL',6,2,NULL,2),
('AL',7,5,NULL,1),
('AL',8,6,NULL,1),
('LS',1,25,NULL,1),
('LS',2,26,NULL,1),
('LS',3,27,NULL,3),
('LS',4,28,NULL,2),
('LS',5,29,NULL,1),
('LS',6,10,NULL,2),
('LS',6,29,NULL,1),
('MJ',1,21,NULL,1),
('MJ',2,13,NULL,2),
('MJ',2,22,NULL,1),
('MJ',3,23,NULL,2),
('MJ',4,24,NULL,1),
('MN',1,7,NULL,1),
('MN',2,8,NULL,1),
('MN',3,11,NULL,1),
('MN',7,9,NULL,1),
('RM',1,12,NULL,1),
('RM',3,14,NULL,1),
('RM',4,15,NULL,1),
('RM',5,16,NULL,2),
('RM',7,17,NULL,1),
('RM',8,18,NULL,3),
('RM',9,19,NULL,1),
('RM',10,20,NULL,1),
('SH',1,1,NULL,1),
('SH',3,1,NULL,1);
/*!40000 ALTER TABLE `reserva_quartos` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 20:15:29
