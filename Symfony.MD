Symfony
=========

Commandes de l'utilitaire Symfony Console

## Installation
```bash
curl -LsS http://symfony.com/installer > symfony.phar
sudo mv symfony.phar /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony
```

## Création d'un nouveau projet
|Commande|Résultat|
|------- | -------|
|`symfony new myproject`|Crée un nouveau projet symfony dans le dossier myproject|
|`symfony new myproject lts`|Crée un nouveau projet symfony avec la version **LTS** (Long Time Support) dans le dossier myproject|
|`symfony new myproject 2.3.23`|Crée un nouveau projet symfony avec la version **2.3.23**|


## Serveur PHP
|Commande|Résultat|
|------- | -------|
|`php app/console server:start`|Lance le serveur embed PHP|
|`php app/console server:stop`|Arrête le serveur embed PHP|
