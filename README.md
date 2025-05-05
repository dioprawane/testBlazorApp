# Gestion Budgétaire

**Gestion Budgétaire** est une application web, un outil, utilisant Blazor et Radzen pour la gestion de collecte, d'outillage et de pillotage budgétaire pluriannuel porté par le département **perfeco** de la DSI, qui auparavant se faisait à travers des fichiers Excel. Elle permet de gérer tout le processus des campagnes et dialogues de gestion via une interface intuitive à une base de données structurée et performante. De plus, elle inclut le maximum de fonctionnalités accessible sur Excel.

## Table des matières
- [Installation](#installation)
- [Structure du projet](#structure-du-projet)
- [Règles d’usage pour la gestion du repos](#règles-dusage-pour-la-gestion-du-repos)


## Installation

### Prérequis

- [Visual Studio Code ``2022``](https://code.visualstudio.com/)
- [.NET 8 SDK : version ``8.0.302``](https://dotnet.microsoft.com/fr-fr/download/dotnet/8.0)
- [Package Microsoft.EntityFrameworkCore : version ``8.0.7``](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore/8.0.0)
- [Package Pomelo.EntityFrameworkCore.MySql : version ``8.0.0``](https://www.nuget.org/packages/Pomelo.EntityFrameworkCore.MySql/8.0.0)
- [Package Radzen.Blazor : version ``4.21.4``](https://www.nuget.org/packages/Radzen.Blazor/4.21.4)
- [MySQL Server](https://dev.mysql.com/downloads/mysql/)

### Configuration
1. Installez MySQL Server en suivant les instructions fournies sur le [site officiel](https://dev.mysql.com/downloads/mysql/).
2. Créez une base de données pour l'application. Vous pouvez le faire via le terminal MySQL :

    ```sql
    CREATE DATABASE dialogue_gestion;
    ```

3. Mettez à jour votre fichier `appsettings.json` pour inclure la chaîne de connexion à votre base de données MySQL :

    ```json
    {
      "Logging": {
        "LogLevel": {
          "Default": "Information",
          "Microsoft.AspNetCore": "Warning"
        }
      },
      "AllowedHosts": "*",
      "ConnectionStrings": {
        "DefaultConnection": "server=nom_du_serveur;database=nom_de_la_base_de_données;user=your_username;password={PASSWORD};"
      }
    }
    ```

4. Créer une variable d'environnement `PASSWORDMYSQL` avec comme valeur le mot de passe de votre utilisateur MySQL.

### Étapes d'installation

1. Clonez le repository :

    ```bash
    git clone https://github.com/akaioda/GestionBudget.git
    cd GestionBudget
    ```

2. Restaurez les packages NuGet :

    ```bash
    dotnet restore
    ```

3. Nettoyez le projet :

    ```bash
    dotnet clean
    ```

4. Reconstruisez le projet :

    ```bash
    dotnet build
    ```

5. Compilez et lancez l'application :

    ```bash
    dotnet watch run
    ```

6. Ouvrez votre navigateur et accédez à `https://localhost:5001` pour voir l'application en action.

---

## Structure du projet

```plaintext
GestionBudget/
├── .config/                     # Fichiers de configuration internes générés par .NET
├── .github/workflows            # Workflows GitHub Actions (CI : Intégration Continue sur les push ou PR et CD : Déploiement Continu pour la mise en prod et le déploiement automatique)
├── bin/                         # Dossier de sortie de build (automatique)
├── obj/                         # Fichiers temporaires de compilation (.NET)
│
├── Components/                  # Composants Blazor réutilisables définis automatiquement lors de la création du projet
│   ├── Layout/                  # Layouts pour structurer les pages
│   ├── Pages/                   # Composants spécifiques des pages de base
│   ├── _Imports.razor           # Importations communes à toutes les pages : usings, injections, etc.
│   ├── App.razor                # Point d’entrée de l’application Blazor : Composant racine Blazor
│   └── Routes.razor             # Définition des routes de l’application
│
├── Data/                        # Couche d'accès aux données et logique métier
│   ├── Contracts/               # Interfaces
│   ├── Entities/                # Modèles de données : Entités utilisées par l'application
│   │   ├── Custom/              # Entités personnalisées pour usage temporaire
│   │   └── Database/            # Entités liées à la base de données
|   ├── Services/                # Services métier, accès aux données ou logique applicative
│   └── ApplicationDbContext.cs  # Contexte de la base de données EF Core, configurant les DbSet<> et la BDD
│
├── Pages/                       # Pages Razor (.razor) principales routables dans l'app
│
├── Properties/
│   └── launchSettings.json      # Paramètres de lancement/démarrage pour les profils pour Visual Studio
│
├── Shared/                      # Composants partagés entre plusieurs pages tels que les Dialogues, les Popup, etc.
│
├── SQLScripts/                  # Scripts SQL pour la base de données, chaque table dans la BDD a un dossier où se trouve les fichiers de création et d'insertion
│
├── wwwroot/                     # # Dossier public pour les fichiers statiques (CSS, JS, images)
│
├── .gitattributes               # Fichier Git (gestion de fin de ligne, formats)
├── .gitignore                   # Fichiers/rep à ignorer par Git
├── appsettings.json             # Configuration globale de l'application (connexions, options)
├── appsettings.Development.json # Configuration spécifique à l'environnement Dev
├── GestionBudgétaire.csproj     # Fichier de projet C# .NET (références, SDK, dépendances)
├── GestionBudgétaire.sln        # Fichier de solution Visual Studio (gère plusieurs projets)
├── Program.cs                   # Point d'entrée de l'application Blazor Server
├── README.md                    # Documentation du projet
```
--- 

## Règles d’usage pour la gestion du repos

Cette partie décrit les règles d’usages pour la gestion du repos. [Références](https://git-scm.com/book/fr/v2/Les-branches-avec-Git-Travailler-avec-les-branches)

### Branches principales

- **`master`** :  
  Branche stable. Elle contient uniquement le code **testé et validé par nous deux**.  
  Chaque merge sur `master` déclenche une livraison sur le serveur IIS.

### Branches de développement

- **`feature/*`** :  
  Pour les développements en cours.  
  Exemples : `feature/login`, `feature/api-auth`, `feature/export-csv`, `feature/authentification-AD`, etc.

- **`bugfix/*`** *(optionnel)* :  
  Pour corriger des bugs identifiés en cours de développement.

- **`hotfix/*`** *(optionnel)* :  
  Pour les corrections urgentes en production (à utiliser plus tard).

### Bonnes pratiques

- Chacun travaille sur une branche dédiée via `git checkout -b nom-clair`.
- Le nom de la branche doit indiquer **clairement le thème ou la fonctionnalité**.
- On organise un **backlog** et on sélectionne les sujets en fonction de notre disponibilité.

### Exemple de branches

- `feature/export-csv`
- `feature/authentification-AD`
- `feature/formulaire-edition-table`
- `feature/composant-login-console`

### Processus de merge

1. Une fois le développement terminé :  
   Créer une **merge request** (MR) sur GitHub pour demander une relecture par l'autre.
   
2. Si le code est validé :  
   - On merge la MR vers `master`.  
   - On supprime la branche `feature/*` correspondante.

3. Si besoin :  
   - On fait un point rapide pour se mettre d’accord ou ajuster le code.

### Livraison

- **Chaque merge sur `master` déclenche une livraison automatique** sur le serveur IIS.
- **Suggestion** : Mettre en place une incrémentation automatique de la version du projet à chaque merge sur `master`.

### Commits

- Préférer **des petits commits réguliers** à de gros livrables.
- Les messages de commit doivent être **clairs et explicites**.

### Illustration
![Vue en silo de branches dans un processus de stabilité progressive](wwwroot/images/lr-branches-2.png)

---

## Documentations
[Github Actions](https://docs.github.com/en/actions/use-cases-and-examples/building-and-testing/building-and-testing-net)

### Pour correction bug MAJ des données, conflit de modification
- [Source 1](https://learn.microsoft.com/fr-fr/ef/core/saving/concurrency?tabs=data-annotations)
- [Source 2](https://learn.microsoft.com/fr-fr/aspnet/core/blazor/components/lifecycle?view=aspnetcore-8.0#state-management-and-rendering)
- [Source 3](https://learn.microsoft.com/fr-fr/dotnet/api/microsoft.entityframeworkcore.changetracking.changetracker.clear?view=efcore-8.0)

### Secure controllers avec AspNetCore.Authorization
- [Source](https://www.radzen.com/blazor-studio/documentation/security/identity/#:~:text=To%20require%20authorized%20access%20you%20need%20to%20decorate,code%20and%20add%20%5BAuthorize%5D%20before%20the%20class%20declaration.)

## Contacts
Pour toute question ou suggestion, n'hésitez pas à nous contacter :
- **Nom** : QUIDORT Joël : **Chef de projet** & DIOP Serigne Rawane : **Développeur**
- **Email** : [serigne-rawane.diop@acoss.fr](mailto:votre.email@example.com)
- **GitHub** : [dioprawane](https://github.com/dioprawane)