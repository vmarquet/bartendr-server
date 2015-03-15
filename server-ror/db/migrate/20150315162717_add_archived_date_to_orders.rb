class AddArchivedDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :archived_at, :datetime
  end
end
