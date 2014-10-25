class AddConstraintsToArticles < ActiveRecord::Migration
  def change
  	# cf http://guides.rubyonrails.org/migrations.html#using-the-change-method

    ##########
    # Nota bene: d'après http://railsguides.net/change-data-in-migrations-like-a-boss/
    # il est peu conseillé de faire des modifs de la base de données 
    # (ce que je fais avec Ruby dans les lignes suivantes) depuis les 
    # fichiers de migration, mais:
    # 1) Je ne vois pas comment faire autrement de manière simple
    # 2) Je ne comprends pas pourquoi ça planterait, étant donné que les migrations
    #    se font dans l'ordre dans lequel elles ont été écrites
    ##########

    ##########
    # Nota bene 2: la migration ne suffit pas pour assurer que les contraintes 
    # sont respectées, il faut aussi mettre des validations dans le modèle
    # cf http://stackoverflow.com/questions/26565906/
    ##########


  	##### we add 'NOT NULL' constraint to some columns:
    # 1) we must first remove all database entries where the colum is null
    #    this can be done with Ruby code
    # 2) and then we can add the constraint

    # for each article already in the database, we replace null columns by something
    Article.find_each do |article|
      if article.name == nil
        article.name = ""  # I guess that an empty string is different from nil
      end

      if article.price == nil
        article.price = 999999.99  # maximum value
      end

      if article.availability == nil
        article.availability = true
      end

      article.save!  # we save into the database
    end

    # now we can actually update the database
    change_column_null :articles, :name, false
    change_column_null :articles, :price, false
    change_column_null :articles, :availability, false
    ##########


    ##### we limit the size of strings
    # as for the change above, we must convert database entries to follow the new rule
    # and then we can change the columns type
    # cf http://stackoverflow.com/questions/3484249

    # for each article, we truncate the string fields
    Article.find_each do |article|
      if article.name.length > 40
        article.name = truncate(article.name, :length => 40)
      end

      if article.description.length > 255
        article.description = truncate(article.description, :length => 255)
      end

      if article.category.length > 40
        article.category = truncate(article.category, :length => 40)
      end

      if article.picture_url.length > 255
        article.picture_url = truncate(article.picture_url, :length => 255)
      end

      article.save!  # we save into the database
    end

    # we apply the changes to the database
    change_column :articles, :name, :string, :limit => 40
    change_column :articles, :description, :string, :limit => 255
    change_column :articles, :category, :string, :limit => 40
    change_column :articles, :picture_url, :string, :limit => 255
    ##########


    # we set the default value for the availability column
    change_column_default :articles, :availability, true
  end
end
