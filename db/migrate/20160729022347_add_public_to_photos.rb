class AddPublicToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :public, :boolean, default: true
  end
end
