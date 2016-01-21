class SessionsController < ApplicationController
  def new
  end

  def create
	  u = User.find_by_email(params[:email])
	  if u && u.authenticate(params[:password])
		  if u.verified
			  session[:user_id] = u.id
			  flash[:notice] = "Welcome back!"
			  redirect_to root_path
		  else
		  	  flash[:alert] = "You must confirm your email! #{ u.id }"
			  redirect_to login_path
		  end
	  else
		  redirect_to '/login'
		  #TODO pass an error, that login failed
	  end
  end

  def destroy
	  session[:user_id] = nil
	  redirect_to '/login'
  end
end
