namespace :notification do
  desc "send sms to employees and ask them to log overtime"

  task sms: :environment do
  	if Time.now.monday?
  		
  	end	
  	#schdule  to run at dunday 5pm
  	# iterate over all employees to send the sms
  	# skip admin user
  	# send a mesage that has instruction and have link to login

  end

end
