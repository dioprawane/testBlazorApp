using GestionBudgétaire.Components;
using GestionBudgétaire.Data;
using GestionBudgétaire.Data.Services;
using GestionBudgétaire.Data.Services.ToBeRemoved;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Radzen;
using Serilog;
using Serilog.Events;

namespace GestionBudgétaire
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Configuration de Serilog
            Log.Logger = new LoggerConfiguration()
                // Définir le niveau de log minimum pour tout le système à Debug
                .MinimumLevel.Debug()
                // Surcharger le niveau de log minimum pour les logs provenant de l'espace de noms "Microsoft" à Information
                .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
                // Enrichir les logs avec le contexte de la log
                .Enrich.FromLogContext()
                // Ajouter une destination de log (sink) pour la console
                .WriteTo.Console()
                // Ajouter une destination de log (sink) pour un fichier
                // Les logs seront écrits dans des fichiers sous le dossier "logs" avec un nom de fichier "log-[date].txt"
                // Les fichiers de log seront segmentés quotidiennement (rollingInterval: RollingInterval.Day)
                .WriteTo.File("logs/log-.txt", rollingInterval: RollingInterval.Day)
                // Créer l'instance de logger configurée
                .CreateLogger();

            // JQ : Ajout de l'authentification Windows (Negotiate) A supprimer dans le cas ou on utilise l'authentification Windows sur IIS
            //builder.Services.AddAuthentication(NegotiateDefaults.AuthenticationScheme)
            //    .AddNegotiate();
            builder.Services.AddAuthorization(options =>
            {
                //  JQ : Toutes les pages exigent une authentification par défaut
                options.FallbackPolicy = options.DefaultPolicy;
            });
            //  JQ : Nécessaire pour le composant de revalidation du password AD
            builder.Services.AddHttpContextAccessor();

            //  JQ : Service permettant d'ajouter les rôle applicatis au Claims de l'utilisateur Windows
            builder.Services.AddScoped<IClaimsTransformation, CustomClaimsTransformer>();

            // JQ : ajout pour l'utilisation de RadZen
            builder.Services.AddRadzenComponents();

            // Add services to the container.
            builder.Services.AddRazorComponents()
                .AddInteractiveServerComponents();
            //builder.Services.AddRadzenComponents();

            // Gestion de la base de donn�es
            string? connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
            string dbPassword = Environment.GetEnvironmentVariable("PASSWORDMYSQL") ?? "default_password";
            Console.WriteLine("Mot de passe DB récupéré: " + dbPassword);
            if (connectionString != null)
            {
                connectionString = connectionString.Replace("{PASSWORD}", dbPassword);
            }
            else
            {
                throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
            }

            builder.Services.AddDbContextFactory<ApplicationDbContext>(options =>
                options.UseMySql(connectionString + ";AllowZeroDateTime=True;ConvertZeroDateTime=True", // Les 2 derniers param pour accepter des dates "0000-00-00"
                new MySqlServerVersion(new Version(8, 0, 21))));

            builder.Services.AddScoped<TestService>(); // Service de Test

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.UseStaticFiles();
            app.UseAntiforgery();

            app.MapRazorComponents<App>()
                .AddInteractiveServerRenderMode();

            try
            {
                // Exécution/Lancement de l'application web
                app.Run();
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "L'application a rencontré une erreur critique");
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }
    }
}
