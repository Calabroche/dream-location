class MeetingsController < ApplicationController
  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    # Or, for a weekly view:
    @meetings = Meeting.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meetings = Meeting.new
  end

  def create
    @dream = Dream.find(params[:dream_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.dream = @dream
    @meeting.user = current_user
    if @meeting.save
      redirect_to meetings_path
    else
      render "dreams/show"
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to @meeting
    else
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :start_time, :end_time)
  end
end
