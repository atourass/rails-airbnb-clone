class DashboardController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @bookings = Booking.where(user: current_user)
  end
end


