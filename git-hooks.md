Hooks Post Receive
=========
Exemple de hooks git qui réagissent lors d'un push

## Déploiement Drupal
```bash
#!/bin/sh

echo "*******************************************************"
echo "**** Bonjouuuur, je suis le script de post-receive ****"
echo "*******************************************************"

ssh USER@SERVER 'cd /PATH/;git pull orgin master;drush @ALIAS cc all;drush @ALIAS updb -y;drush @ALIAS core-cron;drush @ALIAS cc all'

echo "*******************************************************"
echo "**** Merci, j'ai terminééééé *************************"
echo "*******************************************************"

echo "Over ! "

```
