# Script de backup incrémental d'un serveur

## tl;dr
Vous trouverez ici un script de sauvegardes incrémentales d'un serveur via SSH utilisant des *hard links* fonctionnant avec un fichier de configuration.

## Principe
Un script, autant de fichiers de configuration que de dossiers à sauvegarder.
Les fichiers *\*.cfg* contiennent la configuration de la sauvegarde d'un dossier d'un serveur distant.

Le fichier d'exemple fournis va se connecter en SSH via le port *22* au serveur *monserveur.net* et va sauvegarder le dossier */home* dans le répertoire local */backup/monserveur/home*.

Il conservera 7 versions des données (si 1 backup/jour alors : 7 jours de backups conservés). 

Chaque fichier, si non modifié, sera un *hard link* vers le fichier de la **révision** précédente, afin d'économiser de l'espace.

L'architecture sera la suivante : 
```
/backup/monserveur/home
  backup.0 #Backup le plus récent
  backup.1 #Backup de la "veille*
...
  backup.7 #Backup le plus ancien*
```
Regardez le fichier *monserveur.cfg* pour voir les différentes options configurables.

Dans le fichier *backup-incremental.sh* deux choses sont configurables au début du fichier :

```bash
# Dossier qui contient les fichiers de configuration
CONFIG_PATH="/volume1/backup/scripts/config/"
# Dossier qui contient les fichiers d'exclusion (utilisé si existant avec --exclude-from=)
EXCLUDE_PATH="/volume1/backup/scripts/excludes/"
```

## Utilisation
`./backup-incremental.sh CHEMIN_FICHIER_CONFIGURATION.cfg`

ex : 
`./backup-incremental.sh /backup/scripts/config/monserveur.cfg`

Si vous avez définis la variable *CONFIG_PATH* alors vous pouvez mettre uniquement le nom du fichier de configuration, s'il se trouve à l'intérieur du dossier : 
`./backup-incremental.sh monserveur.cfg`

