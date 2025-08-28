CREATE DATABASE  IF NOT EXISTS `gatedcommunity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `gatedcommunity`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gatedcommunity
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
-- Table structure for table `cashbox`
--

DROP TABLE IF EXISTS `cashbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` tinyint(3) NOT NULL,
  `total_collected` decimal(12,2) DEFAULT 0.00,
  `total_spent` decimal(12,2) DEFAULT 0.00,
  `total_balance` decimal(12,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_year_month` (`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbox`
--

LOCK TABLES `cashbox` WRITE;
/*!40000 ALTER TABLE `cashbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashbox_expense`
--

DROP TABLE IF EXISTS `cashbox_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashbox_expense` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cashbox` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashbox_expense_ibfk_1_idx` (`id_cashbox`),
  CONSTRAINT `cashbox_expense_ibfk_1` FOREIGN KEY (`id_cashbox`) REFERENCES `cashbox` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbox_expense`
--

LOCK TABLES `cashbox_expense` WRITE;
/*!40000 ALTER TABLE `cashbox_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbox_expense` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_insert_cashbox_expense
AFTER INSERT ON cashbox_expense
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_spent = IFNULL(total_spent, 0) + NEW.amount
    WHERE id = NEW.id_cashbox;

    CALL sp_update_balance(NEW.id_cashbox);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_update_cashbox_expense
AFTER UPDATE ON cashbox_expense
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_spent = IFNULL(total_spent, 0) + (NEW.amount - OLD.amount)
    WHERE id = NEW.id_cashbox
      AND EXISTS (SELECT 1 FROM cashbox WHERE id = NEW.id_cashbox);

    CALL sp_update_balance(NEW.id_cashbox);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_delete_cashbox_expense
AFTER DELETE ON cashbox_expense
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_spent = GREATEST(0, IFNULL(total_spent, 0) - OLD.amount)
    WHERE id = OLD.id_cashbox;

    CALL sp_update_balance(OLD.id_cashbox);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cashbox_fee`
--

DROP TABLE IF EXISTS `cashbox_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashbox_fee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cashbox` bigint(20) NOT NULL,
  `id_member` bigint(20) NOT NULL,
  `assigned_amount` decimal(12,2) DEFAULT 0.00,
  `paid` decimal(12,2) DEFAULT 0.00,
  `status` enum('Pagado','No pagado','Pago parcial','Pagado con Transferencia') NOT NULL DEFAULT 'No pagado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_member_cashbox` (`id_cashbox`,`id_member`),
  KEY `id_cashbox_idx` (`id_cashbox`),
  KEY `id_member_idx` (`id_member`),
  CONSTRAINT `cashbox_fee_ibfk_1` FOREIGN KEY (`id_cashbox`) REFERENCES `cashbox` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cashbox_fee_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbox_fee`
--

LOCK TABLES `cashbox_fee` WRITE;
/*!40000 ALTER TABLE `cashbox_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbox_fee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_insert_cashbox_fee
AFTER INSERT ON cashbox_fee
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_collected = IFNULL(total_collected, 0) + NEW.paid
    WHERE id = NEW.id_cashbox;

    CALL sp_update_balance(NEW.id_cashbox);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_update_cashbox_fee
AFTER UPDATE ON cashbox_fee
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_collected = IFNULL(total_collected, 0) + (NEW.paid - OLD.paid)
    WHERE id = NEW.id_cashbox
	AND EXISTS (SELECT 1 FROM cashbox WHERE id = NEW.id_cashbox);

    CALL sp_update_balance(NEW.id_cashbox);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_delete_cashbox_fee
AFTER DELETE ON cashbox_fee
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_collected = GREATEST(0, IFNULL(total_collected, 0) - OLD.paid)
    WHERE id = OLD.id_cashbox;

    CALL sp_update_balance(OLD.id_cashbox);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `slot` varchar(4) DEFAULT NULL,
  `status` enum('Activo','EXmiembro') DEFAULT 'EXmiembro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obligation`
--

DROP TABLE IF EXISTS `obligation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obligation` (
  `id_obligacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_obligacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obligation`
--

LOCK TABLES `obligation` WRITE;
/*!40000 ALTER TABLE `obligation` DISABLE KEYS */;
/*!40000 ALTER TABLE `obligation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obligation_member`
--

DROP TABLE IF EXISTS `obligation_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obligation_member` (
  `id_oes` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_obligacion` bigint(20) NOT NULL,
  `id_socio` bigint(20) NOT NULL,
  `monto_asignado_usd` decimal(12,2) NOT NULL DEFAULT 0.00,
  `abonado_usd` decimal(12,2) NOT NULL DEFAULT 0.00,
  `estado` enum('No pagado','Pago parcial','Pagado','Condonado') NOT NULL DEFAULT 'No pagado',
  PRIMARY KEY (`id_oes`),
  UNIQUE KEY `uk_ob_socio` (`id_obligacion`,`id_socio`),
  KEY `id_socio` (`id_socio`),
  CONSTRAINT `obligation_member_ibfk_1` FOREIGN KEY (`id_obligacion`) REFERENCES `obligation` (`id_obligacion`),
  CONSTRAINT `obligation_member_ibfk_2` FOREIGN KEY (`id_socio`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obligation_member`
--

LOCK TABLES `obligation_member` WRITE;
/*!40000 ALTER TABLE `obligation_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `obligation_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id_pago` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_socio` bigint(20) NOT NULL,
  `medio` enum('Efectivo','Transferencia','Otro') NOT NULL DEFAULT 'Otro',
  `monto_total` decimal(12,2) NOT NULL,
  `destinatario_pago` varchar(120) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_socio` (`id_socio`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_fee`
--

DROP TABLE IF EXISTS `payment_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_fee` (
  `id_pago_cuota` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pago` bigint(20) NOT NULL,
  `id_cuota` bigint(20) NOT NULL,
  `monto_aplicado` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_pago_cuota`),
  KEY `id_pago` (`id_pago`),
  KEY `id_cuota` (`id_cuota`),
  CONSTRAINT `payment_fee_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `payment` (`id_pago`),
  CONSTRAINT `payment_fee_ibfk_2` FOREIGN KEY (`id_cuota`) REFERENCES `cashbox_fee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_fee`
--

LOCK TABLES `payment_fee` WRITE;
/*!40000 ALTER TABLE `payment_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_obligation`
--

DROP TABLE IF EXISTS `payment_obligation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_obligation` (
  `id_pago_oes` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pago` bigint(20) NOT NULL,
  `id_oes` bigint(20) NOT NULL,
  `moneda` enum('USD','ARS') NOT NULL DEFAULT 'ARS',
  `monto_original` decimal(12,2) NOT NULL DEFAULT 0.00,
  `cotizacion_usd` decimal(12,2) DEFAULT NULL,
  `monto_usd` decimal(12,2) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_pago_oes`),
  KEY `id_pago` (`id_pago`),
  KEY `id_oes` (`id_oes`),
  CONSTRAINT `payment_obligation_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `payment` (`id_pago`),
  CONSTRAINT `payment_obligation_ibfk_2` FOREIGN KEY (`id_oes`) REFERENCES `obligation_member` (`id_oes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_obligation`
--

LOCK TABLES `payment_obligation` WRITE;
/*!40000 ALTER TABLE `payment_obligation` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_obligation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_cashbox_expense`
--

DROP TABLE IF EXISTS `v_cashbox_expense`;
/*!50001 DROP VIEW IF EXISTS `v_cashbox_expense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_cashbox_expense` AS SELECT 
 1 AS `id_cashbox_expense`,
 1 AS `id_cashbox`,
 1 AS `description`,
 1 AS `amount`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_cashbox_fee`
--

DROP TABLE IF EXISTS `v_cashbox_fee`;
/*!50001 DROP VIEW IF EXISTS `v_cashbox_fee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_cashbox_fee` AS SELECT 
 1 AS `id_cashbox_fee`,
 1 AS `id_cashbox`,
 1 AS `id_member`,
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `slot`,
 1 AS `assigned_amount`,
 1 AS `paid`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'gatedcommunity'
--

--
-- Dumping routines for database 'gatedcommunity'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_debt_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_debt_member`(p_id_member INT) RETURNS double
    DETERMINISTIC
BEGIN
	DECLARE debt DOUBLE;
    SELECT SUM(IFNULL(assigned_amount - IFNULL(paid, 0), 0)) INTO debt
	FROM cashbox_fee
	WHERE id_member = p_id_member AND status <> 'Pagado';
	RETURN IFNULL(debt, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_paid_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_paid_member`(p_id_member INT) RETURNS double
    DETERMINISTIC
BEGIN
	DECLARE total DOUBLE;
	SELECT SUM(IFNULL(paid, 0)) INTO total
	FROM cashbox_fee
	WHERE id_member = p_id_member;
	RETURN IFNULL(total, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_balance`(in p_caja_id INT)
BEGIN
	UPDATE cashbox
    SET total_balance = total_collected - total_spent
    WHERE cashbox.id = p_caja_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_cashbox_expense`
--

/*!50001 DROP VIEW IF EXISTS `v_cashbox_expense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cashbox_expense` AS select `ce`.`id` AS `id_cashbox_expense`,`ce`.`id_cashbox` AS `id_cashbox`,`ce`.`description` AS `description`,`ce`.`amount` AS `amount`,`ce`.`date` AS `date` from `cashbox_expense` `ce` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cashbox_fee`
--

/*!50001 DROP VIEW IF EXISTS `v_cashbox_fee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cashbox_fee` AS select `cf`.`id` AS `id_cashbox_fee`,`cf`.`id_cashbox` AS `id_cashbox`,`m`.`id` AS `id_member`,`m`.`last_name` AS `last_name`,`m`.`first_name` AS `first_name`,`m`.`slot` AS `slot`,`cf`.`assigned_amount` AS `assigned_amount`,`cf`.`paid` AS `paid`,`cf`.`status` AS `status` from (`cashbox_fee` `cf` join `member` `m` on(`cf`.`id_member` = `m`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29  1:10:38
