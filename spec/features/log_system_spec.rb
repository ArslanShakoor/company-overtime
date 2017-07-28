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
    fill_in 'employee_email', with: email
    fill_in 'employee_password', with: password
    fill_in 'employee_first_name', with: first_name
    fill_in 'employee_last_name', with: last_name
    fill_in 'employee_phone_no', with: phone_no
     

    click_button 'Create Employee'
  end  

  it "created user and show logout buttion" do
    expect(page).to have_content("Employee was successfully created.")
  end  
end



