class AddTableNumberToOrders < ActiveRecord::Migration
  def self.up
    # bug if done in a single line, 
    # cf 2dn answer http://stackoverflow.com/questions/3170634
    add_column :orders, :table, :integer
    change_column :orders, :table, :integer, null: false
  end

  def self.down
    remove_column :orders, :table
  end
end
