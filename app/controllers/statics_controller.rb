class StaticsController < ApplicationController

	def welcome
		if admin_types.include?(current_user.try(:type))
			@pending_approvals=Post.submitted
	    @audit_log=AuditLog.last(10)
	  else
	    @pending_audits= current_user.audit_logs.pending
	  end    
	end	
	
end