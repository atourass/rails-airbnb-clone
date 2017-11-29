class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :set_user_details, only: [:show, :update]
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @user = current_user
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = @user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle)
    else
      render :edit
    end
  end

  def destroy
    if @vehicle.bookings.nil?
      @vehicle.destroy
      redirect_to vehicles_path
    else
      raise "Cannot delete vehicle with bookings"
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def set_user_details
    @user = User.find(@vehicle.user_id)
  end

  def vehicle_params
    params.require(:vehicle).permit(:price, :availability, :kms, :brand, :model, :description, :cc, :photo)
  end
end
