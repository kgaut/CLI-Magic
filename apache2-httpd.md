# Apache2 & PHP5

## Protection par htpasswd

### Création d'un fichier htpasswd
```
htpasswd -c /vhosts/monsite/.htpasswd kgaut
```

### Ajout d'un utilisateur à un fichier existant
```
htpasswd /vhosts/monsite/.htpasswd kgauty
```

### Utilisation dans le vhosts
```        
<Directory "/vhosts/monsite/www">
  AuthType Basic
  AuthName "Restricted Content"
  AuthUserFile /vhosts/monsite/.htpasswd
  Require valid-user
</Directory>

```
