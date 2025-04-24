USE demo;

DROP TABLE IF EXISTS PrevisionFigee;
DROP TABLE IF EXISTS VueFigee;
DROP TABLE IF EXISTS PrevisionBudgetaire;
DROP TABLE IF EXISTS LigneBudgetaire;

CREATE TABLE IF NOT EXISTS LigneBudgetaire (
    id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    macro_designation VARCHAR(255) NOT NULL, -- à transformer en FK
    da_code           VARCHAR(50) NOT NULL,  -- à transformer en FK
    pf_code           VARCHAR(50), -- à transformer en FK
    spf_code         VARCHAR(50), -- à transformer en FK
    nature_depense    ENUM('FCT_INFO_ADF', 'INV_INFO_STD') NOT NULL,
    code_initiative   VARCHAR(50), 
    code_projet       VARCHAR(50), 
    criticite         ENUM('Basse', 'Moyenne', 'Haute') NOT NULL,
    description_besoin TEXT,
    caracteristique_besoin TEXT,
    date_creation     DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modification DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS PrevisionBudgetaire (
    id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    demande_id        BIGINT NOT NULL,
    annee            INT NOT NULL,
    montant          DECIMAL(15,2) NOT NULL,
    date_modification DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (demande_id) REFERENCES LigneBudgetaire(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS VueFigee (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    nom_vue       VARCHAR(255) NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS PrevisionFigee (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    vue_id      BIGINT NOT NULL,
    demande_id  BIGINT NOT NULL,
    annee       INT NOT NULL,
    montant     DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (vue_id) REFERENCES VueFigee(id) ON DELETE CASCADE,
    FOREIGN KEY (demande_id) REFERENCES LigneBudgetaire(id) ON DELETE CASCADE
);

-- Insertion des demandes budgétaires
INSERT INTO LigneBudgetaire (macro_designation, da_code, pf_code, spf_code, nature_depense, code_initiative, code_projet, criticite, description_besoin, caracteristique_besoin)
VALUES 
('SERV-X86', 'DAAIS', 'HDC', 'HDC-GDC', 'INV_INFO_STD', '07_003', 'P24-352', 'Haute', 'Mise en conformité NIS - Volet infrastructure', 'Nouveau Besoin'),
('NEW-MAYDAY', 'DAFA', 'SDDOS', 'OFFR-TRANS', 'FCT_INFO_ADF', '03_020', 'P24-253', 'Haute', 'Licences base de connaissances', 'Engagement Contractuel'),
('ARCHI-WANDC', 'DAAIS', 'HDC', 'HDC-GREX', 'INV_INFO_STD', null, null, 'Basse', 'Installation de nouveaux routeurs', 'Extension de Périmètre');

-- Insertion des prévisions budgétaires
INSERT INTO PrevisionBudgetaire (demande_id, annee, montant)
VALUES 
(1, 2025, 50000.00),
(1, 2026, 52000.00),
(2, 2025, 75000.00),
(2, 2026, 77000.00),
(3, 2025, 30000.00);

-- Création d'une vue figée
INSERT INTO VueFigee (nom_vue)
VALUES ('Budget prévisionnel 2025');

-- Insertion des prévisions figées
INSERT INTO PrevisionFigee (vue_id, demande_id, annee, montant)
VALUES 
(1, 1, 2025, 39999.00),
(1, 2, 2025, 65999.00),
(1, 3, 2025, 44999.00),
(1, 1, 2026, 49999.00),
(1, 2, 2026, 55999.00),
(1, 3, 2026, 64999.00);

DROP TRIGGER IF EXISTS after_vuefigee_insert;

DELIMITER //

CREATE TRIGGER after_vuefigee_insert
AFTER INSERT ON VueFigee
FOR EACH ROW
BEGIN
    -- Insérer les prévisions budgétaires existantes dans la table PrevisionFigee
    INSERT INTO PrevisionFigee (vue_id, demande_id, annee, montant)
    SELECT NEW.id, demande_id, annee, montant
    FROM PrevisionBudgetaire;
END //

DELIMITER ;

