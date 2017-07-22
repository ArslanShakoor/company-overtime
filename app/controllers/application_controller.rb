class ApplicationController < ActionController::Base
  
  def admin_types
    ['AdminUser']
  end

	include Pundit
  protect_from_forgery

  protect_from_forgery with: :exception

  before_action :authenticate_user!


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authenticate_user
    if current_user == nil
      redirect_to(root_path)
    end  
  end	

   

 private

	 def user_not_authorized(exception)
	   policy_name = exception.policy.class.to_s.underscore

	   flash[:notice] =  "You are not allowed to perform this action"
	   redirect_to(root_path)
	 end

end
