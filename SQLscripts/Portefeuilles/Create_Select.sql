USE gestion_budgetaire;

drop table if exists PORTEFEUILLES;
drop table if exists GROUPE_PORTEFEUILLES;

/*==============================================================*/
/* Table : GROUPE_PORTEFEUILLES                                 */
/*==============================================================*/
create table GROUPE_PORTEFEUILLES
(
	GP_ID_GROUPE         BIGINT AUTO_INCREMENT,
	GP_NOM               varchar(20) not null,
	primary key (GP_ID_GROUPE)
);

/*==============================================================*/
/* Table : PORTEFEUILLE                                         */
/*==============================================================*/
CREATE TABLE PORTEFEUILLES (
	ID_PORTEFEUILLE BIGINT AUTO_INCREMENT,
	GP_ID_GROUPE         BIGINT not null,
	LIBELLE              varchar(100) not null,
	ID_VERSION           int not null,
	ID_PARENT            int,
	NIVEAU               varchar(20) not null,
	ACTIF                bool not null default TRUE,
	DATE_DE_MODIFICATION date not null,
    DATE_DE_VALIDITE     date not null,
    PRIMARY KEY (ID_PORTEFEUILLE)
);

alter table PORTEFEUILLES 
add constraint FK_EST_DANS_UN_GROUPE 
foreign key (GP_ID_GROUPE)
references GROUPE_PORTEFEUILLES (GP_ID_GROUPE)
on delete restrict 
on update restrict;

/*==============================================================*/
/* Insertions GROUPE_PORTEFEUILLES                              */
/*==============================================================*/
INSERT INTO GROUPE_PORTEFEUILLES (GP_ID_GROUPE, GP_NOM)
VALUES (100, '');

INSERT INTO GROUPE_PORTEFEUILLES (GP_NOM)
VALUES ('DAAIS'),
       ('DAOS'),
       ('DAFA'),
       ('DAPM'),
       ('BAFFI'),
       ('DIR-ACOSS'),
       ('DA3C');
       
select * from Groupe_portefeuilles;
select * from portefeuilles;