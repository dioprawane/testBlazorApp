-- BDD utilisée
USE gestion_budgetaire;

-- Suppression des tables si existantes
DROP TABLE IF EXISTS evaluation_besoin;
DROP TABLE IF EXISTS valeur_evaluation;
DROP TABLE IF EXISTS critere;
DROP TABLE IF EXISTS caracteristique_besoin;

-- Création des différentes tables
CREATE TABLE caracteristique_besoin (
    id_caracteristique INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE critere (
    id_critere INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    poids FLOAT NOT NULL
);

CREATE TABLE valeur_evaluation (
    id_valeur INT AUTO_INCREMENT PRIMARY KEY,
    id_critere INT,
    label VARCHAR(50) NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (id_critere) REFERENCES critere(id_critere)
);

CREATE TABLE evaluation_besoin (
    id_evaluation INT AUTO_INCREMENT PRIMARY KEY,
    id_caracteristique INT,
    id_critere INT,
    id_valeur INT,
    FOREIGN KEY (id_caracteristique) REFERENCES caracteristique_besoin(id_caracteristique),
    FOREIGN KEY (id_critere) REFERENCES critere(id_critere),
    FOREIGN KEY (id_valeur) REFERENCES valeur_evaluation(id_valeur)
);