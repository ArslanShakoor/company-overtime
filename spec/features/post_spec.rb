require 'rails_helper'

describe 'navigate' do
  before do 
    @user =  FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
     
  end  

  it 'can be reached successfully' do
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  it 'post page has content' do
    
    FactoryGirl.create(:post)
    FactoryGirl.create(:second_post)

    visit posts_path
    expect(page).to have_content(/post1|post2/)
  end


  describe "new" do
    it "new post nav click" do
      visit root_path
      click_link ("new_post_from_nav")
      expect(page.status_code).to eq(200) 
    end  
  end
 
 describe "delete" do
    before do
      @post = FactoryGirl.create(:post)
    end  
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
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "rationale"
      click_on "Create Post"  
      expect(page).to have_content("rationale")
    end

    it "always have user associated with" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user association"
      click_on "Create Post"
      expect(User.last.posts.last.rationale).to eq("user association")         
    end 

    describe "edit" do
      before do
        @post= FactoryGirl.create(:post)
      end  

      it "can do go to the edit page" do
         
        visit posts_path
        click_link "Edit_#{@post.id}"
        expect(page.status_code).to eq(200)   

      end
     it "can be edited" do
        visit edit_post_path(@post)
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "edited content"
        click_on "Update Post"
        expect(page).to have_content(/edited content/)
      end
    end  


  end
end	