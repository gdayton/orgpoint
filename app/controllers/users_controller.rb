class UsersController < ApplicationController
	def index
		@company = current_user.company
		@users = Company.find(@company.id).employees
	end
	
	def new
		@user = User.new
		@company = current_user.company
	end
	
	def show
		@users = Company.find(params[:id]).employees	
	end 
	
	def edit
		@company = Company.find(params[:id])
		@users = @company.employees
	end
	
	def update
		@users = Company.find(params[:id]).employees
		@user = @users.find(params[:user_id])
		
		@user.first_name = user_params[:first_name]
		@user.last_name = user_params[:last_name]
		
		if @user.save
			redirect_to user_path+"/edit", "Employee was updated successfully!"
		else
			render "edit"
		end
	end
	
	def create
		@company = current_user.company
		@user = User.new(user_params)
		if @user.save
			redirect_to edit_user_path(@company.id), notice: "Employee was created successfully!"
		else
			render "new"
		end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, 
									 :password, :password_confirmation, :company_id)
	end
end
