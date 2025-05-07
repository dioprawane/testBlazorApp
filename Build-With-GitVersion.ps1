# Stop en cas d'erreur
$ErrorActionPreference = "Stop"

Write-Host "🔍 Récupération de la version via GitVersion..."

# Lancer GitVersion et stocker la sortie JSON
$gitVersionJson = dotnet gitversion /output json
if (-not $gitVersionJson) {
    throw "❌ Échec de récupération de la version avec GitVersion."
}

# Convertir le JSON en objet PowerShell
$gitVersion = $gitVersionJson | ConvertFrom-Json

# Extraire la version complète
$version = $gitVersion.FullSemVer
Write-Host "✅ Version GitVersion détectée : $version"

# Chemin vers le .csproj (modifie si nécessaire)
$csprojPath = "GestionBudgétaire.csproj"

# Compilation avec la version récupérée
Write-Host "🛠️ Compilation de $csprojPath avec la version : $version..."
dotnet build $csprojPath --configuration Release /p:Version=$version
