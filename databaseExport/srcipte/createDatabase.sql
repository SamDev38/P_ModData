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
-- Structure de la table `t_classpart`
--

CREATE TABLE `t_classpart` (
  `idClassPart` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fkClass` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_collaborator`
--

CREATE TABLE `t_collaborator` (
  `idPerson` bigint(20) NOT NULL,
  `idSchool` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_collaborator_job`
--

CREATE TABLE `t_collaborator_job` (
  `fkPerson` bigint(20) NOT NULL,
  `fkJob` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_collaborator_section_rank`
--

CREATE TABLE `t_collaborator_section_rank` (
  `fkCollaborator` bigint(20) NOT NULL,
  `fkRank` bigint(20) NOT NULL,
  `fkSection` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Structure de la table `t_eventtype`
--

CREATE TABLE `t_eventtype` (
  `idEventType` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `isFacultative` char(1) NOT NULL,
  `fkScope` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_event_collaborator`
--

CREATE TABLE `t_event_collaborator` (
  `fkPerson` bigint(20) NOT NULL,
  `fkEvent` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_job`
--

CREATE TABLE `t_job` (
  `idJob` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Structure de la table `t_rank`
--

CREATE TABLE `t_rank` (
  `idRank` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Structure de la table `t_scope`
--

CREATE TABLE `t_scope` (
  `idScope` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_section`
--

CREATE TABLE `t_section` (
  `idSection` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_specification`
--

CREATE TABLE `t_specification` (
  `idSpecification` bigint(20) NOT NULL,
  `myKey` varchar(100) NOT NULL,
  `myValue` varchar(200) NOT NULL,
  `fkEventType` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_student`
--

CREATE TABLE `t_student` (
  `idPerson` bigint(20) NOT NULL,
  `fkClassPart` bigint(20) NOT NULL,
  `fkSchool` bigint(20) NOT NULL,
  `fkStudentGroup` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `t_studentgroup`
--

CREATE TABLE `t_studentgroup` (
  `idStudentGroup` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



