class AddMessageToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :message, :string
  end
end
