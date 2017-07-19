class StaticsController < ApplicationController

	def welcome
		@pending_approvals=Post.where(status: "submitted")
    @audit_log=AuditLog.last(10)
	end	
	
	
end