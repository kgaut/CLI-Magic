# Prise en main d'un serveur Centos 7

## Gestion des disques
### Formatage ext4 d'un disque
`mkfs -t ext4 /dev/vdb1`

### Montage d'un second disque
éditer le fichier `/etc/fstab` et ajouter la ligne : 

`/dev/vdb /home auto  defaults,nofail,errors=remount-ro 0 2`
Avec : 
  - /dev/vdb : Chemin du disque
  - /home : Point de montage

## Utilisateurs

### Mot de passe pour root
`passwd`

### Création d'un autre user que root (ici "monuser")
`adduser monuser`

### Définition de son mot de passe
passwd monsuer

### Ajout de ce user au groupe des sudoers (penser à deconnecter l'utilisateur en question pour que ce soit pris en compte)
usermod -aG wheel monsuer

## Configuration du serveur

### Changement du nom du serveur
`vim /etc/sysconfig/network`
ajouter la ligne suivante :
`HOSTNAME=monserveur.domain.com`
utilisation de la commande hostname
`hostname monserveur.domain.com`

### Gestion de l'heure (Fuseau Horaire)
```
timedatectl set-timezone Europe/Paris
```
### Gestion des mails
### Installation de postfix
```
yum install postfix
systemctl start postfix
systemctl enable postfix
```

#### Redirection des mails
https://kgaut.net/journal/2016/serveur-rediriger-les-emails-envoyes-a-root.html

## Paquets
`yum update`

Installation de yum utils pour la commande `yum-config-manager` entre autres

`yum install yum-utils`

## Fail2ban
https://www.linode.com/docs/security/using-fail2ban-for-security
```
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum install fail2ban
```

Configuration fail2ban :
@todo wget d'un gist de /etc/fail2ban/jail.local

```
systemctl start fail2ban
systemctl enable fail2ban
```

## Installation des packages de base 
yum install curl-devel

## Installation de GIT
https://www.digitalocean.com/community/tutorials/how-to-install-git-on-centos-7

## Pile Lamp
### ajout du dépot remi
```
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
yum-config-manager --enable remi-php70
```

### Installation d'Apache
```
yum install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
```

### Installation de MySQL (via MariaDB)
```
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo systemctl enable mariadb.service
```

### Installation de PHP 7.0
```
yum install php70 php70-php-gettext php70-php-mbstring php70-php-curl php70-php-sqlite3 php70-php-soap php70-fpm php70-php-mysqlnd
```
