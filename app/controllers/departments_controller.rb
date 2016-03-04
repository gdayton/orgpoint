class DepartmentsController < ApplicationController
  before_action :set_company, only: [:index, :new, :show, :create, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @departments = @company.departments
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
	@department = @company.departments.find(params[:id])
  end

  # GET /departments/new
  def new
    @department = @company.departments.new
  end

  # GET /departments/1/edit
  def edit
	@department = @company.departments.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = @company.departments.create(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to company_departments_path(@company), notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @company.departments.find(params[:id]).update(department_params)
        format.html { redirect_to company_departments_path(@company), notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department = @company.departments.find(params[:id])
    @department.destroy
    
    respond_to do |format|
      format.html { redirect_to company_departments_path(@company), notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:title)
    end
end
