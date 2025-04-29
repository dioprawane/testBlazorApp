-- BDD utilisée
USE gestion_budgetaire;

-- Suppression des tables si existantes
DROP TABLE IF EXISTS DemoEntityValues;

-- Creation de la table
CREATE TABLE DemoEntityValues (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedDate DATETIME NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Score DOUBLE NULL,
    ExternalId CHAR(36) NULL,
    Description TEXT NULL
);