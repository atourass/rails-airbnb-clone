class ChangeColumnAvailabilityToVehicle < ActiveRecord::Migration[5.0]
  def change
    change_column :vehicles, :availability, :boolean, default: true
  end
end
