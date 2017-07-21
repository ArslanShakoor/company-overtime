module ApplicationHelper
	def active?(path)
		"active" if current_page?(path)
	end	

  def admin_types
    ['AdminUser']
  end

  def admin?
     admin_types.include?(current_user.type)   
  end

  def employee?
    current_user.type == "Employee"
  end

 def status_label status
    case status
    when "pending"	
    	content_tag(:label, status.capitalize, class: "label label-primary")
    when "submitted"
      content_tag(:label, status.capitalize, class: "label label-primary")
    when "approved"
      content_tag(:label, status.capitalize, class: "label label-success")
    when "rejected"
      content_tag(:label, status.capitalize, class: "label label-danger")
    end      
  end 		
end
