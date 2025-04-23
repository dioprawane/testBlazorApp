USE gestion_budgetaire;

drop table if exists MASSE_BUDGETAIRE;

/*==============================================================*/
/* Table : MASSE_BUDGETAIRE - ici, il s'agit de la notion de version où on peut suivre différentes versions et suivre le changement des libelles aussi */
/*==============================================================*/
create table MASSE_BUDGETAIRE
(
   ID_MASSE_BUDGETAIRE  int AUTO_INCREMENT,
   MASSE_BUDGETAIRE     varchar(100) not null,
   ID_LIBELLE           int not null, -- permet d'avoir les différents changement d'un libelle par exemple : 'ADF COURANTS' > 'ADF COURANTE' > 'ADF COURANTES'
   ID_VERSION           int not null, -- permet d'avoir les différentes versions par exemple : codif1 puis codif2 puis codif3, etc
   DATE_DE_MODIFICATION date not null,
   DATE_DE_VALIDITE     date not null,
   ACTIF                bool not null default TRUE,
   primary key (ID_MASSE_BUDGETAIRE)
);

/*==============================================================*/
/* Table : MASSE_BUDGETAIRE - Affichage */
/*==============================================================*/

-- Afficher la table
select * from masse_budgetaire;

-- Masses budg actives
select distinct masse_budgetaire
from masse_budgetaire 
where actif = TRUE;

-- Masses budg d’un même libellé
SELECT * FROM MASSE_BUDGETAIRE
WHERE ID_LIBELLE = 3
ORDER BY ID_VERSION;

-- Voir la dernière version active d’un libellé (actuellement comme 2 versions, c'est même chose qu'actif)
SELECT DISTINCT masse_budgetaire FROM MASSE_BUDGETAIRE mb
WHERE ACTIF = TRUE
AND ID_VERSION = (
    SELECT MAX(ID_VERSION)
    FROM MASSE_BUDGETAIRE
    WHERE ID_LIBELLE = mb.ID_LIBELLE
);

-- Afficher les masses budg actuelles et leurs versions d'avant
SELECT 
    actuelle.ID_LIBELLE,
    actuelle.MASSE_BUDGETAIRE AS masse_budg_actuelle,
    precedente.MASSE_BUDGETAIRE AS masse_budg_precedente
FROM MASSE_BUDGETAIRE actuelle
LEFT JOIN MASSE_BUDGETAIRE precedente
    ON actuelle.ID_LIBELLE = precedente.ID_LIBELLE
   AND precedente.id_version = (
       SELECT MAX(id_version)
       FROM MASSE_BUDGETAIRE p
       WHERE p.ID_LIBELLE = actuelle.ID_LIBELLE
         AND p.id_version < actuelle.id_version
   )
WHERE actuelle.ACTIF = TRUE
ORDER BY actuelle.MASSE_BUDGETAIRE, actuelle.DATE_DE_VALIDITE DESC;

