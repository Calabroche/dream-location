class DreamsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  # before_action :set_dream, only: %i[show edit update destroy]

  def index
    @dreams = Dream.all
    # params[:origin].present? ? Dream.where(origin: params[:origin]) :

    @markers = Dream.geocoded.map do |dream|
      {
        lat: dream.latitude,
        lng: dream.longitude
      }
    end
  end

  def show
    @location = Location.new
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    if @dream.save
      redirect_to dreams_path(@dream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)
      redirect_to dreams_path(@dream), notice: "dream was successfully updated."
    else
      render :edit, notice: "dreams was not updated."
    end
  end

  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy
    redirect_to dreams_path, notice: "dreams was successfully destroyed."
  end

  private

  def dream_params
    params.require(:dream).permit(:name, :description, :address, :activity, :region, :img_url)
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end

end
