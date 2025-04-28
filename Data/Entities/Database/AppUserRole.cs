using System.ComponentModel.DataAnnotations;

namespace GestionBudgétaire.Data.Entities.Database
{
    // JQ : entité destinée à la gestion des droits dans l'application
    // un DbSet correpondant est déclaré dans ApplicationDbContext
    public class AppUserRole
    {
        [Key]
        public int Id { get; set; }
        public string CompteAd { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
    }
}
