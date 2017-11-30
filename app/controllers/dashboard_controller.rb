class DashboardController < ApplicationController
  def index
    @my_bookings = current_user.bookings
    @my_vehicles = current_user.vehicles
    @customer_bookings = current_user.demands
  end
end


