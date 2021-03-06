require "rails_helper"

describe "homepage" do 
	it "allows admin to update the post via homepage" do
	post = FactoryGirl.create(:post)
	admin_user = FactoryGirl.create(:admin_user)
	login_as(admin_user, :scope => :user)
	visit root_path
	click_on("approve_#{post.id}")
	expect(post.reload.status).to eq('approved') 	
  end	
end