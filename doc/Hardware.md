Matériel nécéssaire
-------------------
* [Raspberry Pi Model B+](http://uk.rs-online.com/web/p/processor-microcontroller-development-kits/8111284/)
    * carte SD classe 10 (parfois fournie avec)
    * [chargeur](http://uk.rs-online.com/web/p/products/8226373/) (5V 2A 10W environ)
    * boitier ?

* [ChromeCast](http://www.amazon.fr/Google-Chromecast-HDMI-multim%C3%A9dia-WiFi/dp/B00IJUW1RI)
    * alternative future: [MatchStick](http://korben.info/matchstick-la-cle-hdmi-de-mozilla.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+KorbensBlog-UpgradeYourMind+%28Korben%27s+Blog+-+Upgrade+Your+Mind%29)

* clé wifi
    * afin de pouvoir générer un réseau wifi, elles doivent être compatible "Access Point" (aussi appelé réseau "Ad Hoc" je crois (?))
    * d'après [ici](https://learn.adafruit.com/setting-up-a-raspberry-pi-as-a-wifi-access-point/what-youll-need),
    [ce modèle](http://www.adafruit.com/products/814) est compatible Access Point et ne nécéssite pas de hub. Voir aussi [ce modèle](https://www.adafruit.com/product/1012), qui est censé avoir une plus grande portée, attention, il faudra peut-être un hub USB autoalimenté
    * d'après [ici](http://itsacleanmachine.blogspot.fr/2013/02/wifi-access-point-with-raspberry-pi.html),
      [ce modèle](http://www.amazon.com/gp/product/B002WBX9C6/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B002WBX9C6&linkCode=as2&tag=itsacleanmach-20) gère l'Access point
    * [modèle suggéré par Palik](http://www.amazon.fr/gp/product/B00EZOQFHO/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1)
        * ajouter le repo `deb http://ftp.uk.debian.org/debian/ wheezy main non-free`
        * installer `firmware-ralink`
    * autres:
        * voir [ici](http://elinux.org/RPi_USB_Wi-Fi_Adapters) pour la liste des clé wifi compatibles avec le Raspberry Pi
        * tuto [ici](http://elinux.org/RPI-Wireless-Hotspot)
        * tuto [ici](http://www.daveconroy.com/turn-your-raspberry-pi-into-a-wifi-hotspot-with-edimax-nano-usb-ew-7811un-rtl8188cus-chipset/)

