module PostsHelper
  def status_label status
    case status
    when "submitted"
      content_tag(:label, status.capitalize, class: "label label-primary")
    when "approved"
      content_tag(:label, status.capitalize, class: "label label-success")
    when "rejected"
      content_tag(:label, status.capitalize, class: "label label-danger")
    end      
    
  end 	
end
