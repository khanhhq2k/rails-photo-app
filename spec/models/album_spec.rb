require 'rails_helper'

RSpec.describe Album, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "Testing Album.title when other fields are all valid" do
    before(:each) do
      @album = Album.new(description: "sample description")
    end
    it "is valid with a title" do
      @album.title = "Khanh album"
      expect(@album).to be_valid
    end
    it "is not valid without a name" do
      @album.title = nil
      expect(@album).to_not be_valid
    end
    it "is not valid when title length is shorter than 5 chars" do
      @album.title = "abcd"
      expect(@album).to_not be_valid
    end
    it "is valid when title length is exact 5 chars" do
      @album.title = "abc12"
      expect(@album).to be_valid
    end
    it "is valid when title length is greater than 5 chars but less than 30 chars" do
      @album.title = "less than 30 characters"
      expect(@album).to be_valid
    end
    it "is NOT valid when title length is greater than 30 chars" do
      @album.title = "should be greater than 30 characters"
      expect(@album).to_not be_valid
    end     
  end
end
