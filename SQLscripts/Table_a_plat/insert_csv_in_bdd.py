import mysql.connector
from mysql.connector import Error
import time

csv_file_path = "../data/Insertion_Table_a_plat.csv"

colonnes_csv = [
    "ANNEE", "SERIES_DE_DONNEES", "DG_DATE", "SERIE_DATE", "LINE_TO_USE",
    "MACRO_DESIGNATION", "MACRO_DESIGNATION_ORIGINAL", "MACRO_DESIGNATION_HDC_TELEPH",
    "CATEGORIE_SDSI", "SOUS_CATEGORIE_SDSI", "NATURE_DU_BESOIN", "CADRE_D_ACHAT",
    "FOURNISSEUR", "LIBELLE_DU_MARCHE", "MASSE_BUDGETAIRE", "BASE_LINE_INITIATIVE",
    "DA", "AXE_NATIONAL_1", "CTRL_CODE_INITIATIVE_SELON_G2PI", "CODE_INITIATIVE_STANDARDISE",
    "LIBELLE_INITIATIVE", "LIBELLE_ORIENTATION", "COMMENTAIRES_INITIATIVES_SDSI",
    "CODE_PROJET_STANDARDISE", "LIBELLE_PROJET", "STATUT_PROJET",
    "COMPTES_BUDGETAIRES", "COMPTES_COMPTABLES", "DA_STANDARDISE",
    "PORTEFEUILLE_STANDARDISE", "SOUS_PORTEFEUILLE_STANDARDISE", "NEW_SOUS_PORTEFEUILLE_STANDARDISE",
    "CARACTERISTIQUE_DU_BESOIN_STANDARDISE", "CRITICITE_STANDARDISE", "MONTANT_TTC",
    "DEMANDE_DE_REPORT_IDENTIFIE", "BUDGET_AUTORISE", "COMMENTAIRES", "SOUS_SOUS_PORTEFEUILLE",
    "FICHIER_SOURCE", "PRIORITE_BPA", "PREVISION_ACTUALISEE_VS_SDSI",
    "CATEGORIE_SDSI_FORMULE", "SOUS_CATEGORIE_SDSI_FORMULE",
    "MOTIFS_DR_BC", "COMMENTAIRES_DR_BC"
]

config = {
    'user': 'perfeco',
    'password': 'perfeco',
    'host': 'pro69valo.urdom.ad.recouv',
    'database': 'gestion_budgetaire',
    'allow_local_infile': True,
    'charset': 'utf8mb4',
    'collation': 'utf8mb4_unicode_ci'
}

cursor = None
cnx = None

try:
    print("Connexion à MySQL...")
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    load_query = f"""
    LOAD DATA LOCAL INFILE '{csv_file_path.replace("\\", "\\\\")}'
    INTO TABLE gestion_budgetaire.DIALOGUE_GESTION
    CHARACTER SET utf8mb4
    FIELDS TERMINATED BY ';'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\\n'
    IGNORE 1 LINES
    ({', '.join(colonnes_csv)});
    """

    print("Insertion en cours...")
    start_time = time.time() 
    cursor.execute(load_query)
    cnx.commit()
    end_time = time.time()

    duration = end_time - start_time
    print(f"Données insérées avec succès dans DIALOGUE_GESTION")
    print(f"Temps d'insertion : {duration:.3f} secondes")

except Error as e:
    print(f"Erreur MySQL : {e}")

finally:
    if cursor is not None:
        cursor.close()
    if cnx is not None:
        cnx.close()