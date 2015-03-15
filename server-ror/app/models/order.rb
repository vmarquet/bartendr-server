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

	# before the creation, we set default values for tags
	before_create :set_default_values

	# if both "is_paid" and "is_served" are true, we archive the order
	before_save :archive_if_necessary


	private

	def archive_if_necessary
		if self.is_paid and self.is_served and self.archived_at == nil
			self.archived_at = DateTime.now
		end
	end

	# we set default values (don't accept the ones from the application user)
	def set_default_values
		self.is_paid = false
		self.is_served = false
		self.is_preparation_started = false
		self.is_preparation_done = false
		return true
	end

	def require_at_least_one_item
		errors.add(:base, "You must provide at least one item") if items.size < 1
	end
end
