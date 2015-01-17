class ChangeCategoryInArticles < ActiveRecord::Migration
  def up
  	# we suppress column "category" that was a string
    remove_column :articles, :category
    # we add a column "category_id" that is a reference to "categories" table
    # NB: WARNING: the column will be name "category_id", not just "category"
    add_reference :articles, :category, index: true
  end

  def down
    remove_index  :articles, :category_id
    remove_column :articles, :category_id
    add_column    :articles, :category, :string
  end
end
