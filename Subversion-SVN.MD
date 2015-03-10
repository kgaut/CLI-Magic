Subversion - SVN
=========
Parce qu'il n'y a pas que GIT dans la vie...

## Divers

**Contexte : à la racine d'une copie locale d'un dépot**

|Commande|Résultat|
|------- | -------|
|`svn log -l 5`|Obtenir des infos sur les 5 derniers commits|
|`svn log -v -r 234`|Informations détaillés sur un commit en particulier|



## Branches

**Contexte : à la racine d'une copie locale d'un dépot**

|Commande|Résultat|
|------- | -------|
|`svn copy http://SERVEUR/DEPOT/trunk http://SERVEUR/DEPOT/branches/NomBranche -m "Creation de la branche NomBranche"` | Creation d'une nouvelle branche |
|`svn switch http://SERVEUR/DEPOT/branches/NomBranche`|changer vers la branche **NomBranche** (version courte)|
|`svn switch ^/branches/NomBranche`|changer vers la branche **NomBranche** (version courte)|
|`svn switch http://SERVEUR/DEPOT/trunk`|Retourner sur le trunk|
|`svn switch ^/trunk`|Retourner sur le trunk (version courte)|

