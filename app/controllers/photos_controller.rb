class PhotosController < ApplicationController
  
  def create
    @photo = PhotoService.new(photo_params: photo_params, current_user: current_user).create_photo
    if @photo.id?
      flash[:success] = "Photo created!"
      redirect_to root_path
    else
      flash.now[:danger] = "#{@photo.errors.full_messages.to_sentence}"
      render :new
    end 
  end
  
  def new
    @photo = Photo.new
  end
  
  def index
    @photo = Photo.all
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = PhotoService.new(photo_params: photo_params, photo_id: params[:id], current_user: current_user).update_photo
    if @photo.changed?
      flash[:success] = "Photo Updated!"
      redirect_to root_path
    else
      flash.now[:danger] = "#{@photo.errors.full_messages.to_sentence}"
      render :edit
    end    
  end  
  
  def show
    
  end
  

  
  def destroy
    
  end
  
  private
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end
  
end
