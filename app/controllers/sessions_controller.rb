class SessionsController < ApplicationController
  def new
  end

  def create
	  u = User.find_by_email(params[:email])
	  if u && u.authenticate(params[:password])
		  if u.verified
			  session[:user_id] = u.id
			  redirect_to '/'
			  #TODO redirect_to u.company.url
		  else
		  	  format.html { redirect_to login_path, notice: 'You must confirm your email!' }
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
