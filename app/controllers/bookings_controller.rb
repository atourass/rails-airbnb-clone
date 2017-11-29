class BookingsController < ApplicationController
skip_before_action :authenticate_user!, only: :new
before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :message)
  end
end
