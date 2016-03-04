class StatementsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # GET /statements
  # GET /statements.json
  def index
    @statements = @company.statements
  end

  # GET /statements/1
  # GET /statements/1.json
  def show
	@statement = @company.statements.find(params[:id])
  end

  # GET /statements/new
  def new
    @statement = @company.statements.new
  end

  # GET /statements/1/edit
  def edit
	@statement = @company.statements.find(params[:id])
  end

  # POST /statements
  # POST /statements.json
  def create
    @statement = @company.statements.create(statement_params)

    respond_to do |format|
      if @statement.save
        format.html { redirect_to company_statements_path(@company), notice: 'Statement was successfully created.' }
        format.json { render :show, status: :created, location: @statement }
      else
        format.html { render :new }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statements/1
  # PATCH/PUT /statements/1.json
  def update
    respond_to do |format|
      if @company.statements.find(params[:id]).update(statement_params)
        format.html { redirect_to company_statements_path(@company), notice: 'Statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1
  # DELETE /statements/1.json
  def destroy
    @company.statements.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to company_statements_path(@company), notice: 'Statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statement_params
      params.require(:statement).permit(:company_id, :amount)
    end
end
