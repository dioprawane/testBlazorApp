using GestionBudgétaire.Data.Entities;
using Microsoft.EntityFrameworkCore;
using System.Data;

// JQ : Dataservice en lien avec l'edition générique des table, permet d'implémenter les fonction CRUD

namespace GestionBudgétaire.Data.Services
{
    public class GenericDataService<TEntity> where TEntity : class
    {
        private readonly ApplicationDbContext _context;
        private readonly DbSet<TEntity> _dbSet;

        public GenericDataService(ApplicationDbContext context)
        {
            _context = context;
            _dbSet = _context.Set<TEntity>();
        }

        public async Task<List<TEntity>> GetAllAsync()
        {
            return await _dbSet.ToListAsync();
        }

        public async Task AddAsync(TEntity entity)
        {
            _dbSet.Add(entity);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(TEntity entity)
        {
            /* RD : Détache toutes les entités suivies : sans cette ligne, erreur d'instance avec la même clé pour la méthode : RefreshDataAsync()
            EF Core détache toutes les entités suivies par ce DbContext; il ne reste alors qu’une seule instance pour la clé primaire.
            */
            _context.ChangeTracker.Clear();

            _context.Entry(entity).State = EntityState.Modified;
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex) when (entity is IHasRowVersion)
            {
                throw new ConcurrencyException("La donnée a été modifiée par un autre utilisateur.", ex);
            }
        }

        public async Task DeleteAsync(TEntity entity)
        {
            _dbSet.Remove(entity);
            await _context.SaveChangesAsync();
            
        }

        public async Task<TEntity?> GetByIdAsync(object id)
        {
            return await _dbSet.FindAsync(id);
        }
    }
    public class ConcurrencyException(string message, Exception innerException) : Exception(message, innerException)
    {
    }
}

