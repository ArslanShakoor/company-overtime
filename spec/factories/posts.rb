FactoryGirl.define do
   
  factory :post do
    date Date.today
    rationale "post1"
    user
  end

  factory :second_post, class: "Post" do
  	date Date.yesterday
  	rationale "post2"
  	user
  end	

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "post from other user"
    non_authorized_user
  end
end