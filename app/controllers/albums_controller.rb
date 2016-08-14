class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index]
  load_and_authorize_resource  
  def index
    @albums = current_user.albums.page(params[:page])
  end
  
  def new
    # @album = Album.new
  end
  
  def create
    # @album = Album.new(album_params)
    @album.user = current_user    
    if @album.save
      flash[:success] = t ".success"
      if params[:images]
        params[:images].each do |image|
          @album.photos.create(title: params[:album][:title], description: params[:album][:description], 
          image: image, user_id: current_user.id)
        end
      end
      redirect_to album_path(@album)
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end
  
  def show
    # @album = Album.find(params[:id])
  end
  
  def edit
    # @album = Album.find(params[:id])
  end
  
  def update
    # @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:success] = t ".success"
      if params[:images]
        params[:images].each do |image|
          @album.photos.create(title: params[:album][:title], description: params[:album][:description], 
          image: image, user_id: current_user.id)
        end
      end
      redirect_to album_path(@album)
    else
      flash[:danger] = t ".failed"
      render :edit
    end    
  end
  
  def destroy
    # @album = Album.find(params[:id])
    if @album.destroy
      flash[:success] = t ".success"
      redirect_to albums_path
    else
      flash[:danger] = t ".failed"
      redirect_to albums_path      
    end
  end
  
  private
    def album_params
      params.require(:album).permit(:title, :description, :photos)
    end  
end
