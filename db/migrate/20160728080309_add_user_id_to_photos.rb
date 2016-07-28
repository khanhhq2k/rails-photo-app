class AddUserIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer
    add_column :photos, :album_id, :integer
  end
end
