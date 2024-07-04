create database first_test_project;
use first_test_project;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `upassword` varchar(50) DEFAULT NULL,
  `uemail` varchar(50) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `imag` blob,
  `dateN` date DEFAULT NULL,
  PRIMARY KEY (`id`)
);
