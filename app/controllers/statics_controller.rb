class StaticsController < ApplicationController

	def welcome
		@pending_approvals=Post.submitted
    @audit_log=AuditLog.last(10)
	end	
	
	
end