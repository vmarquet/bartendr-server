class AddAttachmentPictureToArticles < ActiveRecord::Migration
  def self.up
    remove_column :articles, :picture_url
    add_attachment :articles, :picture
  end

  def self.down
    remove_attachment :articles, :picture
    add_column :articles, :picture_url, :string
  end
end
