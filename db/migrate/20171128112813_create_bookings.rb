class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.string :status, default: "Pending"
      t.date :date_from
      t.date :date_to
      t.integer :distance

      t.timestamps
    end
  end
end
