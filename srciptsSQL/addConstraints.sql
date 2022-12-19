USE db_agenda;

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
  MODIFY `idClassPart` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_event`
--
ALTER TABLE `t_event`
  MODIFY `idEvent` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `t_eventtype`
--
ALTER TABLE `t_eventtype`
  MODIFY `idEventType` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_job`
--
ALTER TABLE `t_job`
  MODIFY `idJob` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_person`
--
ALTER TABLE `t_person`
  MODIFY `idPerson` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
  MODIFY `idScope` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `t_section`
--
ALTER TABLE `t_section`
  MODIFY `idSection` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `t_specification`
--
ALTER TABLE `t_specification`
  MODIFY `idSpecification` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
