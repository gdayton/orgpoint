class PostsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /posts
  # GET /posts.json
  def index
<<<<<<< HEAD
    @posts = @company.posts.order(created_at: :desc)
=======
    @posts = @company.posts(:order => "updated_at DESC")
>>>>>>> 50b6f3b9641d609bafcd6b9971de1b7d7d1e2259
    
    @post = Post.new
    @users = User.all
    @current_user_id = current_user.id
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
	@post = @company.posts.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = @company.posts.new
    @users = User.all
  end

  # GET /posts/1/edit
  def edit
	@post = @company.posts.find(params[:id])
    @users = User.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @company.posts.create(post_params)
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to company_posts_path(@company), notice: 'Post was successfully created.' }
        #format.json { render :show, status: :created, location: @post }
        format.json { render "POSTED!!!" }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @company.posts.find(params[:id]).update(post_params)
        format.html { redirect_to company_posts_path(@company), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @company.posts.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to company_posts_path(@company), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :post_type, :content)
    end
end
