using GestionBudgétaire.Components;
using GestionBudgétaire.Data;
using GestionBudgétaire.Data.Services;
using GestionBudgétaire.Data.Services.ToBeRemoved;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Server;
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

            // RD : Crée le dossier logs si nécessaire
            var logDirectory = Path.Combine(builder.Environment.ContentRootPath, "logs");
            Directory.CreateDirectory(logDirectory);

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
                // shared: true, permet à plusieurs processus ou threads de partager l'accès au fichier de log sans le verrouiller exclusivement.
                .WriteTo.File(
                    Path.Combine(logDirectory, "log-.txt"),
                    rollingInterval: RollingInterval.Day, 
                    shared: true)
                // Créer l'instance de logger configurée
                .CreateLogger();

            // branche ASP-NET Core sur Serilog (extension du package Serilog.AspNetCore) pour bien avoir les fichiers de logs
            builder.Host.UseSerilog();

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

            // RD : // Permet d'utiliser AuthorizeView
            builder.Services.AddAuthorizationCore();

            // Add services to the container.
            builder.Services.AddRazorComponents()
                .AddInteractiveServerComponents();
            //builder.Services.AddRadzenComponents();

            // RD : Gestion de la base de donnees
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


            builder.Services.AddScoped(typeof(GenericDataService<>)); // JQ : Service généric d'accès aux entités

            builder.Services.AddScoped<Radzen.DialogService>();
            builder.Services.AddScoped<Radzen.NotificationService>();

            // RD : Service de Test
            builder.Services.AddScoped<TestService>();

            // RD : Service de Dialogue et MacroDesignation
            builder.Services.AddScoped<DialogueService>();
            builder.Services.AddScoped<MacroDesignationService>();

            // RD : Activer l'affichage des erreurs détaillées
            builder.Services.Configure<CircuitOptions>(options =>
            {
                options.DetailedErrors = true;
            });

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

            // RD : Exécution/Lancement de l'application web
            //app.Run();
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
