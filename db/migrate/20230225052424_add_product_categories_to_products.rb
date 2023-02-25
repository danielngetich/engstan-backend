class AddProductCategoriesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :plain_product, :boolean
    add_column :products, :branded_product, :boolean
  end
end
