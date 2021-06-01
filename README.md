# Setup

L'idée de ce petit programme est de permettre une installation de travail rapide : un bouton (ou plusiteurs boutons) sur le bureau ou ailleurs permet de lancer un petit script qui va ouvrir les application voulues, dans le mode voulu, avec les paramètres voulus.

## Lancement du script de démarrage

Si le script `scripts/xcreate_bash_alias.rb` a été joué, il suffit de taper `startup` dans le Terminal pour lancer le script défini dans `Setup/_startuppers_/`. S'il y a plusieurs scripts, SETUP demande lequel utiliser.

On peut aussi lancer `startup <nom du start-upper>`.

## Définition d'un script de démarrage

On crée ce setup dans `Setup/_startuppers_/`, il s'appelle un "startupper" (un "démarreur"). On peut en créer autant qu'on veut.

## Faire un raccourci sur le bureau

Pour le moment, on ne le fait pas.

Jouer le script `Setup/Script/desktop_shortcut.rb` en indiquant le nom du script de démarrage (seulement son nom).
