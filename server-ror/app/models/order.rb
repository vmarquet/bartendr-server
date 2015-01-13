class Order < ActiveRecord::Base
	resourcify

	has_many :items, dependent: :destroy
	after_initialize :set_default_values  # method set_default_values will be called after initialization

	# we set default values if fields are empty
	def set_default_values
		self.is_paid ||= false
		self.is_served ||= false
		self.is_preparation_started ||= false
		self.is_preparation_done ||= false
	end
end
