CREATE DATABASE  IF NOT EXISTS `lubricentro_jomean` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lubricentro_jomean`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: lubricentro_jomean
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Aceites',1),(2,'Grasas',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cedula` varchar(45) NOT NULL,
  `id_vehiculo` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_clliente_UNIQUE` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Pedro','112250',1),(2,'Ana','123098',2),(3,'Marco','123456789',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `id_operario` int NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_operario_idx` (`id_operario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,'2024-01-05',90000,2,1),(2,2,'2024-01-07',43000,2,2),(7,1,'2024-04-21',30000,NULL,1),(8,1,'2024-04-21',55000,NULL,1),(9,1,'2024-04-21',30000,NULL,2),(10,3,'2024-04-21',30000,NULL,1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operario`
--

DROP TABLE IF EXISTS `operario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operario` (
  `id_operario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id_operario`),
  KEY `id_rol_idx` (`id_rol`),
  CONSTRAINT `id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operario`
--

LOCK TABLES `operario` WRITE;
/*!40000 ALTER TABLE `operario` DISABLE KEYS */;
INSERT INTO `operario` VALUES (1,'Jorge Operario',5),(2,'Melvin Operario',5);
/*!40000 ALTER TABLE `operario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `detalle` varchar(1600) NOT NULL,
  `precio` double DEFAULT NULL,
  `existencias` int DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Aceite Penzol','Aceite marca pro',30000,14,1),(2,1,'Aceite ME','Aceite marca Medio',25000,10,1),(3,2,'Grasa Sintetica','De alto rendimiento cartucho 400G',20000,9,1),(4,2,'Grasa Sabo','Dielectrica 470ML',12000,13,1),(5,1,'Aceite','detalle prueba',10000,2,1),(6,1,'Aceite Penzol','Aceite marca pro',30000,14,NULL),(7,1,'Aceite ME','Aceite marca Medio',25000,10,NULL),(8,2,'Grasa Sintetica','De alto rendimiento cartucho 400G',20000,9,NULL),(9,2,'Grasa Sabo','Dielectrica 470ML',12000,13,NULL),(10,1,'Aceite','detalle prueba',10000,2,NULL),(13,1,'Castrol Magnatec','Aceite sintetico de alto rendimiento',28000,5,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `fk_rol_usuario` (`id_usuario`),
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ROLE_ADMIN',1,1),(5,'ROLE_USER',2,1),(6,'ROLE_USER',3,1),(7,'ROLE_USER',5,1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `precio` double DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Cambio de aceite',43000,1),(2,'Lavado interno del motor',20000,1),(3,'Cambio de líquido de frenos',15000,1),(4,'Cambio de coolant',10000,1),(5,'Cambio de bujías',57000,0);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(512) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'usuario1','usuariopass1'),(2,'usuario2','usuariopass2'),(3,'usuario3','usuariopass3'),(5,'usuario4','pass123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`),
  CONSTRAINT `id_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'Toyota Corolla'),(2,'Hyundai Tucson');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_servicio` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_operario` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_factura` (`id_factura`),
  KEY `fk_ventas_producto` (`id_producto`),
  KEY `id_servicio_idx` (`id_servicio`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_operaroi_idx` (`id_operario`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `id_operaroi` FOREIGN KEY (`id_operario`) REFERENCES `operario` (`id_operario`),
  CONSTRAINT `id_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,1,90000,3,NULL,1,NULL),(2,2,NULL,43000,NULL,1,2,NULL),(19,10,NULL,30000,NULL,NULL,3,NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-30 20:39:15
