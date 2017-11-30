class BookingsController < ApplicationController
skip_before_action :authenticate_user!, only: :new
before_action :set_booking, only: [:cancel, :show, :edit, :update, :destroy]

  def index
    @vehicle = Vehicle.find(params[:id])
    @bookings = Booking.where(vehicle: @vehicle)
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.vehicle = @vehicle
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

  def cancel
    @booking.status = "Cancelled"
    @booking.save
    redirect_to dashboard_path, notice: "Booking cancelled"
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
    params.require(:booking).permit(:status, :date_from, :date_to, :message)
  end
end
