class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	
	private
	
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end
	
	# TODO: Add support for admin/regular user
	
	#def current_user_company
	#	if session[:user_id]
	#		@current_user_company ||=  current_user.company
	#	end
	#end
	
	helper_method :current_user
	
	def authenticate_user!
		redirect_to	login_path unless current_user
	end
	
	# TODO: Add support for admin/regular user
end
