class AddAttachmentPictureToCategories < ActiveRecord::Migration
  def self.up
    add_attachment :categories, :picture
  end

  def self.down
    remove_attachment :categories, :picture
  end
end
