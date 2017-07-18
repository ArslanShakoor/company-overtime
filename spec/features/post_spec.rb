require 'rails_helper'

describe 'navigate' do
  before do 
    @user =  FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    @post= Post.create(date:Date.today, rationale: "post1", user_id: @user.id, overtime_request: 3.2)
  end  

  it 'can be reached successfully' do
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  it 'post page has content' do
    
    visit posts_path
    expect(page).to have_content(/post1/)
  end

  it 'not show other user content' do
    @user =  FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit posts_path
    expect(page).not_to have_content(/post1/)
  end  

  describe "new" do
    it "new post nav click" do
      visit root_path
      click_link ("new_post_from_nav")
      expect(page.status_code).to eq(200) 
    end  
  end
 
 describe "delete" do
     
    it "delete the post" do
      visit posts_path
      click_link ("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200) 
    end  
  end

  describe "delete" do
     it "deletes the post" do
     
     end
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
      visit new_post_path
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "rationale"
      fill_in 'post[overtime_request]', with: "1.0"
       
      expect{click_on "Create Post"}.to change(Post, :count).by(1)
    end

    it "always have user associated with" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user association"
      click_on "Create Post"
      expect(User.last.posts.last.rationale).to eq("post1")         
    end 
  end

  describe "edit" do
     
    it "can do go to the edit page" do
       
      visit posts_path
      click_link "Edit_#{@post.id}"
      expect(page.status_code).to eq(200)   

    end
    
    it "cannot be  edited by non authorized user" do
     
      @user =  FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end 
  end	
end   