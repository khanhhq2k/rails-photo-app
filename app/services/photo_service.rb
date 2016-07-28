class PhotoService
  def initialize(photo_params: nil, photo_id: nil, current_user: nil)
    @photo_params = photo_params
    @photo_id = photo_id
    @current_user = current_user
  end
  
  def create_photo
    @photo = Photo.new(@photo_params)
    @photo.user = @current_user
    @photo.save
    @photo
  end
  
  def update_photo
    @photo = Photo.find(@photo_id)
    @photo.update(@photo_params)
    @photo
  end
  
end