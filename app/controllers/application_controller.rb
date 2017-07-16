class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def authenticate_user
    if current_user == nil
      redirect_to(root_path)
    end  
  end	
end
