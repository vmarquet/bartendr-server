class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :description
      t.string :category
      t.string :picture_url
      t.boolean :availability

      t.timestamps
    end
  end
end
