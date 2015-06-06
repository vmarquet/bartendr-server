class AddApprovedToUser < ActiveRecord::Migration
  # cf https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in
  def self.up
    add_column :users, :approved, :boolean, :default => false, :null => false
    add_index  :users, :approved
  end

  def self.down
    remove_index  :users, :approved
    remove_column :users, :approved
  end
end