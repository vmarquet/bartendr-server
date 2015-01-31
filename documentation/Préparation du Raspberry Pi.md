Préparation du Raspberry Pi
===========================

Cette documentation couvre:

1. l'installation de l'OS
2. l'installation du serveur
3. la création d'un Access Point


Installation de l'OS (Raspbian)
-------------------------------

### Matériel requis

* Raspberry Pi et son alim
* carte microSD (et adaptateur format SD si le PC n'a pas de port microSD)
* clavier et souris
* câble HDMI et écran (ou adaptateur HDMI vers VGA)
* câble Ethernet


### Préparation de la carte SD

* Télécharger Noobs, qui contient Raspbian et facilite son installation: 
    * <http://www.raspberrypi.org/downloads/>
* Formater la carte microSD en format FAT32
* Dézipper le contenu du dossier téléchargé dans la carte microSD
* Ejecter la carte microSD proprement


### Installation de l'OS sur la Rasp (~ 30 minutes)

* Insérer la carte microSD dans la rasp
* Brancher clavier, souris, câble Ethernet et câble HDMI
* Brancher l'alim de la rasp
* Un menu de sélection apparait, cocher Raspbian et Installer
    * Pendant l'installation vous pouvez choisir la langue et la configuration du clavier en bas de l'écran


### Configuration de la Rasp (~ 5 minutes)

A la fin de l'installation vous entrez automatiquement dans le menu de config (si ce n'est pas le cas tapez `sudo raspi-config`).

* **configurez le clavier en français sinon il sera en qwerty** ([instructions](http://www.tropfacile.net/doku.php/raspberry-pi/comment-passer-votre-raspberry-en-francais))
* Éventuellement, changer le mot de passe
    * L'identifiant de base est:
        * username: `pi`
        * password: `raspberry`
    * Pour changer le mot de passe, sélectionnez la deuxième ligne et tapez le nouveau mot de passe
* pour activer le SSH sélectionnez la 8ième ligne et sélectionnez `ENABLE`
* une fois que c'est fait, quittez le menu de config (rappel: il est possible d'y revenir avec `sudo raspi-config`)


### Mise à jour du système (~ 5 minutes)

* Pour mettre à jour vous pouvez utiliser `apt-get` ou `aptitude`
    * Nota bene: il est conseillé d'utiliser toujours le même gestionnaire de paquet, mélanger `apt-get` et `aptitude` peut poser des problèmes
    * (les options et commandes sont exactement les mêmes pour les deux)
* mettre à jour: `sudo aptitude update -y && sudo aptitude upgrade -y && sudo reboot`


Installation du serveur
-----------------------

### Installation de Rails (~ 1h30)

Voir [Installation de Rails.md](Installation de Rails.md).


### Installation du serveur (~ 3h)

	git clone https://github.com/vmarquet/bartendr-server.git
	cd ~/bartendr-server/server-ror
	bundle install

Nota bene: pour accélérérer un peu le `bundle install`, ne pas installer les docs, pour cela créer un fichier `~/.gemrc` et y mettre `gem: --no-document`.


### Configurer le serveur en mode production

TODO


### Lancement du serveur

	cd ~/bartendr-server/server-ror
	rake db:migrate
	rails s

Votre serveur tourne maintenant sur la rasp ! Bravo !


Configuration de l'Access Point
-------------------------------

TODO

