class UsersController < ApplicationController
  def index
    @photos = current_user.photos.page(params[:page])
  end
end