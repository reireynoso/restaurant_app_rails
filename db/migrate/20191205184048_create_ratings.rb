class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :number
      t.integer :user_id
      t.integer :dish_id

      t.timestamps
    end
  end
end
