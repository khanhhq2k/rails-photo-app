class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @photos = current_user.photos.page(params[:page])
  end
  
  def manage
    @users = User.all_except(current_user.id)
  end
  def toggle
    @user = User.find(params[:id])
    @user.toggle!(:active)
    flash[:success] = t '.toggle_message'
    redirect_to manage_users_path
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = t '.destroy_user_message'
    redirect_to manage_users_path
  end
end