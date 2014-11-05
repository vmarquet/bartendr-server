Comment récupérer la liste des articles en vente
------------------------------------------------
* lancer le serveur Rails
    1. faites un `git clone` ou un `git pull` pour récupérer la dernière version
    2. placez-vous dans le dossier `server-ror` et lancer le serveur: `rails s`

* la page du serveur qui renvoie le contenu de la table Articles au format [JSON](http://fr.wikipedia.org/wiki/JavaScript_Object_Notation#Exemple) est /articles.json
    * le serveur tournant par défaut sur le port 3000, cette page sera à l'adresse http://localhost:3000/articles.json
    * NB: cette page est en accès libre, pas besoin d'authentification

* il vous suffit de faire une requête GET à cette adresse pour récupérer le fichier JSON. Exemple avec netcat:
```
netcat localhost 3000

GET /articles.json HTTP/1.1
Host: localhost
```

* pour connaître la liste des clés (JSON = paires clé/valeur), voir le nom des colonnes dans la table articles dans [ce fichier](server-ror/db/schema.rb). Les colonnes principales sont:
    * name: le nom de la boisson
    * category: la catégorie de la boisson (bière / cocktail / ...)
        * voir [ici](server-ror/app/models/article.rb) pour les catégories possibles
    * description: la description de la boisson (max 255 caractères)
    * availability: si la boisson est dispo en stocks ou pas
