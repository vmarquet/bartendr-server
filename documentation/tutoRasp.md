# Tuto installation de la Rasp


###     Préparation de la carte SD
* Télécharger un os pour la rasp pour l'instant NOOBS : 
* <http://www.raspberrypi.org/downloads/>
* Formater la carte SD en format FAT32
* Dézipper le contenu du dossier téléchargé dans la carte SD
* Ejecter la carte SD proprement
	
###     Installation de l'OS sur la Rasp
* Inserer la carte SD dans la rasp
* Brancher Clavier, Souris, Cable Ethernet et cable HDMI
* Brancher l'alim de la rasp
* Un menu de séléction apparait, cocher Raspbian et Installer
* Pendant l'installation vous pouvez choisir la langue et la configuration du clavier en bas de l'écran

###     Configuration de la Rasp
* A la fin de l'installation vous entrez automatiquement dans le menu de config.
* (Si ce n'est pas la cas tapez : sudo raspi-config)
* En sachant que les logs de bases sont : pi ; raspberry
* Pour changer le Mdp séléctionnez la deuxieme ligne et tapez le nouveau Mdp
* pour activer le SSH séléctionnez la 8ieme ligne et selectionnez ENABLE

###     Mise a jour du systeme

* Il faut tout d'abord quitter le menu de config pour cela appuyez sur tab et selectionnez finish
* Pour mettre à jour vous pouvez utiliser apt-get ou aptitude 
* (les options et commandes sont exactement les mêmes)
* exemple avec aptitude : 
	sudo aptitude update -y && sudo aptitude upgrade -y && sudo reboot
* (Il suffit donc de substituer aptitude par apt-get si vous le souhaitez)
* La Rasp va alors redémarrer.
	
##     Installation de RoR (GitHub de Vincent Marquet)

###	INSTALLATION DE RVM
	
	sudo apt-get install curl
	curl -L get.rvm.io | bash -s stable   # download and install rvm
	#Il faut quitter la console pour recharger le fichier Bash
	exit  #puis reloggez vous
	rvm requirements                      # install some packages (sqlite3, ...)
	
###	INSTALLATION DE RUBY
	
	rvm install ruby 2.1.0                # installe Ruby 2.1.0
	# NB: il est possible d'installer différentes versions en parallèle
	rvm use --default 2.1.0               # utiliser cette version par défaut
	# NB: si la dernière commande provoque l'erreur "RVM is not a function":
	# - solution temporaire: taper "/bin/bash --login" avant
	# - solution permanente: voir ici: <https://rvm.io/integration/gnome-terminal>
	rvm rubygems current                  # je ne sais pas si c'est nécéssaire
	
###	INSTALLATION DE RAILS
	
	gem install rails -v 4.1.6

###	INSTALLATION DU SERVEUR

	git clone https://github.com/vmarquet/bartendr-server.git
	cd ~/bartendr-server/server-ror	
	bundle install 				# Prévoir 3 bonnes heures

###	LANCEMENT DU SERVEUR

	cd ~/bartendr-server/server-ror
	rake db:migrate
	rails s

* Votre serveur tourne maintenant sur la rasp ! Bravo !
