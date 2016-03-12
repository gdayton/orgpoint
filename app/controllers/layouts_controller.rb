class LayoutsController < ApplicationController
	def index
		# if the user is logged in, no need to show the homepage
		if !current_user.nil?
			redirect_to company_path(current_user.company)
		end
	end
	
	def onboard
		@company = Company.new
		@user = User.new
	end

	def faq
		
	end
end