using GestionBudgétaire.Components;
// JQ : pour Introduction du SSO windows
// il faut ajouter Microsoft.AspNetCore.Authentication.Negotiate via nuget
using Microsoft.AspNetCore.Authentication.Negotiate;
using Radzen;

namespace GestionBudgétaire
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // JQ : Ajout de l'authentification Windows (Negotiate)
            builder.Services.AddAuthentication(NegotiateDefaults.AuthenticationScheme)
                .AddNegotiate();
            builder.Services.AddAuthorization(options =>
            {
                //  JQ : Toutes les pages exigent une authentification par défaut
                options.FallbackPolicy = options.DefaultPolicy;
            });
            //  JQ : Nécessaire pour le composant de revalidation du password AD
            builder.Services.AddHttpContextAccessor();

            // JQ : ajout pour l'utilisation de RadZen
            builder.Services.AddRadzenComponents();

            // Add services to the container.
            builder.Services.AddRazorComponents()
                .AddInteractiveServerComponents();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            // JQ : Activation de l'authentification et de l'autorisation
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseStaticFiles();
            app.UseAntiforgery();

            app.MapRazorComponents<App>()
                .AddInteractiveServerRenderMode();

            app.Run();
        }
    }
}
