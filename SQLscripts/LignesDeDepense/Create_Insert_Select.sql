-- BDD utilisée
USE gestion_budgetaire;

-- Suppression des tables si existantes
DROP TABLE IF EXISTS LigneDeDepense;

-- Création de la table
CREATE TABLE LigneDeDepense (
    id_LDD            INT AUTO_INCREMENT PRIMARY KEY,
    type_depense      ENUM("Budget demandé", "Budget autorisé", "Demande de report identifié"),
    annee             INT NOT NULL,
    montant           DECIMAL(15,2) NOT NULL,
    date_creation     DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modification DATETIME ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Lignes de dépense
INSERT INTO LigneDeDepense (type_depense, annee, montant) VALUES
('Budget demandé', 2024, 100000),
('Budget demandé', 2025, 100000),
('Budget demandé', 2026, 100000),
('Budget autorisé', 2024, 75000),
('Budget autorisé', 2025, 75000),
('Budget autorisé', 2026, 75000),
('Demande de report identifié', 2025, 10000);

select * from Lignededepense;