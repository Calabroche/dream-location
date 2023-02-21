class LikesController < ApplicationController
  before_action :find_dream, only: [:create, :destroy]
  before_action :find_like, only: [:destroy]

 def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @dream.likes.create(user_id: current_user.id)
    end
    redirect_to dream_path(@dream)
 end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like = @dream.likes.find(params[:id])
      @like.destroy
  end
  redirect_to dream_path(@dream)
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

 private

 def find_dream
   @dream = Dream.find(params[:dream_id])
 end

 def already_liked?
  Like.where(user_id: current_user.id, dream_id:
  params[:dream_id]).exists?
 end


end
