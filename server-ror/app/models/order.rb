class Order < ActiveRecord::Base
	resourcify

	# NB: inverse_of is very important, cf http://stackoverflow.com/questions/16782990
	# and http://stackoverflow.com/questions/9296694
	has_many :items, dependent: :destroy, :inverse_of => :order
	accepts_nested_attributes_for :items

	after_initialize :set_default_values  # method set_default_values will be called after initialization

	validate :require_at_least_one_item


	private

	# we set default values if fields are empty
	def set_default_values
		self.is_paid ||= false
		self.is_served ||= false
		self.is_preparation_started ||= false
		self.is_preparation_done ||= false
	end

	def require_at_least_one_item
		errors.add(:base, "You must provide at least one item") if items.size < 1
	end
end
