Structure
---------

* "articles" => 1 table pour stocker les boissons (ou plus généralement les produits vendus)
    * name:string => nom
    * price:decimal => prix (10 chiffres, dont 2 après la virgule)
        * ajouter `, :precision => 8, :scale => 2` dans le fichier db/migrate/... correspondant
    * description:string => description
    * category:string/references => catégorie de produit (bière / vin / ...)(faire une table pour ça ?)
    * picture_url:string => lien vers une image / une photo représentant le produit (définir un dossier où chercher les images par défaut)(il faudra probablement plusieurs tailles d'images différentes...)
    * availability:boolean => disponibilité (pouvoir signaler qu'un produit est indisponible)
    * autres colonnes qui seront crées automatiquement:
        * created_at:datetime => date de création
            * Automatically gets set to the current date and time when the record is first created.
        * updated_at:datetime => date de dernière modif du produit dans la table (pour synchro avec l'app)
            * Automatically gets set to the current date and time whenever the record is updated.

* "transactions" => 1 table par transaction (achat)
    * article_references:references => références des produits achetés (clé étrangère)
        * rajouter `has_many :articles` dans le code de la classe Transaction (?)
    * comments:string => commentaire pour le barman (avec/sans glaçons, au shaker, pas à la cuillère, ...)
    * price:decimal => prix (ne pas se fier à celui de la table des produits, car celui-ci a pu changer entre-temps)
    * created_at:datetime => date de la transaction
    * client_id:references => identifiant client (clé étrangère) ?
    * is_paid:boolean                => payé par le client
    * is_preparation_started:boolean => préparation de la commande lancée
    * is_preparation_done:boolean    => préparation de la commande terminée
    * is_served:boolean              => servi au client

* 1 table pour les clients ? Cela permettrait de faire des offres de fidélisation
    * identification: inscription / utilisation de cookies / adresse IP / via l'ID Paypal / ... ?
    * liste des commandes passées par le client: `has_many :transactions` (?)


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

* [tuto Active Records](http://guides.rubyonrails.org/active_record_basics.html) (gestion du M de MVC en Rails)
	* pour des explications sur le type "references" (associations entre tables), voir partie 6 [ici](http://guides.rubyonrails.org/getting_started.html)
    * pour des explications sur les associations entre tables, voir [ici](http://guides.rubyonrails.org/association_basics.html)

* tuto pour un système d'authentification: voir partie 9 [ici](http://guides.rubyonrails.org/getting_started.html)


