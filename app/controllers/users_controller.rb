class UsersController < ApplicationController
  before_action :set_company, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  
  load_and_authorize_resource :company
  load_and_authorize_resource :user, :through => :company
  
  helper_method :convert_video_platform

  # GET /users
  # GET /users.json
  def index
    @users = @company.users
  end

  # GET /users/1
  # GET /users/1.json
  def show
	@photos = Photo.where(user_id: params[:id]).order(created_at: :desc).limit(6)
	@user = @company.users.find(params[:id])
  end

  # GET /users/new
  def new
    @user = @company.users.new 
  end

  # GET /users/1/edit
  def edit
	#authorize! :update, @user
	@user = @company.users.find(params[:id])
	
	@users = User.all
	@user_blank = User.new
	@user_blank.first_name = "Root"
	@user_blank.last_name = "aaaaa"
	@user_blank.id = 0
	@companies = Company.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = @company.users.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to company_users_path(@company), notice: 'Verification Email sent to your email' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
	#authorize! :update, @user
    respond_to do |format|
      if @company.users.find(params[:id]).update(user_params)
        format.html { redirect_to company_users_path(@company), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @company.users.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to company_users_path(@company), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
	 User.import(params[:file], @company)
	 redirect_to users_url, notice: "Users were successfully imported." 
  end
  
  def convert_video_platform(num)
	  humanized_numbers = {"0" => "Skype", 
		  				   "1" => "Adobe Connect", 
		  				   "2" => "Google Hangout", 
		  				   "3" => "Cisco WebEx", 
		  				   "4" => "Citrix GoToMeeting",
		  				   "5" => "Polycom",
		  				   "6" => "Zoom",
		  				   "7" => "Facetime"}
	  humanized_numbers[num.to_s]
  end
  
  def nouser
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      #@user = User.find(params[:id])
	  @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :image, :role, :manager_id, :mobile_phone, :work_phone, :start_date, :video_platform, :video_handle, :about_me, :resp, :job_role)
    end
end
