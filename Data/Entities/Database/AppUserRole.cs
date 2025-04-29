using System.ComponentModel.DataAnnotations;
namespace GestionBudgétaire.Data.Entities.Database
{
    // JQ : entité destinée à la gestion des droits dans l'application
    // un DbSet correpondant est déclaré dans ApplicationDbContext
    public class AppUserRole : IHasRowVersion
    {
        [Key]
        public int Id { get; set; }
        public string CompteAd { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;

        [Timestamp]
        public byte[] RowVersion { get; set; } = Array.Empty<byte>();
    }
}
