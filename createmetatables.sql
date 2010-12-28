create database if not exists `dhwani`;
USE `dhwani`;
SET FOREIGN_KEY_CHECKS=0;

/* ID TABLES */
Drop Table if EXISTS `mi_Lyricist`;
CREATE TABLE `mi_Lyricist` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
  `Name` varchar(50) NOT NULL,
  `GoogleLink` varchar(75) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Actor`;
CREATE TABLE `mi_Actor` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(75) NOT NULL,	
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Composer`;
CREATE TABLE `mi_Composer` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(75) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Singer`;
CREATE TABLE `mi_Singer` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(75) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_AlbumArt`;
CREATE TABLE `mi_AlbumArt` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`URL` varchar(75) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Label`;
Drop Table if EXISTS `mi_Album`;
CREATE TABLE `mi_Album` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`GoogleLink` varchar(75) NOT NULL,
`Label` varchar(25) NOT NULL,
`Released` YEAR NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `mi_Song`;
CREATE TABLE `mi_Song` (
`Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UniqueId to identify Albul',
`Name` varchar(50) NOT NULL,
`Duration` TIME NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*END ID TABLES */


Drop Table if EXISTS `mla_Actor`;
CREATE TABLE `mla_Actor` (
`AlbumId` int(10) unsigned NOT NULL,
`ActorId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`ActorId`),
KEY `FK_mla_Actor` (`ActorId`),
CONSTRAINT `FK_mla_Actor` FOREIGN KEY (`ActorId`) REFERENCES `mi_Actor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_ActorAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
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


Drop Table if EXISTS `mla_Composer`;
CREATE TABLE `mla_Composer` (
`AlbumId` int(10) unsigned NOT NULL,
`ComposerId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`ComposerId`),
KEY `FK_mla_Composer` (`ComposerId`),
CONSTRAINT `FK_mla_Composer` FOREIGN KEY (`ComposerId`) REFERENCES `mi_Composer` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_ComposerAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Label`;


Drop Table if EXISTS `mla_Lyricist`;
CREATE TABLE `mla_Lyricist` (
`AlbumId` int(10) unsigned NOT NULL,
`LyricistId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`LyricistId`),
KEY `FK_mla_Lyricist` (`LyricistId`),
CONSTRAINT `FK_mla_Lyricist` FOREIGN KEY (`LyricistId`) REFERENCES `mi_Lyricist` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_LyricistAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Singer`;
CREATE TABLE `mla_Singer` (
`AlbumId` int(10) unsigned NOT NULL,
`SingerId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`SingerId`),
KEY `FK_mla_Singer` (`SingerId`),
CONSTRAINT `FK_mla_Singer` FOREIGN KEY (`SingerId`) REFERENCES `mi_Singer` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_SingerAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `mla_Song`;
CREATE TABLE `mla_Song` (
`AlbumId` int(10) unsigned NOT NULL,
`SongId` int(10) unsigned NOT NULL,
PRIMARY KEY (`AlbumId`,`SongId`),
KEY `FK_mla_Song` (`SongId`),
CONSTRAINT `FK_mla_Song` FOREIGN KEY (`SongId`) REFERENCES `mi_Song` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_mla_SongAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `mi_Album` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



SET FOREIGN_KEY_CHECKS=1;