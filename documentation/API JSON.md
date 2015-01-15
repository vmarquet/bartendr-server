API JSON
========

Liste des catégories
--------------------

`GET /categories.json`

```
[
	{
		"id": 0,
		"name": "Bières",
		"picture": "..."
	},
	{
		"id": 1,
		"name": "Cocktails",
		"picture": "..."
	}
]
```

Nota bene: ici, l'id est le numéro de la ligne dans la table "categories".

Nota bene: étant donné qu'il est possible de supprimer une catégorie de la table des catégories, rien ne garantit que les id commencent à 0, et qu'ils se suivent tous avec un pas de 1.


Liste des articles d'une catégorie
----------------------------------

`GET /categories/[ID].json`

```
[
	{
		"id": 5,
		"name": "Bière blonde",
		"description": "Une bière blonde est une bière désignée ainsi de par sa couleur.",
		"price": 10.00,
		"size": "...",
		"picture": "..."
	},
	{
		"id": 6;
		"name": "Bière brune",
		"description": "La bière brune est une bière de couleur brune, du brun acajou au noir ébène, obtenue grâce à l'utilisation de malt plus ou moins torréfié.",
		"price": 9.00,
		"size": "...",
		"picture": "..."
	}
]
```

Nota bene: ici, l'id est le numéro de l'article dans la table "articles". De même que pour les catégories, rien ne garantit que l'ID commence à 0, ni qu'ils se suivent.

Nota bene: ces fichiers JSON ne contiendront que les articles étant disponibles, afin d'éviter de surcharger la bande passante. Le filtrage selon la disponibilité se fera donc côté serveur.


Envoyer la liste des articles commandés
---------------------------------------

Requête à faire: à définir. POST ?

```
{
	"table": 10,
	"articles": [
		5, 8, 12
	]
}
```

NB: si un même article est commandé plusieurs fois, juste mettre plusieurs fois d'affilée son id.


Comment accéder à l'API JSON (groupe appli mobile)
--------------------------------------------------
* lancer le serveur Rails
    1. faites un `git clone` ou un `git pull` pour récupérer la dernière version
    2. placez-vous dans le dossier `server-ror` et lancer le serveur: `rails s`
    3. en dev, le serveur tourne par défaut sur le port 3000 (http://localhost:3000)

* il vous suffit de faire une requête GET à l'adresse du fichier pour le récupérer. Exemple avec netcat:

```
netcat localhost 3000

GET /categories.json HTTP/1.1
Host: localhost
```


