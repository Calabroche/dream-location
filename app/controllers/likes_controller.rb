class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @dream = Dream.find(params[:dream_id])
    current_user.likes.create(dream: @dream)
    redirect_to @dream
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to @like.dream
  end
end
