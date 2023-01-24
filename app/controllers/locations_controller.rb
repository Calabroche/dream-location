class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    @dream = Dream.find(params[:dream_id])
    @location.dream = @dream

    if @location.save!
      redirect_to dream_path(@dream), notice: "Location was successfully created."
    else
      render "dreams/show"
    end
  end

  def destroy
    @location.destroy
    redirect_to dream_path(@dream_id)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:starts_at, :ends_at)
  end


end
