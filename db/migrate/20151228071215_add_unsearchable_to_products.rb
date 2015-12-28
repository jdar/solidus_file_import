class AddUnsearchableToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :unsearchable, :boolean

    #TODO: add a 'partial index' if the active inventory becomes a subset of the total inventory.
    #add_index "spree_products", ["unsearchable"], name: "index_spree_products_on_unsearchable"
  end
end
