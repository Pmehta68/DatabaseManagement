-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: project
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `Analyst`
--

DROP TABLE IF EXISTS `Analyst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Analyst` (
  `analyst_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`analyst_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `Analyst_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Analyst`
--

LOCK TABLES `Analyst` WRITE;
/*!40000 ALTER TABLE `Analyst` DISABLE KEYS */;
INSERT INTO `Analyst` VALUES (1,4),(2,5),(3,7);
/*!40000 ALTER TABLE `Analyst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Complaint`
--

DROP TABLE IF EXISTS `Complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `ride_taken_id` int(11) DEFAULT NULL,
  `customer_support_id` int(11) DEFAULT NULL,
  `complaint_description` text,
  `complaint_status` varchar(10) DEFAULT NULL,
  `complaint_by` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `ride_taken_id` (`ride_taken_id`),
  KEY `customer_support_id` (`customer_support_id`),
  CONSTRAINT `Complaint_ibfk_1` FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken` (`ride_taken_id`),
  CONSTRAINT `Complaint_ibfk_2` FOREIGN KEY (`customer_support_id`) REFERENCES `Customer_Support` (`customer_support_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complaint`
--

LOCK TABLES `Complaint` WRITE;
/*!40000 ALTER TABLE `Complaint` DISABLE KEYS */;
INSERT INTO `Complaint` VALUES (1,4,3,'hendrerit neque.','Pending','Driver'),(2,6,5,'pharetra sed, hendrerit a, arcu. Sed et libero. Proin','Resolved','Passenger'),(3,12,4,'nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim','Initiated','Driver'),(4,3,2,'parturient montes, nascetur ridiculus mus. Proin','Initiated','Passenger'),(5,17,6,'magna a tortor. Nunc commodo auctor velit. Aliquam','Initiated','Passenger');
/*!40000 ALTER TABLE `Complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Support`
--

DROP TABLE IF EXISTS `Customer_Support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Support` (
  `customer_support_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_support_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `Customer_Support_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Support`
--

LOCK TABLES `Customer_Support` WRITE;
/*!40000 ALTER TABLE `Customer_Support` DISABLE KEYS */;
INSERT INTO `Customer_Support` VALUES (1,1),(2,2),(3,3),(4,6),(5,8),(6,9),(7,10);
/*!40000 ALTER TABLE `Customer_Support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Driver` (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `driver_password` varchar(12) DEFAULT NULL,
  `driver_last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `driver_account_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`driver_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Driver_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES (1,1,'YZI48GPI3FC','2016-09-27 20:16:17','375785884022735'),(2,3,'TFI02GFY6RG','0000-00-00 00:00:00','3748 340697 577'),(3,5,'COG99IAG0GL','2017-02-04 07:44:48','3785 692506 043'),(4,7,'TXL72WYL6PE','2017-07-13 22:02:39','3774 461104 073'),(5,10,'MLL71HXY1AB','2017-10-25 12:55:32','3753 195785 249');
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Driver_Ratings`
--

DROP TABLE IF EXISTS `Driver_Ratings`;
/*!50001 DROP VIEW IF EXISTS `Driver_Ratings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Driver_Ratings` (
  `user_name` tinyint NOT NULL,
  `driver_id` tinyint NOT NULL,
  `ride_source` tinyint NOT NULL,
  `ride_destination` tinyint NOT NULL,
  `passenger_id` tinyint NOT NULL,
  `rating` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) DEFAULT NULL,
  `employee_email` varchar(100) DEFAULT NULL,
  `employee_type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Ulric Terry','luctus.ipsum.leo@montes.com','customer_support'),(2,'Chelsea Winters','sed@metusAliquamerat.org','customer_support'),(3,'Indigo Butler','placerat@nonlobortisquis.com','customer_support'),(4,'Helen Michael','tortor@metussitamet.co.uk','analyst'),(5,'Xenos Peterson','et@Quisque.co.uk','analyst'),(6,'Aidan Wong','elementum@ipsum.co.uk','customer_support'),(7,'Noelani Wilcox','metus@nullaDonec.co.uk','analyst'),(8,'Camille Bradley','a@Nuncac.org','customer_support'),(9,'Steven Sandoval','Nullam@purusNullam.org','customer_support'),(10,'Erica Shannon','tincidunt.Donec@sociosquad.co.uk','customer_support');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(10) NOT NULL,
  `login_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (1,1,'Driver','2016-08-27 20:16:17'),(2,2,'Passenger','2016-09-26 07:01:39'),(3,1,'Driver','2016-09-27 20:16:17'),(4,2,'Passenger','2016-10-11 07:01:39'),(5,3,'Passenger','2017-01-02 22:16:59'),(6,4,'Passenger','2017-02-04 08:08:51'),(7,5,'Driver','2017-02-04 07:44:48'),(8,6,'Passenger','2017-03-11 08:38:13'),(9,7,'Driver','2017-03-13 22:02:39'),(10,3,'Passenger','2017-04-02 22:16:59'),(11,4,'Passenger','2017-05-09 08:08:51'),(12,5,'Passenger','2017-05-11 07:44:48'),(13,6,'Passenger','2017-06-11 08:38:13'),(14,7,'Driver','2017-07-13 22:02:39'),(15,8,'Passenger','2017-08-02 03:48:52'),(16,9,'Passenger','2017-08-04 15:01:09'),(17,10,'Driver','2017-09-23 12:55:32'),(18,8,'Passenger','2017-09-25 03:48:52'),(19,9,'Passenger','2017-10-04 15:01:09'),(20,10,'Driver','2017-10-25 12:55:32');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Passenger` (
  `passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `passenger_password` varchar(12) DEFAULT NULL,
  `passenger_last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `passenger_credit_card` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES (1,2,'WMU77ENO8EJ','2016-10-11 07:01:39','550944 187153 8246'),(2,4,'TXT41CDB7AT','2017-05-09 08:08:51','5366762894955097'),(3,6,'VAT45LWG8TK','2017-06-11 08:38:13','5220 6203 6385 0403'),(4,8,'FQP92WMI3NP','2017-09-25 03:48:52','5506 6049 2834 4230'),(5,9,'RUP13QQF8NP','2017-10-04 15:01:09','5588692189271185'),(6,3,'RFQ31PRE2EU','2017-04-02 22:16:59','523021 5607228470'),(7,5,'ELT54MGG0FG','2017-05-11 07:44:48','531926 4560784214'),(8,11,'KLU7657AS','2017-11-22 08:46:55','45665565678798112');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `ride_taken_id` int(11) DEFAULT NULL,
  `payment_status` varchar(12) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `ride_taken_id` (`ride_taken_id`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken` (`ride_taken_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,2,'Paid',3.76),(2,1,'Paid',3.76),(3,5,'Paid',3.71),(4,7,'Paid',3.19),(5,6,'Paid',3.19),(6,4,'Paid',3.71),(7,3,'Outstanding',3.71),(8,10,'Paid',4.76),(9,8,'Outstanding',4.76),(10,9,'Paid',1.75),(11,11,'Paid',9.34),(12,13,'Paid',4.89),(13,16,'Outstanding',4.89),(14,15,'Outstanding',4.89),(15,17,'Paid',2.66),(16,14,'Paid',4.89),(17,12,'Outstanding',4.82),(18,20,'Paid',6.22),(19,18,'Paid',6.22),(20,19,'Outstanding',6.22);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `ride_taken_id` int(11) DEFAULT NULL,
  `rating_given_by` varchar(10) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `ride_taken_id` (`ride_taken_id`),
  CONSTRAINT `Rating_ibfk_1` FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken` (`ride_taken_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
INSERT INTO `Rating` VALUES (1,2,'Passenger',4),(2,5,'Passenger',4),(3,10,'Passenger',3),(4,9,'Driver',5),(5,1,'Passenger',2),(6,3,'Driver',5),(7,8,'Passenger',5),(8,12,'Driver',4),(9,15,'Passenger',4),(10,19,'Driver',2);
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Refund`
--

DROP TABLE IF EXISTS `Refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `ride_taken_id` int(11) DEFAULT NULL,
  `customer_support_id` int(11) DEFAULT NULL,
  `refund_reason` text,
  `refund_status` varchar(12) DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `ride_taken_id` (`ride_taken_id`),
  KEY `customer_support_id` (`customer_support_id`),
  CONSTRAINT `Refund_ibfk_1` FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken` (`ride_taken_id`),
  CONSTRAINT `Refund_ibfk_2` FOREIGN KEY (`customer_support_id`) REFERENCES `Customer_Support` (`customer_support_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Refund`
--

LOCK TABLES `Refund` WRITE;
/*!40000 ALTER TABLE `Refund` DISABLE KEYS */;
INSERT INTO `Refund` VALUES (1,2,3,'lobortis tellus justo sit amet nulla. Donec non justo.','Resolved',3.51),(2,10,1,'elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate','Resolved',1.47),(3,15,7,'rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi','Resolved',0.00);
/*!40000 ALTER TABLE `Refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ride`
--

DROP TABLE IF EXISTS `Ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ride` (
  `ride_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) DEFAULT NULL,
  `ride_source` varchar(50) NOT NULL,
  `ride_destination` varchar(50) NOT NULL,
  `ride_date` date NOT NULL,
  `ride_fare` decimal(10,2) NOT NULL,
  `ride_seats_available` int(11) NOT NULL,
  PRIMARY KEY (`ride_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `Ride_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `Driver` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ride`
--

LOCK TABLES `Ride` WRITE;
/*!40000 ALTER TABLE `Ride` DISABLE KEYS */;
INSERT INTO `Ride` VALUES (1,1,'Montes Street','Ante St.','2016-09-29',3.76,4),(2,4,'Sed Avenue','Libero Avenue','2017-01-23',3.71,3),(3,3,'Quam. St.','Sed Road','2017-02-07',3.19,4),(4,4,'Erat St.','Libero Avenue','2017-03-15',4.76,3),(5,4,'Erat St.','Libero Avenue','2017-03-20',1.75,4),(6,3,'Luctus Av.','Neque. Rd.','2017-06-20',9.34,1),(7,5,'Fermentum Street','Non St.','2017-09-27',4.82,4),(8,3,'Quam St.','Libero Avenue','2017-09-27',4.89,4),(9,1,'Convallis Rd.','Ante St.','2017-09-29',2.66,3),(10,5,'Duis Ave','Magna. Rd.','2017-10-25',6.22,4);
/*!40000 ALTER TABLE `Ride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ride_Taken`
--

DROP TABLE IF EXISTS `Ride_Taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ride_Taken` (
  `ride_taken_id` int(11) NOT NULL AUTO_INCREMENT,
  `ride_id` int(11) DEFAULT NULL,
  `booking_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  `ride_fare` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ride_taken_id`),
  KEY `ride_id` (`ride_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `Ride_Taken_ibfk_1` FOREIGN KEY (`ride_id`) REFERENCES `Ride` (`ride_id`),
  CONSTRAINT `Ride_Taken_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `Passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ride_Taken`
--

LOCK TABLES `Ride_Taken` WRITE;
/*!40000 ALTER TABLE `Ride_Taken` DISABLE KEYS */;
INSERT INTO `Ride_Taken` VALUES (1,1,'2016-09-28 18:25:27',3,3.76),(2,1,'2016-09-28 21:13:09',2,3.76),(3,2,'2017-01-22 17:42:16',5,3.71),(4,2,'2017-01-22 21:42:28',4,3.71),(5,2,'2017-01-22 22:27:19',2,3.71),(6,3,'2017-02-06 19:39:13',2,3.19),(7,3,'2017-02-07 22:27:16',6,3.19),(8,4,'2017-03-14 07:41:30',7,4.76),(9,5,'2017-03-20 13:28:58',2,1.75),(10,5,'2017-03-20 17:00:38',6,1.75),(11,6,'2017-06-19 20:00:38',5,9.34),(12,7,'2017-09-26 17:00:33',6,4.82),(13,8,'2017-09-26 03:17:25',1,4.89),(14,8,'2017-09-26 17:45:45',4,4.89),(15,8,'2017-09-26 19:58:32',2,4.89),(16,8,'2017-09-26 22:12:18',5,4.89),(17,9,'2017-09-28 23:33:56',5,2.66),(18,10,'2017-10-23 21:19:13',7,6.22),(19,10,'2017-10-24 01:19:13',3,6.22),(20,10,'2017-10-24 10:01:08',5,6.22);
/*!40000 ALTER TABLE `Ride_Taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Ride_details`
--

DROP TABLE IF EXISTS `Ride_details`;
/*!50001 DROP VIEW IF EXISTS `Ride_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Ride_details` (
  `user_id` tinyint NOT NULL,
  `passenger_id` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `user_email` tinyint NOT NULL,
  `ride_taken_id` tinyint NOT NULL,
  `ride_source` tinyint NOT NULL,
  `ride_destination` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_zipcode` varchar(5) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Kiona Ashley','P.O. Box 730, 224 Ut, Road','natoque.penatibus.et@commodoipsumSuspendisse.net','474-0158','95014'),(2,'Bryar Hopkins','8482 Massa Rd.','non.sollicitudin@Donecdignissimmagna.org','995-5229','95086'),(3,'Ingrid Mullins','582-7339 Vitae Ave','amet.lorem@loremDonecelementum.org','291-8876','95014'),(4,'Clinton Guzman','923-1666 Parturient St.','semper.pretium.neque@Phasellus.edu','871-7377','95008'),(5,'Astra Everett','Ap #563-4042 Aliquam Av.','nibh@lectusasollicitudin.com','1-900-162-0731','95008'),(6,'Kaye Bird','P.O. Box 391, 9738 Aliquam St.','nec.diam.Duis@Aliquamauctorvelit.com','237-7845','95083'),(7,'Aladdin Harmon','410-9599 Aliquam Ave','Curabitur@vulputatelacus.co.uk','1-127-328-7250','95623'),(8,'Malachi Marsh','5395 Duis St.','nascetur.ridiculus@ridiculus.edu','1-168-120-7039','95083'),(9,'Virginia Cunningham','7803 Dui Avenue','eleifend.vitae@arcuVestibulum.edu','905-2791','95014'),(10,'Evangeline Gaines','2030 Ridiculus St.','In@estarcuac.org','588-5223','95432'),(11,'Brinne Gomes','115 North First Street','gomes@schellar.com','426-7865','92376');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Driver_Ratings`
--

/*!50001 DROP TABLE IF EXISTS `Driver_Ratings`*/;
/*!50001 DROP VIEW IF EXISTS `Driver_Ratings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`roswal94`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Driver_Ratings` AS select `U`.`user_name` AS `user_name`,`D`.`driver_id` AS `driver_id`,`RD`.`ride_source` AS `ride_source`,`RD`.`ride_destination` AS `ride_destination`,`RT`.`passenger_id` AS `passenger_id`,`R`.`rating` AS `rating` from ((((`User` `U` join `Driver` `D`) join `Rating` `R`) join `Ride_Taken` `RT`) join `Ride` `RD`) where ((`U`.`user_id` = `D`.`user_id`) and (`D`.`driver_id` = `RD`.`driver_id`) and (`RD`.`ride_id` = `RT`.`ride_id`) and (`R`.`ride_taken_id` = `RT`.`ride_taken_id`) and (`R`.`rating_given_by` = 'Passenger')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Ride_details`
--

/*!50001 DROP TABLE IF EXISTS `Ride_details`*/;
/*!50001 DROP VIEW IF EXISTS `Ride_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`roswal94`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Ride_details` AS select `U`.`user_id` AS `user_id`,`P`.`passenger_id` AS `passenger_id`,`U`.`user_name` AS `user_name`,`U`.`user_email` AS `user_email`,`RT`.`ride_taken_id` AS `ride_taken_id`,`R`.`ride_source` AS `ride_source`,`R`.`ride_destination` AS `ride_destination` from (((`User` `U` join `Passenger` `P`) join `Ride` `R`) join `Ride_Taken` `RT`) where ((`P`.`passenger_id` = `RT`.`passenger_id`) and (`U`.`user_id` = `P`.`user_id`) and (`R`.`ride_id` = `RT`.`ride_id`)) */;
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

-- Dump completed on 2017-11-30  3:46:21
