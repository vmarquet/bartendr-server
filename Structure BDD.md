Rajoutez ici vos idées concernant la structure de la base de données.


Structure
---------

* 1 table pour stocker les boissons (ou plus généralement les produits vendus)
    * nom
    * prix
    * lien vers une image / une photo représentant le produit

* 1 table par transaction (achat)
    * référence du produit acheté (clé étrangère)
    * prix (ne pas se fier à celui de la table des produits, car celui-ci a pu changer entre-temps)
    * date de la transaction
    * identifiant acheteur (clé étrangère) ?
    * booléen: payé ou non
    * booléen: servi ou non

* 1 table acheteur ? (identification: inscription / utilisation de cookies / adresse IP / ...)

