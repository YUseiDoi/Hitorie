class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :rank
      t.text :intro
      t.string :atmos
      t.integer :genre_id
      t.integer :user_id
      t.integer :price_id

      t.timestamps
    end
  end
end
