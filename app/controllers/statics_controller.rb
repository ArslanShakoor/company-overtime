class StaticsController < ApplicationController

	def welcome
		@pending_approvals=Post.where(status: "submitted")

	end	
	
	
end