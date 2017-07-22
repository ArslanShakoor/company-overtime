require 'rails_helper'

describe "admin dashboard" do 
  
  it 'cannot be reached when no logged in' do
    visit admin_root_path
    expect(current_path).to eq(user_session_path)
  end 

  it 'cannot be reached when regular logged in' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
  end 

  it 'can be reached with admin loggedin' do
    user = FactoryGirl.create(:admin_user) 
    login_as(user, :scope => :user)
    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end
end	