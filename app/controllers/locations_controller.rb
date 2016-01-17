class LocationsController < ApplicationController
	def new 
		@location = Location.new
	end
	
	def index
		@locations = Company.all.locations
	end
	
	def show
		@location = Company.find(params[:id]).locations
	end
	
	def edit
		@location = Location.find(params[:id])
	end
	
	def update
		@location = Location.find(params[:id])
		@location.title = location_params[:title]
		
		if @location.save
			redirect_to company_path+"/edit", notice: "Location updated successfully!"
		else
			render "edit"
		end
	end
	
	def create
		@location = Location.new(location_params)
		# TODO append the location onto the locations array!
		if @location.save
			redirect_to companies_url(params[:company_id])+"/edit", notice: "Location created."
		else
			render "new"
		end
	end
	
	private 
	
	def location_params
		params.require(:location).permit(:title)
	end
		
end
