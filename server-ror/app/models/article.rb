class Article < ActiveRecord::Base
	# we add validations before adding entries to the database
	# see db/migrate/20141025154223_add_constraints_to_articles.rb

	# we check that string are not too long
	validates_length_of :name, maximum: 40
	validates_length_of :description, maximum: 255
	validates_length_of :category, maximum: 40
	validates_length_of :picture_url, maximum: 255

	# we check that some fields aren't nil
	validates_presence_of :name, :price

	# we check that the price is correct
	validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ },
	          :numericality => {:greater_than => 0.0, :less_than => 999999.99}
	

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

