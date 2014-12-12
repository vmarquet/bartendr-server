API JSON
========

Liste des catégories
--------------------

`GET /categories.md`

```
{
	[
		{
			id: 0,
			name: "Bières",
			picture: "..."
		},
		{
			id: 1,
			name: "Cocktail",
			picture: "..."
		}
	]
}
```

Nota bene: ici, l'id est le numéro de la ligne dans la table "categories".


Liste des articles d'une catégorie
----------------------------------

`GET /categories/[ID].json`

```
{
	[
		{
			name: "Bière blonde",
			price: 10.00,
			size: "...",
			picture: "..."
		},
		{
			name: "Bière brune",
			price: 9.00,
			size: "...",
			picture: "..."
		}
	]
}
```

Nota bene: ces fichiers JSON ne contiendront que les articles étant disponibles, afin d'éviter de surcharger la bande passante. Le filtrage selon la disponibilité se fera donc côté serveur.



