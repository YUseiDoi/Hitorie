class CreateAddImageToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :add_image_to_users do |t|
      t.string :image

      t.timestamps
    end
  end
end
