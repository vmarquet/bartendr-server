class AddNameToUsers < ActiveRecord::Migration
  def self.up
    # bug if done in a single line, 
    # cf 2dn answer http://stackoverflow.com/questions/3170634

    add_column    :users, :first_name, :string
    change_column :users, :first_name, :string, null: false

    add_column    :users, :last_name, :string
    change_column :users, :last_name, :string, null: false
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
