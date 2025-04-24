using GestionBudgétaire.Data.Entities.Database;
using Microsoft.EntityFrameworkCore;

namespace GestionBudgétaire.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // Propriete DbSet<Dialogue> representant la table Dialogue dans la base de donn�es
        // Cette propri�t� permet de faire des requ�tes et des op�rations CRUD sur la table Dialogue
        public DbSet<Dialogue>? Dialogue { get; set; }

    }
}
