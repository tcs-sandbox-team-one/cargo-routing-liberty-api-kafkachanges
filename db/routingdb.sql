CREATE SCHEMA `routingmsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
use routingmsdb;

CREATE USER 'routingmsdb'@'%' IDENTIFIED BY 'routingmsdb';
GRANT ALL PRIVILEGES ON routingmsdb.* TO 'routingmsdb'@'%';

##Voyage Table DDL
CREATE TABLE `voyage` (
`Id` int(11) NOT NULL AUTO_INCREMENT,
`voyage_number` varchar(20) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##Carrier Movement Table DDL -
CREATE TABLE `carrier_movement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `arrival_location_id` varchar(100) DEFAULT NULL,
  `departure_location_id` varchar(100) DEFAULT NULL,
  `voyage_id` int(11) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

##Location Table DDL
CREATE TABLE `location` (
`ID` int(11) DEFAULT NULL,
`NAME` varchar(50) DEFAULT NULL,
`UNLOCODE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

### Data to ensure Routing works fine ->
insert voyage (Id,voyage_number) values(3,'0100S');
insert voyage (Id,voyage_number) values(4,'0101S');
insert voyage (Id,voyage_number) values(5,'0102S');

insert into carrier_movement (Id,arrival_location_id,departure_location_id,voyage_id,arrival_date,departure_date) values (1355,'CNHGH','CNHKG',3,'2020-04-02','2020-04-01');
insert into carrier_movement (Id,arrival_location_id,departure_location_id,voyage_id,arrival_date,departure_date) values (1356,'JNTKO','CNHGH',4,'2020-04-04','2020-04-02');
insert into carrier_movement (Id,arrival_location_id,departure_location_id,voyage_id,arrival_date,departure_date) values (1357,'USNYC','JNTKO',5,'2020-04-05','2020-04-04');

insert into location (ID,NAME,UNLOCODE) values (1, 'China - Hongkong', 'CNHKG');
insert into location (ID,NAME,UNLOCODE) values (2, 'China - Highland', 'CNHGH');
insert into location (ID,NAME,UNLOCODE) values (3, 'Japan - Tokyo', 'JNTKO');
insert into location (ID,NAME,UNLOCODE) values (4, 'USA - New York', 'USNYC');