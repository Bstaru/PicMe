
CREATE TABLE `ciudad` (
  `idCiudad` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nomCiudad` varchar(50) DEFAULT NULL,
  `idPais` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `notification` (
  `idNotify` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `notifydate` date DEFAULT NULL,
  `idPost` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`idNotify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pais` (
  `idPais` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nomPais` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

CREATE TABLE `publicacion` (
  `idPost` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `postdate` date DEFAULT NULL,
  `post_title` varchar(30) DEFAULT NULL,
  `post_body` varchar(250) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `foto` mediumblob,
  `video` varchar(255) DEFAULT NULL,
  `idUser` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`idPost`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

CREATE TABLE `reportes` (
  `idReport` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idUReported` smallint(5) unsigned DEFAULT NULL,
  `idPReport` smallint(5) unsigned DEFAULT NULL,
  `Rmotivo` varchar(200) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `FechRep` date DEFAULT NULL,
  PRIMARY KEY (`idReport`),
  KEY `idUReported` (`idUReported`),
  KEY `idPReport` (`idPReport`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`idUReported`) REFERENCES `usuario` (`idUser`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`idPReport`) REFERENCES `publicacion` (`idPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `seguridad` (
  `idQuestion` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `user_comments` (
  `idCom` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` smallint(5) unsigned DEFAULT NULL,
  `idPost` smallint(5) unsigned DEFAULT NULL,
  `comdate` date DEFAULT NULL,
  PRIMARY KEY (`idCom`),
  KEY `idUser` (`idUser`),
  KEY `idPost` (`idPost`),
  CONSTRAINT `user_comments_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUser`),
  CONSTRAINT `user_comments_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `publicacion` (`idPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_follow` (
  `idUserfo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idUser1` smallint(5) unsigned DEFAULT NULL,
  `idUser2` smallint(5) unsigned DEFAULT NULL,
  `aceptado` int(1) DEFAULT NULL,
  PRIMARY KEY (`idUserfo`),
  KEY `idUser1` (`idUser1`),
  KEY `idUser2` (`idUser2`),
  CONSTRAINT `user_follow_ibfk_1` FOREIGN KEY (`idUser1`) REFERENCES `usuario` (`idUser`),
  CONSTRAINT `user_follow_ibfk_2` FOREIGN KEY (`idUser2`) REFERENCES `usuario` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `user_likes` (
  `idLike` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` smallint(5) unsigned DEFAULT NULL,
  `idPost` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`idLike`),
  KEY `idUser` (`idUser`),
  KEY `idPost` (`idPost`),
  CONSTRAINT `user_likes_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUser`),
  CONSTRAINT `user_likes_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `publicacion` (`idPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_report` (
  `idUsRep` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` smallint(5) unsigned DEFAULT NULL,
  `idPost` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`idUsRep`),
  KEY `idUser` (`idUser`),
  KEY `idPost` (`idPost`),
  CONSTRAINT `user_report_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUser`),
  CONSTRAINT `user_report_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `publicacion` (`idPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `usuario` (
  `idUser` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `usernm` varchar(50) DEFAULT NULL,
  `psswrd` varchar(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` enum('hombre','mujer') DEFAULT NULL,
  `profpic` mediumblob,
  `profcov` mediumblob,
  `title` varchar(50) DEFAULT NULL,
  `about` varchar(140) DEFAULT NULL,
  `usrtype` bit(1) DEFAULT NULL,
  `privat` bit(1) DEFAULT NULL,
  `fechn` date DEFAULT NULL,
  `rcveryanswer` varchar(30) DEFAULT NULL,
  `idCiudad` smallint(5) unsigned DEFAULT NULL,
  `idQuestion` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `idCiudad` (`idCiudad`),
  KEY `idQuestion` (`idQuestion`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idQuestion`) REFERENCES `seguridad` (`idQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
