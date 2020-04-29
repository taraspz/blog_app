class LikesController < ApplicationController
   before_action :find_post
   before_action :find_like, only: [:destroy]



  def create
  if already_liked?
    flash[:notice] = "You can't like more than once"
  else
    @image.likes.create(user: current_user)
  end
  redirect_to images_path
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to images_path
  end

  def find_like
   @like = @image.likes.find(params[:id])
 end
  private

  def find_post
    @image = Image.find(params[:image_id])
  end

  def already_liked?
    Like.where(user: current_user, image_id:
    params[:image_id]).exists?
  end

end
