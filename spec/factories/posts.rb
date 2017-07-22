FactoryGirl.define do
   
  factory :post do
    date Date.today
    rationale "post1"
    user
    overtime_request 3.1 
  end

  factory :second_post, class: "Post" do
  	date Date.yesterday
  	rationale "post2"
  	user
    overtime_request 2.1
  end	

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "post from other user"
    non_authorized_user
    overtime_request 0.4
  end
end