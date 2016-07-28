#!/bin/bash
#############################################
# Comment utiliser ?
# 1 - Changez la configuration par defaut ci-dessous pour correspondre à vos besoins
# 2 - ensuite via un terminal : 
#       ./mysql-backup.sh pour sauvegarder l'ensemble des bases
#       ./site-backup.sh mabase pour n'en sauvergarder qu'une.
#
# Note : dans mon organisation, j'utilise un nom de base identique à l'adresse du site en prod
# (par exemple "monsite.com"). Mes sources de fichiers pour ce site seront dans le dossier 
# /media/vhosts/monsite.com/www
# et ce script ira placer les dumps dans le dossier 
# /media/vhosts/monsite.com/db
# C'est à adapter en fonction de votre organisations 
#############################################
Mysql_User="root"           # User MySQL
Mysql_Paswd="mysql"         # password correspondant
Mysql_host="localhost"      # Adresse du serveur
DEST_mysql="/media/vhosts"  # Répertoire de base du stockage (CF note plus haut)

CLEANUP=0                   # SI à 1 alors suppression des bases plus vielles que x jours
CLEANUP_OLDER_THAN=30       # Nombre de jours de DB à concerver


if [ "$1" != "" ];
then
  DB_TO_SAVE="$1"
else
  DB_TO_SAVE=""
fi


# Emplacemment des different prog utilisé, laisser tel quel si vous n'avez rien bidouillé
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
CHOWN="$(which chown)"
CHMOD="$(which chmod)"
GZIP="$(which gzip)"



#Rep ou on fout le sql

#Date du jour
NOW="$(date +"%Y-%m-%d_%H-%M-%S")"

# Databases a ne pas sauvegarder separer par des espaces
IGGY="CMS test phpmyadmin information_schema mysql performance_schema"

# On initialise les variables
FILE=""
DBS=""

#on cree le rep
[ ! -d $DEST_mysql ] && mkdir -p $DEST_mysql || :

#On limite l'acces au root uniquemment (utile sur un serveur)
#$CHOWN 0.0 -R $DEST_mysql
#$CHMOD 0600 $DEST_mysql

# On liste les bases de donnees
DBS="$($MYSQL -u $Mysql_User -h $Mysql_host -p$Mysql_Paswd -Bse 'show databases')"

for db in $DBS
do
    sitefolder="$db" #Nom du dossier qui contiendra le dump (CF Note)
    skipdb=-1
    if [ "$DB_TO_SAVE" != "" ];
    then
        for i in $DB_TO_SAVE
        do
            [ "$db" != "$i" ] && skipdb=1 || :
        done
    fi
    if [ "$IGGY" != "" ];
    then
        for i in $IGGY
        do
            [ "$db" == "$i" ] && skipdb=1 || :
        done
    fi

    if [ "$skipdb" == "-1" ] ; then
        mkdir -p "$DEST_mysql/$sitefolder/db"
        if [ "$CLEANUP" == 1 ]; then # Si Netoyage des anciennes bases activé
            find "$DEST_mysql/$sitefolder/db/" -type f -mtime +"$CLEANUP_OLDER_THAN" -delete
        fi
        FILE="$DEST_mysql/$sitefolder/db/$NOW-$db-$HOSTNAME.gz"
        # On boucle, et on dump toutes les bases et on les compresse
        $MYSQLDUMP -u $Mysql_User -h $Mysql_host -p$Mysql_Paswd $db --routines | $GZIP -9 > "$FILE"
        echo "Base de donnée : $db sauvegardée dans $FILE"
    fi
done

