class RemoveDistanceFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :distance
  end
end
