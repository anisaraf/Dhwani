create database if not exists `dhwani`;
USE `dhwani`;

SET FOREIGN_KEY_CHECKS=0;

Drop Table if EXISTS `SongMetadata`;
CREATE TABLE `SongMetadata` (
  `SongId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SongName` varchar(100) NOT NULL,
  `RaterId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SongId`),
  UNIQUE KEY `SongName` (`SongName`,`RaterId`),
  KEY `FK_SongMetadata` (`RaterId`),
  CONSTRAINT `FK_SongMetadata` FOREIGN KEY (`RaterId`) REFERENCES `dr_employees` (`RaterId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Melody`;
CREATE TABLE `Melody` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Simple` float DEFAULT NULL,
`Complex` float DEFAULT NULL,
`Repeating` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Melody` (`SongId`),
CONSTRAINT `FK_Melody` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `TimeSignature`;
CREATE TABLE `TimeSignature` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Simple` float DEFAULT NULL,
`Compound` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_TimeSignature` (`SongId`),
CONSTRAINT `FK_TimeSignature` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


Drop Table if EXISTS `Rhythm`;
CREATE TABLE `Rhythm` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Groove` float DEFAULT NULL,
`Riff` float DEFAULT NULL,
`Indian` float DEFAULT NULL,
`Syncopation` float DEFAULT NULL,
`Swing` float DEFAULT NULL,
`Complex` float DEFAULT NULL,
`Changing` float DEFAULT NULL,
`Loose` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Rhythm` (`SongId`),
CONSTRAINT `FK_Rhythm` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Tempo`;
CREATE TABLE `Tempo` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Slow` float DEFAULT NULL,
`Medium` float DEFAULT NULL,
`Fast` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Tempo` (`SongId`),
CONSTRAINT `FK_Tempo` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Tonality`;
CREATE TABLE `Tonality` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Major` float DEFAULT NULL,
`Minor` float DEFAULT NULL,
`MajorMinor` float DEFAULT NULL,
`Indian` float DEFAULT NULL,
`Raag` float DEFAULT NULL,
`Modal` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Tonality` (`SongId`),
CONSTRAINT `FK_Tonality` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Lyrics`;
CREATE TABLE `Lyrics` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Hindi` float DEFAULT NULL,
`Hinglish` float DEFAULT NULL,
`Urdu` float DEFAULT NULL,
`Other` float DEFAULT NULL,
`Sargam` float DEFAULT NULL,
`Gibberish` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Lyrics` (`SongId`),
CONSTRAINT `FK_Lyrics` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Voice`;
CREATE TABLE `Voice` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`MaleSolo` float DEFAULT NULL,
`FemaleSolo` float DEFAULT NULL,
`Duet` float DEFAULT NULL,
`MultipleSingers` float DEFAULT NULL,
`Chorus` float DEFAULT NULL,
PRIMARY KEY (`SongId`),	
KEY `FK_Voice` (`SongId`),
CONSTRAINT `FK_Voice` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `VocalQuality`;
CREATE TABLE `VocalQuality` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`AggressiveMale` float DEFAULT NULL,
`BreathyMale` float DEFAULT NULL,
`DistinctiveMale` float DEFAULT NULL,
`DynamicMale` float DEFAULT NULL,
`DeepMale` float DEFAULT NULL,
`EmotionalMale` float DEFAULT NULL,
`GrittyMale` float DEFAULT NULL,
`GravelyMale` float DEFAULT NULL,
`LaidbackMale` float DEFAULT NULL,
`SmoothMale` float DEFAULT NULL,
`NasalMale` float DEFAULT NULL,
`AggressiveFemale` float DEFAULT NULL,
`BreathyFemale` float DEFAULT NULL,
`DistinctiveFemale` float DEFAULT NULL,
`DynamicFemale` float DEFAULT NULL,
`DeepFemale` float DEFAULT NULL,
`EmotionalFemale` float DEFAULT NULL,
`GrittyFemale` float DEFAULT NULL,
`GravelyFemale` float DEFAULT NULL,
`LaidbackFemale` float DEFAULT NULL,
`SmoothFemale` float DEFAULT NULL,
`NasalFemale` float DEFAULT NULL,
`Mumbling` float DEFAULT NULL,
`Clear` float DEFAULT NULL,
`Complex` float DEFAULT NULL,
`Simple` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_VocalQuality` (`SongId`),
CONSTRAINT `FK_VocalQuality` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Harmony`;
CREATE TABLE `Harmony` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Prominent` float DEFAULT NULL,
`Subtle` float DEFAULT NULL,
`Interweaving` float DEFAULT NULL,
`Indispensible` float DEFAULT NULL,
`Ornamental` float DEFAULT NULL,
`Complex` float DEFAULT NULL,
`Simple` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Harmony` (`SongId`),
CONSTRAINT `FK_Harmony` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Mood`;
CREATE TABLE `Mood` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Happy` float DEFAULT NULL,
`Sad` float DEFAULT NULL,
`Angry` float DEFAULT NULL,
`Romantic` float DEFAULT NULL,
`Fun` float DEFAULT NULL,
`Dreamy` float DEFAULT NULL,
`Bravery` float DEFAULT NULL,
`Spiritual` float DEFAULT NULL,
`Erotic` float DEFAULT NULL,
`Adrenaline` float DEFAULT NULL,
`Hopeful` float DEFAULT NULL,
`Inspiring` float DEFAULT NULL,
`Envious` float DEFAULT NULL,
`Sarcastic` float DEFAULT NULL,
`Sentimental` float DEFAULT NULL,
`Dejected` float DEFAULT NULL,
`Festive` float DEFAULT NULL,
`Competitive` float DEFAULT NULL,
`Dark` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Mood` (`SongId`),
CONSTRAINT `FK_Mood` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Theme`;
CREATE TABLE `Theme` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Party` float DEFAULT NULL,
`Love` float DEFAULT NULL,
`Patriotic` float DEFAULT NULL,
`Devotional` float DEFAULT NULL,
`Wedding` float DEFAULT NULL,
`Comical` float DEFAULT NULL,
`Underground` float DEFAULT NULL,
`Narrative` float DEFAULT NULL,
`Urban` float DEFAULT NULL,
`Rural` float DEFAULT NULL,
`Reality` float DEFAULT NULL,
`Childrens` float DEFAULT NULL,
`Comaraderie` float DEFAULT NULL,
`Supernatural` float DEFAULT NULL,
`Horrow` float DEFAULT NULL,
`Festive` float DEFAULT NULL,
`Title` float DEFAULT NULL,
`Political` float DEFAULT NULL,
`Tribal` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Theme` (`SongId`),
CONSTRAINT `FK_Theme` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Structure`;
CREATE TABLE `Structure` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Groove` float DEFAULT NULL,
`Melodic` float DEFAULT NULL,
`Repetitive` float DEFAULT NULL,
`Orchestral` float DEFAULT NULL,
`t` float DEFAULT NULL,
`Remix` float DEFAULT NULL,
`Electronic` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Structure` (`SongId`),
CONSTRAINT `FK_Structure` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Influences`;
CREATE TABLE `Influences` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`IndianClassical` float DEFAULT NULL,
`IndianFolk` float DEFAULT NULL,
`Pop` float DEFAULT NULL,
`Rock` float DEFAULT NULL,
`HipHop` float DEFAULT NULL,
`Blues` float DEFAULT NULL,
`Jazz` float DEFAULT NULL,
`Country` float DEFAULT NULL,
`Rap` float DEFAULT NULL,
`RockRoll` float DEFAULT NULL,
`Electronic` float DEFAULT NULL,
`Celtic` float DEFAULT NULL,
`Asian` float DEFAULT NULL,
`African` float DEFAULT NULL,
`Balkan` float DEFAULT NULL,
`Trance` float DEFAULT NULL,
`Bluegrass` float DEFAULT NULL,
`Reggae` float DEFAULT NULL,
`Waltz` float DEFAULT NULL,
`Spanish` float DEFAULT NULL,
`Australian` float DEFAULT NULL,
`WesternClassical` float DEFAULT NULL,
`Sufi` float DEFAULT NULL,
`Arabic` float DEFAULT NULL,
`NonClassicalEuropean` float DEFAULT NULL,
`Fusion` float DEFAULT NULL,
`Acoustic` float DEFAULT NULL,
`WorldMusic` float DEFAULT NULL,
`Ballad` float DEFAULT NULL,
`Gospel` float DEFAULT NULL,
`Folk` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Influences` (`SongId`),
CONSTRAINT `FK_Influences` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `Instruments`;
CREATE TABLE `Instruments` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Piano` float DEFAULT NULL,
`EPiano` float DEFAULT NULL,
`Organ` float DEFAULT NULL,
`Synthesizer` float DEFAULT NULL,
`SynthesizerPad` float DEFAULT NULL,
`SynthBass` float DEFAULT NULL,
`Accordian` float DEFAULT NULL,
`Musette` float DEFAULT NULL,
`Harmoniam` float DEFAULT NULL,
`AcousticGuitar` float DEFAULT NULL,
`ElectricMuteGuitar` float DEFAULT NULL,
`ElecticGuitarRhythm` float DEFAULT NULL,
`ElectricLeadGuitar` float DEFAULT NULL,
`ElectricCleanGuitar` float DEFAULT NULL,
`ElectricDistortionGuitar` float DEFAULT NULL,
`GuitarAcousticBass` float DEFAULT NULL,
`mFinderboard` float DEFAULT NULL,
`DrumsSet` float DEFAULT NULL,
`SteelDrums` float DEFAULT NULL,
`Cymbals` float DEFAULT NULL,
`HandClap` float DEFAULT NULL,
`Mallet` float DEFAULT NULL,
`Timpani` float DEFAULT NULL,
`Dholak` float DEFAULT NULL,
`Pakhwaj` float DEFAULT NULL,
`Tabla` float DEFAULT NULL,
`Dufli` float DEFAULT NULL,
`Mridangam` float DEFAULT NULL,
`Violin` float DEFAULT NULL,
`Viola` float DEFAULT NULL,
`Cello` float DEFAULT NULL,
`DoubleBass` float DEFAULT NULL,
`Banjo` float DEFAULT NULL,
`ClaviKoto` float DEFAULT NULL,
`Mandolin` float DEFAULT NULL,
`Harp` float DEFAULT NULL,
`Santoor` float DEFAULT NULL,
`Sarangi` float DEFAULT NULL,
`Sarod` float DEFAULT NULL,
`Sitar` float DEFAULT NULL,
`Tumbi` float DEFAULT NULL,
`Trumpet` float DEFAULT NULL,
`Trombone` float DEFAULT NULL,
`WesternTransverse` float DEFAULT NULL,
`PennyWhistle` float DEFAULT NULL,
`IndianFlute` float DEFAULT NULL,
`SynthFlute` float DEFAULT NULL,
`Oboe` float DEFAULT NULL,
`Whistle` float DEFAULT NULL,
`Clarinet` float DEFAULT NULL,
`Saxophone` float DEFAULT NULL,
`Harmonica` float DEFAULT NULL,
`Shehnai` float DEFAULT NULL,
`Kanjeera` float DEFAULT NULL,
`Ghunghro` float DEFAULT NULL,
`Nagra` float DEFAULT NULL,
`Thavil` float DEFAULT NULL,
`Ghatam` float DEFAULT NULL,
`FrenchHorn` float DEFAULT NULL,
`Recorder` float DEFAULT NULL,
`Pads` float DEFAULT NULL,
`Douduk` float DEFAULT NULL,
`Tambourine` float DEFAULT NULL,
`TriangleBell` float DEFAULT NULL,
`Oud` float DEFAULT NULL,
`EthnicPercussion` float DEFAULT NULL,
`WoodenClapper` float DEFAULT NULL,
`Shakers` float DEFAULT NULL,
`ComputerDrumKit` float DEFAULT NULL,
`BrassSection` float DEFAULT NULL,
`StringSection` float DEFAULT NULL,
`Arpeggiator` float DEFAULT NULL,
`Morsing` float DEFAULT NULL,
`StringsPizzacato` float DEFAULT NULL,
`VinylScratch` float DEFAULT NULL,
`Vocoder` float DEFAULT NULL,
`JalTarang` float DEFAULT NULL,
`TablaTarang` float DEFAULT NULL,
`Shank` float DEFAULT NULL,
`OrchestralPercussion` float DEFAULT NULL,
`Erhu` float DEFAULT NULL,
`Shakuhachi` float DEFAULT NULL,
`Digiridoo` float DEFAULT NULL,
`Lute` float DEFAULT NULL,
`BeatBox` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_Instruments` (`SongId`),
CONSTRAINT `FK_Instruments` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



Drop Table if EXISTS `RecordingTechnique`;
CREATE TABLE `RecordingTechnique` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Analog` float DEFAULT NULL,
`Digital` float DEFAULT NULL,
`SlightlyProcessed` float DEFAULT NULL,
`ModeratelyProcessed` float DEFAULT NULL,
`HeavilyProcessed` float DEFAULT NULL,
`Electronic` float DEFAULT NULL,
`Synthetic` float DEFAULT NULL,
`Live` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_RecordingTechnique` (`SongId`),
CONSTRAINT `FK_RecordingTechnique` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

Drop Table if EXISTS `MixingStandard`;
CREATE TABLE `MixingStandard` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Poor` float DEFAULT NULL,
`Average` float DEFAULT NULL,
`Good` float DEFAULT NULL,
`Exceptional` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_MixingStandard` (`SongId`),
CONSTRAINT `FK_MixingStandard` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `RandomSongInfo`;
CREATE TABLE `RandomSongInfo` (
`SongId` bigint(20) UNSIGNED NOT NULL,
`Popularity` float DEFAULT NULL,
PRIMARY KEY (`SongId`),
KEY `FK_RandomSongInfo` (`SongId`),
CONSTRAINT `FK_RandomSongInfo` FOREIGN KEY (`SongId`) REFERENCES `SongMetadata` (`SongId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=0;

