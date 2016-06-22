#Gnome Shell

Des trucs qu'ils sont bien pour cet environement de bureau [WIP]

## Nautilus
###Ouvrir un terminal dans le dossier courant 
Editer le fichier ~/.config/nautilus/accels
`vim ~/.config/nautilus/accels`

Remplacer la ligne 

`; (gtk_accel_path "<Actions>/ExtensionsMenuGroup/TerminalNautilus:OpenFolderLocal" "")`

par

`(gtk_accel_path "<Actions>/ExtensionsMenuGroup/TerminalNautilus:OpenFolderLocal" "F12")`

## Extensions

### Alternatetab

Remplace le "Alt-tab" par un plus classique, en supprimant le regroupement des fenêtres par application.

Lien : [Gnome.org](https://extensions.gnome.org/extension/15/alternatetab/)

### Audio-Output-Switcher
Permet de switcher entre les sorties sons du pc (casque / HP...)

Liens : 
  - [Github](https://github.com/kgaut/gnome-shell-audio-output-switcher)
  - [Gnome.org](https://extensions.gnome.org/extension/1028/gnome-shell-audio-output-switcher/)

### Clipboard Indicator
Permet de garder un historique de son presse-papier

Lien : [Gnome.org](https://extensions.gnome.org/extension/1028/gnome-shell-audio-output-switcher/)

### Taskbar

Ajoute les icones des applications lancées dans la barre supérieure

Lien : [Gnome.org](https://extensions.gnome.org/extension/584/taskbar/)

## Themes

@todo : numix
