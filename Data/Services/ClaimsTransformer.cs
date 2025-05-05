using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
namespace GestionBudgétaire.Data.Services
{
    // JQ : Cette classe de service permets de gérer les rôles associés au compte
    // de l'utilisateur. Elle permet de greffer au Claims de l'utilisateur identifié
    // les rôle applicatifs. Par exemple Admin, Dev, Budget, Reba etc.
    // Les rôles sont stockés dans une table de la base de données et
    // mappées sur l'entité AppUserRole
    public class CustomClaimsTransformer(ApplicationDbContext dbContext) : IClaimsTransformation
    {
        private readonly ApplicationDbContext _dbContext = dbContext;

        public async Task<ClaimsPrincipal> TransformAsync(ClaimsPrincipal principal)
        {
            var identity = (ClaimsIdentity?)principal.Identity;
            if (identity == null || !identity.IsAuthenticated) return principal;

            var accountName = identity.Name ?? "";

            // JQ : évite les doublons si déjà enrichi
            if (identity.Claims.Any(c => c.Type == ClaimTypes.Role && c.Issuer == "Custom"))
                return principal;

            var roles = await _dbContext.AppUserRoles!
                .Where(r => r.CompteAd == accountName)
                .Select(r => r.Role)
                .ToListAsync();

            foreach (var role in roles)
            {
                identity.AddClaim(new Claim(ClaimTypes.Role, role, ClaimValueTypes.String, "Custom"));
            }
            return principal;
        }
    }
}
