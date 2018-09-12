CREATE DATABASE  IF NOT EXISTS `dbserpiloee` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbserpiloee`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbserpiloee
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `atividadeserp`
--

DROP TABLE IF EXISTS `atividadeserp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadeserp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `setor` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=26157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atividadesmaquinas`
--

DROP TABLE IF EXISTS `atividadesmaquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividadesmaquinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `maquina` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maq_idx` (`maquina`),
  KEY `codigo_idx` (`codigo`),
  CONSTRAINT `codigo` FOREIGN KEY (`codigo`) REFERENCES `atividadeserp` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_maquina_atividadesmaquinas` FOREIGN KEY (`maquina`) REFERENCES `maquinas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maquina` tinyint(4) NOT NULL,
  `inicio` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `motivo` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`inicio`),
  KEY `idMaquina_idx` (`maquina`),
  KEY `fk_motivo_idx` (`motivo`),
  CONSTRAINT `id_maquina_eventos` FOREIGN KEY (`maquina`) REFERENCES `maquinas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_motivo` FOREIGN KEY (`motivo`) REFERENCES `tiposparadas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itensops`
--

DROP TABLE IF EXISTS `itensops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itensops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_op` int(11) NOT NULL,
  `atividade` smallint(6) NOT NULL,
  `quantidadeDemandada` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_op_idx` (`id_op`),
  CONSTRAINT `id_op` FOREIGN KEY (`id_op`) REFERENCES `ops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=183552 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maquinas`
--

DROP TABLE IF EXISTS `maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maquinas` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `capacidadeNominal` int(11) NOT NULL,
  `escalaCapacidade` int(11) NOT NULL DEFAULT '1',
  `unidade` varchar(10) NOT NULL,
  `setor` varchar(10) NOT NULL,
  `timeoutProducao` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao_UNIQUE` (`descricao`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ops`
--

DROP TABLE IF EXISTS `ops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `descricao` varchar(105) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=82085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registroitemop`
--

DROP TABLE IF EXISTS `registroitemop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registroitemop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `id_itemop` int(11) NOT NULL,
  `id_maquina` tinyint(4) NOT NULL DEFAULT '1',
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_itemop_idx` (`id_itemop`),
  KEY `id_maquina_idx` (`id_maquina`),
  CONSTRAINT `id_itemop` FOREIGN KEY (`id_itemop`) REFERENCES `itensops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_maquina_registroitemop` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4630 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registroproducao`
--

DROP TABLE IF EXISTS `registroproducao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registroproducao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `maquina_id` tinyint(4) NOT NULL,
  `itemop_id` int(11) DEFAULT NULL,
  `produzido` mediumint(9) NOT NULL DEFAULT '0',
  `descartado` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `maquina_idx` (`maquina_id`),
  CONSTRAINT `id_maquina_registroproducao` FOREIGN KEY (`maquina_id`) REFERENCES `maquinas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiposparadas`
--

DROP TABLE IF EXISTS `tiposparadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposparadas` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(25) NOT NULL,
  `setor` varchar(10) NOT NULL,
  `oculto` int(11) NOT NULL DEFAULT '0',
  `statusMaquina` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao_UNIQUE` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maquina` tinyint(4) NOT NULL,
  `inicio` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `fim` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`,`inicio`,`fim`),
  KEY `maquina_idx` (`maquina`),
  CONSTRAINT `id_maquina_turnos` FOREIGN KEY (`maquina`) REFERENCES `maquinas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'dbserpiloee'
--

--
-- Dumping routines for database 'dbserpiloee'
--
/*!50003 DROP FUNCTION IF EXISTS `atualizaTurnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `atualizaTurnos`(maq int) RETURNS int(11)
BEGIN
	DECLARE inicioTurno1 datetime;
	DECLARE fimTurno1 datetime;
	DECLARE inicioTurno2 datetime;
	DECLARE fimTurno2 datetime;
    DECLARE v_counter INT;
    SET v_counter = 0;
    
	while v_counter < 8 do
    
        SET inicioTurno1 = CONCAT(date(DATE_ADD(CURDATE(), INTERVAL v_counter DAY)), ' ', '07:12:00');
		set fimTurno1 = CONCAT(date(DATE_ADD(CURDATE(), INTERVAL v_counter DAY)), ' ', '11:30:00');
		SET inicioTurno2 = CONCAT(date(DATE_ADD(CURDATE(), INTERVAL v_counter DAY)), ' ', '13:00:00');
		set fimTurno2 = CONCAT(date(DATE_ADD(CURDATE(), INTERVAL v_counter DAY)), ' ', '17:30:00');
    
		IF (SELECT COUNT(*) FROM turnos WHERE inicio between date(DATE_ADD(CURDATE(), INTERVAL v_counter DAY)) and date(DATE_ADD(CURDATE(), INTERVAL v_counter+1 DAY)) AND  
        maquina = maq) = 0 AND (select DAYOFWEEK(DATE_ADD(CURDATE(), INTERVAL v_counter DAY)) between 2 and 6) = 1 THEN
			INSERT INTO turnos(maquina, inicio, fim) values(maq, inicioTurno1, fimTurno1);
			INSERT INTO turnos(maquina, inicio, fim) values(maq, inicioTurno2, fimTurno2);
		END IF;
        
        set v_counter=v_counter+1;
    end while;
    
RETURN ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `finalizarOp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `finalizarOp`(maq INT, op varchar(20)) RETURNS int(11)
BEGIN
	
    DECLARE idResultado INT;
    
    SET idResultado = (select id_itemop from registroitemop where id_maquina = maq order by id desc limit 1);
    INSERT INTO dbserpiloee.eventos(maquina, inicio, motivo) value(maq, now(), (select id from tiposParadas where descricao = 'Fim de OP'));
    INSERT INTO dbserpiloee.registroitemop(timestamp, id_itemop, id_maquina, tipo) value(now(),idResultado , maq, 2);
    
    RETURN ROW_COUNT();
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `iniciarOp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `iniciarOp`(maq INT, op varchar(20)) RETURNS int(11)
BEGIN
    INSERT INTO dbserpiloee.eventos(maquina, inicio, motivo) value(maq, now(), (select id from tiposParadas where descricao = 'Inicio de OP'));
    INSERT INTO dbserpiloee.registroitemop(timestamp, id_itemop, id_maquina, tipo) value(now(), (SELECT itensops.id FROM itensops INNER JOIN atividadesmaquinas ON itensops.atividade = atividadesmaquinas.codigo  where itensops.id_op = (select id from ops where codigo = op) and atividadesmaquinas.maquina = maq), maq, 1);
    
    RETURN ROW_COUNT();
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `iniciarOPSemAtividade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `iniciarOPSemAtividade`(maq INT, op varchar(20)) RETURNS int(11)
BEGIN
    
    INSERT INTO dbserpiloee.eventos(maquina, inicio, motivo) value(maq, now(), (select id from tiposParadas where descricao = 'Inicio de OP'));
    INSERT INTO itensops(id_op, atividade, quantidadedemandada) values((select id from ops where codigo = op), -1, 0);
    INSERT INTO dbserpiloee.registroitemop(timestamp, id_itemop, id_maquina, tipo) value(now(), LAST_INSERT_ID(), maq, 1);
		
    RETURN ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculaOEE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `calculaOEE`(maq INT, data1 date, data2 date)
BEGIN
	# Variáveis disponibilidade
	DECLARE tempoProgramado INT;
	DECLARE tempoPerdasDisp INT;
	DECLARE tempoProduzindo INT;

    # Variáveis produtividade
    DECLARE capacidadeNom INT;
    DECLARE producaoTeorica INT;
    DECLARE producaoReal INT;
    
    # Variáveis qualidade
    DECLARE pecasRuins INT;
    DECLARE pecasBoas INT;
    DECLARE retrabalho INT;
    
    # Variáveis OEE
    DECLARE disponibilidade INT;
    DECLARE produtividade INT;
    DECLARE qualidade INT;
    DECLARE oee INT;
    
    DECLARE nome varchar(30);
    DECLARE un varchar(30);
    
    
################## 			Calculo da disponibilidade			################################################
	# Tempo turno
	SET tempoProgramado = 
		(SELECT 
			COALESCE(SUM(TIMESTAMPDIFF(MINUTE,
						inicio,
						IF(NOW() BETWEEN inicio AND fim,
							NOW(),
							fim))),
					0) AS tempoProgramado
		FROM
			turnos
		WHERE
			maquina = maq
				AND DATE(inicio) BETWEEN data1 AND data2
				AND inicio < NOW());

    # Tempo perdas disponibilidade (setup, manutenção, limpeza)
    SET tempoPerdasDisp = 
		(SELECT 
			COALESCE(SUM((TIMESTAMPDIFF(MINUTE,
						e.inicio,
						(IF(COALESCE((SELECT 
											inicio
										FROM
											eventos
										WHERE
											id > e.id AND e.maquina = maquina
										ORDER BY id
										LIMIT 1),
									NOW()) > turno.fim,
							turno.fim,
							COALESCE((SELECT 
											inicio
										FROM
											eventos
										WHERE
											id > e.id AND e.maquina = maquina
										ORDER BY id
										LIMIT 1),
									NOW())))))),
					0)
		FROM
			eventos AS e
				INNER JOIN
			turnos AS turno ON e.inicio BETWEEN turno.inicio AND turno.fim
				AND turno.maquina = e.maquina
				AND e.motivo <> (SELECT 
					id
				FROM
					tiposparadas
				WHERE
					descricao = 'Inicio de OP')
				AND e.motivo <> (SELECT 
					id
				FROM
					tiposparadas
				WHERE
					descricao = 'Fim de OP')
				AND e.maquina = maq
				AND e.inicio < turno.fim
				AND DATE(e.inicio) BETWEEN data1 AND data2);
    
	# Tempo produzindo
	SET tempoProduzindo = tempoProgramado - tempoPerdasDisp;
	
    ###### Disponibilidade ######
    SET disponibilidade = COALESCE(cast((tempoProduzindo/tempoProgramado) * 100 AS UNSIGNED), 0);

################## 			Calculo produtividade			#########################################################
	# Capacidade nominal
	SET capacidadeNom = 
    (SELECT 
		COALESCE(capacidadeNominal/escalaCapacidade, 0) AS capacidadeNom
	FROM
		maquinas
	WHERE
		id = maq);

	# Produção teórica
	SET producaoTeorica = (capacidadeNom * tempoProduzindo)/60;

    # Produção real
    SET producaoReal = 	
    (SELECT 
		(COALESCE(SUM(produzido), 0)/(select escalaCapacidade from maquinas where id = maq))
	FROM
		registroproducao
	WHERE
		maquina_id = maq
			AND DATE(time) BETWEEN data1 AND data2);

	###### Produtividade ######
	SET produtividade = COALESCE(cast(producaoReal/producaoTeorica * 100 AS UNSIGNED), 0);

################## 			Calculo qualidade			##########################################################
SET pecasRuins = 0;
    
SET retrabalho = 0;

SET pecasBoas = producaoReal - pecasRuins - retrabalho;

SET qualidade =  100;

################## 			OEE			##########################################################################	

SET oee = COALESCE(((disponibilidade/100) * (produtividade/100) * (qualidade/100)*100), 0);

SET nome = 
	(SELECT 
		descricao
	FROM
		maquinas
	WHERE
		id = maq);
        
SET un = 
	(SELECT 
		unidade
	FROM
		maquinas
	WHERE
		id = maq);

    # Return
    select 
		# Dados OEE
		maq as idmaquinanome, nome, un, oee, disponibilidade, produtividade, qualidade,
		# Dados disponibilidade
		tempoProgramado, tempoPerdasDisp, tempoProduzindo,
       # Dados produtividade
       capacidadeNom, producaoTeorica, producaoReal,
       # Dados qualidade
       pecasBoas, pecasRuins, retrabalho
       ;

       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 16:14:42
