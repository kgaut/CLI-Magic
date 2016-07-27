#!/bin/bash
#############################################
# Comment utiliser ?
# 1 - Changez la configuration par defaut ci-dessous pour correspondre à vos besoins
# 2 - ensuite via un terminal : 
#       ./site-factory.sh ou ./site-factory.sh www.monsite.com
#############################################

#############################################
# CONFIGURATION
#############################################

# le root du dossier www
CONF_DOCUMENT_ROOT="/media/vhosts/"

# si dans le dossier du domaine on veux un sous dossier qui soit le basepath
# ex : /media/vhosts/monsite.com/ => BASEPATH="/"
# ex : /media/vhosts/monsite.com/httpdocs => BASEPATH="/httpdocs/"
CONF_BASEPATH="/www/"

# Doit on aussi créer les dossiers logs, db.. dans le dossier
# ex : /media/vhosts/monsite.com/db
# ex : /media/vhosts/monsite.com/www # crée automatiquement à l'aide du parametre de configuration CONF_BASEPATH plus haut
CONF_CREATE_SPECIAL_FOLDERS=$true #valeurs possible $false ou $true

declare -a CONF_SPECIALS_FOLDERS=("sh" "db" "docs")

# Doit on créer un dossier pour contenir les fichiers de log ?
CONF_CREATE_LOG_FOLDER=$true #valeurs possible $false ou $true

# le nom du dossier contenant les fichiers de log
# ex : /media/vhosts/monsite.com/logs avec la valeur logs
CONF_CREATE_LOG_FOLDER_NAME="logs"

# le nom du dossier contenant les fichiers de conf (php.ini...)
# ex : /media/vhosts/monsite.com/conf avec la valeur conf
CONF_CREATE_CONF_FOLDER_NAME="conf"

# Chemin vers le fichier drushrc
CONF_DRUSH_RC_FILE="$HOME/.drush/aliases.drushrc.php"

# Chemin vers le fichier d'alias
CONF_DRUSH_BASH_ALIAS="$HOME/.dotfiles/bash_aliases"

# Chemin vers le fichier hosts
CONF_HOSTS_FILE="/etc/hosts"

# extention utilisé pour les sites en developpement
CONF_DEV_EXT="dev"

# Accès à la base de données
CONF_DB_HOST="localhost"
CONF_DB_USER="root"
CONF_DB_PASS="mysql"


#############################################
#PARTIE 1 RECUPERATION DE L'URL DU SITE EN PROD
#############################################
echo "--------------------------------------------"
echo "--------------- Site Factory ---------------"
echo "--------------------------------------------"

domaine="$1"
while [ -z "$domaine" ]
do                
        echo "URL du site en production"
        echo "ex : www.monsite.com ou intranet.monsite.com"
        echo "Puis faites entrée"
        read domaine
done

echo "URL du site en production : ${domaine}"

domainePart=(`echo $domaine | tr '.' ' '`)

nbElement=${#domainePart[*]}
let nbElement--

ext=${domainePart[${nbElement}]}
domainePart[${nbElement}]='dev'


if [ ${domainePart[0]} = "www" ]
then
        flag_www=$true #le flag sert pour le ServerName du vhost
        unset domainePart[0]
else
        flag_www=$false        
fi

domaineDev=$(printf ".%s" "${domainePart[@]}")
domaineDev=${domaineDev:1}

domainePart[${nbElement}]=${ext}
domaine=$(printf ".%s" "${domainePart[@]}")
domaine=${domaine:1}

pathToVhost="/etc/apache2/sites-available/${domaineDev}.conf"

echo "URL du site en developpement : ${domaineDev}"
echo "Le vhost sera situé : ${pathToVhost}"


# création du vhost en .dev

echo "Voulez vous créer les dossiers de travail ? Y/n"
read inputAlias
if [ "$inputAlias" = "y" -o "$inputAlias" = "Y"  -o -z "$inputAlias" ]
then
        echo "Veuillez renseigner le dossier de travail en absolu."
        echo "si vide : ${CONF_DOCUMENT_ROOT}${domaine}${CONF_BASEPATH}"
        read www_folder
        if [ -z "$www_folder" ]
        then
                www_folder="${CONF_DOCUMENT_ROOT}${domaine}${CONF_BASEPATH}"
        fi
        sudo mkdir -p ${www_folder}
        if [ CONF_CREATE_SPECIAL_FOLDERS ]
        then
                for i in ${!CONF_SPECIALS_FOLDERS[*]}
                do
                        echo "creation dossier ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_SPECIALS_FOLDERS[i]}"
                        sudo mkdir -p ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_SPECIALS_FOLDERS[i]}
                done
        fi
        if [ CONF_CREATE_LOG_FOLDER ]
        then
                echo "creation dossier contenant les fichiers de log ${CONF_DOCUMENT_ROOT}${domainedomaine}/${CONF_CREATE_LOG_FOLDER_NAME}"
                sudo mkdir -p ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_LOG_FOLDER_NAME}
                sudo mkdir -p ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_CONF_FOLDER_NAME}
                sudo touch ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_LOG_FOLDER_NAME}/error.log
                sudo touch ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_LOG_FOLDER_NAME}/access.log
        fi
fi

#############################################
# CREATION VHOST APACHE 2.4
#############################################
echo "Voulez vous créer Le Virtual Host Apache 2.4 ? Y/n"
read inputAlias
if [ "$inputAlias" = "y" -o "$inputAlias" = "Y"  -o -z "$inputAlias" ]
then
        echo "Creation du Vhost Apache 2.4"
        ServerAlias=$false
        if [ flag_www ]
        then
                echo "Doit-on créer le ServerAlias avec WWW ? www.${domaineDev} Y/n"
                read inputAlias
                if [ "$inputAlias" = "y" -o "$inputAlias" = "Y" -o -z "$inputAlias" ]
                then
                        ServerAlias=$true
                fi
        fi
        echo "Voici le résumé du vhost : "
        echo "- situé : ${pathToVhost}"
        echo "- ServerName : ${domaineDev}"
        if [ ServerAlias ]
        then
                echo "- ServerAlias : www.${domaineDev}"
        fi
        echo "- directory : ${www_folder}"
        sudo touch ${pathToVhost}
        sudo chown $USER ${pathToVhost}
        sudo echo -e "<VirtualHost *:80>" >> ${pathToVhost}
        sudo echo -e "\tServerName ${domaineDev}" >> ${pathToVhost}


        if [ ServerAlias ]
        then
                sudo echo -e "\tServerAlias www.${domaineDev}" >> ${pathToVhost}
        fi

        if [ CONF_CREATE_LOG_FOLDER ]
       	then
            sudo echo -e "\tErrorLog ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_LOG_FOLDER_NAME}/error.log" >> ${pathToVhost}
            sudo echo -e "\tCustomLog ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_LOG_FOLDER_NAME}/access.log common" >> ${pathToVhost}
       	fi
        sudo echo -e "\t#PHPINIDir ${CONF_DOCUMENT_ROOT}${domaine}/${CONF_CREATE_CONF_FOLDER_NAME}" >> ${pathToVhost}
        sudo echo -e "\tDocumentRoot \"${www_folder}\"" >> ${pathToVhost}

        
        sudo echo -e "\t<directory ${www_folder}>" >> ${pathToVhost}
        sudo echo -e "\t\tOptions -Indexes +FollowSymLinks +MultiViews" >> ${pathToVhost}
        sudo echo -e "\t\tAllowOverride All" >> ${pathToVhost}
        sudo echo -e "\t\tRequire all granted" >> ${pathToVhost}
        sudo echo -e "\t</Directory>" >> ${pathToVhost}
        sudo echo -e "</VirtualHost>" >> ${pathToVhost}
fi
#############################################
# AJOUT AU FICHIER HOSTS
#############################################
echo "----------"
echo "Ajouter une entrée au fichier HOSTS ? Y/n"
read inputAlias
if [ "$inputAlias" = "y" -o "$inputAlias" = "Y" -o -z "$inputAlias" ]
then

        sudo echo -e "127.0.0.1\t${domaineDev}" >> ${CONF_HOSTS_FILE}
		if [ flag_www ]
		then
        	sudo echo -e "127.0.0.1\twww.${domaineDev}" >> ${CONF_HOSTS_FILE}

		fi
fi



#############################################
# CREATION BASE DE DONNEES
#############################################
echo "----------"
echo "Voulez vous créer une base de donnée ? Y/n"
read inputAlias
if [ "$inputAlias" = "y" -o "$inputAlias" = "Y" -o -z "$inputAlias" ]
then
        echo "Nom de la base de données (si vide : ${domaine})"
        read db_name
        if [ -z "$db_name" ]
        then
                db_name="$domaine"
        fi
        echo "Nom de la base de données : $db_name"

        Q1="CREATE DATABASE \`$db_name\`;"
        mysql -u "${CONF_DB_USER}" --password="${CONF_DB_PASS}" -e "$Q1"
fi

#############################################
# CREATION ALIAS DRUSH
#############################################
echo "----------"
echo "Voulez vous créer un alias Drush ? Y/n"
read inputAlias
if [ "$inputAlias" = "y" -o "$inputAlias" = "Y" -o -z "$inputAlias" ]
then
        echo "----------"
        echo "Alias choisi ?"
        read drush_alias
        echo "----------"
        echo "Ajout de l'alias drush au fichier aliases.drushrc.php"
        echo "----------"

        echo -e "\$aliases['${drush_alias}'] = array(" >> ${CONF_DRUSH_RC_FILE}
        echo -e "\t'uri' => '${domaineDev}'," >> ${CONF_DRUSH_RC_FILE}
        echo -e "\t'root' => '${CONF_DOCUMENT_ROOT}${domaine}/www/'," >> ${CONF_DRUSH_RC_FILE}
        echo -e ");" >> ${CONF_DRUSH_RC_FILE}

        echo "Voulez créer un aliad bash pour cet alias drush ? Y/n"
        read inputAlias
        if [ "$inputAlias" = "y" -o "$inputAlias" = "Y" -o -z "$inputAlias" ]
        then        
                echo -e "alias ${drush_alias}='drush @${drush_alias}'" >> ${CONF_DRUSH_BASH_ALIAS}
        fi
fi


echo "----------"
echo "Activation du VirtualHost"
echo "----------"

sudo a2ensite ${domaineDev}.conf
sudo service apache2 restart


echo "----------"
echo "Changement des droits du dossier ${www_folder}"
echo "----------"

sudo chown $USER ${CONF_DOCUMENT_ROOT}${domaine} -R
sudo chgrp www-data ${CONF_DOCUMENT_ROOT}${domaine} -R
sudo chmod ug+wrx ${CONF_DOCUMENT_ROOT}${domaine} -R
