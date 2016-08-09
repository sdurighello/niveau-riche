class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :submarine, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.integer :total_price

      t.timestamps
    end
  end
end
