# Script de backup incrémental d'un serveur

## tl;dr
Vous trouverez ici un script de sauvegardes incrémentales d'un serveur via SSH utilisant des *hard links* fonctionnant avec un fichier de configuration.

## Principe
Un script, autant de fichiers de configuration que de dossiers à sauvegarder.
Les fichiers *\*.cfg* contiennent la configuration de la sauvegarde d'un dossier d'un serveur distant.

Le fichier d'exemple fournis va se connecter en SSH via le port *22* au serveur *monserveur.net* et va sauvegarder le dossier */home* dans le répertoire local */backup/monserveur/home*.

Il concervera 7 versions des données (si on fait un backup par jours alors il y'aura 7 jours de backups). Chaque fichier, si non modifié sera un *hard link* vers le fichier de la **révision** précédente, afin d'économiser de l'espace.

L'architecture sera la suivante : 
```
/backup/monserveur/home
  backup.0 #Backup le plus récent
  backup.1 #Backup de la "veille*
...
  backup.7 #Backup le plus ancien*
```

## Utilisation
`./backup-incremental.sh monserveur.cfg`

