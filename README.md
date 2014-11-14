CLI-Magic
=========

Ensembles de commandes utiles sous GNU/Linux
## Gestion de fichiers
 - rename 's/ /_/g' * => Renommer tous les fichier d'un répertoire en replaçant les espaces par des underscores
 - tar cf - * | (cd ../../httpdocs/; tar xvf -) => Déplacer un dossier et son contenu sans en modifier les droits

## Subversion
 - svn log -l 5 **=>** Retourne les 5 dernières lignes d'un log
 - svn log -l | grep 'USER' **=>** Lister l'ensemble des COMMIT par USER
 - svn log -l | grep 'USER' -c **=>** Récuperer le nombre de COMMIT par USER

## grep
 - grep 'mafonction()' --include='\*.php' **=>** Rechercher les appels de mafonction() uniquement dans les fichiers php
 - cat toto.txt | grep 'lorem' -c **=>** Retourne le nombre de "lorem" dans toto.txt
 - grep -c ^ toto.txt **=>** Retourne le nombre de lignes du fichier toto.txt

