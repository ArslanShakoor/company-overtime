require 'rails_helper'

describe 'navigate' do
 
  it 'can be reached successfully' do
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  
  it "has some content" do
    visit posts_path
    expect(page).to have_content(/Posts/)
  end	
  
  it " can be reached to new_post" do
    visit new_post_path
    expect(page.status_code).to eq(200)
  end
   
  it "new_post has content" do
    visit new_post_path
    expect(page).to have_content(/New/)
  end 
  
  it 'allows  to create a new post from the new_page' do
    visit new_post_path

    fill_in 'post[date]', with: Date.today
    fill_in 'post[rationale]', with: "rationale"

    click_on "Save"

    expect(page).to have_content("rationale")
  end

end	