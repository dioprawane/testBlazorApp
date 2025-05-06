using GestionBudgétaire.Data.Entities.Custom;
using Microsoft.EntityFrameworkCore;

namespace GestionBudgétaire.Data.Services
{
    public class MacroDesignationService
    {
        // Déclarez les champs privés pour le contexte de la base de données et le journaliseur
        private readonly IDbContextFactory<ApplicationDbContext> _contextFactory;
        private readonly ILogger<MacroDesignationService> _logger;

        // Déclarez le constructeur pour initialiser les champs privés
        public MacroDesignationService(IDbContextFactory<ApplicationDbContext> contextFactory, ILogger<MacroDesignationService> logger)
        {
            _contextFactory = contextFactory;
            _logger = logger;
        }

        // Déclarez une méthode pour récupérer tous les dialogues de la base de données
        public async Task<List<MacroDesignation>> GetAllMacroDesignationAsync()
        {
            using var context = _contextFactory.CreateDbContext();
            var macroDesignations = await context.MacroDesignation!.FromSqlRaw("SELECT MIN(DG_CODE) AS Id , MACRO_DESIGNATION As Name FROM dialogue_gestion GROUP BY MACRO_DESIGNATION ORDER BY MACRO_DESIGNATION ASC").ToListAsync();

            _logger.LogInformation($"Loaded {macroDesignations.Count} macroDesignations."); // Loggez le nombre de dialogues chargés
            return macroDesignations;
        }
    }
}
