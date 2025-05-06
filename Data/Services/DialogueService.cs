using GestionBudgétaire.Data.Entities.Database;
using Microsoft.EntityFrameworkCore;

namespace GestionBudgétaire.Data.Services
{
    public class DialogueService
    {
        // Déclarez les champs privés pour le contexte de la base de données et le journaliseur
        private readonly IDbContextFactory<ApplicationDbContext> _contextFactory;
        private readonly ILogger<DialogueService> _logger;

        // Déclarez le constructeur pour initialiser les champs privés
        public DialogueService(IDbContextFactory<ApplicationDbContext> contextFactory, ILogger<DialogueService> logger)
        {
            _contextFactory = contextFactory;
            _logger = logger;
        }

        // Déclarez une méthode pour récupérer tous les dialogues de la base de données
        public async Task<List<Dialogue>> GetTopDialoguesAsync(int limit)
        {
            try
            {
                using var context = _contextFactory.CreateDbContext();
                //var dialogues = await context.Dialogue.Take(limit).ToListAsync();
                var dialogues = await (context.Dialogue ?? Enumerable.Empty<Dialogue>().AsQueryable()).Take(limit).ToListAsync();
                _logger.LogInformation($"Loaded {dialogues.Count} dialogues.");
                return dialogues;
            }
            catch (Exception ex)
            {
                _logger.LogError($"An error occurred while loading dialogues: {ex.Message}");
                return new List<Dialogue>();
            }
        }

        // Déclarez une méthode pour récupérer tous les dialogues de la base de données avec filtrage
        public async Task<int> GetTotalDialoguesCountAsync(string filter)
        {
            using var context = _contextFactory.CreateDbContext();
            //var query = context.Dialogue.AsQueryable();
            var query = context.Dialogue ?? Enumerable.Empty<Dialogue>().AsQueryable();

            // Appliquer le filtrage si un texte de filtre est fourni
            if (!string.IsNullOrWhiteSpace(filter))
            {
                query = query.Where(d =>
                                    d.DG_CODE!.ToString().Contains(filter)
                                 || d.MACRO_DESIGNATION!.Contains(filter)
                                 || d.COMMENTAIRES!.Contains(filter)
                                 || d.ANNEE!.ToString()!.Contains(filter)
                                 || d.SERIES_DE_DONNEES!.Contains(filter));
            }

            // Renvoie le nombre total d'éléments
            return await query.CountAsync();
        }

    }
}
