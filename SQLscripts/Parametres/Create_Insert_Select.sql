-- BDD utilisée
USE gestion_budgetaire;

-- Suppression des tables si existantes
DROP TABLE IF EXISTS Parametres;

-- Creation de la table
CREATE TABLE Parametres (
    id_parametre   INT AUTO_INCREMENT PRIMARY KEY,
    annee          INT NOT NULL,
    exercice       INT NOT NULL,
    date_param     DATETIME DEFAULT CURRENT_TIMESTAMP,
    statut         ENUM("Creation de la ligne", "En cours de dialogue", "Reunion DA", "Fin dialogue"),
    date_creation  DATETIME DEFAULT CURRENT_TIMESTAMP,
    cree_par       VARCHAR(100) NOT NULL,
    commentaires   VARCHAR(500) NOT NULL
);

-- Paramètres
INSERT INTO Parametres (annee, exercice, statut, cree_par, commentaires) VALUES
(2025, 2024, "Creation de la ligne", "DIOP", ""),
(2024, 2025, "En cours de dialogue", "DIOP", ""),
(2024, 2024, "Creation de la ligne", "DIOP", "OK"),
(2024, 2026, "En cours de dialogue", "JEAN", ""),
(2025, 2024, "En cours de dialogue", "PIERRE", "");

select * from parametres;