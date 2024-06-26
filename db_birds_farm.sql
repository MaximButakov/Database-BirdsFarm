CREATE DATABASE  IF NOT EXISTS `birdsfarm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `birdsfarm`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: birdsfarm
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
  `Buy_id` int NOT NULL AUTO_INCREMENT,
  `Buy_description` varchar(255) DEFAULT NULL,
  `Client_id` int NOT NULL,
  PRIMARY KEY (`Buy_id`),
  KEY `Client_id` (`Client_id`),
  CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `client_` (`Client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (1,'Доставка в вечернее время',2),(2,'',4),(3,'Упаковать в пластиковые лотки',6),(4,'',1),(5,'Упаковать часть заказа в 10 картонных лотков по 100 шт.',3);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_product`
--

DROP TABLE IF EXISTS `buy_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_product` (
  `Buy_product_id` int NOT NULL AUTO_INCREMENT,
  `Buy_id` int NOT NULL,
  `Product_id` int NOT NULL,
  `Amount` int NOT NULL,
  PRIMARY KEY (`Buy_product_id`),
  KEY `Buy_id` (`Buy_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `buy_product_ibfk_1` FOREIGN KEY (`Buy_id`) REFERENCES `buy` (`Buy_id`),
  CONSTRAINT `buy_product_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_product`
--

LOCK TABLES `buy_product` WRITE;
/*!40000 ALTER TABLE `buy_product` DISABLE KEYS */;
INSERT INTO `buy_product` VALUES (1,1,1,5000),(2,1,6,7000),(3,1,8,6000),(4,2,8,14000),(5,3,1,13000),(6,4,7,7000),(7,5,6,20000);
/*!40000 ALTER TABLE `buy_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_step`
--

DROP TABLE IF EXISTS `buy_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_step` (
  `Buy_step_id` int NOT NULL AUTO_INCREMENT,
  `Buy_id` int NOT NULL,
  `Step_id` int NOT NULL,
  `Beginning_step_date` date DEFAULT NULL,
  `Finish_step_date` date DEFAULT NULL,
  PRIMARY KEY (`Buy_step_id`),
  KEY `Buy_id` (`Buy_id`),
  KEY `Step_id` (`Step_id`),
  CONSTRAINT `buy_step_ibfk_1` FOREIGN KEY (`Buy_id`) REFERENCES `buy` (`Buy_id`),
  CONSTRAINT `buy_step_ibfk_2` FOREIGN KEY (`Step_id`) REFERENCES `step` (`Step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_step`
--

LOCK TABLES `buy_step` WRITE;
/*!40000 ALTER TABLE `buy_step` DISABLE KEYS */;
INSERT INTO `buy_step` VALUES (101,1,1,'2023-06-22','2023-06-22'),(102,1,2,'2023-06-23','2023-06-23'),(103,1,3,'2023-06-23','2023-06-23'),(104,1,4,'2023-06-23','2023-06-25'),(105,2,1,'2023-06-23','2023-06-23'),(106,2,2,'2023-06-24','2023-06-24'),(107,2,3,'2023-06-24','2023-06-24'),(108,2,4,'2023-06-25',NULL),(109,3,1,'2023-06-23','2023-06-24'),(110,3,2,'2023-06-24','2023-06-24'),(111,3,3,'2023-06-24','2023-06-24'),(112,3,4,'2023-06-25',NULL),(113,4,1,'2023-06-24','2023-06-25'),(114,4,2,'2023-06-25','2023-06-25'),(115,4,3,'2023-06-25',NULL),(116,4,4,NULL,NULL),(117,5,1,'2023-06-25',NULL),(118,5,2,NULL,NULL),(119,5,3,NULL,NULL),(120,5,4,NULL,NULL);
/*!40000 ALTER TABLE `buy_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `City_id` int NOT NULL AUTO_INCREMENT,
  `City` varchar(20) DEFAULT NULL,
  `Days_delivery` int NOT NULL,
  PRIMARY KEY (`City_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Екатеринбург',1),(2,'Тобольск',2),(3,'Ишим',1),(4,'Омск',2),(5,'Сургут',2),(6,'Курган',2),(7,'Казань',3);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_`
--

DROP TABLE IF EXISTS `client_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_` (
  `Client_id` int NOT NULL AUTO_INCREMENT,
  `Second_name` varchar(20) DEFAULT NULL,
  `First_name` varchar(20) DEFAULT NULL,
  `Middle_name` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone_number` varchar(11) DEFAULT NULL,
  `City_id` int NOT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `Building_number` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Client_id`),
  KEY `City_id` (`City_id`),
  CONSTRAINT `client__ibfk_1` FOREIGN KEY (`City_id`) REFERENCES `city` (`City_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_`
--

LOCK TABLES `client_` WRITE;
/*!40000 ALTER TABLE `client_` DISABLE KEYS */;
INSERT INTO `client_` VALUES (1,'Емельянова','Анастасия','Артёмовна','emelianova@mail.ru','84961330532',1,'Домодедовская','5'),(2,'Ефимова','Валерия','Матвеевна','efimova@mail.ru','78452473807',2,'Гагарина','90'),(3,'Олейников','Максим','Максимович','oleynikov@mail.ru','77650589893',3,'Чехова','4'),(4,'Левин','Александр','Денисович','Levin@gmail.com','79253180125',4,'Ленина','97'),(5,'Маркова','Арина','Андреевна','markova@gmail.com','78256931367',5,'Космонавтов','7'),(6,'Князева','Ульяна','Романовна','knyazeva@mail.ru','78750508584',6,'Бухарестская','16'),(7,'Соловьева','Таисия','Константиновна','xucu-kinuza16@list.ru','78956231177',7,'Вишневая','142');
/*!40000 ALTER TABLE `client_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egg_brands`
--

DROP TABLE IF EXISTS `egg_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egg_brands` (
  `Brand_id` int NOT NULL AUTO_INCREMENT,
  `Brand_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egg_brands`
--

LOCK TABLES `egg_brands` WRITE;
/*!40000 ALTER TABLE `egg_brands` DISABLE KEYS */;
INSERT INTO `egg_brands` VALUES (1,'Sunny Side'),(2,'Healthy Eggs'),(3,'Желтое и белое');
/*!40000 ALTER TABLE `egg_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egg_category`
--

DROP TABLE IF EXISTS `egg_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egg_category` (
  `Category_id` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egg_category`
--

LOCK TABLES `egg_category` WRITE;
/*!40000 ALTER TABLE `egg_category` DISABLE KEYS */;
INSERT INTO `egg_category` VALUES (1,'C0'),(2,'C1'),(3,'C2');
/*!40000 ALTER TABLE `egg_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_id` int NOT NULL AUTO_INCREMENT,
  `Brand_id` int NOT NULL,
  `Category_id` int NOT NULL,
  `Total_eggs` int NOT NULL,
  `Date_of_manufactured` date DEFAULT NULL,
  `Expiration_date` date GENERATED ALWAYS AS ((`Date_of_manufactured` + interval 25 day)) VIRTUAL,
  `Price_per_unit` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `Brand_id` (`Brand_id`),
  KEY `Category_id` (`Category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Brand_id`) REFERENCES `egg_brands` (`Brand_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `egg_category` (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`Product_id`, `Brand_id`, `Category_id`, `Total_eggs`, `Date_of_manufactured`, `Price_per_unit`) VALUES (1,1,1,218594,'2024-06-21',14.20),(2,1,2,247336,'2024-06-21',13.12),(3,1,3,272117,'2024-06-21',12.35),(4,2,1,275696,'2024-06-20',13.60),(5,2,2,302273,'2024-06-14',12.45),(6,2,3,307180,'2024-06-16',11.60),(7,3,1,267502,'2024-06-18',16.28),(8,3,2,285470,'2024-06-18',15.67),(9,3,3,304088,'2024-06-16',14.37);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `Step_id` int NOT NULL AUTO_INCREMENT,
  `Name_step` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,'Оплата'),(2,'Упаковка'),(3,'Транспортировка'),(4,'Доставка');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 22:26:30
