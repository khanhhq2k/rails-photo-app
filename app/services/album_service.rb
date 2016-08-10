class AlbumService
  def initialize(album_params: nil, album_id: nil, current_user: nil)
    @album_params = album_params
    @album_id = album_id
    @current_user = current_user
  end
  
  def create_album
    @album = Album.new(@album_params)
    @album.user = @current_user
    result = {}
    byebug
    if @album.save
      if @album_params[:images]
        @album_params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end      
      result[:success] = I18n.t "albums.create.success"
    else
      result[:error] = "#{@album.errors.full_messages.to_sentence}"
    end
    result[:album] = @album
    result
  end
  
  
end