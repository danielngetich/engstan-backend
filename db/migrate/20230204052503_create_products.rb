class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :imageurl
      t.string :description
      t.integer :price
      t.string :discount
      t.timestamps
    end
  end
end
