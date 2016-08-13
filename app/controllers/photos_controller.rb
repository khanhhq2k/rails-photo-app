class PhotosController < ApplicationController
  before_action :authenticate_user!, only: :new
  load_and_authorize_resource
  def create
    @photo = PhotoService.new(photo_params: photo_params, current_user: current_user).create_photo
    if @photo.id?
      flash[:success] = t ".success"
      redirect_to photo_path(@photo)
    else
      flash.now[:danger] = "#{@photo.errors.full_messages.to_sentence}"
      render :new
    end 
  end
  
  def new
    @photo = Photo.new
  end
  
  def index
    @photos = (current_user.admin) ? @photos = Photo.page(params[:page]) : @photos = Photo.public_photos.page(params[:page])
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @result = PhotoService.new(photo_params: photo_params, photo_id: params[:id], current_user: current_user)
                            .update_photo
    respond_to do |format|
      format.html {
        if @result[:success]
          flash[:success] = @result[:success]
          redirect_to photo_path(@result[:photo])
        else
          flash[:danger] = result[:error]
          @photo = @result[:photo]
          render :edit
        end
      }
    end
  end  
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def destroy
    @result = PhotoService.new(photo_id: params[:id])
                            .delete_photo
    respond_to do |format|
      format.html {
        if @result[:success]
          flash[:success] = @result[:success]
          redirect_to photos_path
        else
          flash[:danger] = result[:error]
        end
      }
    end
  end
  
  private
    def photo_params
      params.require(:photo).permit(:title, :description, :image, :public)
    end
  
end
