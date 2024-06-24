-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mybank
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `agencia`
--

DROP TABLE IF EXISTS `agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencia` (
  `IDAGENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` varchar(10) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `IDCIDADE` int(11) NOT NULL,
  PRIMARY KEY (`IDAGENCIA`),
  KEY `IDCIDADE` (`IDCIDADE`),
  CONSTRAINT `agencia_ibfk_1` FOREIGN KEY (`IDCIDADE`) REFERENCES `cidade` (`IDCIDADE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencia`
--

LOCK TABLES `agencia` WRITE;
/*!40000 ALTER TABLE `agencia` DISABLE KEYS */;
INSERT INTO `agencia` VALUES (1,'2055-4','Agência Norte',18),(2,'1642-5','Agência Sudeste',40);
/*!40000 ALTER TABLE `agencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_inserir_agencia AFTER INSERT ON agencia FOR EACH ROW
BEGIN
    CALL atualizar_agencias(NEW.IDCIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_alterar_agencia AFTER UPDATE ON agencia FOR EACH ROW
BEGIN
        CALL atualizar_agencias(NEW.IDCIDADE);
        CALL atualizar_agencias(OLD.IDCIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_excluir_agencia AFTER DELETE ON agencia FOR EACH ROW
BEGIN
    CALL atualizar_agencias(OLD.IDCIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `IDCIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(40) NOT NULL,
  `CLIENTES` int(11) DEFAULT 0,
  `AGENCIAS` int(11) DEFAULT 0,
  `IDESTADO` int(11) NOT NULL,
  PRIMARY KEY (`IDCIDADE`),
  UNIQUE KEY `NOME` (`NOME`),
  KEY `IDESTADO` (`IDESTADO`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`IDESTADO`) REFERENCES `estado` (`IDESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'RIO BRANCO',1,0,1),(2,'CRUZEIRO DO SUL',0,0,1),(3,'SENA MADUREIRA',0,0,1),(4,'TARAUACÁ',0,0,1),(5,'FEIJÓ',0,0,1),(6,'XAPURI',0,0,1),(7,'BRASILÉIA',0,0,1),(8,'MÂNCIO LIMA',1,0,1),(9,'SENADOR GUIOMARD',1,0,1),(10,'PORTO ACRE',0,0,1),(11,'RIBEIRÃO PRETO',0,0,25),(12,'CAMPINAS',0,0,25),(13,'ARARAQUARA',0,0,25),(14,'VITÓRIA',0,0,8),(15,'SALVADOR',0,0,5),(16,'MACAPÁ',0,0,3),(18,'BELÉM',0,1,14),(19,'PALMAS',0,0,27),(20,'ARACAJU',0,0,26),(21,'FLORIANÓPOLIS',0,0,24),(22,'BOA VISTA',0,0,23),(23,'PORTO VELHO',0,0,22),(24,'PORTO ALEGRE',0,0,21),(25,'NATAL',0,0,20),(26,'RIO DE JANEIRO',0,0,19),(27,'TERESINA',0,0,18),(28,'RECIFE',0,0,17),(29,'CURITIBA',0,0,16),(30,'JOÃO PESSOA',0,0,15),(31,'BELO HORIZONTE',0,0,11),(32,'CAMPO GRANDE',0,0,13),(33,'CUIABÁ',0,0,12),(34,'SÃO LUÍS',0,0,10),(35,'GOIÂNIA',0,0,9),(36,'BRASÍLIA',0,0,7),(37,'FORTALEZA',0,0,6),(38,'MACEIÓ',0,0,30),(39,'PIRACICABA',0,0,25),(40,'SÃO PAULO',0,1,25),(42,'SERTÃOZINHO',0,0,25),(43,'JARDINÓPOLIS',0,0,25),(44,'MIRASSOL',0,0,25),(45,'ADAMANTINA',0,0,25),(46,'SANTOS',0,0,25),(47,'UBERLÂNDIA',0,0,11),(48,'MARINGÁ',0,0,16),(49,'OLÍMPIA',0,0,25),(50,'LONDRINA',0,0,16),(51,'JALES',0,0,25),(53,'PIRANHAS',1,0,30),(54,'ANTA GORDA',1,0,21),(55,'ENTREPELADO',1,0,21);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antes_inserir_cidade BEFORE INSERT ON cidade FOR EACH ROW
BEGIN
    SET NEW.NOME = UPPER(NEW.NOME);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_inserir_cidade AFTER INSERT ON cidade FOR EACH ROW
BEGIN
    CALL atualizar_cidades(NEW.IDESTADO);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antes_alterar_cidade BEFORE UPDATE ON cidade FOR EACH ROW
BEGIN
    SET NEW.NOME = UPPER(NEW.NOME);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_alterar_cidade AFTER UPDATE ON cidade FOR EACH ROW
BEGIN 
    CALL atualizar_cidades(NEW.IDESTADO);
    CALL atualizar_cidades(OLD.IDESTADO);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_excluir_cidade AFTER DELETE ON cidade FOR EACH ROW
BEGIN 
    CALL atualizar_cidades(OLD.IDESTADO);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `IDCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `DTNASCIMENTO` date NOT NULL,
  `IDADE` int(11) DEFAULT NULL,
  `CPF` varchar(9) NOT NULL,
  `DACCPF` varchar(2) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `IDCIDADE` int(11) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  KEY `IDCIDADE` (`IDCIDADE`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`IDCIDADE`) REFERENCES `cidade` (`IDCIDADE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'ALBERTO SILVA','1995-09-25',28,'749150240','75','albertosilva@email.com',1),(3,'EDUARDO FELIPE','2006-04-12',18,'506152068','83','eduardofelipespinelli1@gmail.com',55),(4,'SABRINA DODÓI','2005-01-14',19,'243923250','59','amoroblox123_avulso@gmail.com',9),(5,'MURILO JAQUETA','2005-02-27',19,'505005950','03','facoti@yahoo.com',8),(6,'RAFAEL GOMES','2027-03-18',-2,'127417810','01','piranhas.org@piranhocas.com',53),(8,'GREGORY MARQUES OLIVEIRA','2006-08-31',17,'348607440','71','gatosorrindo@outlook.com',54);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antes_inserir_cliente BEFORE INSERT on cliente FOR EACH ROW
BEGIN
	SET NEW.NOME=UPPER(NEW.NOME);
	SET NEW.EMAIL=LOWER(NEW.EMAIL);
	SET NEW.IDADE=calcular_idade(NEW.DTNASCIMENTO);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_inserir_cliente AFTER INSERT ON cliente FOR EACH ROW
BEGIN
	CALL calcular_clientes(NEW.IDCIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antes_alterar_cliente BEFORE UPDATE on cliente FOR EACH ROW
BEGIN
	SET NEW.NOME=UPPER(NEW.NOME);
	SET NEW.EMAIL=LOWER(NEW.EMAIL);
	SET NEW.IDADE=calcular_idade(NEW.DTNASCIMENTO);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_alterar_cliente AFTER UPDATE ON cliente FOR EACH ROW
BEGIN
	CALL calcular_clientes(NEW.IDCIDADE);
	CALL calcular_clientes(OLD.IDCIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depois_excluir_cliente AFTER DELETE ON cliente FOR EACH ROW
BEGIN
	CALL calcular_clientes(OLD.IDCIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta` (
  `IDCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` varchar(20) NOT NULL,
  `IDCLIENTE` int(11) NOT NULL,
  `IDAGENCIA` int(11) NOT NULL,
  `IDTIPODECONTA` int(11) NOT NULL,
  `SALDO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDCONTA`),
  KEY `IDCLIENTE` (`IDCLIENTE`),
  KEY `IDAGENCIA` (`IDAGENCIA`),
  KEY `IDTIPODECONTA` (`IDTIPODECONTA`),
  CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`IDCLIENTE`) REFERENCES `cliente` (`IDCLIENTE`),
  CONSTRAINT `conta_ibfk_2` FOREIGN KEY (`IDAGENCIA`) REFERENCES `agencia` (`IDAGENCIA`),
  CONSTRAINT `conta_ibfk_3` FOREIGN KEY (`IDTIPODECONTA`) REFERENCES `tipodeconta` (`IDTIPODECONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,'14031',3,2,1,1650.00);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposito`
--

DROP TABLE IF EXISTS `deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposito` (
  `IDDEPOSITO` int(11) NOT NULL AUTO_INCREMENT,
  `DT` date NOT NULL,
  `HR` time NOT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  `IDCONTA` int(11) NOT NULL,
  PRIMARY KEY (`IDDEPOSITO`),
  KEY `IDCONTA` (`IDCONTA`),
  CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`IDCONTA`) REFERENCES `conta` (`IDCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposito`
--

LOCK TABLES `deposito` WRITE;
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
INSERT INTO `deposito` VALUES (2,'2024-06-25','12:00:00',250.00,1);
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `IDESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `SIGLA` varchar(2) NOT NULL,
  `NOME` varchar(30) NOT NULL,
  `CIDADES` int(11) DEFAULT 0,
  PRIMARY KEY (`IDESTADO`),
  UNIQUE KEY `SIGLA` (`SIGLA`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'AC','ACRE',10),(3,'AP','AMAPÁ',1),(4,'AM','AMAZONAS',0),(5,'BA','BAHIA',1),(6,'CE','CEARÁ',1),(7,'DF','DISTRITO FEDERAL',1),(8,'ES','ESPÍRITO SANTO',1),(9,'GO','GOIÁS',1),(10,'MA','MARANHÃO',1),(11,'MG','MINAS GERAIS',2),(12,'MT','MATO GROSSO',1),(13,'MS','MATO GROSSO DO SUL',1),(14,'PA','PARÁ',1),(15,'PB','PARAÍBA',1),(16,'PR','PARANÁ',3),(17,'PE','PERNAMBUCO',1),(18,'PI','PIAUÍ',1),(19,'RJ','RIO DE JANEIRO',1),(20,'RN','RIO GRANDE DO NORTE',1),(21,'RS','RIO GRANDE DO SUL',3),(22,'RO','RONDÔNIA',1),(23,'RR','RORAIMA',1),(24,'SC','SANTA CATARINA',1),(25,'SP','SÃO PAULO',12),(26,'SE','SERGIPE',1),(27,'TO','TOCANTINS',1),(30,'AL','ALAGOAS',2);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antes_inserir_estado BEFORE INSERT ON estado FOR EACH ROW
BEGIN
    SET NEW.SIGLA = UPPER(NEW.SIGLA);
    SET NEW.NOME = UPPER(NEW.NOME);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antes_alterar_estado BEFORE UPDATE ON estado FOR EACH ROW
BEGIN
    SET NEW.SIGLA = UPPER(NEW.SIGLA);
    SET NEW.NOME = UPPER(NEW.NOME);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `saque`
--

DROP TABLE IF EXISTS `saque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saque` (
  `IDSAQUE` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DT` date NOT NULL,
  `HR` time NOT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  `IDCONTA` int(11) NOT NULL,
  PRIMARY KEY (`IDSAQUE`),
  KEY `IDCONTA` (`IDCONTA`),
  CONSTRAINT `saque_ibfk_1` FOREIGN KEY (`IDCONTA`) REFERENCES `conta` (`IDCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saque`
--

LOCK TABLES `saque` WRITE;
/*!40000 ALTER TABLE `saque` DISABLE KEYS */;
INSERT INTO `saque` VALUES (1,'2024-06-24','12:00:00',100.00,1);
/*!40000 ALTER TABLE `saque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodeconta`
--

DROP TABLE IF EXISTS `tipodeconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodeconta` (
  `IDTIPODECONTA` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  PRIMARY KEY (`IDTIPODECONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodeconta`
--

LOCK TABLES `tipodeconta` WRITE;
/*!40000 ALTER TABLE `tipodeconta` DISABLE KEYS */;
INSERT INTO `tipodeconta` VALUES (1,'Conta poupança');
/*!40000 ALTER TABLE `tipodeconta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 15:43:47
