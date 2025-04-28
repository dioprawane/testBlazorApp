using GestionBudgétaire.Data;
using GestionBudgétaire.Data.Entities.Database;
using Microsoft.EntityFrameworkCore;

namespace GestionBudgétaire.Data.Services.ToBeRemoved
{
    public class TestService
    {
        private readonly ApplicationDbContext _context;

        public TestService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<Dialogue>> GetDialoguesAsync()
        {
            return await _context.Dialogue!
                .OrderBy(d => d.DG_CODE)
                .Take(50)
                .ToListAsync();
        }

        public async Task<Dialogue?> GetDialogueByIdAsync(int dgcode)
        {
            return await _context.Dialogue!.FirstOrDefaultAsync(d => d.DG_CODE == dgcode);
        }

        public async Task AddDialogueAsync(Dialogue dialogue)
        {
            _context.Dialogue!.Add(dialogue);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateDialogueAsync(Dialogue dialogue)
        {
            _context.Dialogue!.Update(dialogue);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteDialogueAsync(int dgcode)
        {
            var item = await _context.Dialogue!.FindAsync(dgcode);
            if (item != null)
            {
                _context.Dialogue!.Remove(item);
                await _context.SaveChangesAsync();
            }
        }
    }
}
