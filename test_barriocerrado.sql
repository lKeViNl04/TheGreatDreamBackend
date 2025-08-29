CREATE DATABASE  IF NOT EXISTS `test_barriocerrado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `test_barriocerrado`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test_barriocerrado
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `caja_chica`
--

DROP TABLE IF EXISTS `caja_chica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja_chica` (
  `id_caja_chica` bigint(20) NOT NULL AUTO_INCREMENT,
  `anio` int(11) DEFAULT NULL,
  `mes` tinyint(3) unsigned NOT NULL,
  `monto_recaudado` decimal(12,2) DEFAULT NULL,
  `gasto_total` decimal(12,2) DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_caja_chica`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_chica`
--

LOCK TABLES `caja_chica` WRITE;
/*!40000 ALTER TABLE `caja_chica` DISABLE KEYS */;
INSERT INTO `caja_chica` VALUES (4,2024,4,1311500.00,986067.99,325432.01),(5,2025,8,25000000.00,900000.00,16000000.00),(14,2025,12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `caja_chica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuota_socio_cajachica`
--

DROP TABLE IF EXISTS `cuota_socio_cajachica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota_socio_cajachica` (
  `id_cuota` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_caja_chica` bigint(20) NOT NULL,
  `id_socio` bigint(20) NOT NULL,
  `monto_asignado` decimal(12,2) DEFAULT NULL,
  `abonado` decimal(12,2) DEFAULT NULL,
  `estado` enum('Pagado','No pagado','Pago parcial','Pagado con Transferencia') NOT NULL,
  PRIMARY KEY (`id_cuota`),
  KEY `id_caja_chica` (`id_caja_chica`),
  KEY `id_socio` (`id_socio`),
  CONSTRAINT `cuota_socio_cajachica_ibfk_1` FOREIGN KEY (`id_caja_chica`) REFERENCES `caja_chica` (`id_caja_chica`),
  CONSTRAINT `cuota_socio_cajachica_ibfk_2` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota_socio_cajachica`
--

LOCK TABLES `cuota_socio_cajachica` WRITE;
/*!40000 ALTER TABLE `cuota_socio_cajachica` DISABLE KEYS */;
INSERT INTO `cuota_socio_cajachica` VALUES (1,4,1,12500.00,12500.00,'Pagado'),(2,4,2,10000.00,50000.00,'Pagado'),(3,4,3,25000.00,25000.00,'Pagado'),(4,4,4,50000.00,50000.00,'Pagado'),(5,4,5,25000.00,25000.00,'Pagado'),(6,4,6,50000.00,50000.00,'Pagado'),(7,4,7,25000.00,25000.00,'Pagado'),(8,4,8,12500.00,12500.00,'Pagado'),(9,4,9,25000.00,25000.00,'Pagado'),(10,4,10,37500.00,54000.00,'Pagado'),(11,4,11,25000.00,25000.00,'Pagado'),(12,4,12,25000.00,25000.00,'Pagado'),(13,4,14,37500.00,37500.00,'Pagado'),(14,4,15,50000.00,50000.00,'Pagado'),(15,4,16,25000.00,25000.00,'Pagado con Transferencia'),(16,4,17,50000.00,50000.00,'Pagado'),(17,4,18,100000.00,100000.00,'Pagado'),(18,4,20,12500.00,12500.00,'Pagado'),(19,4,21,50000.00,0.00,'No pagado'),(20,4,23,50000.00,50000.00,'Pagado'),(21,4,27,100000.00,100000.00,'Pagado'),(22,4,28,50000.00,50000.00,'Pagado'),(23,4,29,50000.00,0.00,'No pagado'),(24,4,31,25000.00,25000.00,'Pagado'),(25,4,33,50000.00,50000.00,'Pagado'),(26,4,34,25000.00,25000.00,'Pagado'),(27,4,35,25000.00,25000.00,'Pagado'),(28,4,38,25000.00,25000.00,'Pagado'),(30,4,40,50000.00,50000.00,'Pagado'),(31,4,41,12500.00,12500.00,'Pagado'),(32,4,42,25000.00,25000.00,'Pagado'),(33,4,43,50000.00,50000.00,'Pagado'),(34,4,44,50000.00,50000.00,'Pagado'),(35,4,45,25000.00,25000.00,'Pagado'),(36,4,46,25000.00,25000.00,'Pagado'),(38,14,1,5.00,5.00,'Pagado'),(39,14,3,50.00,50.00,'Pagado');
/*!40000 ALTER TABLE `cuota_socio_cajachica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto_mes_cajachica`
--

DROP TABLE IF EXISTS `gasto_mes_cajachica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasto_mes_cajachica` (
  `id_gasto_mes` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_caja_chica` bigint(20) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `monto` decimal(12,2) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_gasto_mes`),
  KEY `id_caja_chica` (`id_caja_chica`),
  CONSTRAINT `gasto_mes_cajachica_ibfk_1` FOREIGN KEY (`id_caja_chica`) REFERENCES `caja_chica` (`id_caja_chica`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto_mes_cajachica`
--

LOCK TABLES `gasto_mes_cajachica` WRITE;
/*!40000 ALTER TABLE `gasto_mes_cajachica` DISABLE KEYS */;
INSERT INTO `gasto_mes_cajachica` VALUES (2,4,'Papel carbon',500.00,NULL),(3,4,'Cuaderno de Actas',7000.00,NULL),(4,4,'Asado(se le pago a Froylan) carne(90470.00) y carbon(8000.00',9847.00,'2024-05-09'),(5,4,'12 Cervezas(se le pago a Salvador)',18000.00,'2024-05-05'),(6,4,'Cosas de limpieza (vitales)',20460.99,'2024-05-05'),(7,4,'Juego de baño (a Jose)',150000.00,'2024-05-07'),(8,4,'Compra de sierra(539,091.00-5%)',512137.00,'2024-05-07'),(9,4,'Asado(se le pago a Froylan) (86000.00+30000.00)',116000.00,'2024-05-15');
/*!40000 ALTER TABLE `gasto_mes_cajachica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id_socio` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `cupos` varchar(4) DEFAULT NULL,
  `estado` enum('Activo','EXmiembro') DEFAULT NULL,
  PRIMARY KEY (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,'Efrain','Alaca','1/4','Activo'),(2,'Noemi','Aliaga','1','Activo'),(3,'Cesar','Aranda','1/2','EXmiembro'),(4,'Alexis','Avisa','1','Activo'),(5,'Jhony','Barco','1/2','Activo'),(6,'Yoselin','Barco','1','Activo'),(7,'Amilcar','Calle','1/3','Activo'),(8,'Hugo','Calle','1/4','Activo'),(9,'Cesar','Cayo','1/2','Activo'),(10,'Rodrigo','Chambilla','1/4','Activo'),(11,'Veronica','Chaparro','1/2','Activo'),(12,'Diego','Choque','1/2','Activo'),(14,'Carla','Donaire','1/2','Activo'),(15,'Luis','Escalante','1','Activo'),(16,'Jose','Espinosa','1/2','Activo'),(17,'Abigail','Fernandez','1','Activo'),(18,'Roberth','Flores','2','Activo'),(20,'Joel','Iraipi','1/4','Activo'),(21,'Rigoberto','Limber','1','Activo'),(23,'Giomar','Mamani','3/4','Activo'),(27,'Isabel','Pelaez','2','Activo'),(28,'Luis','Perez','1','Activo'),(29,'Mercedez','Perez','1','Activo'),(31,'Jose Luis','Quispe','1/2','Activo'),(33,'Silvestre','Quispe','1','Activo'),(34,'Jesus','Reynaldo','1/2','Activo'),(35,'Gaby','Sahonero','1/2','Activo'),(38,'Braulio','Vilca','1/2','Activo'),(39,'Floylan','Vilca','3/4','Activo'),(40,'Luis Alberto','Vilca','3/4','Activo'),(41,'Paulino','Vilca','1/4','Activo'),(42,'Sheyla','Vilches','1/2','Activo'),(43,'Rene','Yucra','1','Activo'),(44,'Edwin','Zambrana','1','Activo'),(45,'Gonzalo','Zambrana','1/2','Activo'),(46,'Brian','Zegarra','1/2','Activo'),(54,'william','flores','1','Activo');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test_barriocerrado'
--

--
-- Dumping routines for database 'test_barriocerrado'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-16  1:38:23
