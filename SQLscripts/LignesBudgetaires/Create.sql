-- BDD utilisée
USE gestion_budgetaire;

-- Suppression des tables si existantes
DROP TABLE IF EXISTS Budget_Parametre;
DROP TABLE IF EXISTS Budget_Depense;
DROP TABLE IF EXISTS LignesBudgetaires;

-- Table des lignes budgétaires
CREATE TABLE LignesBudgetaires (
    id_ligne_budget             int AUTO_INCREMENT PRIMARY KEY,
    ref_macro_designation       int not null,
    ref_masse_budgetaire        int not null,
    nature_du_besoin            varchar(1000) not null,
    ref_portefeuille            bigint not null,
    ref_caracteristique_besoin  int not null,
    date_realisation_cible      DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_creation               DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modification           DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- Liaison N-N : Paramètres & Lignes Budgétaires
CREATE TABLE Budget_Parametre (
    id_budget INT,
    ref_id_parametre INT,
    PRIMARY KEY (id_budget, ref_id_parametre),
    FOREIGN KEY (id_budget) REFERENCES LignesBudgetaires(id_ligne_budget) ON DELETE CASCADE,
    FOREIGN KEY (ref_id_parametre) REFERENCES Parametres(id_parametre) ON DELETE CASCADE
);

-- Liaison N-N : Lignes de dépenses & lignes budgétaires
CREATE TABLE Budget_Depense (
    id_budget INT,
    ref_id_LDD INT,
    PRIMARY KEY (id_budget, ref_id_LDD),
    FOREIGN KEY (id_budget) REFERENCES LignesBudgetaires(id_ligne_budget) ON DELETE CASCADE,
    FOREIGN KEY (ref_id_LDD) REFERENCES LigneDeDepense(id_LDD) ON DELETE CASCADE
);