class AuditLogsController < ApplicationController
	before_action :set_audit_log, only: [:confirm]
	def index
		@audit_logs = AuditLog.all.page params[:page]
		authorize @audit_logs
	end 

	def confirm
		@audit_log.approved!
		@audit_log.end_date = Date.today
    redirect_to root_path, notice:"your log has been confirmed"
  
  end

  private
    def set_audit_log
      @audit_log = AuditLog.find(params[:id])
    end  
end
