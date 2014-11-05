class Item < ActiveRecord::Base
	belongs_to :order
	validates_presence_of :order
	# Nota bene: given that here we use `validates_presence_of :order`,
	# the order must have been recorded in the Order model
	# before we can add items to the order
	# cf http://stackoverflow.com/questions/2859384

	belongs_to :article
	validates_presence_of :article
	validates_presence_of :article_id

	# we use ActiveRecord callbacks to copy the price of the article
	# (we must save a copy of the price, in case the bartender changes the prices)
	before_save do
		|item| item.price = Article.find(item.article_id).price
	end
	# cf http://stackoverflow.com/questions/1187138
	# et http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html

end
