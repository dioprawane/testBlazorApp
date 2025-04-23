-- Insertion des données

-- Caractéristique
INSERT INTO caracteristique_besoin (nom) VALUES ('Engagement contractuel');
INSERT INTO caracteristique_besoin (nom) VALUES ('Augmentation de périmètre');
INSERT INTO caracteristique_besoin (nom) VALUES ('Nouveau besoin');
INSERT INTO caracteristique_besoin (nom) VALUES ('Renouvellement');
INSERT INTO caracteristique_besoin (nom) VALUES ('MCO suite expiration garantie');

-- Critères avec poids
INSERT INTO critere (nom, poids) VALUES 
('Engagement Contractuel', 1.0),
('Prio Stratégique', 0.4),
('Prio Technique', 0.3),
('Maturité', 0.3),
('Phase Projet', 0.2);

-- Valeurs et Labels pour chaque critère
INSERT INTO valeur_evaluation (id_critere, label, score) VALUES
-- Engagement Contractuel
(1, '0-non', 0),
(1, '8-oui', 8),

-- Prio Stratégique
(2, '0-aucune', 0),
(2, '1-basse', 1),
(2, '4-moyenne', 4),
(2, '8-haute', 8),

-- Prio Technique
(3, '0-aucune', 0),
(3, '1-basse', 1),
(3, '4-moyenne', 4),
(3, '10-haute', 10),

-- Maturité
(4, '0-aucune', 0),
(4, '1-basse', 1),
(4, '4-moyenne', 4),
(4, '8-haute', 8),

-- Phase Projet
(5, '0-aucune ou technique', 0),
(5, '1-opportunité', 1),
(5, '2-faisabilité', 2),
(5, '4-lancé', 4);

-- Évaluation du besoin
INSERT INTO evaluation_besoin (id_caracteristique, id_critere, id_valeur) VALUES
-- Engagement contractuel
(1, 1, 2),  -- Toujours Engagement Contractuel : 8-oui
(1, 2, 3),  -- Prio Stratégique : 0-aucune
(1, 2, 4),  -- Prio Stratégique : 1-basse
(1, 2, 5),  -- Prio Stratégique : 4-moyenne
(1, 2, 6),  -- Prio Stratégique : 8-haute
(1, 3, 7),  -- Prio Technique : 0-aucune
(1, 3, 8),  -- Prio Technique : 1-basse
(1, 3, 9),  -- Prio Technique : 4-moyenne
(1, 3, 10),  -- Prio Technique : 10-haute
(1, 4, 11),  -- Maturité : 0-aucune
(1, 4, 12),  -- Maturité : 1-basse
(1, 4, 13),  -- Maturité : 4-moyenne
(1, 4, 14),  -- Maturité : 8-haute
(1, 5, 15),  -- Phase Projet : 0-aucune ou technique
(1, 5, 16),  -- Phase Projet : 1-opportunité
(1, 5, 17),  -- Phase Projet : 2-faisabilité
(1, 5, 18),  -- Phase Projet : 4-lancé
-- Augmentation de périmètre
(2, 1, 1),  -- Toujours Engagement Contractuel : 0-non
(2, 1, 2),  -- Toujours Engagement Contractuel : 8-oui
(2, 2, 3),  -- Prio Stratégique : 0-aucune
(2, 2, 4),  -- Prio Stratégique : 1-basse
(2, 2, 5),  -- Prio Stratégique : 4-moyenne
(2, 2, 6),  -- Prio Stratégique : 8-haute
(2, 3, 7),  -- Prio Technique : 0-aucune
(2, 3, 8),  -- Prio Technique : 1-basse
(2, 3, 9),  -- Prio Technique : 4-moyenne
(2, 3, 10),  -- Prio Technique : 10-haute
(2, 4, 11),  -- Maturité : 0-aucune
(2, 4, 12),  -- Maturité : 1-basse
(2, 4, 13),  -- Maturité : 4-moyenne
(2, 4, 14),  -- Maturité : 8-haute
(2, 5, 15),  -- Phase Projet : 0-aucune ou technique
(2, 5, 16),  -- Phase Projet : 1-opportunité
(2, 5, 17),  -- Phase Projet : 2-faisabilité
(2, 5, 18),  -- Phase Projet : 4-lancé
-- Nouveau besoin
(3, 1, 1),  -- Toujours Engagement Contractuel : 0-non
(3, 1, 2),  -- Toujours Engagement Contractuel : 8-oui
(3, 2, 3),  -- Prio Stratégique : 0-aucune
(3, 2, 4),  -- Prio Stratégique : 1-basse
(3, 2, 5),  -- Prio Stratégique : 4-moyenne
(3, 2, 6),  -- Prio Stratégique : 8-haute
(3, 3, 7),  -- Prio Technique : 0-aucune
(3, 3, 8),  -- Prio Technique : 1-basse
(3, 3, 9),  -- Prio Technique : 4-moyenne
(3, 3, 10),  -- Prio Technique : 10-haute
(3, 4, 11),  -- Maturité : 0-aucune
(3, 4, 12),  -- Maturité : 1-basse
(3, 4, 13),  -- Maturité : 4-moyenne
(3, 4, 14),  -- Maturité : 8-haute
(3, 5, 15),  -- Phase Projet : 0-aucune ou technique
(3, 5, 16),  -- Phase Projet : 1-opportunité
(3, 5, 17),  -- Phase Projet : 2-faisabilité
(3, 5, 18),  -- Phase Projet : 4-lancé
-- Renouvellement
(4, 1, 1),  -- Toujours Engagement Contractuel : 0-non
(4, 1, 2),  -- Toujours Engagement Contractuel : 8-oui
(4, 2, 3),  -- Prio Stratégique : 0-aucune
(4, 2, 4),  -- Prio Stratégique : 1-basse
(4, 2, 5),  -- Prio Stratégique : 4-moyenne
(4, 2, 6),  -- Prio Stratégique : 8-haute
(4, 3, 7),  -- Prio Technique : 0-aucune
(4, 3, 8),  -- Prio Technique : 1-basse
(4, 3, 9),  -- Prio Technique : 4-moyenne
(4, 3, 10),  -- Prio Technique : 10-haute
(4, 4, 11),  -- Maturité : 0-aucune
(4, 4, 12),  -- Maturité : 1-basse
(4, 4, 13),  -- Maturité : 4-moyenne
(4, 4, 14),  -- Maturité : 8-haute
(4, 5, 15),  -- Phase Projet : 0-aucune ou technique
(4, 5, 16),  -- Phase Projet : 1-opportunité
(4, 5, 17),  -- Phase Projet : 2-faisabilité
(4, 5, 18),  -- Phase Projet : 4-lancé
-- MCO suite expiration garantie
(5, 1, 1),  -- Toujours Engagement Contractuel : 0-non
(5, 1, 2),  -- Toujours Engagement Contractuel : 8-oui
(5, 2, 3),  -- Prio Stratégique : 0-aucune
(5, 2, 4),  -- Prio Stratégique : 1-basse
(5, 2, 5),  -- Prio Stratégique : 4-moyenne
(5, 2, 6),  -- Prio Stratégique : 8-haute
(5, 3, 7),  -- Prio Technique : 0-aucune
(5, 3, 8),  -- Prio Technique : 1-basse
(5, 3, 9),  -- Prio Technique : 4-moyenne
(5, 3, 10),  -- Prio Technique : 10-haute
(5, 4, 11),  -- Maturité : 0-aucune
(5, 4, 12),  -- Maturité : 1-basse
(5, 4, 13),  -- Maturité : 4-moyenne
(5, 4, 14),  -- Maturité : 8-haute
(5, 5, 15),  -- Phase Projet : 0-aucune ou technique
(5, 5, 16),  -- Phase Projet : 1-opportunité
(5, 5, 17),  -- Phase Projet : 2-faisabilité
(5, 5, 18);  -- Phase Projet : 4-lancé