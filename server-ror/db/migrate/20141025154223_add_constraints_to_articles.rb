class AddConstraintsToArticles < ActiveRecord::Migration
  def change
    # we don't allow some columns to be null
    change_column_null :articles, :name, false
    change_column_null :articles, :price, false
    change_column_null :articles, :availability, false

    # we set size limits
    change_column :articles, :name, :string, :limit => 40
    change_column :articles, :description, :string, :limit => 255
    change_column :articles, :category, :string, :limit => 40
    change_column :articles, :picture_url, :string, :limit => 255
    
    # we set the default value for the availability column
    change_column_default :articles, :availability, true
  end
end
