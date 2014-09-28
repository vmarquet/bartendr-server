Idées concernant la structure de la base de données.


Structure
---------

* 1 table pour stocker les boissons (ou plus généralement les produits vendus)
    * nom
    * prix
    * description
    * catégorie de produit (bière / vin / ...)
    * lien vers une image / une photo représentant le produit
    * date de dernière modif du produit dans la table (pour synchro avec l'app)

* 1 table par transaction (achat)
    * référence du produit acheté (clé étrangère)
    * prix (ne pas se fier à celui de la table des produits, car celui-ci a pu changer entre-temps)
    * date de la transaction
    * identifiant client (clé étrangère) ?
    * booléen: payé ou non
    * booléen: servi ou non

* 1 table pour les clients ? Cela permettrait de faire des offres de fidélisation
    * identification: inscription / utilisation de cookies / adresse IP / via l'ID Paypal / ... ?

