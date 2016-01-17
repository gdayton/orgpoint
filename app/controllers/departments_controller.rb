class DepartmentsController < ApplicationController
	def new
		@department = Department.new
	end
	
	def index
		@departments = Company.find_all.departments
	end
	
	def show
		@department = Company.find(params[:id]).departments
	end
	
	def edit
		@department = Department.find(params[:id])
	end
	
	def update
		@department = Department.find(params[:id])
		@department.title = department_params[:title]
		
		if @department.save
			redirect_to company_path+"/edit", notice: "Edited department successfully!"
		else
			render "edit" #AKA redirects back up to above function
		end
	end
	
	def create
		@department = Department.create(department_params)
		# TODO Append the department onto the departments array!
		
		if @department.save
			redirect_to companies_url(params[:company_id])+"/edit" , notice: "Department created successfully."
		else
			render "new" 
		end
	end
	
	private
	
	def department_params
		params.require(:department).permit(:title)
	end 
end
