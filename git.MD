GIT
=========


## Authentification
|Commande|Résultat|
|------- | -------|
|`git config credential.helper store`|Si accès en HTTP, cette commande va enregistrer les identifiants tapés lors de la session dans le fichier ~/.git-credentials [Plus d'infos](https://git-scm.com/docs/git-credential-store)|


## Ignorer les modification d'un fichier
Afin d'éviter de commiter un fichier de config que l'on a modifié pour son environement
**Note :** Le mieux restant de passer par un fichier de configuration

|Commande|Résultat|
|------- | -------|
|`git update-index --assume-unchanged path/to/file.txt`|Enlève le fichier spécifié des fichiers modifiés lors d'un `git status`|
|`git update-index --no-assume-unchanged path/to/file.txt`|Ajoute le fichier spécifié aux fichiers modifiés lors d'un `git status`|

## Commits
|Commande|Résultat|
|------- | -------|
|`git add mofichier.php` | ajout d'un fichier pour le futur commit|
|`git add mofichier.php --patch` | ajout partiel du contenu d'un fichier pour le futur commit|
|`git commit -m "Message de commit"` | Commit des fichiers "ajoutés" préalablement|
|`git commit -a -m "Message de commit"` | Commit de tous les fichiers qui ont étés déjà versionnés|
|`git push` | diffusion des commits encore non envoyés |

## Cherry pick

Afin d'appliquer sur la branche courante un ou plusieurs commits qui viennent d'une autre branche sans avoir à la merger

|Commande|Résultat|
|------- | -------|
|`git cherry-pick COMMIT_ID` | ajoute le commit désigné|
|`git cherry-pick COMMIT_ID1..COMMIT_ID1` | ajoute l'ensemble de commit de COMMIT\_ID1 à COMMIT\_ID2 (COMMIT\_ID1 devant être le plus vieux|

## Revert

|Commande|Résultat|
|------- | -------|
|`git revert <commit_id>` | Annuler le commit dont l'identifiant est <commit_id>|

## Logs

|Commande|Résultat|
|------- | -------|
|`git log -n 5` | Obtenir le listing des 5 derniers commits locaux|
|`git log origin/master -n 5` | Obtenir le listing des 5 derniers commits de la branche master distante|

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
|`git push origin --delete NomBranche` | suppression distante de la branche|
|`git push origin :NomBranche` | Idem ci-dessus : suppression distante de la branche|
|`git branch -m AncienNom NouveauNom` | Renommer la branche locale **AncienNom** en **NouveauNom**|
|`git branch -m NouveauNom` | Renommer la branche locale courante **NouveauNom**|

## Tags
[Git Basics - Tagging](http://git-scm.com/book/en/v2/Git-Basics-Tagging)

|Commande|Résultat|
|------- | -------|
|`git tag -a 7.x-1.0 -m "tagging version 1"` | Création d'un tag localement anoté|
|`git push origin 7.x-1.0` | Diffusion de ce tag|
|`git tag -d 7.x-1.0` | Suppression locale d'un tag|
|`git push origin --delete 7.x-1.0` | Suppression distante du tag|
|`git push origin :7.x-1.0` | Idem ci-dessus : suppression distante du tag|

## Archives différentielles

|Commande|Résultat|
|------- | -------|
| `git archive --output=../monarchive.tar.gz --verbose branche1 $(git diff --cached --name-only master)`| Création d'une archive .tar.gz des modifications entre la branche **branche1** et le **master **, ces deux éléments pouvant être remplacés par des tags, des id de commit...|

## Submodules
[Quelques infos sur les submodules](http://stackoverflow.com/questions/1777854/git-submodules-specify-a-branch-tag)

|Commande|Résultat|
|------- | -------|
|`git submodule add git@server:repo lib/dossier`|Ajoute un sous-module dans le dossier **lib/dossier**, (qui ne doit pas exister|
|`git submodule init`|Initialise les submodules du repo que l'on vient de cloner|
|`git submodule update`|Update ("Pull") des submodules|


## God Save Me ! 

Vous avez foutu la merde ? Voici comment vous en sortir...

|Commande|Résultat|
|------- | -------|
|`git reset --hard HEAD`|Annuler toutes les modifications et retourner à la dernière version "commitée"|
|`git reset --hard origin/dev`|Annuler toutes les modifications et retourner à la dernière version de la branche **dev** sur la remote **origin**|

## Links
[2015-03-19 - 8 Tips to help you work better with Git](https://about.gitlab.com/2015/02/19/8-tips-to-help-you-work-better-with-git/)
