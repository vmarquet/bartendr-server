class AddArchivedDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :archived_date, :datetime
  end
end
