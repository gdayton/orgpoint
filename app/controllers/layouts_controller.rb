class LayoutsController < ApplicationController
	def index
	end
	
	def onboard
		@company = Company.new
		@user = User.new
	end
end