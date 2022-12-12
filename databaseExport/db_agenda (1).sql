-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 12 Décembre 2022 à 09:21
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_agenda`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_class`
--

CREATE TABLE `t_class` (
  `idClass` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fkSection` bigint(20) NOT NULL,
  `fkCollaborator` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_class`
--

INSERT INTO `t_class` (`idClass`, `name`, `fkSection`, `fkCollaborator`) VALUES
(1, 'MIN 1', 1, 1),
(2, 'MIN 2', 1, 2),
(3, 'MID 1', 2, 3),
(4, 'MID 2', 2, 4),
(5, 'MIN 3', 4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `t_classpart`
--

CREATE TABLE `t_classpart` (
  `idClassPart` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fkClass` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_collaborator`
--

CREATE TABLE `t_collaborator` (
  `idPerson` bigint(20) NOT NULL,
  `idSchool` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_collaborator`
--

INSERT INTO `t_collaborator` (`idPerson`, `idSchool`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_collaborator_job`
--

CREATE TABLE `t_collaborator_job` (
  `fkPerson` bigint(20) NOT NULL,
  `fkJob` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_collaborator_section_rank`
--

CREATE TABLE `t_collaborator_section_rank` (
  `fkCollaborator` bigint(20) NOT NULL,
  `fkRank` bigint(20) NOT NULL,
  `fkSection` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_collaborator_section_rank`
--

INSERT INTO `t_collaborator_section_rank` (`fkCollaborator`, `fkRank`, `fkSection`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `t_event`
--

CREATE TABLE `t_event` (
  `idEvent` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(600) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `fkEventType` bigint(20) NOT NULL,
  `fkClass` bigint(20) DEFAULT NULL,
  `fkStudentGroup` bigint(20) DEFAULT NULL,
  `fkStudent` bigint(20) DEFAULT NULL,
  `fkCollaborator` bigint(20) DEFAULT NULL,
  `fkSchool` bigint(20) DEFAULT NULL,
  `fkSection` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_eventtype`
--

CREATE TABLE `t_eventtype` (
  `idEventType` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `isFacultative` char(1) NOT NULL,
  `fkScope` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_event_collaborator`
--

CREATE TABLE `t_event_collaborator` (
  `fkPerson` bigint(20) NOT NULL,
  `fkEvent` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_job`
--

CREATE TABLE `t_job` (
  `idJob` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_person`
--

CREATE TABLE `t_person` (
  `idPerson` bigint(20) NOT NULL,
  `birthDate` date NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `street` varchar(255) NOT NULL,
  `streetNumber` varchar(5) NOT NULL,
  `locality` varchar(85) NOT NULL,
  `zip` varchar(7) NOT NULL,
  `phoneNumber` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `pAnonyme` varchar(15) NOT NULL,
  `isActive` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_person`
--

INSERT INTO `t_person` (`idPerson`, `birthDate`, `firstname`, `lastname`, `street`, `streetNumber`, `locality`, `zip`, `phoneNumber`, `email`, `gender`, `pAnonyme`, `isActive`) VALUES
(1, '2008-06-05', 'Lydia', 'Kirk', 'Dui. Rd.', '8054', 'Nord-Pas-de-Calais', '31411', '+41 14 696 96 31', 'eleifend@icloud.ca', 'm', 'p34dfs3', '1'),
(2, '2004-12-16', 'Channing', 'Cochran', 'Feugiat St.', '973', 'Auvergne', '43435', '076 743 22 57', 'penatibus.et.magnis@aol.com', 'm', 'p23dcjh', '1'),
(3, '2009-12-03', 'Baker', 'Combs', 'Dis Rd.', '991', 'Corse', '25708', '011 262 48 48', 'mauris.sagittis.placerat@yahoo.couk', 'f', 'pfgd45', '1'),
(4, '2007-04-14', 'Selma', 'Neill', 'Accumsan Street', '5669', 'Limousin', '59347', '+41 52 118 66 79', 'a.feugiat@hotmail.couk', 'f', 'pdf34df', '1'),
(5, '2007-12-19', 'Ria', 'Walker', 'Ipsum. Av.', '6085', 'Aquitaine', '68512', '+41 73 238 62 90', 'eu.enim.etiam@yahoo.com', 'm', 'pdcjg34x', '0'),
(6, '2006-01-31', 'Alice', 'Carney', 'Ridiculus St.', '9574', 'Provence-Alpes-Côte d\'Azur', '13652', '+41 40 806 25 81', 'a.tortor.nunc@google.ca', 'm', 'psdhg23x', '1'),
(7, '2009-06-25', 'Harper', 'Richardson', 'Arcu. Rd.', '135', 'Auvergne', '64225', '+41 77 276 20 47', 'magnis.dis@google.edu', 'm', 'pdfd3', '1'),
(8, '2009-03-22', 'Jada', 'Wilder', 'Odio, Rd.', '6066', 'Midi-Pyrénées', '48064', '040 424 74 77', 'orci.ut@icloud.couk', 'f', 'pweh3', '1'),
(9, '2007-12-28', 'Zenia', 'Meyer', 'Pellentesque St.', '411', 'Poitou-Charentes', '01146', '038 823 51 77', 'curabitur.egestas.nunc@outlook.ca', 'm', 'psdjg23g', '1');

-- --------------------------------------------------------

--
-- Structure de la table `t_rank`
--

CREATE TABLE `t_rank` (
  `idRank` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_rank`
--

INSERT INTO `t_rank` (`idRank`, `name`) VALUES
(1, 'Directeur'),
(2, 'Doyen'),
(3, 'Professeur'),
(4, 'Stagiaire'),
(5, 'Secrétaire');

-- --------------------------------------------------------

--
-- Structure de la table `t_school`
--

CREATE TABLE `t_school` (
  `idSchool` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `streetNumber` varchar(5) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `zip` varchar(7) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `phoneNumber` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_school`
--

INSERT INTO `t_school` (`idSchool`, `name`, `street`, `streetNumber`, `locality`, `zip`, `mail`, `phoneNumber`) VALUES
(1, 'ETML', 'Rue de Sébeillon', '12', 'Lausanne', '1001', 'secretariat.etml@eduvaud.ch', '+41 14 696 96 31');

-- --------------------------------------------------------

--
-- Structure de la table `t_scope`
--

CREATE TABLE `t_scope` (
  `idScope` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_section`
--

CREATE TABLE `t_section` (
  `idSection` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_section`
--

INSERT INTO `t_section` (`idSection`, `name`) VALUES
(1, 'Informatique'),
(2, 'Bois'),
(3, 'Polymécanicien'),
(4, 'Electronique'),
(5, 'mecanique');

-- --------------------------------------------------------

--
-- Structure de la table `t_specification`
--

CREATE TABLE `t_specification` (
  `idSpecification` bigint(20) NOT NULL,
  `myKey` varchar(100) NOT NULL,
  `myValue` varchar(200) NOT NULL,
  `fkEventType` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_student`
--

CREATE TABLE `t_student` (
  `idPerson` bigint(20) NOT NULL,
  `fkClassPart` bigint(20) NOT NULL,
  `fkSchool` bigint(20) NOT NULL,
  `fkStudentGroup` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_studentgroup`
--

CREATE TABLE `t_studentgroup` (
  `idStudentGroup` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_studentgroup`
--

INSERT INTO `t_studentgroup` (`idStudentGroup`, `name`) VALUES
(1, 'Groupe 1C'),
(2, 'Groupe 2A'),
(3, 'Groupe 1A'),
(4, 'Groupe 3B'),
(5, 'Groupe 1B');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_class`
--
ALTER TABLE `t_class`
  ADD PRIMARY KEY (`idClass`),
  ADD UNIQUE KEY `ID_t_class_IND` (`idClass`),
  ADD KEY `FKlink_IND` (`fkSection`),
  ADD KEY `FKlead_IND` (`fkCollaborator`);

--
-- Index pour la table `t_classpart`
--
ALTER TABLE `t_classpart`
  ADD PRIMARY KEY (`idClassPart`),
  ADD UNIQUE KEY `ID_t_classPart_IND` (`idClassPart`),
  ADD KEY `FKcontain_IND` (`fkClass`);

--
-- Index pour la table `t_collaborator`
--
ALTER TABLE `t_collaborator`
  ADD PRIMARY KEY (`idPerson`),
  ADD UNIQUE KEY `FKt_p_t_c_IND` (`idPerson`),
  ADD KEY `FKaccomodate_IND` (`idSchool`);

--
-- Index pour la table `t_collaborator_job`
--
ALTER TABLE `t_collaborator_job`
  ADD PRIMARY KEY (`fkJob`,`fkPerson`),
  ADD UNIQUE KEY `ID_is_IND` (`fkJob`,`fkPerson`),
  ADD KEY `FKis_t_c_IND` (`fkPerson`);

--
-- Index pour la table `t_collaborator_section_rank`
--
ALTER TABLE `t_collaborator_section_rank`
  ADD PRIMARY KEY (`fkRank`,`fkSection`,`fkCollaborator`),
  ADD UNIQUE KEY `ID_work_IND` (`fkRank`,`fkSection`,`fkCollaborator`),
  ADD KEY `FKwor_t_s_IND` (`fkSection`),
  ADD KEY `FKwor_t_c_IND` (`fkCollaborator`);

--
-- Index pour la table `t_event`
--
ALTER TABLE `t_event`
  ADD PRIMARY KEY (`idEvent`),
  ADD UNIQUE KEY `ID_t_event_IND` (`idEvent`),
  ADD KEY `FKis_2_IND` (`fkEventType`),
  ADD KEY `FKimpose_IND` (`fkClass`),
  ADD KEY `FKhave_3_IND` (`fkStudentGroup`),
  ADD KEY `FKcreate_IND` (`fkStudent`),
  ADD KEY `FKattribute_IND` (`fkCollaborator`),
  ADD KEY `FKassign_IND` (`fkSchool`),
  ADD KEY `FKaffect_IND` (`fkSection`);

--
-- Index pour la table `t_eventtype`
--
ALTER TABLE `t_eventtype`
  ADD PRIMARY KEY (`idEventType`),
  ADD UNIQUE KEY `ID_t_eventType_IND` (`idEventType`),
  ADD KEY `FKbind_IND` (`fkScope`);

--
-- Index pour la table `t_event_collaborator`
--
ALTER TABLE `t_event_collaborator`
  ADD PRIMARY KEY (`fkPerson`,`fkEvent`),
  ADD UNIQUE KEY `ID_do_IND` (`fkPerson`,`fkEvent`),
  ADD KEY `FKdo_t_e_IND` (`fkEvent`);

--
-- Index pour la table `t_job`
--
ALTER TABLE `t_job`
  ADD PRIMARY KEY (`idJob`),
  ADD UNIQUE KEY `ID_t_job_IND` (`idJob`);

--
-- Index pour la table `t_person`
--
ALTER TABLE `t_person`
  ADD PRIMARY KEY (`idPerson`),
  ADD UNIQUE KEY `ID_t_person_IND` (`idPerson`);

--
-- Index pour la table `t_rank`
--
ALTER TABLE `t_rank`
  ADD PRIMARY KEY (`idRank`),
  ADD UNIQUE KEY `ID_t_rank_IND` (`idRank`);

--
-- Index pour la table `t_school`
--
ALTER TABLE `t_school`
  ADD PRIMARY KEY (`idSchool`),
  ADD UNIQUE KEY `ID_t_school_IND` (`idSchool`);

--
-- Index pour la table `t_scope`
--
ALTER TABLE `t_scope`
  ADD PRIMARY KEY (`idScope`),
  ADD UNIQUE KEY `ID_t_scope_IND` (`idScope`);

--
-- Index pour la table `t_section`
--
ALTER TABLE `t_section`
  ADD PRIMARY KEY (`idSection`),
  ADD UNIQUE KEY `ID_t_section_IND` (`idSection`);

--
-- Index pour la table `t_specification`
--
ALTER TABLE `t_specification`
  ADD PRIMARY KEY (`idSpecification`),
  ADD UNIQUE KEY `ID_t_specification_IND` (`idSpecification`),
  ADD KEY `FKhave_2_IND` (`fkEventType`);

--
-- Index pour la table `t_student`
--
ALTER TABLE `t_student`
  ADD PRIMARY KEY (`idPerson`),
  ADD UNIQUE KEY `FKt_p_t_s_IND` (`idPerson`),
  ADD KEY `FKhave_IND` (`fkClassPart`),
  ADD KEY `FKcomport_IND` (`fkSchool`),
  ADD KEY `FKbelong_to_IND` (`fkStudentGroup`);

--
-- Index pour la table `t_studentgroup`
--
ALTER TABLE `t_studentgroup`
  ADD PRIMARY KEY (`idStudentGroup`),
  ADD UNIQUE KEY `ID_t_studentGroup_IND` (`idStudentGroup`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_class`
--
ALTER TABLE `t_class`
  MODIFY `idClass` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_classpart`
--
ALTER TABLE `t_classpart`
  MODIFY `idClassPart` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_event`
--
ALTER TABLE `t_event`
  MODIFY `idEvent` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_eventtype`
--
ALTER TABLE `t_eventtype`
  MODIFY `idEventType` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_job`
--
ALTER TABLE `t_job`
  MODIFY `idJob` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_person`
--
ALTER TABLE `t_person`
  MODIFY `idPerson` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `t_rank`
--
ALTER TABLE `t_rank`
  MODIFY `idRank` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_school`
--
ALTER TABLE `t_school`
  MODIFY `idSchool` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_scope`
--
ALTER TABLE `t_scope`
  MODIFY `idScope` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_section`
--
ALTER TABLE `t_section`
  MODIFY `idSection` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_specification`
--
ALTER TABLE `t_specification`
  MODIFY `idSpecification` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_studentgroup`
--
ALTER TABLE `t_studentgroup`
  MODIFY `idStudentGroup` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_class`
--
ALTER TABLE `t_class`
  ADD CONSTRAINT `FKlead_FK` FOREIGN KEY (`fkCollaborator`) REFERENCES `t_collaborator` (`idPerson`),
  ADD CONSTRAINT `FKlink_FK` FOREIGN KEY (`fkSection`) REFERENCES `t_section` (`idSection`);

--
-- Contraintes pour la table `t_classpart`
--
ALTER TABLE `t_classpart`
  ADD CONSTRAINT `FKcontain_FK` FOREIGN KEY (`fkClass`) REFERENCES `t_class` (`idClass`);

--
-- Contraintes pour la table `t_collaborator`
--
ALTER TABLE `t_collaborator`
  ADD CONSTRAINT `FKaccomodate_FK` FOREIGN KEY (`idSchool`) REFERENCES `t_school` (`idSchool`),
  ADD CONSTRAINT `FKt_p_t_c_FK` FOREIGN KEY (`idPerson`) REFERENCES `t_person` (`idPerson`);

--
-- Contraintes pour la table `t_collaborator_job`
--
ALTER TABLE `t_collaborator_job`
  ADD CONSTRAINT `FKis_t_c_FK` FOREIGN KEY (`fkPerson`) REFERENCES `t_collaborator` (`idPerson`),
  ADD CONSTRAINT `FKis_t_j` FOREIGN KEY (`fkJob`) REFERENCES `t_job` (`idJob`);

--
-- Contraintes pour la table `t_collaborator_section_rank`
--
ALTER TABLE `t_collaborator_section_rank`
  ADD CONSTRAINT `FKwor_t_c_FK` FOREIGN KEY (`fkCollaborator`) REFERENCES `t_collaborator` (`idPerson`),
  ADD CONSTRAINT `FKwor_t_r` FOREIGN KEY (`fkRank`) REFERENCES `t_rank` (`idRank`),
  ADD CONSTRAINT `FKwor_t_s_FK` FOREIGN KEY (`fkSection`) REFERENCES `t_section` (`idSection`);

--
-- Contraintes pour la table `t_event`
--
ALTER TABLE `t_event`
  ADD CONSTRAINT `FKaffect_FK` FOREIGN KEY (`fkSection`) REFERENCES `t_section` (`idSection`),
  ADD CONSTRAINT `FKassign_FK` FOREIGN KEY (`fkSchool`) REFERENCES `t_school` (`idSchool`),
  ADD CONSTRAINT `FKattribute_FK` FOREIGN KEY (`fkCollaborator`) REFERENCES `t_collaborator` (`idPerson`),
  ADD CONSTRAINT `FKcreate_FK` FOREIGN KEY (`fkStudent`) REFERENCES `t_student` (`idPerson`),
  ADD CONSTRAINT `FKhave_3_FK` FOREIGN KEY (`fkStudentGroup`) REFERENCES `t_studentgroup` (`idStudentGroup`),
  ADD CONSTRAINT `FKimpose_FK` FOREIGN KEY (`fkClass`) REFERENCES `t_class` (`idClass`),
  ADD CONSTRAINT `FKis_2_FK` FOREIGN KEY (`fkEventType`) REFERENCES `t_eventtype` (`idEventType`);

--
-- Contraintes pour la table `t_eventtype`
--
ALTER TABLE `t_eventtype`
  ADD CONSTRAINT `FKbind_FK` FOREIGN KEY (`fkScope`) REFERENCES `t_scope` (`idScope`);

--
-- Contraintes pour la table `t_event_collaborator`
--
ALTER TABLE `t_event_collaborator`
  ADD CONSTRAINT `FKdo_t_c` FOREIGN KEY (`fkPerson`) REFERENCES `t_collaborator` (`idPerson`),
  ADD CONSTRAINT `FKdo_t_e_FK` FOREIGN KEY (`fkEvent`) REFERENCES `t_event` (`idEvent`);

--
-- Contraintes pour la table `t_specification`
--
ALTER TABLE `t_specification`
  ADD CONSTRAINT `FKhave_2_FK` FOREIGN KEY (`fkEventType`) REFERENCES `t_eventtype` (`idEventType`);

--
-- Contraintes pour la table `t_student`
--
ALTER TABLE `t_student`
  ADD CONSTRAINT `FKbelong_to_FK` FOREIGN KEY (`fkStudentGroup`) REFERENCES `t_studentgroup` (`idStudentGroup`),
  ADD CONSTRAINT `FKcomport_FK` FOREIGN KEY (`fkSchool`) REFERENCES `t_school` (`idSchool`),
  ADD CONSTRAINT `FKhave_FK` FOREIGN KEY (`fkClassPart`) REFERENCES `t_classpart` (`idClassPart`),
  ADD CONSTRAINT `FKt_p_t_s_FK` FOREIGN KEY (`idPerson`) REFERENCES `t_person` (`idPerson`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
