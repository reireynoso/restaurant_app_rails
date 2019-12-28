class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :street_address
      t.string :latitude
      t.string :longitude
      t.integer :price_rating
      t.string :media_image
      t.string :logo

      t.timestamps
    end
  end
end
