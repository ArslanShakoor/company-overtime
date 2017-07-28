require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "Sessions" do



  it "signs user in and out" do
    user = FactoryGirl.create(:user)
    
    sign_in user
    get root_path
    expect(controller.current_user).to eq(user)
    
    sign_out user
    get root_path
    expect(controller.current_user_id).to be_nil
  end   
end