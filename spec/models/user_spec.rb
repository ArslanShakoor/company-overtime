require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user= User.create(email: "example1@exmaple.com",password: "fanihoja", password_confirmation:
    "fanihoja", first_name: "arslan", last_name: "shakoor")
  end  
  describe "creation" do
   	 
    it "can be created" do
      expect(@user).to be_valid	
    end
    it "cannot be created without first_name and last_name"	do
   
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end	
  end 
  describe "methods" do
    it "should provide full name" do
      expect(@user.full_name).to eq("SHAKOOR, ARSLAN")  
    end  
  end
end


