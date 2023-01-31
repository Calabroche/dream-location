class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    @chatroom = Chatroom.find(params[:chatroom_id])
    @messages = Message.where(chatroom_id: @chatroom)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      render :show, status: :created
    else
      render :new, :unprocessable_entity
    end
  end


  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
