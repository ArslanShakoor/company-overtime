require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user= FactoryGirl.create(:user)
  end  
  describe "creation" do
   	 
    it "can be created" do
      expect(@user).to be_valid	
    end
    it "cannot be created without first_name and last_name, phone_no"	do
   
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end	
     it "cannot be created without email"  do
   
      @user.phone_no = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created with dashes or any special character" do
      @user.phone_no = "123-32234-32"
      expect(@user).to_not be_valid
    end
    
    it "cannot be created if its length is not equal to 10 character" do
      @user.phone_no = "12345678900"
      expect(@user).to_not be_valid
    end    
  end 
  describe "methods" do
    it "should provide full name" do
      expect(@user.full_name).to eq("SNOW, JOHN")  
    end  
  end
end


