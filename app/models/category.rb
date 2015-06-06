class Category < ActiveRecord::Base
  resourcify

  has_many :article, dependent: :destroy
  has_attached_file :picture

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  validates_length_of :name, maximum: 40
  validates_uniqueness_of :name
end
