class DashboardController < ApplicationController
  def index
    @my_bookings = current_user.bookings
    @customer_bookings = current_user.demands
  end
end


