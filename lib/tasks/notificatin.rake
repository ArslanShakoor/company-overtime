namespace :notificatin do
  desc "send sms notificatin on schdule"
  task sms: :environment do
  end

  desc "send email notification on schdule "
  task user_email: :environment do
  	 post_submitted = Post.submitted
  	 admin_users =  AdminUser.all 
  	 if post_submitted.count > 0
  	    admin_users.each  do |admin_user|
  	      UserMailer.email(admin_user).deliver
  	    end
  	  end 	
  end

end
