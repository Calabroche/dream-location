class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all

  end

  def show
    @chatroom = Chatroom.find(params[:id])
    puts "Chatroom: #{@chatroom.inspect}"
    @message = Message.new

    @messages = Message.where(chatroom: @chatroom)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new, :unprocessable_entity
    end
  end


  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
