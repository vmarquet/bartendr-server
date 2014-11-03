class Item < ActiveRecord::Base
	belongs_to :order
	validates_presence_of :order
	# Nota bene: given that here we use `validates_presence_of :order`,
	# the order must have been recorded in the Order model
	# before we can add items to the order
	# cf http://stackoverflow.com/questions/2859384

	has_one :article
	validates_presence_of :article

	# TODO:
	# - il faudrait récupérer le prix de l'article et le copier dans la colonne prix
	#   de l'item avant de l'insérer dans la base
	# - et vérifier avant insertion qu'il n'est pas nul
	#   (dans le modèle + une migrations)

end
