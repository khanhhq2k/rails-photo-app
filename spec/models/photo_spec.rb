require 'rails_helper'

RSpec.describe Photo, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "Testing Photo.title when other fields are all valid" do
    before(:each) do
      @photo = Photo.new(description: "sample description")
      @photo.image = File.new("app/assets/images/images.jpg")
    end
    it "is valid with a title" do
      @photo.title = "Khanh image"
      expect(@photo).to be_valid
    end
    it "is not valid without a name" do
      @photo.title = nil
      expect(@photo).to_not be_valid
    end
    it "is not valid when title length is shorter than 5 chars" do
      @photo.title = "abcd"
      expect(@photo).to_not be_valid
    end
    it "is valid when title length is exact 5 chars" do
      @photo.title = "abc12"
      expect(@photo).to be_valid
    end
    it "is valid when title length is greater than 5 chars but less than 30 chars" do
      @photo.title = "less than 30 characters"
      expect(@photo).to be_valid
    end
    it "is NOT valid when title length is greater than 30 chars" do
      @photo.title = "should be greater than 30 characters"
      expect(@photo).to_not be_valid
    end     
  end
  it "is NOT valid when image is missing" do
    @photo = Photo.new(title: "Photo title", description: "sample description") #no image attached yet
    expect(@photo).to_not be_valid
  end   
  it "is valid when image is attached" do
    @photo = Photo.new(title: "Photo title", description: "sample description")
    @photo.image = File.new("app/assets/images/images.jpg")
    expect(@photo).to be_valid
  end    
end
