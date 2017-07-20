namespace :notification do
  desc "send sms notificatin on schdule"
  task sms: :environment do
    message = "log in your account and log the overtime"
    employees = Employee.all
   
    employees.each do |employee|
      AuditLog.create(user_id: employee.id)
      SmsTool.send_message(num: employee.phone_no, msg: message)
    end 
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
