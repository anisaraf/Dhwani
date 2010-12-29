create database if not exists `dhwani`;
USE `dhwani`;
SET FOREIGN_KEY_CHECKS=0;

/* ID TABLES */
Drop Table if EXISTS `mi_Lyricists`;
CREATE TABLE `mi_Lyricists` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
  `Name` varchar(50) NOT NULL,
  `GoogleLink` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Actors`;
CREATE TABLE `mi_Actors` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(200) NOT NULL,	
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Composers`;
CREATE TABLE `mi_Composers` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(200) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Singers`;
CREATE TABLE `mi_Singers` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(200) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mi_Directors`;
CREATE TABLE `mi_Directors` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(200) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_AlbumArt`;
CREATE TABLE `mi_AlbumArt` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`GoogleLink` varchar(200) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Album`;
CREATE TABLE `mi_Album` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Title` varchar(50) NOT NULL,
`GoogleLink` varchar(200) NOT NULL,
`Label` varchar(25) NULL,
`Released` YEAR NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Songs`;
CREATE TABLE `mi_Songs` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`Duration` TIME NULL,
`GoogleLink` varchar(200) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*END ID TABLES */


Drop Table if EXISTS `mla_Actors`;
CREATE TABLE `mla_Actors` (
`AlbumId` int(10) unsigned NOT NULL,
`ActorsId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`ActorsId`),
KEY `FK_mla_Actors` (`ActorsId`),
CONSTRAINT `FK_mla_Actors` FOREIGN KEY (`ActorsId`) REFERENCES `mi_Actors` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_ActorsAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mla_Directors`;
CREATE TABLE `mla_Directors` (
`AlbumId` int(10) unsigned NOT NULL,
`DirectorsId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`DirectorsId`),
KEY `FK_mla_Directors` (`DirectorsId`),
CONSTRAINT `FK_mla_Directors` FOREIGN KEY (`DirectorsId`) REFERENCES `mi_Directors` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_DirectorsAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mla_AlbumArt`;
CREATE TABLE `mla_AlbumArt` (
`AlbumId` int(10) unsigned NOT NULL,
`AlbumArtId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`AlbumArtId`),
KEY `FK_mla_AlbumArt` (`AlbumArtId`),
CONSTRAINT `FK_mla_AlbumArt` FOREIGN KEY (`AlbumArtId`) REFERENCES `mi_AlbumArt` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_AlbumArtAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Composers`;
CREATE TABLE `mla_Composers` (
`AlbumId` int(10) unsigned NOT NULL,
`ComposersId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`ComposersId`),
KEY `FK_mla_Composers` (`ComposersId`),
CONSTRAINT `FK_mla_Composers` FOREIGN KEY (`ComposersId`) REFERENCES `mi_Composers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_ComposersAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Label`;


Drop Table if EXISTS `mla_Lyricists`;
CREATE TABLE `mla_Lyricists` (
`AlbumId` int(10) unsigned NOT NULL,
`LyricistsId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`LyricistsId`),
KEY `FK_mla_Lyricists` (`LyricistsId`),
CONSTRAINT `FK_mla_Lyricists` FOREIGN KEY (`LyricistsId`) REFERENCES `mi_Lyricists` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_LyricistsAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Singers`;
CREATE TABLE `mla_Singers` (
`AlbumId` int(10) unsigned NOT NULL,
`SingersId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`SingersId`),
KEY `FK_mla_Singers` (`SingersId`),
CONSTRAINT `FK_mla_Singers` FOREIGN KEY (`SingersId`) REFERENCES `mi_Singers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_SingersAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Songs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Songs`;
CREATE TABLE `mla_Songs` (
`AlbumId` int(10) unsigned NOT NULL,
`SongsId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`SongsId`),
KEY `FK_mla_Songs` (`SongsId`),
CONSTRAINT `FK_mla_Songs` FOREIGN KEY (`SongsId`) REFERENCES `mi_Songs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_SongsAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



SET FOREIGN_KEY_CHECKS=1;