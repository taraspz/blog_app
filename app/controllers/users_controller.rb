class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    @images = @user.images.order(created_at: :desc)
  end


  def index
    following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)
    following_ids << current_user.id
    @users = User.where.not(id: following_ids)
  end

  def follow_user
    follower_id = params[:follow_id]
    if Follower.create!(follower_id: current_user.id, following_id: follower_id)
    flash[:success] = "You followed"
    else
    flash[:danger] = "You didn`t follow"
    end
  end
end
