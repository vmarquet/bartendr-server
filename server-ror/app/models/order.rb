class Order < ActiveRecord::Base
	resourcify

	# NB: inverse_of is very important, cf http://stackoverflow.com/questions/16782990
	# and http://stackoverflow.com/questions/9296694
	has_many :items, dependent: :destroy, :inverse_of => :order
	accepts_nested_attributes_for :items

	# a command without any item is pointless
	validate :require_at_least_one_item

	# we check that the fields are what they are expected to be
	validates_presence_of :table
	validates_numericality_of :table, :integer_only => true

	# right after the creation, we set default values for tags
	after_create :set_default_values

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
