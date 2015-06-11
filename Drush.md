Drush
=========

Ensembles de commandes Drush bien pratiques

## Installation / Upgrade / Downgrade
|**commande**|**Résultat**|
|------------|------------|
|`composer global require drush/drush:6.5`|repasser à la version 6.5 stable|
|`composer global require drush/drush:6.*`|passer sur la dernière version stable de la branche 6.x|
|`composer global require drush/drush:7.*`|passer sur la dernière version stable de la branche 7.x|
|`composer global require drush/drush:dev-master`|passer sur la version dev|
|`composer global update drush/drush`|mettre à jour drush|

## Fonctions générales
|**commande**|**Résultat**|
|------------|------------|
|`Drush use @alias`|rentre dans le namespace @alias, ainsi les commandes suivantes n'auront pas besoin de spécifier d'alias|

## Autopsie d'un Alias
Se trouvent dans le fichier ~/.drush/alias.drush.php
```php
$aliases['monsite'] = array( //Nom de l'alias
  'uri' => 'monsite.dev', //url
  'root' => '/media/vhosts/monsite.dev/www/', // chemin d'accès à l'instance du drupal
);
```
