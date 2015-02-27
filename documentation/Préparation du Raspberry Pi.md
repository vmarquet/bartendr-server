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

```
sudo nano /etc/udhcpd.conf
```

* copier le fichier `/etc/udhcpd.conf` dans votre répertoire local pour pouvoir revenir en arrière si besoin

```
sudo cp /etc/udhcpd.conf ~/
```

* Recréer le fichier 

```
	sudo nano /etc/udhcpd.conf
```

* Remplir le fichier

```
start 192.168.42.2 # This is the range of IPs that the hostspot will give to client devices.
end 192.168.42.20
interface wlan0 # The device uDHCP listens on.
remaining yes
opt dns 8.8.8.8 4.2.2.2 # The DNS servers client devices will use.
opt subnet 255.255.255.0
opt router 192.168.42.1 # The Pi's IP address on wlan0 which we will set up shortly.
opt lease 864000 # 10 day DHCP lease time in seconds
```

* Editer le fichier `/etc/default/udhcpd` et mettez la ligne en commentaire:

```
	$sudo nano /etc/default/udhcpd	
DHCPD_ENABLED="no"
```
* Changer l'adresse IP de la rasp dans le reseau local

```
sudo ifconfig wlan0 192.168.42.1
```

* Pour que l'ip reste après un Reboot, changer dans le fichier `/etc/network/interfaces`

```
	$sudo nano /etc/network/interfaces	
iface wlan0 inet static  address 192.168.42.1  netmask 255.255.255.0
```

* Et mettre ces 3 lignes en commentaire : 

```
allow-hotplug wlan0
wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet manual
```

* Configurer Hostapd

```
	$sudo nano /etc/hostapd/hostapd.conf
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
```

* Ne pas oublier de changer le SSID, PASSPHRASE dans le fichier précédent.

* Ajouter hostapd au lancement de la rasp

```
sudo nano /etc/default/hostapd
```

* Changer la ligne 

```
#DAEMON_CONF=""
```

* en

```
DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

* La suite :

```
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
```

* Ajouter la ligne tout en bas du fichier 

```
	$sudo nano /etc/network/interfaces
up iptables-restore < /etc/iptables.ipv4.nat
```

* Lancer l'access point !

```
sudo service hostapd start
sudo service udhcpd start
```



