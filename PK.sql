/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.10 : Database - pk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pk` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pk`;

/*Table structure for table `points` */

DROP TABLE IF EXISTS `points`;

CREATE TABLE `points` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `bus_no` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `points` */

insert  into `points`(`id`,`name`,`bus_no`,`lat`,`lon`) values (1,'Perungudi',0,12.95663561,80.24378979),(2,'Tidel Park',0,12.989251,80.2497045);

/* Procedure structure for procedure `distance` */

/*!50003 DROP PROCEDURE IF EXISTS  `distance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `distance`(in nam varchar(50))
BEGIN
    declare latitude double;
    declare longitude double;
select lat into latitude from points where name=nam;
SELECT lon INTO longitude FROM points WHERE NAME=nam;
SELECT NAME, (6371 * ACOS( COS( RADIANS(latitude) ) * COS( RADIANS( lat ) ) * COS( RADIANS( longitude ) - RADIANS(lon) ) + SIN( RADIANS(latitude) ) * SIN( RADIANS(lat) ) )) AS distanta 
FROM points 
WHERE lat<>'' 
    AND lon<>'' 
HAVING distanta<50 
ORDER BY distanta DESC;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
