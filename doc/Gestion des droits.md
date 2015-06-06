Gestion des droits
------------------

### Résumé des types de comptes

* "admin" (root) pour nous les devs, accès en écriture à tout
* "bartender" pour le gérant du bar
* "barman" pour les barman / serveurs
* l'accès des clients


### Attribution des comptes

#### Principe

Le droit d'accès en "admin" est automatiquement attribué à la première personne à s'inscrire sur le site. Le droit d'accès en "bartender" est automatiquement attribué à la seconde personne à s'inscrire sur le site.

Ainsi, avant de distribuer un Raspberry Pi avec notre serveur dans un bar, il nous suffira juste de créer d'abord un compte dessus, et on aura les droits "admin", puis de demander au gérant / manager du bar de créer un compte dessus, et il aura les droits "bartender". Les suivants à s'inscrire auront automatiquement les droits "barman", et pourront éventuellement être promus "bartender" par un autre "bartender" via notre interface.

#### Implémentation

L'attribution des comptes se fait dans [user.rb](https://github.com/vmarquet/bartendr-server/blob/master/server-ror/app/models/user.rb).


### Implémentation des droits

Les droits sont définis grâce à la gem [rolify](https://github.com/RolifyCommunity/rolify), dans le fichier [ability.rb](https://github.com/vmarquet/bartendr-server/blob/master/server-ror/app/models/ability.rb).

