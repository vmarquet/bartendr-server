class AddAssociationsBetweenItemsAndOrders < ActiveRecord::Migration
  def change
    # in the items table, we add some references to other tables
    add_reference :items, :order, index: true
    add_reference :items, :article, index: true

    # NB: c'est une syntaxe équivalente à ajouter les colonnes suivantes à la table Items:
    # t.references :order
    # t.references :article
  end
end
