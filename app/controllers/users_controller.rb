class UsersController < ApplicationController

      # only_admins added while site backend is incomplete so as to prevent people other 
      # than Emily from modifying articles.
    
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_author_and_articles, only: [:edit, :show, :update]
  before_action :set_first_and_initials, only: [:show, :edit]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users.sort! { |a,b| a.name <=> b.name }
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
      @user = User.find(params[:id])
  end

  def set_first_and_initials
    @author.first_and_initials = @author.name.split(" ").map.with_index do |name, index|
      index == 0 ? name + " " : name[0]
    end
    @author.first_and_initials = @author.first_and_initials.join
    @author.first_and_initials = @author.first_and_initials[0..-2] if @author.first_and_initials[-1] == " "
  end

  # POST /users
  # POST /users.json
  def create  
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "you've signed up successfully"
    else
      flash[:notice] = "that didn't work..."
      flash[:color] = "invalid"
      render "new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def find_author_and_articles
    @author = User.find(params[:id])
    @articles = Article.where(user_id: @author.id)
    @articles = @articles.sort.reverse
  end

  private

      def only_admins
          head(403) unless @user.id == 1
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :twitter, :avatar, :bio, :name)
    end
end
