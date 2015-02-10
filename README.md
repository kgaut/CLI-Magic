CLI-Magic
=========

Ensembles de commandes utiles sous GNU/Linux. Rien de révolutionnaire ici, mais c'est un aide mémoire sur certaines commandes que l'on utlise pas forcement tous les jours.

Les pull requests sont évidement les bienvenues, n'hésitez-pas aussi si vous détectez une erreur, une faute d'orthographe, ou si vous avez une explication qui vous semble plus claire.

## Globales
`watch -n x <your command>` | Executer et afficher le résultat d'une commande toutes les x secondes

## Gestion de fichiers
`rename 's/ /_/g' *` | Renommer tous les fichier d'un répertoire en replaçant les espaces par des underscores
`tar cf - * | (cd ../../httpdocs/; tar xvf -)` | Déplacer un dossier et son contenu sans en modifier les droits

## Gestion d'images
`mogrify -resize 150 monimage.jpg` | Redimensionne l'image **monimage.jpg** à 150px de large
`mogrify -resize 150 *.jpg` | Redimensionne toutes les images jpg d'un dossier à 150px de large

## Subversion
`svn log -l 5` | Retourne les 5 dernières lignes d'un log
`svn log -l | grep 'USER'` | Lister l'ensemble des COMMIT par USER
`svn log -l | grep 'USER' -c` | Récuperer le nombre de COMMIT par USER

## Grep
`grep 'mafonction()' --include='\*.php'` | Rechercher les appels de mafonction() uniquement dans les fichiers php
`cat toto.txt | grep 'lorem' -c` | Retourne le nombre de "lorem" dans toto.txt
`grep -c ^ toto.txt` | Retourne le nombre de lignes du fichier toto.txt
`grep access.log | awk -F "\ " {'print $7'}` | Récuperer uri + query string dans fichier de log apache

## Composer
`composer self-update` | Mise à jour composer (à utiliser en tant que super user)
`composer global update` | Mise à jour l'ensemble des paquets gérés par composer
`composer config -g github-oauth.github.com <token>` | ajouter un token oauth de github pour composer pour éviter les limites d'accès API (CF : https://getcomposer.org/doc/articles/troubleshooting.md#api-rate-limit-and-oauth-tokens)

## MySQL
`gunzip < dump.sql.gz | mysql -u root -p ma_db` | dé-zip et importe le dump **dump.sql.gz** dans la base **ma_db**
