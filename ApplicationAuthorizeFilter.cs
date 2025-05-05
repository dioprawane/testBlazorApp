using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Authorization;

namespace GestionBudgétaire.Filters
{
    /// <summary>
    /// Filtre global : refuse l’accès à toute route sauf /Account/* et /Login
    /// si l’utilisateur n’est pas authentifié.
    /// </summary>
    public class ApplicationAuthorizeFilter : AuthorizeFilter
    {
        public ApplicationAuthorizeFilter(AuthorizationPolicy policy) : base(policy)
        {
        }

        public override Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {
            // La page de connexion et les endpoints Account restent accessibles
            var path = context.HttpContext.Request.Path;
            if (path.StartsWithSegments("/Account") || path.StartsWithSegments("/Login"))
            {
                return Task.CompletedTask;
            }

            return base.OnAuthorizationAsync(context);
        }
    }
}
