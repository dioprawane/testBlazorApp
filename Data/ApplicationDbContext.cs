using GestionBudgétaire.Data.Entities;
using GestionBudgétaire.Data.Entities.Database;
using Microsoft.EntityFrameworkCore;

namespace GestionBudgétaire.Data
{
    public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
    {
        // Propriété DbSet<Dialogue> representant la table Dialogue dans la base de données
        // Cette propriété permet de faire des requêtes et des opérations CRUD sur la table Dialogue
        public DbSet<Dialogue>? Dialogue { get; set; }

       //DbSet d'accès à la table des rôles applicatifs
       public DbSet<AppUserRole> AppUserRoles { get; set; }
       public DbSet<DemoEntityValue> DemoEntityValues { get; set; }
    }
}
