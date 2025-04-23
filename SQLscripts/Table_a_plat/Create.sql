/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  15/04/2025 12:38:44                      */
/*==============================================================*/
USE gestion_budgetaire;

drop table if exists DIALOGUE_GESTION;

/*==============================================================*/
/* Table : DIALOGUE_GESTION                                     */
/*==============================================================*/
create table DIALOGUE_GESTION
(
   DG_CODE              bigint AUTO_INCREMENT,
   ANNEE                bigint,
   SERIES_DE_DONNEES    varchar(50),
   DATE                 date,
   SERIE_DATE           varchar(50),
   LINE_TO_USE          numeric(2,0),
   MACRO_DESIGNATION    varchar(100),
   MACRO_DESIGNATION_ORIGINAL varchar(100),
   MACRO_DESIGNATION_HDC_TELEPH varchar(100),
   CATEGORIE_SDSI       varchar(100),
   SOUS_CATEGORIE_SDSI  varchar(100),
   NATURE_DU_BESOIN     varchar(100),
   CADRE_D_ACHAT        varchar(100),
   FOURNISSEUR          varchar(100),
   LIBELLE_DU_MARCHE    varchar(100),
   MASSE_BUDGETAIRE     varchar(100),
   BASE_LINE_INITIATIVE varchar(50),
   DA                   varchar(100),
   AXE_NATIONAL_1       varchar(100),
   CTRL_CODE_INITIATIVE_SELON_G2PI varchar(100),
   CODE_INITIATIVE_STANDARDISE varchar(100),
   LIBELLE_INITIATIVE   varchar(100),
   LIBELLE_ORIENTATION  varchar(100),
   COMMENTAIRES_INITIATIVES_SDSI varchar(100),
   CODE_PROJET_STANDARDISE varchar(100),
   LIBELLE_PROJET       varchar(100),
   STATUT_PROJET        varchar(100),
   COMPTES_BUDGETAIRES  varchar(100),
   COMPTES_COMPTABLES   varchar(100),
   DA_STANDARDISE       varchar(100),
   PORTEFEUILLE_STANDARDISE varchar(100),
   SOUS_PORTEFEUILLE_STANDARDISE varchar(100),
   NEW_SOUS_PORTEFEUILLE_STANDARDISE varchar(100),
   CARACTERISTIQUE_DU_BESOIN_STANDARDISE varchar(100),
   CRITICITE_STANDARDISE varchar(100),
   MONTANT_TTC          numeric(8,0),
   DEMANDE_DE_REPORT_IDENTIFIE numeric(8,0),
   BUDGET_AUTORISE      numeric(8,0),
   COMMENTAIRES         varchar(200),
   SOUS_SOUS_PORTEFEUILLE varchar(100),
   FICHIER_SOURCE       varchar(100),
   PRIORITE_BPA         varchar(100),
   PREVISION_ACTUALISEE_VS_SDSI varchar(100),
   CATEGORIE_SDSI_FORMULE varchar(100),
   SOUS_CATEGORIE_SDSI_FORMULE varchar(100),
   MOTIFS_DR_BC         varchar(100),
   COMMENTAIRES_DR_BC   varchar(200),
   primary key (DG_CODE)
);

select * from dialogue_gestion;
select distinct PREVISION_ACTUALISEE_VS_SDSI from dialogue_gestion;