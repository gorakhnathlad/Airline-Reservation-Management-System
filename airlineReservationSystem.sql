-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: airline_reservation_system
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `cancel_ticket`
--

DROP TABLE IF EXISTS `cancel_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancel_ticket` (
  `ticket_id` varchar(10) NOT NULL,
  `refund_amount` double(15,2) NOT NULL,
  `cancellation_charge` double(15,2) NOT NULL,
  `cancel_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `id_card_number` varchar(20) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `id_card_number` (`id_card_number`),
  CONSTRAINT `cancel_ticket_ibfk_1` FOREIGN KEY (`id_card_number`) REFERENCES `customer_details` (`id_card_number`) ON UPDATE CASCADE,
  CONSTRAINT `cancel_ticket_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `passenger_details` (`ticket_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancel_ticket`
--

LOCK TABLES `cancel_ticket` WRITE;
/*!40000 ALTER TABLE `cancel_ticket` DISABLE KEYS */;
INSERT INTO `cancel_ticket` VALUES ('AA003T0002',3600.00,900.00,'2019-03-26','2019-04-03','cancel','123456789123'),('SJ007T0101',2000.00,500.00,'2019-03-26','2019-04-02','cancel','123456789123');
/*!40000 ALTER TABLE `cancel_ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trg_cancel_ticket
after insert on airline_reservation_system.cancel_ticket
for each row
begin
	update airline_reservation_system.ticket_info
	set status='cancel'
	where ticket_id=new.ticket_id;	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `card_details`
--

DROP TABLE IF EXISTS `card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_details` (
  `card_number` bigint(20) NOT NULL,
  `card_type` varchar(20) NOT NULL,
  `expiration_month` int(2) NOT NULL,
  `expiration_year` int(4) NOT NULL,
  `id_card_number` varchar(20) NOT NULL,
  KEY `id_card_number` (`id_card_number`),
  CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`id_card_number`) REFERENCES `customer_details` (`id_card_number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_details`
--

LOCK TABLES `card_details` WRITE;
/*!40000 ALTER TABLE `card_details` DISABLE KEYS */;
INSERT INTO `card_details` VALUES (5600123456781234,'DEBIT CARD',12,2023,'cus001'),(6600123456781234,'CREDIT CARD',12,2025,'cus002'),(123,'Debit',2,2021,'cus001'),(523,'Debit',3,2025,'cus001'),(12345,'Debit',3,2020,'CUS001'),(123456,'Credit',3,2025,'cus001'),(568472451,'Credit',2,2026,'cus001'),(2897154,'Debit',3,2056,'cus001'),(12,'Debit',2,2020,'cus001'),(25461354,'Debit',1,2054,'cus001'),(5478125642,'Debit',2,2054,'cus001'),(1,'Debit',2,2023,'cus001'),(54785648,'Debit',2,2045,'cus001'),(4578654,'Debit',2,2026,'cus001'),(1654564,'Debit',2,2020,'cus001'),(4578945325412,'Debit',2,2020,'cus001'),(45789548754,'Debit',2,2047,'cus001'),(45126547,'Debit',2,2025,'cus001'),(12457894,'Debit',2,2065,'cus001'),(1241,'Debit',1,2021,'cus001'),(124573454,'Debit',2,2023,'cus001'),(1345341345,'Debit',2,2020,'cus001'),(1234564,'Debit',2,2050,'cus001'),(1245,'Debit',2,2020,'cus001'),(125432,'Debit',2,2021,'cus002'),(1245631354,'Debit',2,2020,'cus002'),(15487524,'Credit',2,2020,'cus001'),(1245654,'Debit',2,2045,'cus001'),(214564,'Debit',2,2045,'cus001'),(12465,'Debit',2,2032,'CUS001'),(1345646,'Credit',2020,2020,'cus001'),(54124567,'Debit',2,2021,'cus001'),(354125146,'Debit',2,2056,'cus001'),(124564,'Debit',1,2034,'cus001'),(1245654,'Debit',1,2054,'cus001'),(14564,'Debit',2,2025,'cus001'),(2154875421,'Debit',2,2024,'cus001'),(54873544,'Debit',2,2023,'cus002'),(54789456456,'Debit',2,2029,'cus002'),(1245784521,'Debit',2,2054,'cus002'),(1256464,'Debit',2,2025,'cus001'),(456464,'Debit',2,2034,'cus001'),(5454,'Debit',2,2045,'cus001'),(235632132,'Debit',2,2034,'cus001'),(2146554,'Debit',2,2024,'cus001'),(12354,'Debit',2,2045,'cus001'),(2352,'Debit',2,2054,'cus001'),(4576845,'Debit',2,2045,'cus001'),(457895454,'Debit',2,2045,'cus001'),(215646124,'Credit',2,2020,'cus001'),(654354,'Debit',2,2020,'cus001'),(123543654,'Debit',2,2020,'cus001'),(2134654,'Debit',2,2020,'cus001'),(1254,'Debit',2,2025,'cus001'),(154214554,'Debit',2,2025,'cus001'),(32544512,'Debit',2,2020,'cus001'),(12345,'Debit',2,2020,'cus001'),(125454154,'Debit',2,2020,'cus001'),(23464,'Debit',2,2020,'cus001'),(2354,'Debit',2,2020,'cus001'),(23454254,'Debit',2,2020,'cus001'),(1245124,'Debit',2,2020,'cus001'),(23548544,'Debit',2,2020,'cus001'),(4510454,'Debit',2,2045,'cus001'),(214,'Debit',2,2056,'cus001'),(124154,'Debit',2,2024,'cus001'),(2131231,'Debit Card',12,2312,'cus001'),(12345678,'Debit Card',2,2022,'cus001'),(12345678,'Debit Card',4,2023,'cus001'),(12345678,'Debit Card',2,2022,'cus001'),(123445,'Debit Card',2,2022,'cus001'),(123445567,'Debit Card',9,2023,'cus001'),(1234456567,'Debit Card',8,2023,'cus001'),(123456789123567,'Debit Card',2,2023,'123456789123'),(1234567890123456,'Debit Card',2,2020,'123456789123'),(1234567890123456,'Debit Card',2,2020,'123456789123'),(1234567890123456,'Debit Card',5,2022,'123456789123'),(1234567890123456,'Debit Card',12,2023,'123456789123'),(1234567890123456,'Debit Card',2,2022,'123456789123'),(1234456789012345,'Debit Card',4,2022,'123456789123'),(666666666,'Debit Card',666,43445,'123456789123'),(21212121,'Debit Card',12,2222,'123456789123'),(12345667878900,'Debit Card',8,2022,'123456789123'),(1234567890123454,'Debit Card',9,2022,'123456789123'),(1234567890123456,'Debit Card',12,2222,'123456789123'),(1234567890123456,'Debit Card',12,2222,'123456789123'),(1243257656786897,'Debit Card',34,2023,'111111111111'),(1668788888888888,'Debit Card',12,2019,'123456789123');
/*!40000 ALTER TABLE `card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_details`
--

DROP TABLE IF EXISTS `class_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_details` (
  `class_id` varchar(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `flight_id` varchar(10) NOT NULL,
  `total_seats` int(10) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `class_details_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight_details` (`flight_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_details`
--

LOCK TABLES `class_details` WRITE;
/*!40000 ALTER TABLE `class_details` DISABLE KEYS */;
INSERT INTO `class_details` VALUES ('AA0010','Premium',12000.00,'AA0010',50),('AA0010B01','business',4500.00,'AA0010',100),('AA0010E01','Economy',3500.00,'AA0010',100),('AA0010F01','First',7500.00,'AA0010',50),('AA001B01','business',4500.00,'AA001',100),('AA001E01','Economy',3500.00,'AA001',100),('AA001F01','First',7500.00,'AA001',50),('AA001P01','Premium',12000.00,'AA001',50),('AA002B01','business',5500.00,'AA002',100),('AA002E01','Economy',4500.00,'AA002',100),('AA002F01','First',9500.00,'AA002',50),('AA002P01','Premium',13000.00,'AA002',50),('AA003B01','business',5500.00,'AA003',100),('AA003E01','Economy',4500.00,'AA003',100),('AA003F01','First',9500.00,'AA003',50),('AA003P01','Premium',13000.00,'AA003',50),('AA004B01','business',3000.00,'AA004',100),('AA004E01','Economy',2500.00,'AA004',100),('AA004F01','First',1300.00,'AA004',50),('AA004P01','Premium',15000.00,'AA004',50),('AA005B01','business',5900.00,'AA005',100),('AA005E01','Economy',5500.00,'AA005',100),('AA005F01','First',10500.00,'AA005',50),('AA005P01','Premium',13000.00,'AA005',50),('AA006B01','business',6900.00,'AA006',100),('AA006E01','Economy',5500.00,'AA006',100),('AA006F01','First',10500.00,'AA006',50),('AA006P01','Premium',13000.00,'AA006',50),('AA007B01','business',5900.00,'AA007',100),('AA007E01','Economy',5500.00,'AA007',100),('AA007F01','First',10500.00,'AA007',50),('AA007P01','Premium',13000.00,'AA007',50),('AA008B01','business',5900.00,'AA008',100),('AA008E01','Economy',5500.00,'AA008',100),('AA008F01','First',10500.00,'AA008',50),('AA008P01','Premium',13000.00,'AA008',50),('AI003B01','business',9500.00,'AI003',100),('AI003E01','Economy',6500.00,'AI003',100),('AI003F01','First',13000.00,'AI003',50),('AI003P01','Premium',22000.00,'AI003',50),('AI004B01','business',4500.00,'AI004',100),('AI004E01','Economy',3500.00,'AI004',100),('AI004F01','First',5500.00,'AI004',50),('AI004P01','Premium',6500.00,'AI004',50),('AI005B01','business',8600.00,'AI005',100),('AI005E01','Economy',6500.00,'AI005',100),('AI005F01','First',11500.00,'AI005',50),('AI005P01','Premium',16000.00,'AI005',50),('AI006B01','business',6500.00,'AI006',100),('AI006E01','Economy',5500.00,'AI006',100),('AI006F01','First',9500.00,'AI006',50),('AI006P01','Premium',13000.00,'AI006',50),('AI007B01','business',5500.00,'AI007',100),('AI007E01','Economy',4500.00,'AI007',100),('AI007F01','First',9500.00,'AI007',50),('AI007P01','Premium',13000.00,'AI007',50),('AI008B01','business',6900.00,'AI008',100),('AI008E01','Economy',6100.00,'AI008',100),('AI008F01','First',10500.00,'AI008',50),('AI008P01','Premium',13000.00,'AI008',50),('AI009B01','business',6900.00,'AI009',100),('AI009E01','Economy',5500.00,'AI009',100),('AI009F01','First',10500.00,'AI009',50),('AI009P01','Premium',13000.00,'AI009',50),('IND001B01','business',12000.00,'IND001',100),('IND001E01','Economy',9500.00,'IND001',100),('IND001F01','First',18000.00,'IND001',50),('IND001P01','Premium',32000.00,'IND001',50),('IND002B01','business',8600.00,'IND002',100),('IND002E01','Economy',6500.00,'IND002',100),('IND002F01','First',11500.00,'IND002',50),('IND002P01','Premium',16000.00,'IND002',50),('IND003B01','business',6500.00,'IND003',100),('IND003E01','Economy',5500.00,'IND003',100),('IND003F01','First',9500.00,'IND003',50),('IND003P01','Premium',13000.00,'IND003',50),('IND004B01','business',5500.00,'IND004',100),('IND004E01','Economy',4500.00,'IND004',100),('IND004F01','First',9500.00,'IND004',50),('IND004P01','Premium',13000.00,'IND004',50),('IND005B01','business',6900.00,'IND005',100),('IND005E01','Economy',6100.00,'IND005',100),('IND005F01','First',10500.00,'IND005',50),('IND005P01','Premium',13000.00,'IND005',50),('IND006B01','business',6900.00,'IND006',100),('IND006E01','Economy',5500.00,'IND006',100),('IND006F01','First',10500.00,'IND006',50),('IND006P01','Premium',13000.00,'IND006',50),('IND007B01','business',6900.00,'IND007',100),('IND007E01','Economy',5500.00,'IND007',100),('IND007F01','First',10500.00,'IND007',50),('IND007P01','Premium',13000.00,'IND007',50),('KF001B01','business',2700.00,'KF005',100),('KF001E01','Economy',2100.00,'KF005',100),('KF001F01','First',3500.00,'KF005',50),('KF001P01','Premium',4500.00,'KF005',50),('KF002B01','business',5500.00,'KF002',100),('KF002E01','Economy',4500.00,'KF002',100),('KF002F01','First',9500.00,'KF002',50),('KF002P01','Premium',13000.00,'KF002',50),('KF003B01','business',6900.00,'KF003',100),('KF003E01','Economy',6100.00,'KF003',100),('KF003F01','First',10500.00,'KF003',50),('KF003P01','Premium',13000.00,'KF003',50),('KF004B01','business',6900.00,'KF004',100),('KF004E01','Economy',5500.00,'KF004',100),('KF004F01','First',10500.00,'KF004',50),('KF004P01','Premium',13000.00,'KF004',50),('KF006B01','business',6900.00,'KF006',100),('KF006E01','Economy',5500.00,'KF006',100),('KF006F01','First',10500.00,'KF006',50),('KF006P01','Premium',13000.00,'KF006',50),('KF007B01','business',13000.00,'KF007',100),('KF007E01','Economy',8500.00,'KF007',100),('KF007F01','First',18000.00,'KF007',50),('KF007P01','Premium',23000.00,'KF007',50),('SJ0010B01','business',6100.00,'SJ0010',100),('SJ0010E01','Economy',5300.00,'SJ0010',100),('SJ0010F01','First',10900.00,'SJ0010',50),('SJ0010P01','Premium',13600.00,'SJ0010',50),('SJ001B01','business',3000.00,'SJ007',100),('SJ001E01','Economy',2500.00,'SJ007',100),('SJ001F01','First ',3500.00,'SJ007',50),('SJ001P01','Premium',4000.00,'SJ007',50),('SJ002B01','business',8900.00,'SJ002',100),('SJ002E01','Economy',6800.00,'SJ002',100),('SJ002F01','First',9300.00,'SJ002',50),('SJ002P01','Premium',18900.00,'SJ002',50),('SJ003B01','business',10000.00,'SJ003',100),('SJ003E01','Economy',9100.00,'SJ003',100),('SJ003F01','First',14500.00,'SJ003',50),('SJ003P01','Premium',19000.00,'SJ003',50),('SJ005B01','business',3000.00,'SJ005',100),('SJ005E01','Economy',2500.00,'SJ005',100),('SJ005F01','First',3500.00,'SJ005',50),('SJ005P01','Premium',4000.00,'SJ005',50),('SJ006B01','business',9300.00,'SJ006',100),('SJ006E01','Economy',7600.00,'SJ006',100),('SJ006F01','First',16200.00,'SJ006',50),('SJ006P01','Premium',18000.00,'SJ006',50),('SJ007B01','business',4500.00,'SJ007',100),('SJ007E01','Economy',3500.00,'SJ007',100),('SJ007F01','First',7500.00,'SJ007',50),('SJ007P01','Premium',12000.00,'SJ007',50),('SJ008B01','business',4500.00,'SJ008',100),('SJ008E01','Economy',3500.00,'SJ008',100),('SJ008F01','First',7500.00,'SJ008',50),('SJ008P01','Premium',12000.00,'SJ008',50),('SJ009B01','business',8900.00,'SJ009',100),('SJ009E01','Economy',5900.00,'SJ009',100),('SJ009F01','First',11500.00,'SJ009',50),('SJ009P01','Premium',19000.00,'SJ009',50);
/*!40000 ALTER TABLE `class_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_card_number` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `e_mail` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `id_card_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id_card_number`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `e_mail` (`e_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (13,'111111111111','Ravi','ravi@gmail.com','Ravi@123','1995-04-19','hydrabas','8569752369','Male','Aadhaar Card'),(4,'123412341234','Manazir','manazirmohd786@gmail.com','Manazir@123','1995-05-30','allahabad up','8569752369','Male','Aadhaar Card'),(11,'123456654321','Puneet','puneet@gmail.com','Puneet@123','1995-04-22','moradabad','8569752369','Male','Aadhaar Card'),(12,'123456789123','Rahul Singh  Mehta','rahul@gmail.com','Rahul@123','1995-04-20','Dehradun','8569752367','Male','Aadhaar Card'),(14,'123456789741','sumit','sumit.co@gmail.com','Sumit@123','2019-03-13','hyfj','8569752369','Male','Aadhaar Card');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_details`
--

DROP TABLE IF EXISTS `flight_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_details` (
  `flight_id` varchar(10) NOT NULL,
  `airline_name` varchar(20) NOT NULL,
  `from_location` varchar(20) NOT NULL,
  `to_location` varchar(20) NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_date` date NOT NULL,
  `total_seats` int(5) NOT NULL,
  `economy` int(11) NOT NULL,
  `business` int(11) NOT NULL,
  `premium` int(11) NOT NULL,
  `first_class` int(11) NOT NULL,
  PRIMARY KEY (`flight_id`,`from_location`,`to_location`,`departure_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_details`
--

LOCK TABLES `flight_details` WRITE;
/*!40000 ALTER TABLE `flight_details` DISABLE KEYS */;
INSERT INTO `flight_details` VALUES ('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('AA0010','AirAsia','mumbai','kolkata','14:00:00','16:00:00','2019-06-10',300,100,100,50,50),('AA002','AirAsia','Kolkata','Delhi','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('AA002','AirAsia','Kolkata','Delhi','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('AA002','AirAsia','Kolkata','Delhi','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('AA002','AirAsia','Kolkata','Delhi','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('AA002','AirAsia','Kolkata','Delhi','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('AA002','AirAsia','Kolkata','Delhi','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('AA003','AirAsia','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('AA003','AirAsia','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('AA003','AirAsia','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('AA003','AirAsia','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('AA003','AirAsia','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('AA003','AirAsia','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('AA004','AirAsia','Kolkata','Patna','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('AA004','AirAsia','Kolkata','Patna','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('AA004','AirAsia','Kolkata','Patna','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('AA004','AirAsia','Kolkata','Patna','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('AA004','AirAsia','Kolkata','Patna','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('AA004','AirAsia','Kolkata','Patna','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('AA005','AirAsia','Kolkata','Pune','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('AA005','AirAsia','Kolkata','Pune','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('AA005','AirAsia','Kolkata','Pune','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('AA005','AirAsia','Kolkata','Pune','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('AA005','AirAsia','Kolkata','Pune','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('AA005','AirAsia','Kolkata','Pune','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('AA006','AirAsia','Ranchi','Patna','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('AA007','AirAsia','Kolkata','Goa','15:00:00','17:30:00','2019-05-14',300,100,100,50,50),('AA008','AirAsia','Kolkata','Pune','06:00:00','08:30:00','2019-03-30',300,100,100,50,50),('AI003','AirIndia','Chennai','Kolkata','20:10:00','22:30:00','2019-05-20',300,100,100,50,50),('AI004','AirIndia','Chennai','Kolkata','20:10:00','22:30:00','2019-06-20',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','20:10:00','22:30:00','2019-04-01',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','20:10:00','22:30:00','2019-04-02',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','20:10:00','22:30:00','2019-04-03',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','20:10:00','22:30:00','2019-04-04',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','20:10:00','22:30:00','2019-04-05',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','20:10:00','22:30:00','2019-04-06',300,100,100,50,50),('AI005','AirIndia','Kolkata','Chennai','17:00:00','19:30:00','2019-06-20',300,100,100,50,50),('AI006','AirIndia','Kolkata','Delhi','20:10:00','22:30:00','2019-04-01',300,100,100,50,50),('AI006','AirIndia','Kolkata','Delhi','20:10:00','22:30:00','2019-04-02',300,100,100,50,50),('AI006','AirIndia','Kolkata','Delhi','20:10:00','22:30:00','2019-04-03',300,100,100,50,50),('AI006','AirIndia','Kolkata','Delhi','20:10:00','22:30:00','2019-04-04',300,100,100,50,50),('AI006','AirIndia','Kolkata','Delhi','20:10:00','22:30:00','2019-04-05',300,100,100,50,50),('AI006','AirIndia','Kolkata','Delhi','20:10:00','22:30:00','2019-04-06',300,100,100,50,50),('AI007','AirIndia','Kolkata','Mumbai','20:10:00','22:30:00','2019-04-01',300,100,100,50,50),('AI007','AirIndia','Kolkata','Mumbai','20:10:00','22:30:00','2019-04-02',300,100,100,50,50),('AI007','AirIndia','Kolkata','Mumbai','20:10:00','22:30:00','2019-04-03',300,100,100,50,50),('AI007','AirIndia','Kolkata','Mumbai','20:10:00','22:30:00','2019-04-04',300,100,100,50,50),('AI007','AirIndia','Kolkata','Mumbai','20:10:00','22:30:00','2019-04-05',300,100,100,50,50),('AI007','AirIndia','Kolkata','Mumbai','20:10:00','22:30:00','2019-04-06',300,100,100,50,50),('AI008','AirIndia','Kolkata','Patna','20:10:00','22:30:00','2019-04-01',300,100,100,50,50),('AI008','AirIndia','Kolkata','Patna','20:10:00','22:30:00','2019-04-02',300,100,100,50,50),('AI008','AirIndia','Kolkata','Patna','20:10:00','22:30:00','2019-04-03',300,100,100,50,50),('AI008','AirIndia','Kolkata','Patna','20:10:00','22:30:00','2019-04-04',300,100,100,50,50),('AI008','AirIndia','Kolkata','Patna','20:10:00','22:30:00','2019-04-05',300,100,100,50,50),('AI008','AirIndia','Kolkata','Patna','20:10:00','22:30:00','2019-04-06',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','09:00:00','11:30:00','2019-03-30',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','20:10:00','22:30:00','2019-04-01',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','20:10:00','22:30:00','2019-04-02',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','20:10:00','22:30:00','2019-04-03',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','20:10:00','22:30:00','2019-04-04',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','20:10:00','22:30:00','2019-04-05',300,100,100,50,50),('AI009','AirIndia','Kolkata','Pune','20:10:00','22:30:00','2019-04-06',300,100,100,50,50),('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('IND002','Indigo','Kolkata','Delhi','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('IND002','Indigo','Kolkata','Delhi','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('IND002','Indigo','Kolkata','Delhi','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('IND002','Indigo','Kolkata','Delhi','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('IND002','Indigo','Kolkata','Delhi','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('IND002','Indigo','Kolkata','Delhi','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('IND003','Indigo','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('IND003','Indigo','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('IND003','Indigo','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('IND003','Indigo','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('IND003','Indigo','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('IND003','Indigo','Kolkata','Mumbai','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('IND004','Indigo','Kolkata','Patna','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('IND004','Indigo','Kolkata','Patna','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('IND004','Indigo','Kolkata','Patna','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('IND004','Indigo','Kolkata','Patna','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('IND004','Indigo','Kolkata','Patna','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('IND004','Indigo','Kolkata','Patna','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('IND005','Indigo','Kolkata','Pune','14:00:00','16:00:00','2019-04-01',300,100,100,50,50),('IND005','Indigo','Kolkata','Pune','14:00:00','16:00:00','2019-04-02',300,100,100,50,50),('IND005','Indigo','Kolkata','Pune','14:00:00','16:00:00','2019-04-03',300,100,100,50,50),('IND005','Indigo','Kolkata','Pune','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('IND005','Indigo','Kolkata','Pune','14:00:00','16:00:00','2019-04-05',300,100,100,50,50),('IND005','Indigo','Kolkata','Pune','14:00:00','16:00:00','2019-04-06',300,100,100,50,50),('IND006','Indigo','Ranchi','Patna','14:00:00','16:00:00','2019-04-04',300,100,100,50,50),('IND007','Indigo','Kolkata','Delhi','12:00:00','14:30:00','2019-04-11',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-04-01',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-04-02',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-04-03',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-04-04',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-04-05',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-04-06',300,100,100,50,50),('KF001','KingFisher','Kolkata','Delhi','13:00:00','15:30:00','2019-05-12',300,100,100,50,50),('KF002','KingFisher','Kolkata','Pune','15:00:00','17:30:00','2019-05-13',300,100,100,50,50),('KF003','KingFisher','Kolkata','Mumbai','13:00:00','15:30:00','2019-04-01',300,100,100,50,50),('KF003','KingFisher','Kolkata','Mumbai','13:00:00','15:30:00','2019-04-02',300,100,100,50,50),('KF003','KingFisher','Kolkata','Mumbai','13:00:00','15:30:00','2019-04-03',300,100,100,50,50),('KF003','KingFisher','Kolkata','Mumbai','13:00:00','15:30:00','2019-04-04',300,100,100,50,50),('KF003','KingFisher','Kolkata','Mumbai','13:00:00','15:30:00','2019-04-05',300,100,100,50,50),('KF003','KingFisher','Kolkata','Mumbai','13:00:00','15:30:00','2019-04-06',300,100,100,50,50),('KF004','KingFisher','Kolkata','Patna','13:00:00','15:30:00','2019-04-01',300,100,100,50,50),('KF004','KingFisher','Kolkata','Patna','13:00:00','15:30:00','2019-04-02',300,100,100,50,50),('KF004','KingFisher','Kolkata','Patna','13:00:00','15:30:00','2019-04-03',300,100,100,50,50),('KF004','KingFisher','Kolkata','Patna','13:00:00','15:30:00','2019-04-04',300,100,100,50,50),('KF004','KingFisher','Kolkata','Patna','13:00:00','15:30:00','2019-04-05',300,100,100,50,50),('KF004','KingFisher','Kolkata','Patna','13:00:00','15:30:00','2019-04-06',300,100,100,50,50),('KF005','KingFisher','Kolkata','Mumbai','10:00:00','13:00:00','2019-05-20',300,100,100,50,50),('KF006','KingFisher','Kolkata','Pune','13:00:00','15:30:00','2019-04-01',300,100,100,50,50),('KF006','KingFisher','Kolkata','Pune','13:00:00','15:30:00','2019-04-02',300,100,100,50,50),('KF006','KingFisher','Kolkata','Pune','13:00:00','15:30:00','2019-04-03',300,100,100,50,50),('KF006','KingFisher','Kolkata','Pune','13:00:00','15:30:00','2019-04-04',300,100,100,50,50),('KF006','KingFisher','Kolkata','Pune','13:00:00','15:30:00','2019-04-05',300,100,100,50,50),('KF006','KingFisher','Kolkata','Pune','13:00:00','15:30:00','2019-04-06',300,100,100,50,50),('KF007','KingFisher','Kolkata','Chennai','13:00:00','15:30:00','2019-04-01',300,100,100,50,50),('KF007','KingFisher','Kolkata','Chennai','13:00:00','15:30:00','2019-04-02',300,100,100,50,50),('KF007','KingFisher','Kolkata','Chennai','13:00:00','15:30:00','2019-04-03',300,100,100,50,50),('KF007','KingFisher','Kolkata','Chennai','13:00:00','15:30:00','2019-04-04',300,100,100,50,50),('KF007','KingFisher','Kolkata','Chennai','13:00:00','15:30:00','2019-04-05',300,100,100,50,50),('KF007','KingFisher','Kolkata','Chennai','13:00:00','15:30:00','2019-04-06',300,100,100,50,50),('SJ001','Spicejet','Ranchi','Patna','12:00:00','14:00:00','2019-04-04',300,100,100,50,50),('SJ0010','Spicejet','Kolkata','Pune','16:00:00','17:30:00','2019-04-01',300,100,100,50,50),('SJ0010','Spicejet','Kolkata','Pune','16:00:00','17:30:00','2019-04-02',300,100,100,50,50),('SJ0010','Spicejet','Kolkata','Pune','16:00:00','17:30:00','2019-04-03',300,100,100,50,50),('SJ0010','Spicejet','Kolkata','Pune','16:00:00','17:30:00','2019-04-04',300,100,100,50,50),('SJ0010','Spicejet','Kolkata','Pune','16:00:00','17:30:00','2019-04-05',300,100,100,50,50),('SJ0010','Spicejet','Kolkata','Pune','16:00:00','17:30:00','2019-04-06',300,100,100,50,50),('SJ002','Spicejet','Kolkata','Hydrabad','17:00:00','19:30:00','2019-06-20',300,100,100,50,50),('SJ003','Spicejet','Ranchi','Patna','08:00:00','11:00:00','2019-04-04',300,100,100,50,50),('SJ004','Spicejet','Ranchi','Patna','13:00:00','15:00:00','2019-04-04',300,100,100,50,50),('SJ005','Spicejet','Kolkata','Pune','01:00:00','03:30:00','2019-03-30',300,100,100,50,50),('SJ006','Spicejet','Kolkata','Delhi','16:00:00','17:30:00','2019-04-01',300,100,100,50,50),('SJ006','Spicejet','Kolkata','Delhi','16:00:00','17:30:00','2019-04-02',300,100,100,50,50),('SJ006','Spicejet','Kolkata','Delhi','16:00:00','17:30:00','2019-04-03',300,100,100,50,50),('SJ006','Spicejet','Kolkata','Delhi','16:00:00','17:30:00','2019-04-04',300,100,100,50,50),('SJ006','Spicejet','Kolkata','Delhi','16:00:00','17:30:00','2019-04-05',300,100,100,50,50),('SJ006','Spicejet','Kolkata','Delhi','16:00:00','17:30:00','2019-04-06',300,100,100,50,50),('SJ007','Spicejet','Kolkata','Mumbai','16:00:00','17:30:00','2019-04-01',300,100,100,50,50),('SJ007','Spicejet','Kolkata','Mumbai','16:00:00','17:30:00','2019-04-02',300,100,100,50,50),('SJ007','Spicejet','Kolkata','Mumbai','16:00:00','17:30:00','2019-04-03',300,100,100,50,50),('SJ007','Spicejet','Kolkata','Mumbai','16:00:00','17:30:00','2019-04-04',300,100,100,50,50),('SJ007','Spicejet','Kolkata','Mumbai','16:00:00','17:30:00','2019-04-05',300,100,100,50,50),('SJ007','Spicejet','Kolkata','Mumbai','16:00:00','17:30:00','2019-04-06',300,100,100,50,50),('SJ008','Spicejet','Kolkata','Chennai','16:00:00','17:30:00','2019-04-01',300,100,100,50,50),('SJ008','Spicejet','Kolkata','Chennai','16:00:00','17:30:00','2019-04-02',300,100,100,50,50),('SJ008','Spicejet','Kolkata','Chennai','16:00:00','17:30:00','2019-04-03',300,100,100,50,50),('SJ008','Spicejet','Kolkata','Chennai','16:00:00','17:30:00','2019-04-04',300,100,100,50,50),('SJ008','Spicejet','Kolkata','Chennai','16:00:00','17:30:00','2019-04-05',300,100,100,50,50),('SJ008','Spicejet','Kolkata','Chennai','16:00:00','17:30:00','2019-04-06',300,100,100,50,50),('SJ009','Spicejet','Kolkata','Patna','16:00:00','17:30:00','2019-04-01',300,100,100,50,50),('SJ009','Spicejet','Kolkata','Patna','16:00:00','17:30:00','2019-04-02',300,100,100,50,50),('SJ009','Spicejet','Kolkata','Patna','16:00:00','17:30:00','2019-04-03',300,100,100,50,50),('SJ009','Spicejet','Kolkata','Patna','16:00:00','17:30:00','2019-04-04',300,100,100,50,50),('SJ009','Spicejet','Kolkata','Patna','16:00:00','17:30:00','2019-04-05',300,100,100,50,50),('SJ009','Spicejet','Kolkata','Patna','16:00:00','17:30:00','2019-04-06',300,100,100,50,50);
/*!40000 ALTER TABLE `flight_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_details`
--

DROP TABLE IF EXISTS `passenger_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger_details` (
  `ticket_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_details`
--

LOCK TABLES `passenger_details` WRITE;
/*!40000 ALTER TABLE `passenger_details` DISABLE KEYS */;
INSERT INTO `passenger_details` VALUES ('AA003T0002','RAHUL SINGH MEHTA ','Male',21,96),('AA004T0036','SAm','M',22,1),('AA005T0097','Shikhar','Male',23,97),('AA005T0098','Sainath Deokar','Male',21,98),('KF003T0099','Lad Gorakhnath','Male',22,99),('KF006T0100','Lad Gorakhnath','Male',23,100),('SJ007T0101','Lad Gorakhnath','Male',20,101);
/*!40000 ALTER TABLE `passenger_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_info`
--

DROP TABLE IF EXISTS `ticket_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_info` (
  `ticket_id` varchar(10) NOT NULL,
  `flight_id` varchar(10) NOT NULL,
  `flight_departure_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_card_number` varchar(20) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  KEY `id_card_number` (`id_card_number`),
  KEY `flight_id` (`flight_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `ticket_info_ibfk_1` FOREIGN KEY (`id_card_number`) REFERENCES `customer_details` (`id_card_number`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_info_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight_details` (`flight_id`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_info_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `passenger_details` (`ticket_id`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_info_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `class_details` (`class_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_info`
--

LOCK TABLES `ticket_info` WRITE;
/*!40000 ALTER TABLE `ticket_info` DISABLE KEYS */;
INSERT INTO `ticket_info` VALUES ('AA003T0002','AA003','2019-04-03','cancel','123456789123','AA003E01','E001'),('AA005T0097','AA005','2019-04-03','confirm','123456789123','AA005E01','E001'),('AA005T0098','AA005','2019-04-02','confirm','123456789123','AA005E01','E001'),('KF003T0099','KF003','2019-04-02','confirm','123456789123','KF003E01','E001'),('KF006T0100','KF006','2019-04-03','confirm','111111111111','KF006E01','E001'),('SJ007T0101','SJ007','2019-04-02','cancel','123456789123','SJ001E01','E001');
/*!40000 ALTER TABLE `ticket_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-26 16:30:07
