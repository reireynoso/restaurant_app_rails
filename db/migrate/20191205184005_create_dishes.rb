class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
