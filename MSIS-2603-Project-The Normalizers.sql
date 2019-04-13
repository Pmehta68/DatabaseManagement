DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `user_id` integer auto_increment NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_zipcode` varchar(5) NOT NULL,
  PRIMARY KEY (`user_id`)
) AUTO_INCREMENT=1;

INSERT INTO `User` (`user_id`,`user_name`,`user_address`,`user_email`,`user_contact`,`user_zipcode`) 
VALUES 
(1,"Kiona Ashley","P.O. Box 730, 224 Ut, Road","natoque.penatibus.et@commodoipsumSuspendisse.net","474-0158", "95014"),
(2,"Bryar Hopkins","8482 Massa Rd.","non.sollicitudin@Donecdignissimmagna.org","995-5229","95086"),
(3,"Ingrid Mullins","582-7339 Vitae Ave","amet.lorem@loremDonecelementum.org","291-8876", "95014"),
(4,"Clinton Guzman","923-1666 Parturient St.","semper.pretium.neque@Phasellus.edu","871-7377", "95008"),
(5,"Astra Everett","Ap #563-4042 Aliquam Av.","nibh@lectusasollicitudin.com","1-900-162-0731","95008"),
(6,"Kaye Bird","P.O. Box 391, 9738 Aliquam St.","nec.diam.Duis@Aliquamauctorvelit.com","237-7845","95083"),
(7,"Aladdin Harmon","410-9599 Aliquam Ave","Curabitur@vulputatelacus.co.uk","1-127-328-7250","95623"),
(8,"Malachi Marsh","5395 Duis St.","nascetur.ridiculus@ridiculus.edu","1-168-120-7039","95083"),
(9,"Virginia Cunningham","7803 Dui Avenue","eleifend.vitae@arcuVestibulum.edu","905-2791","95014"),
(10,"Evangeline Gaines","2030 Ridiculus St.","In@estarcuac.org","588-5223","95432");



DROP TABLE IF EXISTS `Passenger`;

CREATE TABLE `Passenger` (
  `passenger_id` integer NOT NULL auto_increment,
  `user_id` integer,
  `passenger_password` varchar(12),
  `passenger_last_login` timestamp default 0 ,
  `passenger_credit_card` varchar(20),
  PRIMARY KEY (`passenger_id`,`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Passenger` (`passenger_id`,`user_id`,`passenger_password`,`passenger_last_login`,`passenger_credit_card`) 
VALUES (1,2,"WMU77ENO8EJ","2016-10-11 07:01:39","550944 187153 8246"),
(2,4,"TXT41CDB7AT","2017-05-09 08:08:51","5366762894955097"),
(3,6,"VAT45LWG8TK","2017-06-11 08:38:13","5220 6203 6385 0403"),
(4,8,"FQP92WMI3NP","2017-09-25 03:48:52","5506 6049 2834 4230"),
(5,9,"RUP13QQF8NP","2017-10-04 15:01:09","5588692189271185"),
(6,3,"RFQ31PRE2EU","2017-04-02 22:16:59","523021 5607228470"),
(7,5,"ELT54MGG0FG","2017-05-11 07:44:48","531926 4560784214");



DROP TABLE IF EXISTS `Driver`;

CREATE TABLE `Driver` (
  `driver_id` integer NOT NULL auto_increment,
  `user_id` integer,
  `driver_password` varchar(12),
  `driver_last_login` timestamp default 0,
  `driver_account_no` varchar(15),
  PRIMARY KEY (`driver_id`,`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Driver` (`driver_id`,`user_id`,`driver_password`,`driver_last_login`,`driver_account_no`) 
VALUES (1,1,"YZI48GPI3FC","2016-09-27 20:16:17","375785884022735"),
(2,3,"TFI02GFY6RG","","3748 340697 57797"),
(3,5,"COG99IAG0GL","2017-02-04 07:44:48","3785 692506 04384"),
(4,7,"TXL72WYL6PE","2017-07-13 22:02:39","3774 461104 07335"),
(5,10,"MLL71HXY1AB","2017-10-25 12:55:32","3753 195785 24911");




DROP TABLE IF EXISTS `Login`;

CREATE TABLE `Login` (
  `login_id` integer NOT NULL auto_increment,
  `user_id` integer,
  `user_type` varchar(10) NOT NULL,
  `login_time_stamp` timestamp,
  PRIMARY KEY (`login_id`),
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Login` (`login_id`,`user_id`,`user_type`,`login_time_stamp`) 
VALUES (1,1,"Driver","2016-08-27 20:16:17"),
(2,2,"Passenger","2016-09-26 07:01:39"),
(3,1,"Driver","2016-09-27 20:16:17"),
(4,2,"Passenger","2016-10-11 07:01:39"),
(5,3,"Passenger","2017-01-02 22:16:59"),
(6,4,"Passenger","2017-02-04 08:08:51"),
(7,5,"Driver","2017-02-04 07:44:48"),
(8,6,"Passenger","2017-03-11 08:38:13"),
(9,7,"Driver","2017-03-13 22:02:39"),
(10,3,"Passenger","2017-04-02 22:16:59"),
(11,4,"Passenger","2017-05-09 08:08:51"),
(12,5,"Passenger","2017-05-11 07:44:48"),
(13,6,"Passenger","2017-06-11 08:38:13"),
(14,7,"Driver","2017-07-13 22:02:39"),
(15,8,"Passenger","2017-08-02 03:48:52"),
(16,9,"Passenger","2017-08-04 15:01:09"),
(17,10,"Driver","2017-09-23 12:55:32"),
(18,8,"Passenger","2017-09-25 03:48:52"),
(19,9,"Passenger","2017-10-04 15:01:09"),
(20,10,"Driver","2017-10-25 12:55:32");

DROP TABLE IF EXISTS `Ride`;

CREATE TABLE `Ride` (
  `ride_id` integer NOT NULL auto_increment,
  `driver_id` integer,
  `ride_source` varchar(50) NOT NULL,
  `ride_destination` varchar(50) NOT NULL,
  `ride_date` date NOT NULL,
  `ride_fare` numeric(10,2) NOT NULL,
  `ride_seats_available` integer NOT NULL,
  PRIMARY KEY (`ride_id`),
  FOREIGN KEY (`driver_id`) REFERENCES `Driver`(`driver_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Ride` (`ride_id`,`driver_id`,`ride_source`,`ride_destination`,`ride_date`,`ride_fare`,`ride_seats_available`) 
VALUES 
(1,1,"Montes Street","Ante St.","2016-09-29","3.76",4),
(2,4,"Sed Avenue","Libero Avenue","2017-01-23","3.71",3),
(3,3,"Quam. St.","Sed Road","2017-02-07","3.19",4),
(4,4,"Erat St.","Libero Avenue","2017-03-15","4.76",3),
(5,4,"Erat St.","Libero Avenue","2017-03-20","1.75",4),
(6,3,"Luctus Av.","Neque. Rd.","2017-06-20","9.34",1),
(7,5,"Fermentum Street","Non St.","2017-09-27","4.82",4),
(8,3,"Quam St.","Libero Avenue","2017-09-27","4.89",4),
(9,1,"Convallis Rd.","Ante St.","2017-09-29","2.66",3),
(10,5,"Duis Ave","Magna. Rd.","2017-10-25","6.22",4);

DROP TABLE IF EXISTS `Ride_Taken`;
CREATE TABLE `Ride_Taken` (
  `ride_taken_id` integer NOT NULL auto_increment,
  `ride_id` integer,
  `booking_time_stamp` timestamp,
  `passenger_id` integer,
  `ride_fare` numeric(10,2) NOT NULL,
  PRIMARY KEY (`ride_taken_id`),
  FOREIGN KEY (`ride_id`) REFERENCES `Ride`(`ride_id`),
  FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`passenger_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Ride_Taken` (`ride_taken_id`,`ride_id`,`booking_time_stamp`,`passenger_id`,`ride_fare`) 
VALUES 
(1,1,"2016-09-28 18:25:27",3,"3.76"),
(2,1,"2016-09-28 21:13:09",2,"3.76"),
(3,2,"2017-01-22 17:42:16",5,"3.71"),
(4,2,"2017-01-22 21:42:28",4,"3.71"),
(5,2,"2017-01-22 22:27:19",2,"3.71"),
(6,3,"2017-02-06 19:39:13",2,"3.19"),
(7,3,"2017-02-07 22:27:16",6,"3.19"),
(8,4,"2017-03-14 07:41:30",7,"4.76"),
(9,5,"2017-03-20 13:28:58",2,"1.75"),
(10,5,"2017-03-20 17:00:38",6,"1.75"),
(11,6,"2017-06-19 20:00:38",5,"9.34"),
(12,7,"2017-09-26 17:00:33",6,"4.82"),
(13,8,"2017-09-26 03:17:25",1,"4.89"),
(14,8,"2017-09-26 17:45:45",4,"4.89"),
(15,8,"2017-09-26 19:58:32",2,"4.89"),
(16,8,"2017-09-26 22:12:18",5,"4.89"),
(17,9,"2017-09-28 23:33:56",5,"2.66"),
(18,10,"2017-10-23 21:19:13",7,"6.22"),
(19,10,"2017-10-24 01:19:13",3,"6.22"),
(20,10,"2017-10-24 10:01:08",5,"6.22");



DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `payment_id` integer NOT NULL auto_increment,
  `ride_taken_id` integer,
  `payment_status` varchar(12),
  `payment_amount` numeric(10,2),
  PRIMARY KEY (`payment_id`),
  FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken`(`ride_taken_id`)
) AUTO_INCREMENT=1;


INSERT INTO `Payment` (`payment_id`,`ride_taken_id`,`payment_status`,`payment_amount`) 
VALUES 
(1,2,"Paid","3.76"),
(2,1,"Paid","3.76"),
(3,5,"Paid","3.71"),
(4,7,"Paid","3.19"),
(5,6,"Paid","3.19"),
(6,4,"Paid","3.71"),
(7,3,"Outstanding","3.71"),
(8,10,"Paid","4.76"),
(9,8,"Outstanding","4.76"),
(10,9,"Paid","1.75"),
(11,11,"Paid","9.34"),
(12,13,"Paid","4.89"),
(13,16,"Outstanding","4.89"),
(14,15,"Outstanding","4.89"),
(15,17,"Paid","2.66"),
(16,14,"Paid","4.89"),
(17,12,"Outstanding","4.82"),
(18,20,"Paid","6.22"),
(19,18,"Paid","6.22"),
(20,19,"Outstanding","6.22");



DROP TABLE IF EXISTS `Rating`;
CREATE TABLE `Rating` (
  `rating_id` integer NOT NULL auto_increment,
  `ride_taken_id` integer,
  `rating_given_by` varchar(10),
  `rating` integer default NULL,
  PRIMARY KEY (`rating_id`),
  FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken`(`ride_taken_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Rating` (`rating_id`,`ride_taken_id`,`rating_given_by`,`rating`)
VALUES 
(1,2,"Passenger",4),
(2,5,"Passenger",4),
(3,10,"Passenger",3),
(4,9,"Driver",5),
(5,1,"Passenger",2),
(6,3,"Driver",5),
(7,8,"Passenger",5),
(8,12,"Driver",4),
(9,15,"Passenger",2),
(10,19,"Driver",2);


DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` ( 
  `employee_id` integer NOT NULL auto_increment,
  `employee_name` varchar(50) default NULL,
  `employee_email` varchar(100) default NULL,
  `employee_type` varchar(16) default NULL,
  PRIMARY KEY (`employee_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Employee` (`employee_id`,`employee_name`,`employee_email`,`employee_type`) 
VALUES 
(1,"Ulric Terry","luctus.ipsum.leo@montes.com","customer_support"),
(2,"Chelsea Winters","sed@metusAliquamerat.org","customer_support"),
(3,"Indigo Butler","placerat@nonlobortisquis.com","customer_support"),
(4,"Helen Michael","tortor@metussitamet.co.uk","analyst"),
(5,"Xenos Peterson","et@Quisque.co.uk","analyst"),
(6,"Aidan Wong","elementum@ipsum.co.uk","customer_support"),
(7,"Noelani Wilcox","metus@nullaDonec.co.uk","analyst"),
(8,"Camille Bradley","a@Nuncac.org","customer_support"),
(9,"Steven Sandoval","Nullam@purusNullam.org","customer_support"),
(10,"Erica Shannon","tincidunt.Donec@sociosquad.co.uk","customer_support");

DROP TABLE IF EXISTS `Customer_Support`;

CREATE TABLE `Customer_Support` (
  `customer_support_id` integer NOT NULL auto_increment,
  `employee_id` integer,
  PRIMARY KEY (`customer_support_id`,`employee_id`),
  FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Customer_Support` (`customer_support_id`,`employee_id`) 
VALUES (1,1),(2,2),(3,3),(4,6),(5,8),(6,9),(7,10);

DROP TABLE IF EXISTS `Analyst`;

CREATE TABLE `Analyst` (
  `analyst_id` integer NOT NULL auto_increment,
  `employee_id` integer,
  PRIMARY KEY (`analyst_id`,`employee_id`),
  FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Analyst` (`analyst_id`,`employee_id`) 
VALUES (1,4),(2,5),(3,7);


DROP TABLE IF EXISTS `Complaint`;

CREATE TABLE `Complaint` (
  `complaint_id` integer NOT NULL auto_increment,
  `ride_taken_id` integer,
  `customer_support_id` integer,
  `complaint_description` TEXT default NULL,
  `complaint_status` varchar(10),
  `complaint_by` varchar(10),
  PRIMARY KEY (`complaint_id`),
  FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken`(`ride_taken_id`),
  FOREIGN KEY (`customer_support_id`) REFERENCES `Customer_Support`(`customer_support_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Complaint` (`complaint_id`,`ride_taken_id`,`customer_support_id`,`complaint_description`,`complaint_status`,`complaint_by`) 
VALUES  
(1,4,3,"hendrerit neque.","Pending","Driver"),
(2,6,5,"pharetra sed, hendrerit a, arcu. Sed et libero. Proin","Resolved","Passenger"),
(3,12,4,"nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim","Initiated","Driver"),
(4,3,2,"parturient montes, nascetur ridiculus mus. Proin","Initiated","Passenger"),
(5,17,6,"magna a tortor. Nunc commodo auctor velit. Aliquam","Initiated","Passenger");


DROP TABLE IF EXISTS `Refund`;
CREATE TABLE `Refund` (
  `refund_id` integer NOT NULL auto_increment,
  `ride_taken_id` integer,
  `customer_support_id` integer,
  `refund_reason` TEXT default NULL,
  `refund_status` varchar(12),
  `refund_amount` numeric(10,2),
  PRIMARY KEY (`refund_id`),
  FOREIGN KEY (`ride_taken_id`) REFERENCES `Ride_Taken`(`ride_taken_id`),
  FOREIGN KEY (`customer_support_id`) REFERENCES `Customer_Support`(`customer_support_id`)
) AUTO_INCREMENT=1;

INSERT INTO `Refund` (`refund_id`,`ride_taken_id`,`customer_support_id`,`refund_reason`,`refund_status`,`refund_amount`)
VALUES 
(1,2,3,"lobortis tellus justo sit amet nulla. Donec non justo.","Resolved","3.51"),
(2,10,1,"elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate","Resolved","1.47"),
(3,15,7,"rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi","Resolved","0.00"),
(4,19,2,"tristique senectus et netus et malesuada fames ac turpis egestas.","Pending","5.93");





