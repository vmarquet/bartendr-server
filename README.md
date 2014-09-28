Planning
========
* 30 septembre:
    * [fiche d'évaluation](http://learning.esiea.fr/mod/assign/view.php?id=1925)
    * [carnet de bord](http://learning.esiea.fr/mod/assign/view.php?id=1926)
* 31 octobre: [dossier de cadrage](http://learning.esiea.fr/mod/assign/view.php?id=1918)
    * mission
    * objectifs
    * Quoi (ce sont les spécifications) ?
    * Comment  (c'est la charte) ?
    * Pourquoi (c'est l'étude d'opportunité) ?
    * Quand (c'est le planning) ?
* 10 novembre: [livrable comm'](http://learning.esiea.fr/mod/assign/view.php?id=1922)
* fin mars:
    * soutenance
        * [powerpoint](http://learning.esiea.fr/mod/assign/view.php?id=1921)
        * [vidéo](http://learning.esiea.fr/mod/assign/view.php?id=1923)
    * [rapport final](http://learning.esiea.fr/mod/assign/view.php?id=1920)
    * [carnet de bord](http://learning.esiea.fr/mod/assign/view.php?id=1924)
* liens:
  [moodle](http://learning.esiea.fr/course/view.php?id=114)


Outils
======

* [repo git serveur](https://github.com/vmarquet/bartendr-server)
* [repo git app iOS](https://github.com/vmarquet/bartendr-iphone)
* [Google drive](https://drive.google.com/folderview?id=0B31-CIvNW1LddUh2TDR2dFRUZDg&usp=sharing)
    * [carnet de bord](https://docs.google.com/document/d/1W5y5b67vsxV-OWjjCv3ynAZ-iVZyKB47eH1HxgX0gTk/edit?usp=sharing)
* [dropbox](https://www.dropbox.com/sh/msamrpxkaoui7ee/AABq-7guhfGODuuogzNg-yNLa?dl=0)

Afin de profiter des dernières améliorations de Ruby on Rails, je propose d'utiliser la **version 4.1.6**. Merci d'utiliser exactement cette version afin de ne pas créer de conflits. Quand à Ruby, je pense que n'importe quelle version supérieure à la version 2 fera l'affaire. Pour vérifier la version sur votre machine, taper `ruby -v` ou `rails -v`.

Vous pourrez trouver des eBooks [ici](https://torrentz.eu/search?f=rails+4). Quelques sources que j'ai utilisées:

* [site officiel](http://guides.rubyonrails.org/getting_started.html)
  -> clair et concis
* [Rails par l'exemple, Michael Hartl](https://www.railstutorial.org/book)
  -> expliqué très en détails, en partant de zéro, ça donne une vue d'ensemble
* Rails 4 in Action, 2nd edition
  -> direct dans le vif du sujet, pas très expliqué, pas pour débuter mais plutôt pour approfondir


Installation
------------
* ne surtout pas utiliser apt-get pour installer ruby et rails, les versions dans les dépôts sont obsolètes
* il faut utiliser rvm (Ruby Version Manager), qui permet de mieux gérer les gems (paquets pour Ruby)
* tutoriels détaillés: [ici](http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/),
  [ici](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm)

### Résumé

#### Etape 1: installation de rvm (Ryby Version Manager)
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
gem install rails -v 4.1.6
```

#### Etape 4: dépendances
```
sudo apt-get install nodejs           # JavaScript runtime
```

#### Etape 5: problèmes rencontrés
En testant la création d'un nouveau projet avec `rails new`, il manquait la gem json. A installer avec `gem install json -v '1.8.1'`, puis repartir de zéro avec un nouveau `rails new`.



Technos à connaître
-------------------
* HTML
* CSS
  (ou [SCSS](http://sass-lang.com/))
  (ou [LESS](http://lesscss.org/) pour [Twitter Bootstrap](http://getbootstrap.com/))
* JavaScript (ou [CoffeeScript](http://coffeescript.org/)), 
    * tuto: [voir ici](http://fr.openclassrooms.com/informatique/cours/dynamisez-vos-sites-web-avec-javascript), en particulier la partie 2 sur la manipulation du HTML
    * [AJAX](http://fr.openclassrooms.com/informatique/cours/dynamisez-vos-sites-web-avec-javascript/l-ajax-qu-est-ce-que-c-est)
    * quelques librairies JavaScript pour la "dataviz":
      [ici](http://www.mathieurobin.com/2012/05/realiser-des-graphiques-avec-javascript/),
      [ici](http://selection.datavisualization.ch/)
* [ChromeCast](http://chromecasthub.com/developers/)
  (apparemment l'API est en JavaScript)
* Ruby
    * [tuto développer.com](http://pbnaigeon.developpez.com/tutoriel/ruby/premiers-pas-avec-ruby/#LIII)
    * [Tuto Rails de Michael Hartl, chapitre 4](https://www.railstutorial.org/book/rails_flavored_ruby)
* git: connaître les bases: `git add`, `git commit`, `git pull`, `git push`
    * [tuto plus complet](https://www.atlassian.com/fr/git/tutorial/git-basics)
* web design
    * [Twitter Bootstrap](http://getbootstrap.com/)
        * comment l'inclure dans Rails:
          voir [ici](https://github.com/seyhunak/twitter-bootstrap-rails)
          et [ici](http://railscasts.com/episodes/328-twitter-bootstrap-basics)
    * [Bootstrap Material Design](https://fezvrasta.github.io/bootstrap-material-design/)
