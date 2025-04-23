# Règles d’usage pour la gestion du dépôt

Ce document décrit les règles d’usages pour la gestion du repos.

## Branches principales

- **`master`** :  
  Branche stable. Elle contient uniquement le code **testé et validé par nous deux**.  
  Chaque merge sur `master` déclenche une livraison sur le serveur IIS.

## Branches de développement

- **`feature/*`** :  
  Pour les développements en cours.  
  Exemples : `feature/login`, `feature/api-auth`, `feature/export-csv`, `feature/authentification-AD`, etc.

- **`bugfix/*`** *(optionnel)* :  
  Pour corriger des bugs identifiés en cours de développement.

- **`hotfix/*`** *(optionnel)* :  
  Pour les corrections urgentes en production (à utiliser plus tard).

## Bonnes pratiques

- Chacun travaille sur une branche dédiée via `git checkout -b feature/nom-clair`.
- Le nom de la branche doit indiquer **clairement le thème ou la fonctionnalité**.
- On organise un **backlog** et on sélectionne les sujets en fonction de notre disponibilité.

## Exemple de branches

- `feature/export-csv`
- `feature/authentification-AD`
- `feature/formulaire-edition-table`
- `feature/composant-login-console`

## Processus de merge

1. Une fois le développement terminé :  
   Créer une **merge request** (MR) sur GitHub pour demander une relecture par l'autre.
   
2. Si le code est validé :  
   - On merge la MR vers `master`.  
   - On supprime la branche `feature/*` correspondante.

3. Si besoin :  
   - On fait un point rapide pour se mettre d’accord ou ajuster le code.

## Livraison

- **Chaque merge sur `master` déclenche une livraison automatique** sur le serveur IIS.
- **Suggestion** : Mettre en place une incrémentation automatique de la version du projet à chaque merge sur `master`.

## Commits

- Préférer **des petits commits réguliers** à de gros livrables.
- Les messages de commit doivent être **clairs et explicites**.

---
