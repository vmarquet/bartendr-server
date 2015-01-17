class Category < ActiveRecord::Base
	resourcify
	
	has_many :article, dependent: :destroy

	validates_length_of :name, maximum: 40
	validates_uniqueness_of :name
end
