class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end
	
	def show
		@company = Company.find(params[:id])
	end
	
	def edit
		@company = Company.find(params[:id])
		
		@location = Location.new
		@locations = @company.locations
		
		@department = Department.new
		@departments = @company.departments
	end
	
	def update
		@company = Company.find(params[:id])
		@company.title = company_params[:title]
		
		if @company.save
			redirect_to company_path+"/edit", notice: "Company update was successful!"
		else
			render "edit"
		end
	end
	
	private
	
	def company_params
		params.require(:company).permit(:title)
	end
end
