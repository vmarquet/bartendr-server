class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :is_paid
      t.boolean :is_preparation_started
      t.boolean :is_preparation_done
      t.boolean :is_served

      t.timestamps
    end
  end
end
