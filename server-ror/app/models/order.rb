class Order < ActiveRecord::Base
	resourcify

	has_many :items, dependent: :destroy
end
