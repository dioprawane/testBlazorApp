-- BDD utilisée
USE gestion_budgetaire;

-- Suppression des tables si existantes
DROP TABLE IF EXISTS AppUserRoles;

-- Creation de la table
CREATE TABLE AppUserRoles (
    Id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    CompteAd    VARCHAR(255) NOT NULL,
    Role   		VARCHAR(255) NOT NULL
);
