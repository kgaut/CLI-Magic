 # Cron
 ## Modifier un crontab
 
 ```crontab -e ```
 
 
## Recevoir les résultats par email 
Ajouter tout en haut du fichier 
```
 MAILTO=moi@email.com
```
Sera envoyé à cette adresse le résultat des commandes executés.
  
## Syntaxe
```
 +---------------- minute (0 - 59)
 |  +------------- hour (0 - 23)
 |  |  +---------- day of month (1 - 31)
 |  |  |  +------- month (1 - 12)
 |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
 |  |  |  |  |
 *  *  *  *  *  command to be executed 
``````


## Exemples Crontask

### Tous les jours à 4H15
```
15      4       *       *       *       monscript.sh
```

### Tous les dimanches à 23H50
```
50      23      *       *       0       monscript.sh
```

### Toutes les heures à 10
executé à 1H10, 2H10, 3h10...
```
10      *       *       *       *       monscript.sh
```

### Toutes les 10 minutes
executé à 1H00, 1H10, 1H20, 1h30...
```
*/10    *       *       *       *       monscript.sh
```
