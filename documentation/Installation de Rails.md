Installation de Rails
---------------------
* ne surtout pas utiliser `apt-get` pour installer ruby et rails, les versions dans les dépôts sont obsolètes
* il faut utiliser `rvm` (Ruby Version Manager), qui permet de mieux gérer les gems (paquets pour Ruby)
* tutoriels détaillés: [ici](http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/),
  [ici](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm)

### Résumé

#### Etape 1: installation de rvm (Ruby Version Manager)
```
sudo apt-get install curl
curl -L get.rvm.io | bash -s stable   # download and install rvm
source ~/.rvm/scripts/rvm
exit
```

Maintenant ouvrir un **nouveau terminal**, ne pas en utiliser un qui est déjà ouvert, parce qu'il ne va pas relire le fichier `~/.bashrc` qui a été modifié.

```
rvm requirements                      # install some packages (sqlite3, ...)
```

Nota bene: si à ce moment-là, il y a une erreur du genre `rvm not found`, ajouter la ligne suivante à la fin du fichier `~/.bashrc`:
```
export PATH="$PATH:$HOME/.rvm/bin"
```
Et réouvrir un nouveau terminal puis relancer `rvm requirements`.


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
gem install rails -v 4.1.6
```

Optionnel: pour accélérer un peu l'installation, il est possible de ne pas installer les docs avec l'option `--no-document`.


#### Etape 4: dépendances

##### NodeJS (Javascript runtime)
```
sudo apt-get install nodejs
```

#### Problèmes éventuels

##### Gem JSON

En testant la création d'un nouveau projet avec `rails new`, il manquait la gem json. A installer avec `gem install json -v '1.8.1'`, puis repartir de zéro avec un nouveau `rails new`.
