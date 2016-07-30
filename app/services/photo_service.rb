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
    result = {}
    if @photo.update(@photo_params)
      result[:success] = I18n.t "photos.update.success"
    else
      result[:error] = "#{@photo.errors.full_messages.to_sentence}"
    end
    result[:photo] = @photo
    result
  end
  
  def delete_photo
    @photo = Photo.find(@photo_id)
    result = {}
    if @photo.destroy
      result[:success] = I18n.t "photos.destroy.success"
    else
      result[:error] = "#{@photo.errors.full_messages.to_sentence}"
    end
    result[:photo] = @photo
    result
  end
  
end