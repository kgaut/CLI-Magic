GIT
=========
## Commits

|Commande|Résultat|
|------- | -------|
|`git add mofichier.php` | ajout d'un fichier pour le futur commit|
|`git commit -m "Message de commit"` | Commit des fichiers "ajoutés" préalablement|
|`git commit -a -m "Message de commit"` | Commit de tous les fichiers qui ont étés déjà versionnés|
|`git push` | diffusion des commmits non envoyés encore|

## Revert

|Commande|Résultat|
|------- | -------|
|`git revert <commit_id>` | Annuler le commit dont l'identifiant est <commit_id>|


## Branches
[Branches in a Nutshell](http://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) 

[Basic Branching and Merging](http://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)

|Commande|Résultat|
|------- | -------|
|`git branch -a` | Listing des branches|
|`git checkout -b NomBranche` | Création d'une branche locale **NomBranche** et déplacement vers la nouvelle branche|
|`git push origin NomBranche` | Diffusion de la branche vers le serveur distant|
|`git checkout master && git merge NomBranche` | déplacement dans le master et merge de la branche **NomBranche**|
|`git branch -d NomBranche` | suppresion locale de ma branche **NomBranche**|
|`git push --delete NomBranche` | suppression distante de la branche|
|`git push origin :NomBranche` | Idem ci-dessus : suppression distante de la branche|
|`git branch -m AncienNom NouveauNom` | Renommer la branche locale **AncienNom** en **NouveauNom**|
|`git branch -m NouveauNom` | Renommer la branche locale courante **NouveauNom**|

## Tags
[Git Basics - Tagging](http://git-scm.com/book/en/v2/Git-Basics-Tagging)

|Commande|Résultat|
|------- | -------|
|`git tag -a 7.x-1.0 -m "tagging version 1"` | Création d'un tag localement anoté|
|`git push origin 7.x-1.0` | Diffusion de ce tag|
|`git tag -d 7.x-1.0` | suppression locale d'un tag|
|`git push --delete 7.x-1.0` | suppression distante du tag|
|`git push origin :7.x-1.0` | Idem ci-dessus : suppression distante du tag|

## Submodules

|Commande|Résultat|
|------- | -------|
|`git submodule add git@server:repo lib/dossier`|ajoute un sous-module dans le dossier **lib/dossier**, (qui ne doit pas exister|


## God Save Me ! 

Vous avez foutu la merde ? Voici comment vous en sortir...

|Commande|Résultat|
|------- | -------|
|`git reset --hard HEAD`|Annuler toutes les modifications et retourner à la dernière version "commitée"|

## Links
[2015-03-19 - 8 Tips to help you work better with Git](https://about.gitlab.com/2015/02/19/8-tips-to-help-you-work-better-with-git/)
