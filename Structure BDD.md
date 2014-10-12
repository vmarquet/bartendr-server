Structure
---------

* "articles" => 1 table pour stocker les boissons (ou plus généralement les produits vendus)
    * name:string => nom
    * price:decimal => prix
    * description:string => description
    * category:string? => catégorie de produit (bière / vin / ...)(faire une table pour ça ?)
    * picture_url:string => lien vers une image / une photo représentant le produit (définir un dossier où chercher les images par défaut)(il faudra probablement plusieurs tailles d'images différentes...)
    * last_update:datetime => date de dernière modif du produit dans la table (pour synchro avec l'app)
    * availability:boolean => disponibilité (pouvoir signaler qu'un produit est indisponible)

* "transactions" => 1 table par transaction (achat)
    * reference:? => référence des produits achetés (clé étrangère)
    * comments:string => commentaire pour le barman (avec/sans glaçons, au shaker, pas à la cuillère, ...)
    * price:decimal => prix (ne pas se fier à celui de la table des produits, car celui-ci a pu changer entre-temps)
    * date:datetime => date de la transaction
    * client_id:? => identifiant client (clé étrangère) ?
    * is_paid:boolean                => payé par le client
    * is_preparation_started:boolean => préparation de la commande lancée
    * is_preparation_done:boolean    => préparation de la commande terminée
    * is_served:boolean              => servi au client

* 1 table pour les clients ? Cela permettrait de faire des offres de fidélisation
    * identification: inscription / utilisation de cookies / adresse IP / via l'ID Paypal / ... ?



Gestion des droits
------------------

* un compte admin (root) pour nous les devs, accès en écriture à tout

* un compte "patron du bar":
    * accès en écriture à la table des boissons, pour qu'il puisse changer le prix, ajouter des nouveaux produits, ...
    * accès en lecture à la table des clients et des commandes

* un compte pour le barman / les serveurs:
    * accès en écriture à la table des transactions, pour pouvoir indiquer si la commande a été préparée, servie, ...
    * éventuellement accès en écriture à la table des boissons pour indiquer si une boisson devient indisponible (rupture de stock)

* l'accès des clients:
    * accès en lecture à la table des boissons
    * pas d'accès aux autres tables



Liens utiles
------------
* [liste des types en Rails](http://stackoverflow.com/questions/3260345/list-of-rails-model-types)

