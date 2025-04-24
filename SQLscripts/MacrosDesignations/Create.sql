USE gestion_budgetaire;

drop table if exists MACRO_DESIGNATION;
drop table if exists CATEGORIE_SDSI;

/*==============================================================*/
/* Table : CATEGORIE_SDSI                                       */
/*==============================================================*/
create table CATEGORIE_SDSI
(
	CSDSI_ID_CATEGORIE_SDSI        int AUTO_INCREMENT,
	CATEGORIE_MD                   varchar(100) not null,
    CATEGORIE_SDSI                 varchar(100) not null,
    SOUS_CATEGORIE_SDSI            varchar(100) not null,
    ACTIVITE_MODELE_DE_COUT        varchar(100) not null,
    SERVICE_MODELE_DE_COUT_V2      varchar(100) not null,
    SERVICE_MODELE_DE_COUT_V2_ABD  varchar(100) not null,
    ID_LIBELLE                     int not null,
	ID_VERSION                     int not null,
	DATE_DE_MODIFICATION           date not null,
	DATE_DE_VALIDITE               date not null,
	ACTIF                          bool not null default TRUE,
    COMMENTAIRES                   varchar(1000) not null,
	primary key (CSDSI_ID_CATEGORIE_SDSI)
);

/*==============================================================*/
/* Table : MASSE_BUDGETAIRE                                     */
/*==============================================================*/
create table MACRO_DESIGNATION
(
   ID_MACRO_DESIGNATION    int AUTO_INCREMENT,
   ID_CATEGORIE_SDSI       int not null,
   CODE_MACRO_DESIGNATION  varchar(100) not null,
   MACRO_DESIGNATION       varchar(100) not null,
   PERIMETRE               varchar(500) not null,
   ID_LIBELLE              int not null,
   ID_VERSION              int not null,
   DATE_DE_MODIFICATION    date not null,
   DATE_DE_VALIDITE        date not null,
   ACTIF                   bool not null default TRUE,
   primary key (ID_MACRO_DESIGNATION)
);

alter table MACRO_DESIGNATION 
add constraint FK_EST_DANS_UNE_CATEGORIE 
foreign key (ID_CATEGORIE_SDSI)
references CATEGORIE_SDSI (CSDSI_ID_CATEGORIE_SDSI)
on delete restrict 
on update restrict;