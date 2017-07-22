class PostPolicy < ApplicationPolicy
 
  def approve?
    admin?
  end  
  def update?
 	  approved? && current_user? 
  end

  def show?
 	record.user_id == user.id || admin_types.include?(user.type)
  end

  def destroy?
 	record.user_id == user.id || admin_types.include?(user.type)
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