CLI-Magic
=========

Ensembles de commandes utiles sous GNU/Linux. Rien de révolutionnaire ici, mais c'est un aide mémoire sur certaines commandes que l'on utlise pas forcement tous les jours.

Les pull requests sont évidement les bienvenues, n'hésitez-pas aussi si vous détectez une erreur, une faute d'orthographe, ou si vous avez une explication qui vous semble plus claire.

Un peu de réorganisation est prévue pour les mois qui viennent.

## Globales
|Commande|Résultat|
|------- | -------|
|`watch -n x <your command>` | Executer et afficher le résultat d'une commande toutes les x secondes|

## Archives
|Commande|Résultat|
|------- | -------|
|`tar -zcvf archive.tar.gz DOSSIER/`|Création d'une archive tar.gz contenant le dossier **DOSSIER**|

## Fichiers
|Commande|Résultat|
|------- | -------|
|`du -h`| Afficher le poids du dossier courant, et affiche le poids de chacun des fichiers|
|`du -h --max-depth=1 ./`| Afficher le poids du dossier courant et de chacun des dossier de niveau 1|
|`du -h --max-depth=1 ./ | sort -h`| Afficher le poids du dossier courant et de chacun des dossier de niveau 1, en les triant par poids|
|`find -mtime -2`|Trouver l'ensemble des fichiers modifiés au cours des 2 derniers jours|
|`rename 's/ /_/g' *` | Renommer tous les fichier d'un répertoire en replaçant les espaces par des underscores|
|`tar cf - * | (cd ../../httpdocs/; tar xvf -)` | Déplacer un dossier et son contenu sans en modifier les droits|
|` scp -P 1374 fichier.tar root@server.net:/home/test`| Envoyer le fichier **fichier.tar** vers le serveur **server.net** en utilisant le port ssh 1374 |
|`for f in *; do mv "$f" "$f.jpg"; done`| ajouter une extension **.jpg** à tous les fichiers du dossier|
|`ncdu`|permet de visualiser l'usage disque dans un dossier (necessite l'installation du package *ncdu*)|

## Wget
|Commande|Résultat|
|------- | -------|
|`get -nd -H -p -A jpg,jpeg,png,gif -e robots=off http://monsite.com/mapage` | Récupère toutes les images de la page http://monsite.com/mapage|

## Transfert de fichiers (SCP)
|Commande|Résultat|
|------- | -------|
|`scp USER@SERVER:/home/user/fichier.tar .`| Télécharge le fichier **/home/user/fichier.tar** depuis un server distant dans le dossier courant (en utilisant le port ssh standard (22)|
|`scp -P 1234 USER@SERVER:/home/user/fichier.tar .`| Télécharge le fichier **/home/user/fichier.tar** depuis un server distant  dans le dossier courant  en se connectant via un port SSH spécifique|
|`scp fichier.tar USER@server.net:/home/test`| Envoie le fichier **fichier.tar** vers le serveur **server.net** en utilisant le port ssh standard (22) |
|`scp -P 1374 fichier.tar root@server.net:/home/test`| Envoie le fichier **fichier.tar** vers le serveur **server.net** en utilisant le port ssh 1374 |
|`scp -r mondossier USER@server.net:/home/test`| Envoie le dossier **mondossier** vers le serveur **server.net** en utilisant le port ssh standard (22) |

## Grep
|Commande|Résultat|
|------- | -------|
|`grep 'mafonction()' --include='\*.php'` | Rechercher les appels de mafonction() uniquement dans les fichiers php|
|`cat toto.txt | grep 'lorem' -c` | Retourne le nombre de "lorem" dans toto.txt|
|`grep -c ^ toto.txt` | Retourne le nombre de lignes du fichier toto.txt|
|`grep access.log | awk -F "\ " {'print $7'}` | Récuperer uri + query string dans fichier de log apache|

## Crontab 
```
 +---------------- minute (0 - 59)
 |  +------------- hour (0 - 23)
 |  |  +---------- day of month (1 - 31)
 |  |  |  +------- month (1 - 12)
 |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
 |  |  |  |  |
 *  *  *  *  *  command to be executed 
```

## Images
|Commande|Résultat|
|------- | -------|
|`mogrify -resize 150 monimage.jpg` | Redimensionne l'image **monimage.jpg** à 150px de large|
|`mogrify -resize 150 *.jpg` | Redimensionne toutes les images jpg d'un dossier à 150px de large|

## MySQL
|Commande|Résultat|
|------- | -------|
|`mysql -u USER -h localhost -p DB > DUMP.SQL` | Dump la base **DB** du serveur **localhost** dans le fichier **DUMP.SQL** si l'utilisateur mysql **root** a un mot de passe|
|`mysql -u USER -h localhost DB > DUMP.SQL` | Dump la base **DB** du serveur **localhost** dans le fichier **DUMP.SQL** si l'utilisateur mysql **root** n'a pas de mot de passe|
|`mysql -u USER -h localhost -p DB < DUMP.SQL` | Importe de dump **DUMP.SQL** dans la base **DB** du serveur **localhost** si l'utilisateur mysql **root** a un mot de passe|
|`mysql -u USER -h localhost DB < DUMP.SQL` | Importe de dump **DUMP.SQL** dans la base **DB** du serveur **localhost** si l'utilisateur mysql **root**  n'a pas de mot de passe|
|`zcat DUMP.sql.gz | mysql -u USER -p DB` |Importe de dump gzipé **DUMP.sql.gz** dans la base **DB** du serveur **localhost** si l'utilisateur mysql **root** a un mot de passe|
|`zcat DUMP.sql.gz | mysql -u USER DB` |Importe de dump gzipé **DUMP.sql.gz** dans la base **DB** du serveur **localhost** si l'utilisateur mysql **root** n'a pas de mot de passe|

## Utilisateurs
|Commande|Résultat|
|------- | -------|
|`adduser login` | Créé l'utilisateur **login** de manière interactive|
|`usermod -a -G www-data login`|Ajoute l'utilisateur *existant* **login** au groupe **www-data**|
|`userdel login`|Supprime l'utilisateur **login**|
|`userdel -r login`|Supprime l'utilisateur **login** et son dossier home|

## Subversion
|Commande|Résultat|
|------- | -------|
|`svn log -l 5` | Retourne les 5 dernières lignes d'un log|
|`svn log -l | grep 'USER'` | Lister l'ensemble des COMMIT par USER|
|`svn log -l | grep 'USER' -c` | Récuperer le nombre de COMMIT par USER|
