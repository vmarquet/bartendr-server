##########
# we want to redefine the way ActiveRecord should handle the price
# (because the way people will enter the price in the form depends on their country)
# to do this, we add a new method to String class and to ActiveRecord class
class String
  def to_delocalized_decimal
    delimiter = I18n::t('number.format.delimiter')
    separator = I18n::t('number.format.separator')
    self.gsub(/[#{delimiter}#{separator}]/, delimiter => '', separator => '.')
  end
end

class ActiveRecord::Base
  def self.attr_localized(*fields)
    fields.each do |field|
      define_method("#{field}=") do |value|
        self[field] = value.is_a?(String) ? value.to_delocalized_decimal : value
      end
    end
  end
end
# cf http://stackoverflow.com/questions/6541209/
##########


class Article < ActiveRecord::Base
  resourcify

  belongs_to :category
  accepts_nested_attributes_for :category
  validates_presence_of :category_id

  has_many :items

  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  # we add validations before adding entries to the database
  # see db/migrate/20141025154223_add_constraints_to_articles.rb

  # we check that string are not too long
  validates_length_of :name, maximum: 40
  validates_length_of :description, maximum: 255

  # we check that some fields aren't nil
  validates_presence_of :name, :price

  # we convert the input (see after in this file for the explanation about this)
  attr_localized :price

  # we check that the price is correct
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ },
            :numericality => {:greater_than => 0.0, :less_than => 999999.99}
  
end

