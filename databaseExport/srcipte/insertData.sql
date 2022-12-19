--
-- Contenu de la table `t_class`
--

INSERT INTO `t_class` (`idClass`, `name`, `fkSection`, `fkCollaborator`) VALUES
(1, 'MIN 1', 1, 1),
(2, 'MIN 2', 1, 2),
(3, 'MID 1', 2, 3),
(4, 'MID 2', 2, 4),
(5, 'MIN 3', 4, 5);

--
-- Contenu de la table `t_classpart`
--

INSERT INTO `t_classpart` (`idClassPart`, `name`, `fkClass`) VALUES
(1, 'MIN / MID 1', 1),
(2, 'MIN / MID 2', 2),
(3, 'MIN / MID 3', 3),
(4, 'MAM / MAD 1', 4),
(5, 'MAM / MAD 2', 5);

--
-- Contenu de la table `t_collaborator`
--

INSERT INTO `t_collaborator` (`idPerson`, `idSchool`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

--
-- Contenu de la table `t_collaborator_job`
--

INSERT INTO `t_collaborator_job` (`fkPerson`, `fkJob`) VALUES
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5);

--
-- Contenu de la table `t_collaborator_section_rank`
--

INSERT INTO `t_collaborator_section_rank` (`fkCollaborator`, `fkRank`, `fkSection`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

--
-- Contenu de la table `t_event`
--

INSERT INTO `t_event` (`idEvent`, `name`, `description`, `startDate`, `endDate`, `fkEventType`, `fkClass`, `fkStudentGroup`, `fkStudent`, `fkCollaborator`, `fkSchool`, `fkSection`) VALUES
(1, 'Sortie au musée d\'histoire', 'Nous allons voir le musée d\'histoire naturel du centre de la Suisse, dans le cadre du cours d\'histoire et de science naturel', '2022-12-02', '2022-12-02', 1, 2, NULL, NULL, NULL, NULL, NULL),
(2, 'Evenement sportif à la montage', 'Sortie à la montage avec toutes une section, pour faire du ski durant une journée', '2022-12-03', '2022-12-03', 2, NULL, NULL, NULL, NULL, NULL, 3),
(3, 'Absence maladie', 'Absence maladie due au Covid', '2022-12-01', '2022-12-06', 5, NULL, NULL, NULL, 3, NULL, NULL);


--
-- Contenu de la table `t_eventtype`
--

INSERT INTO `t_eventtype` (`idEventType`, `name`, `isFacultative`, `fkScope`) VALUES
(1, 'Sortie', '1', 3),
(2, 'Sportif', '1', 4),
(3, 'Demande de congé', '0', 2),
(4, 'Arrivée tardive', '0', 2),
(5, 'Absent', '0', 2);

--
-- Contenu de la table `t_event_collaborator`
--

INSERT INTO `t_event_collaborator` (`fkPerson`, `fkEvent`) VALUES
(1, 1),
(13, 1),
(2, 2),
(14, 2),
(12, 3);

--
-- Contenu de la table `t_job`
--

INSERT INTO `t_job` (`idJob`, `name`) VALUES
(1, 'Concierge'),
(2, 'Secrétaire'),
(3, 'Aumônier'),
(4, 'Infirmière'),
(5, 'Surveillant');

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
(9, '2007-12-28', 'Zenia', 'Meyer', 'Pellentesque St.', '411', 'Poitou-Charentes', '01146', '038 823 51 77', 'curabitur.egestas.nunc@outlook.ca', 'm', 'psdjg23g', '1'),
(10, '2022-12-04', 'Jean', 'Michmich', 'Baker Street', '202B', 'Londre', '1023', '+41 14 696 96 31', 'Cherlock.Holmes@gmail.com', 'm', 'p32dars3', '1'),
(11, '2008-03-05', 'Mathis', 'Bret', 'Dui. Rd.', '5645', 'Bercher', '31411', '+41 14 236 96 31', 'eleifend@icloud.ca', 'm', 'pfd4dfs3', '1'),
(12, '2004-11-16', 'Alex', 'Grink', 'Feugiat St.', '323', 'Lausanne', '43435', '076 745 12 57', 'penatibus.et.magnis@aol.com', 'm', 'p345fjh', '0'),
(13, '2009-03-03', 'Julia', 'Combait', 'Dis Rd.', '957', 'Echallens', '25708', '011 245 28 48', 'mauris.sagittis.placerat@yahoo.couk', 'f', 'psd45fd', '1'),
(14, '2007-02-14', 'Sigmal', 'Orthag', 'Accumsan Street', '965', 'Yverdon', '59347', '+41 32 134 63 29', 'a.feugiat@hotmail.couk', 'm', 'phtm34v', '1'),
(15, '2007-01-19', 'Mia', 'Kuipe', 'Ipsum. Av.', '5467', 'Montreux', '68512', '+41 73 238 62 90', 'eu.enim.etiam@yahoo.com', 'f', 'pkl34j5', '0');

--
-- Contenu de la table `t_rank`
--

INSERT INTO `t_rank` (`idRank`, `name`) VALUES
(1, 'Directeur'),
(2, 'Doyen'),
(3, 'Professeur'),
(4, 'Stagiaire'),
(5, 'MC');

--
-- Contenu de la table `t_school`
--

INSERT INTO `t_school` (`idSchool`, `name`, `street`, `streetNumber`, `locality`, `zip`, `mail`, `phoneNumber`) VALUES
(1, 'ETML', 'Rue de Sébeillon', '12', 'Lausanne', '1001', 'secretariat.etml@eduvaud.ch', '+41 14 696 96 31');

--
-- Contenu de la table `t_scope`
--

INSERT INTO `t_scope` (`idScope`, `name`) VALUES
(1, 'Classe'),
(2, 'Personne'),
(3, 'Ecole'),
(4, 'Section');

--
-- Contenu de la table `t_section`
--

INSERT INTO `t_section` (`idSection`, `name`) VALUES
(1, 'Informatique'),
(2, 'Bois'),
(3, 'Polymécanicien'),
(4, 'Electronique'),
(5, 'mecanique');

--
-- Contenu de la table `t_specification`
--

INSERT INTO `t_specification` (`idSpecification`, `myKey`, `myValue`, `fkEventType`) VALUES
(1, 'Les sorties ', 'Les sorties ne doivent pas durer plus d\'une journée. Il n\'y à que 2 sorties possible par années.', 1),
(2, 'Les évènement sportifs', 'Les évènement sportifs ont lieu chaque fin de Semestre. Il y aura donc des sports d\'hiver et d\'été. ', 2);

--
-- Contenu de la table `t_student`
--

INSERT INTO `t_student` (`idPerson`, `fkClassPart`, `fkSchool`, `fkStudentGroup`) VALUES
(6, 1, 1, 1),
(7, 2, 1, 2),
(8, 3, 1, 3),
(9, 4, 1, 4),
(10, 5, 1, 5);

--
-- Contenu de la table `t_studentgroup`
--

INSERT INTO `t_studentgroup` (`idStudentGroup`, `name`) VALUES
(1, 'Groupe 1C'),
(2, 'Groupe 2A'),
(3, 'Groupe 1A'),
(4, 'Groupe 3B'),
(5, 'Groupe 1B');