require 'rails_helper'

describe 'navigate' do
  before do 
    @user = User.create!(email: "examplde134@exmdsfaple.com",password: "fanihoja", password_confirmation: "fanihoja", first_name: "arslan", last_name: "shakoor")
    login_as(@user, :scope => :user)
     
  end  

  it 'can be reached successfully' do
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  it 'post page has content' do
    Post.create!(date: Date.today, rationale: 'post1', user_id: @user.id)
    Post.create!(date: Date.today, rationale: 'post2', user_id: @user.id)
    visit posts_path
    expect(page).to have_content(/post1|post2/)
  end


  
   
  describe "new_post" do
     before do 
      
      visit new_post_path 
    end 

    it " can be reached to new_post" do
    expect(page.status_code).to eq(200)
    end
     
    it "new_post has content" do
    expect(page).to have_content(/New/)
    end 
    
    it 'allows  to create a new post from the new_page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "rationale"
      click_on "Save"  
      expect(page).to have_content("rationale")
    end

    it "always have user associated with" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("user association")         
    end  
  end
end	