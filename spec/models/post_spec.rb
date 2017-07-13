require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "creation" do 
		before do
      user =  User.create(email: "example134@exmdsfaple.com",password: "fanihoja", password_confirmation: "fanihoja", first_name: "arslan", last_name: "shakoor")
			@post = Post.create(user_id: user.id, date: Date.today, rationale: 'anything')
		end	

	  it "can be created" do
	     expect(@post).to be_valid
	  end
	  it "can not be created" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
	  end	

  end

end
