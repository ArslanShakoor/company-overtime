ass PostPolicy < ApplicationPolicy
 
	  def index?
	 	  admin? 
	  end

    def show?
	    admin_types.include?(user.type)
	  end

	  def destroy?
	 	  admin_types.include?(user.type)
	  end

 private
  def admin?
    admin_types.include?(user.type)
  end

  def current_user?	
   	record.user_id == user.id
  end	

  def approved?
    record.status != "approved" 
  end	
end
