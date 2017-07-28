It has been considered Publicity.io is using Devise gem for user registration
For signup i just created the simple feature spec and I considered all the requirements has been implemented on model of user.
For sign in and sign up . i used the request type spec and whole idea is to check the current user sessions on login and logout
in the comments the file names are added. 
To run these tests just paste the content in file_name which are given in comments



#/spec/features/signup
require 'rails_helper';

describe 'User registration' do
  let(:email) { 'registration_test_user@example.org' }
  let(:password) { 'password' }
  let(:first_name){'john'}
  let(:last_name){'Doe'}
  let(:phone_no){'9172083523'} 


  before :each do
  	@user = FactoryGirl.create(:admin_user)
    login_as(@user)
    visit new_admin_employee_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_repassword', with: password
    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    fill_in 'user_phone_no', with: phone_no
     

    click_button 'Create Employee'
  end  

  it "created user and show logout buttion" do
    expect(page).to have_content("Logout")
  end  
end




# /spec/support/request_spec_helper.rb
module RequestSpecHelper

  include Warden::Test::Helpers

  def self.included(base)
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end

#spec/rails_helper.rb
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  # ...
  config.include RequestSpecHelper, type: :request
  # ...
end

#/spec/factories/user.rb
factory :user do
    first_name 'John'
    last_name 'Snow'
    email { generate :email }
    password "password"
    password_confirmation "password"
    phone_no "9043334444"
  end

# /spec/requests/sessions.rb

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