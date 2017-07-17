require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "creation" do 
		before do
      user =  FactoryGirl.create(:user)
			@post = FactoryGirl.create(:post)
		end	

	  it "can be created" do
	     expect(@post).to be_valid
	  end
	  it "can not be created" do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil
      expect(@post).to_not be_valid
	  end	
   
    it "has overtime request greater than 0.0" do
      @post.overtime_request = 0
      expect(@post).to_not be_valid()
    end 
  end

end
