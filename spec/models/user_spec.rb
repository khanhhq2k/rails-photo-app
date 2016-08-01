require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "Testing User.name when other fields are all valid" do
    before(:each) do
      @user = User.new(email: "khanh@gmail.com", password: "123456")
    end
    it "is valid with a name" do
      @user.name = "Khanh"
      expect(@user).to be_valid
    end
    it "is not valid without a name" do
      @user.name = ""
      expect(@user).to_not be_valid
    end
    it "is not valid when name length is shorter than 5 chars" do
      @user.name = "abcd"
      expect(@user).to_not be_valid
    end
    it "is valid when name length is exact 5 chars" do
      @user.name = "khanh"
      expect(@user).to be_valid
    end
    it "is valid when name length is greater than 5 chars" do
      @user.name = "khanhhq2k"
      expect(@user).to be_valid
    end    
  end
  
  context "Testing User.email when other fields are all valid" do
    before(:each) do
      @user = User.new(name: "khanh", password: "123456")
    end
    it "is valid with a well formed email" do
      @user.email = "khanh@gmail.com"
      expect(@user).to be_valid
    end
    it "is not valid without a email" do
      @user.email = ""
      expect(@user).to_not be_valid
    end
    it "is not valid when email has wrong format" do
      @user.email = "abcd.gmail.com"
      expect(@user).to_not be_valid
    end
  end
  
  context "Testing User.password when other fields are all valid" do
    before(:each) do
      @user = User.new(email: "khanh@gmail.com", name: "khanhhq")
    end
    it "is valid with a password" do
      @user.password = "Khanh123456"
      expect(@user).to be_valid
    end
    it "is not valid without a password" do
      @user.password = ""
      expect(@user).to_not be_valid
    end
    it "is not valid when password length is shorter than 6 chars" do
      @user.password = "abc12"
      expect(@user).to_not be_valid
    end
    it "is valid when password length is exact 6 chars" do
      @user.password = "abc123"
      expect(@user).to be_valid
    end    
    it "is valid when password length is greater 6 chars" do
      @user.password = "khanhhq2k123456"
      expect(@user).to be_valid
    end    
  end
end
