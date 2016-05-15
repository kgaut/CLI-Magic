NAS Synology
=========

##Ressources 

http://pellelatarte.fr/2011/03/le-ssh-pour-tous-les-utilisateurs-sur-les-nas-synology/

## Cron

|**commande**|**Résultat**|
|------------|------------|
|`vi vi /etc/crontab`|Modifier les tâches cron|
|`/usr/syno/sbin/synoservicectl --restart crond`|Redémarrer le service cron|


## Modification configuration programmes

|**fichier**|**Programme**|
|------------|------------|
|`/var/packages/deluge/scripts/start-stop-status`|Deluge - Configuration|
|`/var/packages/sickbeard-custom/scripts/start-stop-status`|Sick Beard - Configuration|
|`/usr/local/deluge/`|Deluge - Installation|
|`/usr/local/sickbeard-custom/`|Sick Beard - Installation|
