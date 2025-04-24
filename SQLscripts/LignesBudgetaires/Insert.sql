-- Lignes budgétaires
INSERT INTO LignesBudgetaires (ref_macro_designation, ref_masse_budgetaire, nature_du_besoin, 
ref_portefeuille, ref_caracteristique_besoin) VALUES
(5, 6, 'Nouvelle demande de PC', 5, 4),
(2, 1, 'Nouveaux Servers', 4, 3),
(8, 9, 'Nouvelles licences Power BI', 7, 5);

-- Associations budgets ↔ dépenses
INSERT INTO Budget_Depense (id_budget, ref_id_LDD) VALUES
(1, 1),
(2, 2),
(3, 1),
(1, 2),
(2, 3),
(3, 4),
(1, 3),
(2, 1),
(3, 2),
(1, 5),
(2, 4),
(3, 6),
(3, 3);

-- Associations ligne ↔ paramètre
INSERT INTO Budget_Parametre (id_budget, ref_id_parametre) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 2),
(1, 4),
(1, 5),
(2, 4),
(3, 5),
(3, 4),
(3, 3);