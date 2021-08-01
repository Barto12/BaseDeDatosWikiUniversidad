CREATE DATABASE  IF NOT EXISTS `wiki_tsu` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wiki_tsu`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: wiki_tsu
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
-- Table structure for table `acls`
--

DROP TABLE IF EXISTS `acls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acls` (
  `pagina_etiqueta` varchar(100) NOT NULL,
  `leer_acl` text NOT NULL,
  `escribir_acl` text NOT NULL,
  `comentar_leer_acl` text NOT NULL,
  `comentar_post_acl` text NOT NULL,
  `paginas_idpaginas` int NOT NULL,
  PRIMARY KEY (`pagina_etiqueta`,`paginas_idpaginas`),
  KEY `fk_acls_paginas1_idx` (`paginas_idpaginas`),
  CONSTRAINT `fk_acls_paginas1` FOREIGN KEY (`paginas_idpaginas`) REFERENCES `paginas` (`idpaginas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls`
--

LOCK TABLES `acls` WRITE;
/*!40000 ALTER TABLE `acls` DISABLE KEYS */;
INSERT INTO `acls` VALUES ('hoteles','1','1','1','1',3),('manufactura','1','1','1','1',5),('restaurantes','1','1','1','1',4),('software','1','1','1','1',1),('software','1','0','1','1',2);
/*!40000 ALTER TABLE `acls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `id actividad` int NOT NULL AUTO_INCREMENT,
  `tipo de actividad` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `paginas_idpaginas` int NOT NULL,
  `paginas_comentarios_idcomentarios` int NOT NULL,
  `comentarios_idcomentarios` int NOT NULL,
  PRIMARY KEY (`id actividad`,`paginas_idpaginas`,`paginas_comentarios_idcomentarios`,`comentarios_idcomentarios`),
  KEY `fk_Actividades_paginas1_idx` (`paginas_idpaginas`,`paginas_comentarios_idcomentarios`),
  KEY `fk_Actividades_comentarios1_idx` (`comentarios_idcomentarios`),
  CONSTRAINT `fk_Actividades_comentarios1` FOREIGN KEY (`comentarios_idcomentarios`) REFERENCES `comentarios` (`idcomentarios`),
  CONSTRAINT `fk_Actividades_paginas1` FOREIGN KEY (`paginas_idpaginas`, `paginas_comentarios_idcomentarios`) REFERENCES `paginas` (`idpaginas`, `comentarios_idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,'lectura','programar en java','leer el capitulo ','2013-11-24',1,1,1),(2,'lectura','programar en python','hacer resumen del capitulo 2','2013-11-24',2,2,2),(3,'lectura','programar en c','hacer el ejercicio de la pagina 43','2013-11-24',3,3,3),(4,'investigación','historia del hotel regis','hacer una investigación del hotel regis','2013-11-24',4,4,4),(5,'investigacion','historia de los restaurantes','hacer una investigacion de la historia de los restaurantes','2013-11-24',5,5,5),(6,'investigacion','historia de la administración','hacer un mapa conceptual ','2013-11-24',6,6,6),(7,'visita ','visita al corporativo de microsoft','visitaremos el corporativo de microsoft el lunes 20 de noviembre','2013-11-24',7,7,7),(8,'visita','visita al hotel sheraton santa fe','visita al hotel sheraton santa fe el marte 24 de octubre','2013-11-24',8,8,8),(9,'visita','visita a general elctric','visita a general electric','2013-11-24',9,9,9),(10,'visita','visita a rocher','visita a rocher','2013-11-24',10,10,10);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id carrera` int NOT NULL,
  `programa` varchar(100) NOT NULL,
  `wiki_tsu usuarios_id usuario` int NOT NULL,
  PRIMARY KEY (`id alumno`,`wiki_tsu usuarios_id usuario`),
  KEY `fk_alumnos_wiki_tsu usuarios1_idx` (`wiki_tsu usuarios_id usuario`),
  CONSTRAINT `fk_alumnos_wiki_tsu usuarios1` FOREIGN KEY (`wiki_tsu usuarios_id usuario`) REFERENCES `wiki_tsu usuarios` (`id usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'mario ',100,'TSU',1),(2,'maria',100,'TSU',2),(3,'eutanasio',100,'TSU',3),(4,'fernanda',100,'TSU',4),(5,'sandra',100,'TSU',5),(6,'josue',100,'TSU',6),(7,'miguel',100,'TSU',7),(8,'lucia',100,'TSU',8),(9,'manuel ',100,'TSU',9),(10,'esmeralda',100,'TSU',10),(11,'teresa',200,'TSU',11),(12,'carlos',200,'TSU',12),(13,'david',200,'TSU',13),(14,'hiram',200,'TSU',14),(15,'jacob',200,'TSU',15),(16,'sara',200,'TSU',16),(17,'andres',200,'TSU',17),(18,'andrea',200,'TSU',18),(19,'miguel',300,'TSU',19),(20,'maria jose',300,'TSU',20),(21,'eduardo',300,'TSU',21),(22,'rogelio',300,'TSU',22),(23,'joaquin',300,'TSU',23),(24,'patricia',300,'TSU',24),(25,'anastasia',300,'TSU',25),(26,'santos',400,'TSU',26),(27,'geovani',400,'TSU',27),(28,'jan',400,'TSU',28),(29,'janette',400,'TSU',29),(30,'ray',400,'TSU',30),(31,'soraya',500,'TSU',31),(32,'melesiio',500,'TSU',32),(33,'mayra',500,'TSU',33),(34,'andrea',500,'TSU',34),(35,'andres',600,'TSU',35),(36,'fernando',600,'TSU',36),(37,'ivette',700,'TSU',37),(38,'fernanda',700,'TSU',38),(39,'eric',700,'TSU',39),(40,'irvin',800,'TSU',40);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int NOT NULL AUTO_INCREMENT,
  `pagina_etiqueta` varchar(100) NOT NULL,
  `hora` datetime NOT NULL,
  `comentario` text NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `parent` int NOT NULL,
  `status` enum('borrado') NOT NULL,
  PRIMARY KEY (`idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'w','2013-11-24 17:15:10','test','admin',1,'borrado'),(2,'s','2013-11-24 17:15:10','test','admin',1,'borrado'),(3,'d','2013-11-24 17:15:10','test','admin',1,'borrado'),(4,'f','2013-11-24 17:15:10','test','admin',1,'borrado'),(5,'g','2013-11-24 17:15:10','test','admin',1,'borrado'),(6,'h','2013-11-24 17:15:10','test','admin',1,'borrado'),(7,'j','2013-11-24 17:15:10','test','admin',1,'borrado'),(8,'iy','2013-11-24 17:15:10','test','admin',1,'borrado'),(9,'e','2013-11-24 17:15:10','test','admin',1,'borrado'),(10,'q','2013-11-24 17:15:10','test','admin',1,'borrado'),(11,'a','2013-11-24 17:15:10','test','admin',1,'borrado'),(12,'x','2013-11-24 17:15:10','test','admin',1,'borrado'),(13,'za','2013-11-24 17:15:10','test','admin',1,'borrado'),(14,'sd','2013-11-24 17:15:10','test','admin',1,'borrado'),(15,'er','2013-11-24 17:15:10','test','admin',1,'borrado'),(16,'gh','2013-11-24 17:15:10','test','admin',1,'borrado'),(17,'jh','2013-11-24 17:15:10','test','admin',1,'borrado'),(18,'df','2013-11-24 17:15:10','test','admin',1,'borrado'),(19,'cv','2013-11-24 17:15:10','test','admin',1,'borrado'),(20,'fg','2013-11-24 17:15:10','test','admin',1,'borrado');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `id material` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `indice de materiales` tinyint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `audio` varchar(45) NOT NULL,
  `materialescol` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `paginas_idpaginas` int NOT NULL,
  `paginas_comentarios_idcomentarios` int NOT NULL,
  `comentarios_idcomentarios` int NOT NULL,
  PRIMARY KEY (`id material`,`paginas_idpaginas`,`paginas_comentarios_idcomentarios`,`comentarios_idcomentarios`),
  KEY `fk_materiales_paginas1_idx` (`paginas_idpaginas`,`paginas_comentarios_idcomentarios`),
  KEY `fk_materiales_comentarios1_idx` (`comentarios_idcomentarios`),
  CONSTRAINT `fk_materiales_comentarios1` FOREIGN KEY (`comentarios_idcomentarios`) REFERENCES `comentarios` (`idcomentarios`),
  CONSTRAINT `fk_materiales_paginas1` FOREIGN KEY (`paginas_idpaginas`, `paginas_comentarios_idcomentarios`) REFERENCES `paginas` (`idpaginas`, `comentarios_idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
INSERT INTO `materiales` VALUES (1,'libro','2020-01-12 00:00:00',1,'programar en python ','libro para principiantes que deseen programar en python','shorturl.at/quCD4','shorturl.at/quCD4','shorturl.at/quCD4',1,1,1),(2,'libro','2020-01-12 00:00:00',2,'hoteles en mexico','hoteles del pais','shorturl.at/psFNY','shorturl.at/psFNY','shorturl.at/psFNY',2,2,2),(3,'libro','2020-02-05 00:00:00',3,'diseño de posters','como diseñar posters','shorturl.at/glDH0','shorturl.at/glDH0','shorturl.at/glDH0',3,3,3),(4,'libro','2020-03-09 00:00:00',4,'manufactura','manufactura en mexico','shorturl.at/nACU0','shorturl.at/nACU0','shorturl.at/nACU0',4,4,4),(5,'libro','2020-05-09 00:00:00',5,'gestion de proyectos en la cdmx','proyectos de interes social en la cdmx','shorturl.at/ixMS0','shorturl.at/ixMS0','shorturl.at/ixMS0',5,5,5);
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros`
--

DROP TABLE IF EXISTS `miembros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros` (
  `id miembro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `no_miembro` int NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `edad` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `matricula` varchar(100) NOT NULL,
  `TSU_id tsu` int NOT NULL,
  `TSU_tsu_carreras_id carrera` int NOT NULL,
  `alumnos_id alumno` int NOT NULL,
  `profesores_id profesor` int NOT NULL,
  PRIMARY KEY (`id miembro`,`TSU_id tsu`,`TSU_tsu_carreras_id carrera`,`alumnos_id alumno`,`profesores_id profesor`),
  KEY `fk_miembros_TSU1_idx` (`TSU_id tsu`,`TSU_tsu_carreras_id carrera`),
  KEY `fk_miembros_alumnos1_idx` (`alumnos_id alumno`),
  KEY `fk_miembros_profesores1_idx` (`profesores_id profesor`),
  CONSTRAINT `fk_miembros_alumnos1` FOREIGN KEY (`alumnos_id alumno`) REFERENCES `alumnos` (`id alumno`),
  CONSTRAINT `fk_miembros_profesores1` FOREIGN KEY (`profesores_id profesor`) REFERENCES `profesores` (`id profesor`),
  CONSTRAINT `fk_miembros_TSU1` FOREIGN KEY (`TSU_id tsu`, `TSU_tsu_carreras_id carrera`) REFERENCES `tsu` (`id tsu`, `tsu_carreras_id carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros`
--

LOCK TABLES `miembros` WRITE;
/*!40000 ALTER TABLE `miembros` DISABLE KEYS */;
INSERT INTO `miembros` VALUES (1,'mario',1,'hernandez',20,'alumno','q@yahoo.com','7464738','a2182738',150,100,1,1),(2,'maria',2,'anaya',21,'alumno','fr@gmail.com','7362784','a2345928',150,100,2,2),(3,'eutanasio',3,'rodriguez',22,'alumno','ju@outlook.com','2637482','a2395924',150,100,3,3),(4,'fernanda',4,'zapata',24,'alumno','ij@hotmail.com','2637492','a1389585',150,100,4,4),(5,'sandra',5,'segovia',26,'alumno','ui@hotmail.com','5473726','a3858682',150,100,5,5),(6,'josue',6,'sanchez',20,'alumno','req@yahoo.com.mx','7498372','a3859603',150,100,6,6),(7,'miguel',7,'wertz',19,'alumno','hiqsd@hotmail.com','3648372','a4859683',150,100,7,7),(8,'lucia',8,'madrigal',18,'alumno','gfh@hotmail.com','7373628','a3959693',150,100,8,8),(9,'manuel',9,'obrador',33,'alumno','gq@gmail.com','7364652','a4869820',150,100,9,9),(10,'esmeralda',10,'segura',32,'alumno','jahs@yahoo.com','7463527','a8957839',150,100,10,10),(11,'teresa',11,'leon',28,'alumno','jhagy@yahoo.com','7362529','a9586839',160,200,11,11),(12,'carlos',12,'garcia',23,'alumno','ji@gmail.com','6837636','a8759583',160,200,12,12),(13,'david',13,'cepeda',24,'alumno','hot@gmail.com','6475872','a6758693',160,200,13,13),(14,'hiram',14,'rosas',25,'alumno','huy@hotmail.com','4364862','a8595038',160,200,14,14),(15,'jacob',15,'solorzano',35,'alumno','fer@gmail.com','8484635','a7585938',160,200,15,15),(16,'sara',16,'salgado',24,'alumno','nz@gmail.com','6453839','a7598593',160,200,16,16),(17,'andres',17,'alanis',34,'alumno','sna@gmail.com','8363628','a6748595',160,200,17,17),(18,'andrea',18,'azpeitia',23,'alumno','g@uia.mx','7694639','a3848698',160,200,18,18),(19,'miguel',19,'gurwitz',34,'alumno','qua@uia.mx','8736358','a3848508',170,300,19,19),(20,'maria jose',20,'hernandez',22,'alumno','jahsd@hotmail.com','8383726','a7498573',170,300,20,20);
/*!40000 ALTER TABLE `miembros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `etiqueta`,
 1 AS `COUNT(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paginas`
--

DROP TABLE IF EXISTS `paginas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paginas` (
  `idpaginas` int NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(100) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `hora` datetime NOT NULL,
  `cuerpo` text NOT NULL,
  `autor` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `ultimo` enum('Y','N') NOT NULL,
  `nota` varchar(100) NOT NULL,
  `comentarios_idcomentarios` int NOT NULL,
  PRIMARY KEY (`idpaginas`,`comentarios_idcomentarios`),
  KEY `fk_paginas_comentarios1_idx` (`comentarios_idcomentarios`),
  CONSTRAINT `fk_paginas_comentarios1` FOREIGN KEY (`comentarios_idcomentarios`) REFERENCES `comentarios` (`idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paginas`
--

LOCK TABLES `paginas` WRITE;
/*!40000 ALTER TABLE `paginas` DISABLE KEYS */;
INSERT INTO `paginas` VALUES (1,'software','programar en java','2013-11-24 17:15:10','test','admin','admin ','Y','test',1),(2,'software','programar en c','2013-11-24 17:15:10','test','admin','admin','Y','test',2),(3,'hoteles','administracion hotelera','2013-11-24 17:15:10','test','admin','admin','Y','test',3),(4,'restaurantes','administracion de restaurantes','2013-11-24 17:15:10','test','admin','admin','Y','test',4),(5,'manufactura','procesos y manufactura','2013-11-24 17:15:10','test','admin','admin','Y','test',5),(6,'produccion audiovisuall','diseño','2013-11-24 17:15:10','test','admin','admin','Y','test',6),(7,'gestion de proyectos sociales','sociedades ','2013-11-24 17:15:10','test','admin','admin','Y','test',7),(8,'gestion de proyectos sociales','comunidades','2013-11-24 17:15:10','test','admin','admin','Y','test',8),(9,'software','programar en python','2013-11-24 17:15:10','test','admin','admin','Y','test',9),(10,'manufactura','industrias ','2013-11-24 17:15:10','test','admin','admin','Y','test',10),(11,'procesos ','procesos productivos','2013-11-24 17:15:10','test','admin','admin','Y','test',11),(12,'mecatronica','robots','2013-11-24 17:15:10','test','admin','admin','Y','test',12),(13,'mecatronica','robots en la industria 4.0','2013-11-24 17:15:10','test','admin','admin','Y','test',13),(14,'administración','hoteleria y vinos','2013-11-24 17:15:10','test','admin','admin','Y','test',14),(15,'software','programar en R','2013-11-24 17:15:10','test','admin','admin','Y','test',15),(16,'hoteles y restaurantes','vinos','2013-11-24 17:15:10','test','admin','admin','Y','test',16),(17,'produccion grafica','pintura','2013-11-24 17:15:10','test','admin','admin','Y','test',17),(18,'software','programar arduino','2013-11-24 17:15:10','test','admin','admin','Y','test',18),(19,'software','programar en scala','2013-11-24 17:15:10','test','admin','admin','Y','test',19),(20,'produccion audiovisual','diseño de posters','2013-11-24 17:15:10','test','admin','admin','Y','test',20);
/*!40000 ALTER TABLE `paginas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id profesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `programa` varchar(45) DEFAULT NULL,
  `wiki_tsu usuarios_id usuario` int NOT NULL,
  PRIMARY KEY (`id profesor`,`wiki_tsu usuarios_id usuario`),
  KEY `fk_profesores_wiki_tsu usuarios1_idx` (`wiki_tsu usuarios_id usuario`),
  CONSTRAINT `fk_profesores_wiki_tsu usuarios1` FOREIGN KEY (`wiki_tsu usuarios_id usuario`) REFERENCES `wiki_tsu usuarios` (`id usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'alberto fernandez','TSU',41),(2,'maria rodriguez','TSU',42),(3,'asuncion perez','TSU',43),(4,'sara mendoza','TSU',44),(5,'saul rodriguez ','TSU',45),(6,'mario canales','TSU',46),(7,'alberta zaragoza','TSU',47),(8,'fernanda rodriguez','TSU',48),(9,'asuncion aramburuzabala','TSU',49),(10,'carlos slim','TSU',50),(11,'mario moreno','TSU',51),(12,'stefan arguten','TSU',52),(13,'joaquin hernandez','TSU',53),(14,'axayacatl zempoala','TSU',54),(15,'fard sanchez','TSU',55),(16,'daniela zaragoza','TSU',56),(17,'mario cantiinflas','TSu',57),(18,'melesio zacapoaxcatla','TSu',58),(19,'selena quintanilla','TSu',59),(20,'seymour skinner','TSu',60);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programas` (
  `id programa` int NOT NULL AUTO_INCREMENT,
  `tipo de programa` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `plan de estudio` varchar(100) NOT NULL,
  `paginas_idpaginas` int NOT NULL,
  `paginas_comentarios_idcomentarios` int NOT NULL,
  `comentarios_idcomentarios` int NOT NULL,
  PRIMARY KEY (`id programa`,`paginas_idpaginas`,`paginas_comentarios_idcomentarios`,`comentarios_idcomentarios`),
  KEY `fk_programas_paginas1_idx` (`paginas_idpaginas`,`paginas_comentarios_idcomentarios`),
  KEY `fk_programas_comentarios1_idx` (`comentarios_idcomentarios`),
  CONSTRAINT `fk_programas_comentarios1` FOREIGN KEY (`comentarios_idcomentarios`) REFERENCES `comentarios` (`idcomentarios`),
  CONSTRAINT `fk_programas_paginas1` FOREIGN KEY (`paginas_idpaginas`, `paginas_comentarios_idcomentarios`) REFERENCES `paginas` (`idpaginas`, `comentarios_idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES (1,'certificacion powerapps microsoft','2020-02-16 00:00:00','certificacion oficial powerapps',' desarrollador power apps de microsoft ','duracion 4 meses ',1,1,1),(2,'certificacion hotelera w','2020-03-04 00:00:00','certificate como profesional del ramo hotelero con sheraton hotels','certificacion oficial de sheraton hotels.',' duracion 3 meses',2,2,2),(3,'certificacion adobe designer','2020-06-09 00:00:00','certificacion oficial adobe designer ','certificacion oficial de adobe.',' duracion 5 meses',3,3,3),(4,'certificacion industria 4.0','2020-07-08 00:00:00','certificacion industria 4.0 ','certificacion ford 4.0','duracion 6 meses',4,4,4),(5,'certificacion como gestor de proyectos sociales','2020-08-15 00:00:00','certificacion de gestor de proyectos sociales','certificacion internacional onu','duracion 7 meses',5,5,5);
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos infograficos`
--

DROP TABLE IF EXISTS `recursos infograficos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursos infograficos` (
  `id recurso` int NOT NULL AUTO_INCREMENT,
  `tipo de recurso` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `autor` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagenes` varchar(100) NOT NULL,
  `recursos relacionados` varchar(100) NOT NULL,
  `paginas_idpaginas` int NOT NULL,
  `paginas_comentarios_idcomentarios` int NOT NULL,
  `comentarios_idcomentarios` int NOT NULL,
  PRIMARY KEY (`id recurso`,`paginas_idpaginas`,`paginas_comentarios_idcomentarios`,`comentarios_idcomentarios`),
  KEY `fk_recursos infograficos_paginas1_idx` (`paginas_idpaginas`,`paginas_comentarios_idcomentarios`),
  KEY `fk_recursos infograficos_comentarios1_idx` (`comentarios_idcomentarios`),
  CONSTRAINT `fk_recursos infograficos_comentarios1` FOREIGN KEY (`comentarios_idcomentarios`) REFERENCES `comentarios` (`idcomentarios`),
  CONSTRAINT `fk_recursos infograficos_paginas1` FOREIGN KEY (`paginas_idpaginas`, `paginas_comentarios_idcomentarios`) REFERENCES `paginas` (`idpaginas`, `comentarios_idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos infograficos`
--

LOCK TABLES `recursos infograficos` WRITE;
/*!40000 ALTER TABLE `recursos infograficos` DISABLE KEYS */;
INSERT INTO `recursos infograficos` VALUES (1,'imagen','2020-01-02 00:00:00','admin','computadora','shorturl.at/ehoH0','shorturl.at/aijnA',1,1,1),(2,'imagen','2020-02-02 00:00:00','admin','hoteles','shorturl.at/sNS23','shorturl.at/jtI19',2,2,2),(3,'imagen','2020-03-02 00:00:00','admin','manufactura','shorturl.at/bSUZ3','shorturl.at/lJLQW',3,3,3),(4,'imagen','2020-06-07 00:00:00','admin','diseño grafico ','shorturl.at/aotLT','shorturl.at/rENRZ',4,4,4),(5,'imagen','1999-09-07 00:00:00','admin','proyectos sociales','shorturl.at/bgjX0','shorturl.at/tuxI6',5,5,5);
/*!40000 ALTER TABLE `recursos infograficos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `idsesion` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `sesion_iniciada` tinyint NOT NULL,
  `id alumno` int NOT NULL,
  `id profesor` int NOT NULL,
  `acls_pagina_etiqueta` varchar(100) NOT NULL,
  PRIMARY KEY (`idsesion`,`acls_pagina_etiqueta`),
  KEY `fk_sesiones_acls1_idx` (`acls_pagina_etiqueta`),
  CONSTRAINT `fk_sesiones_acls1` FOREIGN KEY (`acls_pagina_etiqueta`) REFERENCES `acls` (`pagina_etiqueta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (1,1,1,1,1,'hoteles'),(2,2,1,2,2,'manufactura'),(3,3,1,3,3,'restaurantes'),(4,4,1,4,4,'software '),(5,5,1,5,5,'software');
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temas` (
  `id tema` int NOT NULL AUTO_INCREMENT,
  `tipo de tema` varchar(100) NOT NULL,
  `nombre de tema` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `nombre del articulo` varchar(100) NOT NULL,
  `descripcion del articulo` varchar(100) NOT NULL,
  `referencias` varchar(100) NOT NULL,
  `articulos relacionados` varchar(100) NOT NULL,
  `paginas_idpaginas` int NOT NULL,
  `paginas_comentarios_idcomentarios` int NOT NULL,
  PRIMARY KEY (`id tema`,`paginas_idpaginas`,`paginas_comentarios_idcomentarios`),
  KEY `fk_temas_paginas1_idx` (`paginas_idpaginas`,`paginas_comentarios_idcomentarios`),
  CONSTRAINT `fk_temas_paginas1` FOREIGN KEY (`paginas_idpaginas`, `paginas_comentarios_idcomentarios`) REFERENCES `paginas` (`idpaginas`, `comentarios_idcomentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
INSERT INTO `temas` VALUES (1,'software','arduino','admin','programar en arduino','articulo sobre arduino','shorturl.at/hvJR9','programar en java',1,1),(2,'hoteles','marketing para hoteles','admin','redes sociales en la hoteleria','articulo sobre marketing en la hoteleria','shorturl.at/hEZ05','hoteles y vinos',2,2),(3,'restaurantes','comtabilidad para restaurantes','admin','administrar las finanzas de un restaurante','articulo sobre finanzas de un restaurante','shorturl.at/fhsCE','finanzas ',3,3),(4,'produccion grafica','diseño de cahjas','admin','diseño y embalaje','diseño de cajas y embalaje','hshorturl.at/jnrK1','diseño',4,4),(5,'mecatronica','industria 4.0','admin','robots en la industria automotriz','industria 4.0 ','shorturl.at/cxzOX','automotriz',5,5),(6,'gestion proyectos sociales','dif ','admin','cuidado del infante','desarrollo integral de la familia','shorturl.at/bwBPX','comunidades',6,6);
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsu`
--

DROP TABLE IF EXISTS `tsu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsu` (
  `id tsu` int NOT NULL AUTO_INCREMENT,
  `nombre programa` varchar(45) NOT NULL,
  `tipo de programa` varchar(45) NOT NULL,
  `carreras` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tsu_carreras_id carrera` int NOT NULL,
  PRIMARY KEY (`id tsu`,`tsu_carreras_id carrera`),
  KEY `fk_TSU_tsu_carreras1_idx` (`tsu_carreras_id carrera`),
  CONSTRAINT `fk_TSU_tsu_carreras1` FOREIGN KEY (`tsu_carreras_id carrera`) REFERENCES `tsu_carreras` (`id carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsu`
--

LOCK TABLES `tsu` WRITE;
/*!40000 ALTER TABLE `tsu` DISABLE KEYS */;
INSERT INTO `tsu` VALUES (150,'TSU ','vespertino','tsu software','tecnico superior universitario en software',100),(160,'TSU','vespertino','tsu hoteles y restaurantes','tecnico superior universitario en hoteles y restaurantes',200),(170,'TSU','vespertino','tsu produccion grafica','tecnico superior universitario en produccion grafica',300),(180,'TSU ','vespertino','tsu gestion de proyectos sociales','tecnico superior universitario en gestion de proyectos sociales',400),(190,'TSU','vespertino','tsu manufactura','tecnico superior  universitario en manufactura ',500),(200,'TSU','vespertino','tsu produccion audiovisual','tecnico superior universitario en produccion audiovisual ',600),(210,'TSU','matutino','tsu mecatronica','tecnico superior universitario en mecatronica',700),(220,'TSU','matutino','tsu procesos de produccion','tecnico superior universitario en procesos de produccion',800),(230,'TSU','matutino','tsu mantenimiento industrial','tecnico superior universitario en mantenimiento industrial',900);
/*!40000 ALTER TABLE `tsu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsu_carreras`
--

DROP TABLE IF EXISTS `tsu_carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsu_carreras` (
  `id carrera` int NOT NULL AUTO_INCREMENT,
  `tipo de carrera` varchar(100) NOT NULL,
  `nombre de carrera` varchar(100) NOT NULL,
  `no_carrera` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsu_carreras`
--

LOCK TABLES `tsu_carreras` WRITE;
/*!40000 ALTER TABLE `tsu_carreras` DISABLE KEYS */;
INSERT INTO `tsu_carreras` VALUES (100,'TSU','software','1','carrera de 2 años y medio donde podras formarte como desarrollador de software'),(200,'TSU','hoteles y restaurantes','2','carrera de 2 años donde podras formarte como gerente de hoteles'),(300,'TSU','produccion grafica','3','carrera de 2 años y medio donde podras ejercer como diseñador grafico'),(400,'TSU','gestion de proyectos sociales','4','carrera de 2 años y medio donde podras realizar labores sociales'),(500,'TSU ','manufactura','5','carrera de 2 años y medio donde podras aprender sobre tecnicas de manufactura industrial'),(600,'TSU ','produccion audiovisual','6','carrera de 2 años y medio donde podras ejercer en la industria de TV y radio'),(700,'TSU','mecatronica','7','carrera de 2 años y medio donde te formaras como tecnico mecatronico'),(800,'TSU','procesos de produccion','8','carrera de dos años donde te formaras como tecnico en procesos de produccion'),(900,'TSU','mantenimiento industrial','9','carrera de dos años y medio donde te formaras como tecnico en mantenimiento industrial');
/*!40000 ALTER TABLE `tsu_carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsu_carreras_has_alumnos`
--

DROP TABLE IF EXISTS `tsu_carreras_has_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsu_carreras_has_alumnos` (
  `tsu_carreras_id carrera` int NOT NULL,
  `alumnos_id alumno` int NOT NULL,
  PRIMARY KEY (`tsu_carreras_id carrera`,`alumnos_id alumno`),
  KEY `fk_tsu_carreras_has_alumnos_alumnos1_idx` (`alumnos_id alumno`),
  KEY `fk_tsu_carreras_has_alumnos_tsu_carreras1_idx` (`tsu_carreras_id carrera`),
  CONSTRAINT `fk_tsu_carreras_has_alumnos_alumnos1` FOREIGN KEY (`alumnos_id alumno`) REFERENCES `alumnos` (`id alumno`),
  CONSTRAINT `fk_tsu_carreras_has_alumnos_tsu_carreras1` FOREIGN KEY (`tsu_carreras_id carrera`) REFERENCES `tsu_carreras` (`id carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsu_carreras_has_alumnos`
--

LOCK TABLES `tsu_carreras_has_alumnos` WRITE;
/*!40000 ALTER TABLE `tsu_carreras_has_alumnos` DISABLE KEYS */;
INSERT INTO `tsu_carreras_has_alumnos` VALUES (100,1),(100,2),(100,3),(400,4),(400,5),(300,6),(700,7),(100,8),(200,9),(200,10),(200,11),(200,12),(200,13),(200,14),(200,15),(200,16),(200,17),(200,18),(300,19),(300,20),(300,21),(300,22),(300,23),(300,24),(300,25),(400,26),(400,27),(400,28),(400,29),(400,30),(100,31),(200,32),(500,33),(500,34),(500,35),(500,36),(600,37),(600,38),(600,39),(600,40);
/*!40000 ALTER TABLE `tsu_carreras_has_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsu_carreras_has_profesores`
--

DROP TABLE IF EXISTS `tsu_carreras_has_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsu_carreras_has_profesores` (
  `tsu_carreras_id carrera` int NOT NULL,
  `profesores_id profesor` int NOT NULL,
  PRIMARY KEY (`tsu_carreras_id carrera`,`profesores_id profesor`),
  KEY `fk_tsu_carreras_has_profesores_profesores1_idx` (`profesores_id profesor`),
  KEY `fk_tsu_carreras_has_profesores_tsu_carreras1_idx` (`tsu_carreras_id carrera`),
  CONSTRAINT `fk_tsu_carreras_has_profesores_profesores1` FOREIGN KEY (`profesores_id profesor`) REFERENCES `profesores` (`id profesor`),
  CONSTRAINT `fk_tsu_carreras_has_profesores_tsu_carreras1` FOREIGN KEY (`tsu_carreras_id carrera`) REFERENCES `tsu_carreras` (`id carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsu_carreras_has_profesores`
--

LOCK TABLES `tsu_carreras_has_profesores` WRITE;
/*!40000 ALTER TABLE `tsu_carreras_has_profesores` DISABLE KEYS */;
INSERT INTO `tsu_carreras_has_profesores` VALUES (100,1),(100,2),(100,3),(100,4),(100,5),(100,6),(200,7),(200,8),(200,9),(300,10),(400,11),(400,12),(500,13),(500,14),(500,15),(600,16),(700,17),(800,18),(900,19),(300,20);
/*!40000 ALTER TABLE `tsu_carreras_has_profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidad`
--

DROP TABLE IF EXISTS `universidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universidad` (
  `id universidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `TSU_id tsu` int NOT NULL,
  PRIMARY KEY (`id universidad`,`TSU_id tsu`),
  KEY `fk_Universidad_TSU_idx` (`TSU_id tsu`),
  CONSTRAINT `fk_Universidad_TSU` FOREIGN KEY (`TSU_id tsu`) REFERENCES `tsu` (`id tsu`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidad`
--

LOCK TABLES `universidad` WRITE;
/*!40000 ALTER TABLE `universidad` DISABLE KEYS */;
INSERT INTO `universidad` VALUES (1000,'universidad iberoamericana campus ciudad de mexico  ',150),(1000,'universidad iberoamericana campus ciudad de mexico',160),(1000,'universidad iberoamericana campus ciudad de mexico',170),(1000,'universidad iberoamericana campus ciudad de mexico ',180),(1000,'universidad iberoamericana campus ciudad de mexico ',190),(1000,'universidad iberoamericana campus ciudad de mexico ',200),(1100,'tecnologico universitario del valle de chalco',210),(1100,'tecnologico universitario del valle de chalco',220),(1100,'tecnologico universitario del valle de chalco ',230);
/*!40000 ALTER TABLE `universidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista alumnos`
--

DROP TABLE IF EXISTS `vista alumnos`;
/*!50001 DROP VIEW IF EXISTS `vista alumnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista alumnos` AS SELECT 
 1 AS `id alumno`,
 1 AS `nombre`,
 1 AS `id carrera`,
 1 AS `programa`,
 1 AS `wiki_tsu usuarios_id usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista profesores`
--

DROP TABLE IF EXISTS `vista profesores`;
/*!50001 DROP VIEW IF EXISTS `vista profesores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista profesores` AS SELECT 
 1 AS `id profesor`,
 1 AS `nombre`,
 1 AS `programa`,
 1 AS `wiki_tsu usuarios_id usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista programas`
--

DROP TABLE IF EXISTS `vista programas`;
/*!50001 DROP VIEW IF EXISTS `vista programas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista programas` AS SELECT 
 1 AS `programas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_miembros`
--

DROP TABLE IF EXISTS `vista_miembros`;
/*!50001 DROP VIEW IF EXISTS `vista_miembros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_miembros` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `edad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistatsucarreras`
--

DROP TABLE IF EXISTS `vistatsucarreras`;
/*!50001 DROP VIEW IF EXISTS `vistatsucarreras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistatsucarreras` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wiki_tsu usuarios`
--

DROP TABLE IF EXISTS `wiki_tsu usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_tsu usuarios` (
  `id usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cuentarevision` enum('Y','N') NOT NULL,
  `cuentacambios` enum('Y','N') NOT NULL,
  `ediciondobleclick` enum('Y','N') NOT NULL,
  `horaderegistro` time NOT NULL,
  `mostrarcomentarios` enum('Y','N') NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `mostrarcomentariodefault` int NOT NULL,
  PRIMARY KEY (`id usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_tsu usuarios`
--

LOCK TABLES `wiki_tsu usuarios` WRITE;
/*!40000 ALTER TABLE `wiki_tsu usuarios` DISABLE KEYS */;
INSERT INTO `wiki_tsu usuarios` VALUES (1,'mario','5ks','q@yahoo.com','Y','Y','Y','22:00:00','Y','active',1),(2,'maria','5kiq','fr@gmail.com','Y','Y','Y','23:00:00','Y','active',1),(3,'eutanasio','kjhjj','ju@outlook.com','Y','Y','Y','21:00:00','Y','active',1),(4,'fernanda','khjhghv','ij@hotmail.com','Y','Y','Y','18:00:00','Y','active',1),(5,'sandra','jhgfgtu','ui@hotmail.com','Y','Y','Y','12:00:00','Y','active',1),(6,'josue','jhajjshj','req@yahoo.com.mx','Y','Y','Y','13:00:00','Y','active',1),(7,'miguel','jajsjbd','hiqsd@hotmail.com','Y','Y','Y','14:00:00','Y','active',1),(8,'lucia','jfhjdjf','gfh@hotmail.com','Y','Y','Y','15:00:00','Y','active',1),(9,'manuel','kajsjd','gq@gmail.com','Y','Y','Y','15:00:00','Y','active',1),(10,'esmeralda','ksjndjksd','jahs@yahoo.com','Y','Y','Y','16:00:00','Y','active',1),(11,'teresa','sndjshd','jhagy@yahoo.com','Y','Y','Y','18:00:00','Y','active',1),(12,'carlos','jasjdj','ji@gmail.com','Y','Y','Y','17:00:00','Y','active',1),(13,'david','kajsj','hot@gmail.com','Y','Y','Y','18:00:00','Y','active',1),(14,'hiram','jnassjnd','huy@hotmail.com','Y','Y','Y','20:00:00','Y','active',1),(15,'jacob','lskndjsdn','fer@gmail.com','Y','Y','Y','22:00:00','Y','active',1),(16,'sara','absbd','nz@gmail.com','Y','Y','Y','23:00:00','Y','active',1),(17,'andres','kaksd','sna@gmail.com','Y','Y','Y','00:00:00','Y','active',1),(18,'andrea','kakd','g@uia.mx','Y','Y','Y','09:00:00','Y','active',1),(19,'miguel','kfknns','qua@uia.mx','Y','Y','Y','07:00:00','Y','active',1),(20,'maria jose','mkmd','jahsd@hotmail.com','Y','Y','Y','01:00:00','Y','active',1),(21,'eduardo','klkjs','hagsj@hotmail.com','Y','Y','Y','09:00:00','Y','active',1),(22,'rogelio','uauq','vags@gmail.com','Y','Y','Y','02:00:00','Y','active',1),(23,'joaquin','mskjf','fash@gmail.com','Y','Y','Y','07:00:00','Y','active',1),(24,'patricia','makllmd','gadf@gmail.com','Y','Y','Y','07:00:00','Y','active',1),(25,'anastasia','maks','hai@gmail.com','Y','Y','Y','08:00:00','Y','active',1),(26,'santos','mklfls','haus@gmail.com','Y','Y','Y','06:00:08','Y','active',1),(27,'geovani','kajkq','u@uia.mx','Y','Y','Y','18:00:08','Y','active',1),(28,'jan','uaos','has@uia.mx','Y','Y','Y','13:00:00','Y','active',1),(29,'janette','lkmfn','hg@gmail.com','Y','Y','Y','14:00:08','Y','active',1),(30,'ray','jahjgs','as@uia.mx','Y','Y','Y','15:07:00','Y','active',1),(31,'soraya','knjajhjfo','has@microsoft.com','Y','Y','Y','19:09:00','Y','active',1),(32,'melesiio','mnamnd','example@uia.mx','Y','Y','Y','23:00:07','Y','active',1),(33,'mayra','mnamnd','g@gmail.com','Y','Y','Y','22:00:00','Y','active',1),(34,'andrea','na mn','gh@gmail.com','Y','Y','Y','23:08:00','Y','active',1),(35,'andres','kfmk','hga@hotmail.com','Y','Y','Y','00:03:00','Y','active',1),(36,'fernando','lmkalmd','gas@outlook.com','Y','Y','Y','01:08:00','Y','active',1),(37,'ivette','kmka','b@microsoft.com','Y','Y','Y','20:30:00','Y','active',1),(38,'fernanda','lmkd','gas@yahoo.com.mx','Y','Y','Y','21:59:00','Y','active',1),(39,'eric','lml','gasq@yahoo.com','Y','Y','Y','23:00:09','Y','active',1),(40,'irvin','kmla','dw@outlook.com','Y','Y','Y','23:35:01','Y','active',1),(41,'alberto fernandez','jhjhsd','p@gmail.com','Y','Y','Y','23:35:02','Y','active',1),(42,'maria rodriguez ','jsdjsjdn','j@gmail.com','Y','Y','Y','23:35:06','Y','active',1),(43,'asuncion perez','nsddjs','ed@gmail.com','Y','Y','Y','23:35:09','Y','active',1),(44,'sara mendoza','kjsddkdnj','uaq@uia.mx','Y','Y','Y','23:35:00','Y','active',1),(45,'saul rodriguez ','kjdjsndj','s@gmail.com','Y','Y','Y','22:35:00','Y','active',1),(46,'mario canales','kmsndjbd','sa@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(47,'alberta zaragoza','ksndknd','kal@gmail.com','Y','Y','Y','13:35:00','Y','active',1),(48,'fernanda rodriguez','kasjb','jal@gmail.com','Y','Y','Y','17:35:00','Y','active',1),(49,'asuncion aramburuzabala','ksdnjd','jaa@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(50,'carlos slim','kndjbdsj','jam@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(51,'mario moreno','lknjdb','jak@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(52,'stefan arguten','kahshja','jakq@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(53,'joaquin hernandez','kshdj','iaj@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(54,'axayacatl zempoala','ksdnj','iak@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(55,'fard sanchez','lskdj','jamq@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(56,'daniela zaragoza','ksdnjs','kakq@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(57,'mario cantiinflas','kajd','iajq@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(58,'melesio zacapoaxcatla','knsdnd','jaiqm@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(59,'selena quintanilla','lsndk','kaqo@gmail.com','Y','Y','Y','23:35:00','Y','active',1),(60,'seymour skinner','kndk','lajq@gmail.com','Y','Y','Y','23:35:00','Y','active',1);
/*!40000 ALTER TABLE `wiki_tsu usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_tsu usuarios_has_sesiones`
--

DROP TABLE IF EXISTS `wiki_tsu usuarios_has_sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_tsu usuarios_has_sesiones` (
  `wiki_tsu usuarios_id usuario` int NOT NULL,
  `sesiones_idsesion` int NOT NULL,
  PRIMARY KEY (`wiki_tsu usuarios_id usuario`,`sesiones_idsesion`),
  KEY `fk_wiki_tsu usuarios_has_sesiones_sesiones1_idx` (`sesiones_idsesion`),
  KEY `fk_wiki_tsu usuarios_has_sesiones_wiki_tsu usuarios1_idx` (`wiki_tsu usuarios_id usuario`),
  CONSTRAINT `fk_wiki_tsu usuarios_has_sesiones_sesiones1` FOREIGN KEY (`sesiones_idsesion`) REFERENCES `sesiones` (`idsesion`),
  CONSTRAINT `fk_wiki_tsu usuarios_has_sesiones_wiki_tsu usuarios1` FOREIGN KEY (`wiki_tsu usuarios_id usuario`) REFERENCES `wiki_tsu usuarios` (`id usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_tsu usuarios_has_sesiones`
--

LOCK TABLES `wiki_tsu usuarios_has_sesiones` WRITE;
/*!40000 ALTER TABLE `wiki_tsu usuarios_has_sesiones` DISABLE KEYS */;
INSERT INTO `wiki_tsu usuarios_has_sesiones` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `wiki_tsu usuarios_has_sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `paginas`.`etiqueta` AS `etiqueta`,count(0) AS `COUNT(*)` from `paginas` group by `paginas`.`etiqueta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista alumnos`
--

/*!50001 DROP VIEW IF EXISTS `vista alumnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista alumnos` AS select `alumnos`.`id alumno` AS `id alumno`,`alumnos`.`nombre` AS `nombre`,`alumnos`.`id carrera` AS `id carrera`,`alumnos`.`programa` AS `programa`,`alumnos`.`wiki_tsu usuarios_id usuario` AS `wiki_tsu usuarios_id usuario` from `alumnos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista profesores`
--

/*!50001 DROP VIEW IF EXISTS `vista profesores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista profesores` AS select `profesores`.`id profesor` AS `id profesor`,`profesores`.`nombre` AS `nombre`,`profesores`.`programa` AS `programa`,`profesores`.`wiki_tsu usuarios_id usuario` AS `wiki_tsu usuarios_id usuario` from `profesores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista programas`
--

/*!50001 DROP VIEW IF EXISTS `vista programas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista programas` AS select count(0) AS `programas` from `programas` group by `programas`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_miembros`
--

/*!50001 DROP VIEW IF EXISTS `vista_miembros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_miembros` AS select `miembros`.`nombre` AS `nombre`,`miembros`.`apellido` AS `apellido`,`miembros`.`edad` AS `edad` from `miembros` where (`miembros`.`edad` < 29) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistatsucarreras`
--

/*!50001 DROP VIEW IF EXISTS `vistatsucarreras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistatsucarreras` AS select count(0) AS `count(*)` from `tsu_carreras` */;
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

-- Dump completed on 2020-11-23 14:54:44
