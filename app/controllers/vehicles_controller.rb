class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @user = current_user
    @vehicule.user = @user
    @vehicle = Vehicle.new(vehicle_params)
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
    if @vehicule.bookings.nil?
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

  def vehicle_params
    params.require(:vehicle).permit(:price, :availability, :kms, :brand, :model, :description, :cc, :photo)
  end
end
