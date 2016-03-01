class LocationsController < ApplicationController
  before_action :set_company, only: [:index, :new, :edit, :create, :show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = @company.locations
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
	@location = @company.locations.find(params[:id])
  end

  # GET /locations/new
  def new
    @location = @company.locations.new
  end

  # GET /locations/1/edit
  def edit
	@location = @company.locations.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = @company.locations.create(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to company_locations_path(@company), notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @company.locations.find(params[:id]).update(location_params)
        format.html { redirect_to company_locations_path(@company), notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
	@location = @company.locations.find(params[:id])
    @location.destroy
    
    respond_to do |format|
      format.html { redirect_to company_locations_path(@company), notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:title)
    end
end
