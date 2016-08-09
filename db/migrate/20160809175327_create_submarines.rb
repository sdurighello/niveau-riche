class CreateSubmarines < ActiveRecord::Migration[5.0]
  def change
    create_table :submarines do |t|
      t.string :name
      t.string :type_submarine
      t.integer :price_day
      t.string :image_url
      t.text :description
      t.integer :max_number_of_guests
      t.references :port, foreign_key: true

      t.timestamps
    end
  end
end
