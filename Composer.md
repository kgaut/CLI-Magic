Composer
=========
Gestionnaires de dépendances PHP


## Installation
Dans un terminal : 

```curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer```

## Commande de base
|Commande|Résultat|
|------- | -------|
|`curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer`|Installer Composer de manière globale|
|`composer self-update` | Mise à jour composer|
|`composer clear-cache`| Vider le cache de composer|
|`composer global update` | Mise à jour l'ensemble des paquets gérés par composer|
|`composer config -g github-oauth.github.com <token>` | ajouter un token oauth de github pour composer pour éviter les limites d'accès API (CF : https://getcomposer.org/doc/articles/troubleshooting.md#api-rate-limit-and-oauth-tokens)|

## Paquets et ressources utiles

###drupal-coder
Contient aussi code-sniffer, permet de vérifier son code sur les bonnes pratiques

Installation :

```composer global require drupal/coder```

###drupal-project
Utiliser drupal à la sauce composer, compatible avec drupal 7 et drupal 8


[https://github.com/drupal-composer/drupal-project](https://github.com/drupal-composer/drupal-project)

###pman
Doc php dans le terminal 

[https://github.com/willdurand/pman](https://github.com/willdurand/pman)

Installation :

```composer global require willdurand/pman:dev-master```

Puis ajouter `$COMPOSER_HOME/vendor/willdurand/pman/bin` à votre variable $PATH
