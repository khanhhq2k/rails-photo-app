class PhotosController < ApplicationController
  
  def index
    
  end
  
  def create
    
  end
  
  def new
    
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end
  
end
