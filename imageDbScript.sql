CREATE DATABASE `images`;
USE `images`;

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `image` VALUES (18,'Images Name','card10.gif'),(25,'Images Name','card16.gif'),(26,'Images Name','card14.gif');
