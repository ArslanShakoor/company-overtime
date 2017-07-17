require 'rails_helper' 

describe "approval admin user" do 
	 
     
  it "post cannot be editable by user after the status is approved by admin" do
  	user =  FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  	post= Post.create(date:Date.today, rationale: "post1", user_id: user.id, overtime_request: 3.1 )
  	post.update(date:Date.today, status: "approved",)
    visit edit_post_path(post)
    expect(page).to have_current_path(root_path)
  end

  it "post can be editable by user after the status is not approved by admin" do
  	user =  FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  	post= Post.create(date:Date.today, rationale: "post1", user_id: user.id, overtime_request: 2.2)
  	post.update(date:Date.today, status: "rejected",)
    visit edit_post_path(post)
    expect(page).to have_current_path(edit_post_path(post))
  end
end 	
