using System.ComponentModel.DataAnnotations;

namespace GestionBudgétaire.Data.Entities.Database
{
    public class Dialogue
    {
        [Key]
        public int DGCODE { get; set; }
        public int? ANNEE { get; set; } = 0;
        public string? SERIES_DE_DEDONNEES { get; set; } = string.Empty;
        public DateTime? DATE { get; set; } = null;
        public string? SERIE_DATE { get; set; } = string.Empty;
        public int? LINE_TO_USE { get; set; } = 0;
        public string? MACRO_DESIGNATION { get; set; } = string.Empty;
        public string? MACRO_DESIGNATION_ORIGINAL { get; set; } = string.Empty;
        public string? MACRO_DESIGNATION_HDC_TELEPH { get; set; } = string.Empty;
        public string? CATEGORIE_SDSI { get; set; } = string.Empty;
        public string? SOUS_CATEGORIE_SDSI { get; set; } = string.Empty;
        public string? NATURE_DU_BESOIN { get; set; } = string.Empty;
        public string? CADRE_D_ACHAT { get; set; } = string.Empty;
        public string? FOURNISSEUR { get; set; } = string.Empty;
        public string? LIBELLE_DU_MARCHE { get; set; } = string.Empty;
        public string? MASSE_BUDGETAIRE { get; set; } = string.Empty;
        public string? BASE_LINE_INITIATIVE { get; set; } = string.Empty;
        public string? DA { get; set; } = string.Empty;
        public string? AXE_NATIONAL_1 { get; set; } = string.Empty;
        public string? CTRL_CODE_INITIATIVE_SELON_G2PI { get; set; } = string.Empty;
        public string? CODE_INITIATIVE_STANDARDISE { get; set; } = string.Empty;
        public string? LIBELLE_INITIATIVE { get; set; } = string.Empty;
        public string? LIBELLE_ORIENTATION { get; set; } = string.Empty;
        public string? COMMENTAIRES_INITIATIVES_SDSI { get; set; } = string.Empty;
        public string? CODE_PROJET_STANDARDISE { get; set; } = string.Empty;
        public string? LIBELLE_PROJET { get; set; } = string.Empty;
        public string? STATUT_PROJET { get; set; } = string.Empty;
        public decimal? COMPTES_BUDGETAIRES { get; set; } = 0;
        public decimal? COMPTES_COMPTABLES { get; set; } = 0;
        public string? DA_STANDARDISE { get; set; } = string.Empty;
        public string? PORTEFEUILLE_STANDARDISE { get; set; } = string.Empty;
        public string? SOUS_PORTEFEUILLE_STANDARDISE { get; set; } = string.Empty;
        public string? NEW_SOUS_PORTEFEUILLE_STANDARDISE { get; set; } = string.Empty;
        public string? CARACTERISTIQUE_DU_BESOIN_STANDARDISE { get; set; } = string.Empty;
        public string? CRITICITE_STANDARDISE { get; set; } = string.Empty;
        public decimal? MONTANT_TTC { get; set; } = 0;
        public decimal? DEMANDE_DE_REPORT_IDENTIFIE { get; set; } = 0;
        public decimal? BUDGET_AUTORISE { get; set; } = 0;
        public string? COMMENTAIRES { get; set; } = string.Empty;
        public string? SOUS_SOUS_PORTEFEUILLE { get; set; } = string.Empty;
        public string? FICHIER_SOURCE { get; set; } = string.Empty;
        public string? PRIORITE_BPA { get; set; } = string.Empty;
        public string? PREVISION_ACTUALISEE_VS_SDSI { get; set; } = string.Empty;
        public string? CATEGORIE_SDSI_FORMULE { get; set; } = string.Empty;
        public string? SOUS_CATEGORIE_SDSI_FORMULE { get; set; } = string.Empty;
        public string? MOTIFS_DR_BC { get; set; } = string.Empty;
        public string? COMMENTAIRES_DR_BC { get; set; } = string.Empty;
    }
}
