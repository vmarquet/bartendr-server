Comment faire un select dans un formulaire avec Rails
-----------------------------------------------------

NB: ce que j'appelle un formulaire select est un menu déroulant dans lequel vous pouvez choisir une seule option.

Etant donné qu'il n'y a pas de doc claire sur la manière de faire un formulaire SELECT avec Rails, je fais un mini-tuto ici, d'après ce que j'ai compris.

Il y a 3 méthodes différentes pour générer un formulaire SELECT avec Rails:

* `select`
* `select_tag`
* `collection_select`

### select_tag

`select_tag` sert quand on hardcode les options dans le code HTML du formulaire.

Exemple: `<%= select_tag :category, options_for_select([['Lisbon', 1], ['Madrid', 2]]) %>`

### collection_select

`collection_select` ne sert que dans le cas où on récupère les options dans une BDD.

Prototype: `collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})`

Explications:

* arg1 et arg2 servent pour le tag HTML name: `name="arg1[arg2]"`
* arg3 sert pour récupérer des lignes dans une base afin de constituer les options
* arg4 -> le nom de la colonne de arg3 à utiliser pour la valeur de l'option HTML
* arg5 -> le nom de la colonne de arg3 à utiliser pour le texte de l'option HTML

exemple: `collection_select(:post, :author_id, Author.all, :id, :name_with_initial, prompt: true)`:

```
<select name="post[author_id]">
	<option value="">Please select</option>
	<option value="1" selected="selected">D. Heinemeier Hansson</option>
	<option value="2">D. Thomas</option>
	<option value="3">M. Clark</option>
</select>
```

### select

`select` sert quand les options du formulaire ne viennent pas d'une base de données, mais d'un array Ruby.



Sources
-------
* [doc officielle](http://guides.rubyonrails.org/form_helpers.html) (voir partie 3)
* http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html

* [doc select](http://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/select)
* [doc collection_select](http://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select)

* http://ashleyangell.com/2009/11/form-select-helper-in-ruby-on-rails/

* http://stackoverflow.com/questions/14113057/how-to-have-a-drop-down-select-field-in-a-rails-form
* http://stackoverflow.com/questions/1728593/rails-collection-select-vs-select

