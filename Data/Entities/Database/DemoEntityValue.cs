using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


// JQ : entité destinée à la gestion des droits dans l'application
// un DbSet correpondant est déclaré dans ApplicationDbContext

namespace GestionBudgétaire.Data.Entities.Database
{
    [Table("DemoEntityValues")]
    public class DemoEntityValue
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string? Name { get; set; }

        [Required]  
        public bool IsActive { get; set; } = true;

        [Required]
        public DateTime CreatedDate { get; set; }

        [Required]
        [Column(TypeName = "decimal(10,2)")]
        public decimal Amount { get; set; }

        public double? Score { get; set; }

        public Guid? ExternalId { get; set; }

        public string? Description { get; set; }
    }
}

