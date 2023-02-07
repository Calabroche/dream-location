class DreamsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  # before_action :set_dream, only: %i[show edit update destroy]

  def index
    @dreams = Dream.all

    # params[:origin].present? ? Dream.where(origin: params[:origin]) :
    results = FilterDreamsService.new(params[:regions]).call
    puts params["regions"]
    @dreams = results

    #ici je filtre les dreams
    @dreams = Dream.where('name ilike ?', "%#{params[:name]}%") if params[:name].present?
    render(partial: 'dreams', locals: { dreams: @dreams })

    # if params[:query].present?
    #   @dreams = Dream.where("name ILIKE ?", "%" + params[:query] + "%")
    # end

    @markers = @dreams.geocoded.map do |dream|
      puts dream.name
      {
        lat: dream.latitude,
        lng: dream.longitude,
        id: dream.id,
        info_window: render_to_string(partial: "info_window", locals: {dream:dream}),
      }
    end
  end

  # def search
  #   @dreams = Dream.where("name LIKE?", "%" + params[:q] + "%")
  # end

  # def list
  #   session['filters'] = {} if session['filters'].blank?

  #   session['filters'].merge!(filter_params)
  #   dreams = Dream.includes(:name)

  #   render(partial: 'dreams', locals: { dreams: dreams })
  # end

  def show
    @dream = Dream.find(params[:id])
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
    params.require(:dream).permit(:name, :description, :address, :activity, :region, :img_url_one, :img_url_two)
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end

end
