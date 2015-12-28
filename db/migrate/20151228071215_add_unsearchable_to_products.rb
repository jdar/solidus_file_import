class AddUnsearchableToProducts < ActiveRecord::Migration
  def change
    add_column :products, :searchable, :boolean
  end
end
