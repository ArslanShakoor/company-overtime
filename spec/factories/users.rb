 FactoryGirl.define do
	sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'John'
    last_name 'Snow'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone_no "9043334444"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone_no "9043334444"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'non'
    last_name 'authorized'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone_no "9043334444"
  end
end