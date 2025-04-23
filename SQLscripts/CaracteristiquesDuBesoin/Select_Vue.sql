select * from caracteristique_besoin;
select * from critere;
select * from valeur_evaluation;
select * from evaluation_besoin;

SELECT 
    cb.nom AS besoin,
    c.nom AS critere,
    ve.label AS evaluation,
    c.poids,
	ve.score,
    ROUND(ve.score * c.poids, 2) AS score_pondere
FROM evaluation_besoin eb
JOIN caracteristique_besoin cb ON eb.id_caracteristique = cb.id_caracteristique
JOIN critere c ON eb.id_critere = c.id_critere
JOIN valeur_evaluation ve ON eb.id_valeur = ve.id_valeur
WHERE cb.id_caracteristique = 1;

SELECT 
    cb.nom AS besoin,
    ROUND(SUM(ve.score * c.poids), 2) AS score_total,
    CASE 
        WHEN SUM(ve.score * c.poids) >= 3 THEN 'P1-HAUTE'
        WHEN SUM(ve.score * c.poids) >= 1.8 THEN 'P2-MOYENNE'
        ELSE 'P3-BASSE'
    END AS priorite_affichee
FROM caracteristique_besoin cb
JOIN evaluation_besoin eb ON eb.id_caracteristique = cb.id_caracteristique
JOIN critere c ON c.id_critere = eb.id_critere
JOIN valeur_evaluation ve ON ve.id_valeur = eb.id_valeur
WHERE cb.nom = 'Engagement contractuel'
AND (
    (c.nom = 'Engagement Contractuel' AND ve.label = '8-oui') OR
    (c.nom = 'Prio Stratégique' AND ve.label = '8-haute') OR
    (c.nom = 'Prio Technique' AND ve.label = '0-aucune') OR
    (c.nom = 'Maturité' AND ve.label = '0-aucune') OR
    (c.nom = 'Phase Projet' AND ve.label = '0-aucune ou technique')
)
GROUP BY cb.nom;

DELIMITER //

CREATE PROCEDURE affiche_priorite_besoin(
    IN nom_besoin VARCHAR(100),
    IN val1 VARCHAR(50),
    IN val2 VARCHAR(50),
    IN val3 VARCHAR(50),
    IN val4 VARCHAR(50),
    IN val5 VARCHAR(50)
)
BEGIN
    DECLARE total FLOAT;

    SELECT SUM(ve.score * c.poids)
    INTO total
    FROM caracteristique_besoin cb
    JOIN evaluation_besoin eb ON eb.id_caracteristique = cb.id_caracteristique
    JOIN critere c ON eb.id_critere = c.id_critere
    JOIN valeur_evaluation ve ON ve.id_valeur = eb.id_valeur
    WHERE cb.nom = nom_besoin
    AND (
        (c.nom = 'Engagement Contractuel' AND ve.label = val1) OR
        (c.nom = 'Prio Stratégique' AND ve.label = val2) OR
        (c.nom = 'Prio Technique' AND ve.label = val3) OR
        (c.nom = 'Maturité' AND ve.label = val4) OR
        (c.nom = 'Phase Projet' AND ve.label = val5)
    );

    SELECT 
        nom_besoin AS besoin,
        ROUND(total, 2) AS score,
        CASE
            WHEN total >= 3 THEN 'P1-HAUTE'
            WHEN total >= 1.8 THEN 'P2-MOYENNE'
            ELSE 'P3-BASSE'
        END AS priorite;
END //

DELIMITER ;

CALL affiche_priorite_besoin(
    'Engagement contractuel',
    '8-oui',
    '8-haute',
    '8-haute',
    '8-haute',
    '0-aucune ou technique'
);