-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Mon Dec  5 11:09:59 2022 
-- * LUN file: C:/Users/pr23yde/Desktop/P_ModData/db_agenda.lun 
-- * Schema: mld/1 
-- ********************************************* 


-- Database Section
-- ________________ 

drop database if exists db_agenda;

create database db_agenda;
use db_agenda;


-- Tables Section
-- _____________ 

create table t_class (
     idClass bigint not null auto_increment,
     name varchar(50) not null,
     idSection char(1) not null,
     idPerson bigint not null,
     constraint ID_t_class_ID primary key (idClass));

create table t_classPart (
     idClassPart bigint not null auto_increment,
     name varchar(50) not null,
     idClass bigint not null,
     constraint ID_t_classPart_ID primary key (idClassPart));

create table t_collaborator (
     idPerson bigint not null,
     idSchool bigint not null,
     constraint FKt_p_t_c_ID primary key (idPerson));

create table t_collaborator_job (
     idPerson bigint not null,
     idCollaboratorType bigint not null,
     constraint ID_is_ID primary key (idCollaboratorType, idPerson));

create table t_collaborator_section_rank (
     idPerson bigint not null,
     idRank bigint not null,
     idSection char(1) not null,
     constraint ID_work_ID primary key (idRank, idSection, idPerson));

create table t_job (
     idJob bigint not null auto_increment,
     name varchar(50) not null,
     constraint ID_t_collaboratorType_ID primary key (idJob));

create table t_event (
     idEvent int not null auto_increment,
     name varchar(150) not null,
     description varchar(600) not null,
     startDate date,
     endDate date,
     idEventType bigint not null,
     idClass bigint,
     idPerson bigint,
     Att_idPerson bigint,
     idSchool bigint,
     idSection char(1),
     constraint ID_t_event_ID primary key (idEvent));

create table t_event_collaborator (
     idPerson bigint not null,
     idEvent int not null,
     constraint ID_do_ID primary key (idPerson, idEvent));

create table t_eventType (
     idEventType bigint not null auto_increment,
     name varchar(150) not null,
     scope varchar(50) not null,
     isFacultative char not null,
     constraint ID_t_eventType_ID primary key (idEventType));

create table t_person (
     idPerson bigint not null auto_increment,
     birthDate date not null,
     firstname varchar(50) not null,
     lastname varchar(50) not null,
     street varchar(255) not null,
     streetNumber varchar(5) not null,
     locality varchar(85) not null,
     zip varchar(5) not null,
     phoneNumber varchar(20) not null,
     email varchar(255) not null,
     gender varchar(100) not null,
     pAnonyme varchar(15) not null,
     isActive char not null,
     constraint ID_t_person_ID primary key (idPerson));

create table t_rank (
     idRank bigint not null auto_increment,
     name varchar(50) not null,
     constraint ID_t_rank_ID primary key (idRank));

create table t_school (
     idSchool bigint not null auto_increment,
     name varchar(100) not null,
     street varchar(255) not null,
     streetNumber varchar(5) not null,
     locality varchar(100) not null,
     zip varchar(5) not null,
     mail varchar(255) not null,
     phoneNumber varchar(20) not null,
     constraint ID_t_school_ID primary key (idSchool));

create table t_section (
     idSection bigint not null auto_increment,
     name varchar(50) not null,
     constraint ID_t_section_ID primary key (idSection));

create table t_student (
     idPerson bigint not null,
     idClassPart bigint not null,
     idSchool bigint not null,
     idStudentGroup bigint,
     constraint FKt_p_t_s_ID primary key (idPerson));

create table t_studentGroup (
     idStudentGroup bigint not null auto_increment,
     name varchar(50) not null,
     constraint ID_t_studentGroup_ID primary key (idStudentGroup));


-- Constraints Section
-- ___________________ 

alter table t_class add constraint FKlead_FK
     foreign key (idPerson)
     references t_collaborator (idPerson);

alter table t_class add constraint FKlink_FK
     foreign key (idSection)
     references t_section (idSection);

alter table t_classPart add constraint FKcontain_FK
     foreign key (idClass)
     references t_class (idClass);

alter table t_collaborator add constraint FKt_p_t_c_FK
     foreign key (idPerson)
     references t_person (idPerson);

alter table t_collaborator add constraint FKaccomodate_FK
     foreign key (idSchool)
     references t_school (idSchool);

alter table t_collaborator_job add constraint FKis_t_c_FK
     foreign key (idPerson)
     references t_collaborator (idPerson);

alter table t_collaborator_job add constraint FKis_t_c_1
     foreign key (idCollaboratorType)
     references t_job (idJob);

alter table t_collaborator_section_rank add constraint FKwor_t_r
     foreign key (idRank)
     references t_rank (idRank);

alter table t_collaborator_section_rank add constraint FKwor_t_s_FK
     foreign key (idSection)
     references t_section (idSection);

alter table t_collaborator_section_rank add constraint FKwor_t_c_FK
     foreign key (idPerson)
     references t_collaborator (idPerson);

alter table t_event add constraint FKimpose_FK
     foreign key (idClass)
     references t_class (idClass);

alter table t_event add constraint FKcreate_FK
     foreign key (idPerson)
     references t_student (idPerson);

alter table t_event add constraint FKis_2_FK
     foreign key (idEventType)
     references t_eventType (idEventType);

alter table t_event add constraint FKassign_FK
     foreign key (idSchool)
     references t_school (idSchool);

alter table t_event add constraint FKaffect_FK
     foreign key (idSection)
     references t_section (idSection);

alter table t_event add constraint FKattribute_FK
     foreign key (Att_idPerson)
     references t_collaborator (idPerson);

alter table t_event_collaborator add constraint FKdo_t_c
     foreign key (idPerson)
     references t_collaborator (idPerson);

alter table t_event_collaborator add constraint FKdo_t_e_FK
     foreign key (idEvent)
     references t_event (idEvent);

-- Not implemented
-- alter table t_rank add constraint ID_t_rank_CHK
--     check(exists(select * from t_collaborator_section_rank
--                  where t_collaborator_section_rank.idRank = idRank)); 

alter table t_student add constraint FKt_p_t_s_FK
     foreign key (idPerson)
     references t_person (idPerson);

alter table t_student add constraint FKhave_FK
     foreign key (idClassPart)
     references t_classPart (idClassPart);

alter table t_student add constraint FKbelong_to_FK
     foreign key (idStudentGroup)
     references t_studentGroup (idStudentGroup);

alter table t_student add constraint FKcomport_FK
     foreign key (idSchool)
     references t_school (idSchool);


-- Index Section
-- _____________ 

create unique index ID_t_class_IND
     on t_class (idClass);

create index FKlead_IND
     on t_class (idPerson);

create index FKlink_IND
     on t_class (idSection);

create unique index ID_t_classPart_IND
     on t_classPart (idClassPart);

create index FKcontain_IND
     on t_classPart (idClass);

create unique index FKt_p_t_c_IND
     on t_collaborator (idPerson);

create index FKaccomodate_IND
     on t_collaborator (idSchool);

create unique index ID_is_IND
     on t_collaborator_job (idCollaboratorType, idPerson);

create index FKis_t_c_IND
     on t_collaborator_job (idPerson);

create unique index ID_work_IND
     on t_collaborator_section_rank (idRank, idSection, idPerson);

create index FKwor_t_s_IND
     on t_collaborator_section_rank (idSection);

create index FKwor_t_c_IND
     on t_collaborator_section_rank (idPerson);

create unique index ID_t_collaboratorType_IND
     on t_job (idJob);

create unique index ID_t_event_IND
     on t_event (idEvent);

create index FKimpose_IND
     on t_event (idClass);

create index FKcreate_IND
     on t_event (idPerson);

create index FKis_2_IND
     on t_event (idEventType);

create index FKassign_IND
     on t_event (idSchool);

create index FKaffect_IND
     on t_event (idSection);

create index FKattribute_IND
     on t_event (Att_idPerson);

create unique index ID_do_IND
     on t_event_collaborator (idPerson, idEvent);

create index FKdo_t_e_IND
     on t_event_collaborator (idEvent);

create unique index ID_t_eventType_IND
     on t_eventType (idEventType);

create unique index ID_t_person_IND
     on t_person (idPerson);

create unique index ID_t_rank_IND
     on t_rank (idRank);

create unique index ID_t_school_IND
     on t_school (idSchool);

create unique index ID_t_section_IND
     on t_section (idSection);

create unique index FKt_p_t_s_IND
     on t_student (idPerson);

create index FKhave_IND
     on t_student (idClassPart);

create index FKbelong_to_IND
     on t_student (idStudentGroup);

create index FKcomport_IND
     on t_student (idSchool);

create unique index ID_t_studentGroup_IND
     on t_studentGroup (idStudentGroup);

