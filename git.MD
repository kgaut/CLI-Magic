GIT
=========
## Commits

|Commande|Résultat|
|------- | -------|
|`git add mofichier.php` | ajout d'un fichier pour le futur commit|
|`git commit -m "Message de commit"` | Commit des fichiers "ajoutés" préalablement|
|`git commit -a -m "Message de commit"` | Commit de tous les fichiers qui ont étés déjà versionnés|
|`git push` | diffusion des commmits non envoyés encore|

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

## Tags
[Git Basics - Tagging](http://git-scm.com/book/en/v2/Git-Basics-Tagging)

|Commande|Résultat|
|------- | -------|
|`git tag -a 7.x-1.0 -m "tagging version 1"` | Création d'un tag localement anoté|
|`git push origin 7.x-1.0` | Diffusion de ce tag|
|`git tag -d 7.x-1.0` | suppression locale d'un tag|
|`git push --delete 7.x-1.0` | suppression distante du tag|
