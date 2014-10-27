class Article < ActiveRecord::Base
	# we add validations before adding entries to the database
	# see db/migrate/20141025154223_add_constraints_to_articles.rb

	# we check that string are not too long
	validates_length_of :name, maximum: 40
	validates_length_of :description, maximum: 255
	validates_length_of :category, maximum: 40
	validates_length_of :picture_url, maximum: 255

	# we check that some values aren't nil
	validates :name, presence: true
	validates :price, presence: true
	validates :availability, presence: true


	# declaration of class methods
	class << self
		# the list of categories we suggest to the user
		def categoryList
			categories = [
				"Apéritif",
				"Bière",
				"Café",
				"Cocktail",
				"Digestif",
				"Soda",
				"Vin",
				"Autres"
			]
			return categories
		end
		# Nota Bene: this list is only used to suggest options to the user.
		# When inserting articles into the database, we do not check that the
		# article category is in this list
	end
	
end
