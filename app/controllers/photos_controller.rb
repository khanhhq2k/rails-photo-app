class PhotosController < ApplicationController
  
  def create
    @photo = PhotoService.new(photo_params: photo_params, current_user: current_user).create_photo
    if @photo.id?
      flash[:success] = "Photo created!"
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
    @photos = Photo.public_photos.page(params[:page])
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
          flash.now[:success] = @result[:success]
          redirect_to photo_path(@result[:photo])
        else
          flash.now[:danger] = result[:error]
          @photo  =  @result[:photo]
          render :edit
        end
      }
    end
      

   
    # @photo = Photo.find(params[:id])
    # @photo = PhotoService.new(photo_params: photo_params, photo_id: params[:id], current_user: current_user).update_photo
    # if @photo == false
    #   flash.now[:danger] = "Unable to update photo!"
    #   render :edit
    # else
    #   flash[:success] = "Photo Updated!"
    #   redirect_to root_path
    # end    
  end  
  
  def show
    @photo = Photo.find(params[:id])
  end
  

  
  def destroy
    
  end
  
  private
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end
  
end
