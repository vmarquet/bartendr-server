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

```
POST /orders.json HTTP/1.1
Accept: application/json
Content-type: application/json
Content-length: 164

{
	"order": {
		"table": 10,
		"items_attributes": [
			{
				"article_id": 5,
				"comments": "au shaker"
			},
			{
				"article_id": 8,
				"comments": "pas à la cuillère"
			}
		]
	}
}
```

NB: si un même article est commandé plusieurs fois, créer plusieurs items différents, c'est plus simple à gérer en Rails que de préciser le nombre pour chaque.

NB: ATTENTION: pour un caractère non ASCII, il faut compter le nombre d'octets qu'il prend dans le `Content-length`, pas juste 1, par exemple `à` ou `è` prenne chacun 2 octets en UTF8. Si le `Content-length:` n'est pas valide, le parsing côté serveur va échouer, et la commande sera rejetée (`400 Bad Request`).


Comment accéder à l'API JSON (groupe appli mobile)
--------------------------------------------------
* lancer le serveur Rails
    1. faites un `git clone` ou un `git pull` pour récupérer la dernière version
    2. placez-vous dans le dossier `server-ror` et lancer le serveur: `rails s`
    3. en dev, le serveur tourne par défaut sur le port 3000 (http://localhost:3000)


Exemples avec netcat
--------------------

### Récupérer la liste des articles / catégories

```
netcat localhost 3000

GET /categories.json HTTP/1.1
Host: localhost
```

### Envoyer une commande

Mettre toute la requête HTTP (POST + headers + JSON) dans un fichier `request.txt`. Exemple: voir plus haut "Envoyer la liste des articles commandés".

```
cat request.txt | netcat localhost 3000
```


