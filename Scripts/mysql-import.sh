#!/bin/bash
if [ "$1" != "" ];
then
  DB_TO_IMPORT="$1"
else
  while [ -z "$DB_TO_IMPORT" ]
  do
      echo "Nom de la base de données à importer ?"
      read DB_TO_IMPORT
  done
fi

if [ "$2" != "" ];
then
  DB_NAME="$2"
else
  DB_NAME="$1"
fi


DUMP="$(ls -t /media/vhosts/$DB_TO_IMPORT/db | head -1)"
FILE="/media/vhosts/$DB_TO_IMPORT/db/$DUMP"


echo "----"
echo "ATTENTION : Ce script va supprimer la base de donnnées $DB_NAME."
echo "Il importera ensuite le dump le plus récent du dossier /media/vhosts/$DB_TO_IMPORT/db/"
echo "Le fichier importé sera $DUMP"

if [ "$2" != "-y" ];
then
	echo "Si vous ne souhaitez pas faire ça, répondez «n» à la question suivante."
	echo "----"
	read -r -p "Voulez-vous continuer ? [y/N] " response
else
	response="y"
fi
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	echo "----"
	echo "On commence par supprimer la base de données «$DB_NAME."
	mysqladmin drop $DB_NAME  --force --verbose
	mysqladmin create $DB_NAME --force --verbose
	echo "----"
	echo "C'est parti pour l'import, cela peut-être un poil long, allez-vous faire un café."
	zcat $FILE | mysql $DB_NAME
else
    echo "OK, on annule tout !"
fi
