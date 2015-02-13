# Tuto installation de la Rasp


###     Préparation de la carte SD
* Télécharger un os pour la rasp pour l'instant NOOBS : 
* <http://www.raspberrypi.org/downloads/>
* Formater la carte SD en format FAT32
* Déziper le contenu du dossier téléchargé dans la carte SD
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
* Pour mettre a jour vous pouvez utiliser apt-get ou aptitude 
* (les options et commandes sont exactement les memes)
* exemple avec aptitude : 
	sudo aptitude update -y && sudo aptitude upgrade -y && sudo reboot
* (Il suffit donc de substituer aptitude par apt-get si vous le souhaitez)
* La Rasp va alors redémarrer.
	
##     Installation de RoR (GitHub de vincent Marquet)

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
	cd ~/bartendr-server/serveur-ror	
	bundle install 				# Prévoir 3 bonnes heures

###	LANCEMENT DU SERVEUR

	cd ~/bartendr-server/serveur-ror
	rake db:migrate
	rails s


## Votre serveur tourne maintenant sur la rasp !

### Installation de l'access point
	
	sudo nano /etc/udhcpd.conf
	
* copier le fichier /etc/udhcpd.conf dans votre repertoire locale pour pouvoir revenir en arriere	

	sudo cp /etc/udhcpd.conf ~/	

* Recréer le fichier 

	sudo nano /etc/udhcpd.conf

* Remplir le fichier

	start 192.168.42.2 # This is the range of IPs that the hostspot will give to client devices.
	end 192.168.42.20
	interface wlan0 # The device uDHCP listens on.
	remaining yes
	opt dns 8.8.8.8 4.2.2.2 # The DNS servers client devices will use.
	opt subnet 255.255.255.0
	opt router 192.168.42.1 # The Pi's IP address on wlan0 which we will set up shortly.
	opt lease 864000 # 10 day DHCP lease time in seconds

* Editer le fichier /etc/default/udhcpd et mettez la ligne en commentaire:

	sudo nano /etc/default/udhcpd	
	DHCPD_ENABLED="no"


	sudo ifconfig wlan0 192.168.42.1

* Pour que l'ip reste aprés un Reboot changer dans le fichier /etc/network/interfaces

	sudo nano /etc/network/interfaces	
	iface wlan0 inet static  address 192.168.42.1  netmask 255.255.255.0

* Et mettre ces 3 lignes en commentaire : 

	allow-hotplug wlan0
	wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
	iface default inet manual

* Configurer Hostapd

	sudo nano /etc/hostapd/hostapd.conf
	interface=wlan0
	driver=nl80211
	ssid=My_AP
	hw_mode=g
	channel=6
	macaddr_acl=0
	auth_algs=1
	ignore_broadcast_ssid=0
	wpa=2
	wpa_passphrase=My_Passphrase
	wpa_key_mgmt=WPA-PSK
	wpa_pairwise=TKIP
	rsn_pairwise=CCMP

* Changer le SSID, PASSPHRASE

	sudo nano /etc/default/hostapd

* Changer la ligne 

	\#DAEMON_CONF=""
* en

	DAEMON_CONF="/etc/hostapd/hostapd.conf"

* La suite :

	sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
	sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
	sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
	sudo nano /etc/network/interfaces

* Ajouter la ligne tout en bas du fichier 

	up iptables-restore < /etc/iptables.ipv4.nat

* Lancer l'access point !

	sudo service hostapd start
	sudo service udhcpd start




