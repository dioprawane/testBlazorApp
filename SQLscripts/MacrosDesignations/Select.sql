-- Afficher les tables
select * from macro_designation;
select * from categorie_sdsi;

-- Cathegorie SDSI
select distinct categorie_md from categorie_sdsi;
select distinct categorie_sdsi from categorie_sdsi;
select distinct sous_categorie_sdsi from categorie_sdsi;

-- Macro Designation
select distinct CODE_MACRO_DESIGNATION from MACRO_DESIGNATION;
select distinct count(CODE_MACRO_DESIGNATION) from MACRO_DESIGNATION;
select distinct count(MACRO_DESIGNATION) from MACRO_DESIGNATION;
select count(MACRO_DESIGNATION) from MACRO_DESIGNATION;
select * from MACRO_DESIGNATION where CODE_MACRO_DESIGNATION like 'ALTO';

select code_MACRO_DESIGNATION, MACRO_DESIGNATION, categorie_md, categorie_sdsi, sous_categorie_sdsi
from MACRO_DESIGNATION 
left join categorie_sdsi on MACRO_DESIGNATION.ID_CATEGORIE_SDSI = categorie_sdsi.csdsi_ID_CATEGORIE_SDSI
where CODE_MACRO_DESIGNATION 
like 'ALTO';

select code_MACRO_DESIGNATION, MACRO_DESIGNATION, categorie_md, categorie_sdsi, sous_categorie_sdsi
from MACRO_DESIGNATION 
left join categorie_sdsi on MACRO_DESIGNATION.ID_CATEGORIE_SDSI = categorie_sdsi.csdsi_ID_CATEGORIE_SDSI
where CODE_MACRO_DESIGNATION 
like 'AMABIS';

select code_MACRO_DESIGNATION, MACRO_DESIGNATION, categorie_md, categorie_sdsi, sous_categorie_sdsi
from MACRO_DESIGNATION 
left join categorie_sdsi on MACRO_DESIGNATION.ID_CATEGORIE_SDSI = categorie_sdsi.csdsi_ID_CATEGORIE_SDSI
where CODE_MACRO_DESIGNATION 
like 'MS-SERVER';

select code_MACRO_DESIGNATION, MACRO_DESIGNATION, categorie_md, categorie_sdsi, sous_categorie_sdsi
from MACRO_DESIGNATION 
left join categorie_sdsi on MACRO_DESIGNATION.ID_CATEGORIE_SDSI = categorie_sdsi.csdsi_ID_CATEGORIE_SDSI
where CODE_MACRO_DESIGNATION 
like 'STOCKAGE-HITACHI';