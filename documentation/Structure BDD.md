Structure
---------

* "articles" => table pour stocker les boissons (ou plus généralement les produits) à vendre
    * __name__:string => nom
    * __category__:string/references => catégorie de produit (bière / vin / ...)(faire une table pour ça ?)
    * __description__:string => description
    * __price__:decimal => prix (10 chiffres, dont 2 après la virgule)
        * ajouter `, :precision => 8, :scale => 2` dans le fichier db/migrate/... correspondant
    * __picture_url__:string => lien vers une image / une photo représentant le produit (définir un dossier où chercher les images par défaut)(il faudra probablement plusieurs tailles d'images différentes...)
    * __availability__:boolean => disponibilité (pouvoir signaler qu'un produit est indisponible)
        

* "orders" => table pour stocker les commandes (achat de plusieurs items)
    * rajouter `has_many :items` ([cf doc](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many)) dans le code de la classe Transaction (transaction.rb)
    * __is_paid__:boolean                => payé par le client
    * __is_preparation_started__:boolean => préparation de la commande lancée
    * __is_preparation_done__:boolean    => préparation de la commande terminée
    * __is_served__:boolean              => servi au client
    * rajouter `belongs_to :client` => identifiant client (clé étrangère) ?
        * à rajouter quand on ajoutera une table "clients"


* "items" => table pour stocker la liste des articles commandés (plusieurs par transaction)
    * rajouter `belongs_to :order` ([cf doc](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-belongs_to)) dans le code de la classe Item (item.rb)
    * rajouter `has_one :article` => référence vers l'article commandé (clé étrangère)
    * __price__:decimal => prix (ne pas se fier à celui de la table Articles, car celui-ci a pu changer depuis le moment de la commande, et ça fausserait les stats)
    * __comments__:string => commentaire pour le barman (avec/sans glaçons, [au shaker, pas à la cuillère](https://www.youtube.com/watch?v=OUUq5mRCimo), ...)


* "clients" => table pour les clients ? Cela permettrait de faire des offres de fidélisation
    * identification: inscription / utilisation de cookies / adresse IP / via l'ID Paypal / ... ?
    * liste des commandes passées par le client: `has_many :transactions`


Nota Bene: pour toutes les tables, les 2 colonnes suivantes sont crées automatiquement:

* created_at:datetime => date de création
    * Automatically gets set to the current date and time when the record is first created.
* updated_at:datetime => date de dernière modif du produit dans la table (utile pour synchro avec l'app)
    * Automatically gets set to the current date and time whenever the record is updated.



Liens utiles
------------
* [liste des types en Rails](http://stackoverflow.com/questions/3260345/list-of-rails-model-types)

* [tuto Active Records](http://guides.rubyonrails.org/active_record_basics.html) (gestion du M de MVC en Rails)
	* pour des explications sur le type "references" (associations entre tables), voir partie 6 [ici](http://guides.rubyonrails.org/getting_started.html)
    * pour des explications sur les associations entre tables, voir [ici](http://guides.rubyonrails.org/association_basics.html)

