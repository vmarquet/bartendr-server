Afin de profiter des dernières améliorations de Ruby on Rails, je propose d'utiliser la version 4. Vous pourrez trouver des eBooks [ici](https://torrentz.eu/search?f=rails+4).

Installation
------------
* ne surtout pas utiliser apt-get pour installer ruby et rails, les versions dans les dépôts sont obsolètes
* il faut utiliser rvm (Ruby Version Manager), qui permet de mieux gérer les gems (paquets pour Ruby)
* tutoriels détaillés: [ici](http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/),
  [ici](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm)

### Résumé

#### Etape 1: installation de rvm
```
sudo apt-get install curl
curl -L get.rvm.io | bash -s stable   # download and install rvm
source ~/.rvm/scripts/rvm             # add rvm to $PATH
rvm requirements                      # install some packages (sqlite3, ...)
```

#### Etape 2: installation de Ruby
```
rvm install ruby 2.1.0                # installe Ruby 2.1.0
# NB: il est possible d'installer différentes versions en parallèle
rvm use --default 2.1.0               # utiliser cette version par défaut
# NB: si la dernière commande provoque l'erreur "RVM is not a function":
# - solution temporaire: taper "/bin/bash --login" avant
# - solution permanente: voir ici: https://rvm.io/integration/gnome-terminal
rvm rubygems current                  # je ne sais pas si c'est nécéssaire
```

#### Etape 3: installation de Rails
```
gem install rails                     # install the latest version (use -v to choose version)
```
