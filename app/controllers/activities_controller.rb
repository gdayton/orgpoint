class ActivitiesController < ApplicationController
  before_action :set_user_n_company, only: [:index, :create, :new, :show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = @user.activities
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
	@activity = @user.activities.find(params[:id])
  end

  # GET /activities/new
  def new
    @activity = @user.activities.new
  end

  # GET /activities/1/edit
  def edit
	@activity = @user.activities.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = @user.activities.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @user.activities.find(params[:id]).update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @user.activities.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_n_company
      #@activity = Activity.find(params[:id])
      @company = Company.find(params[:company_id])
      @user = @company.users.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:user_id, :content)
    end
end
