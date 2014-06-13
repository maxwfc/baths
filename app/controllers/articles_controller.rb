class ArticlesController < ApplicationController

        # only_admins added while site backend is incomplete so as to prevent people other 
        # than Emily from modifying articles.
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :ordered_articles, only: [:index, :archive]
  before_action :strip_div, only: [:create, :update]
  
  def archive
  end
  
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
    if @article.published == 1
      @leftSubmitText = "update"
      @rightSubmitText = "save and revert to draft"
    end
  end

  def create
    @article = Article.new(article_params)

      # non-admin users cannot choose which author to publish as, so user_id is not passed in the parameters and must be added

    @article.user_id = @user.id if @article.user_id.blank? # NOTE: when "user-level" is added to DB, testing that will be more secure
    @article.views = 0
    @article.created_at = DateTime.now

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        params[:flash] = article_params
        format.html { redirect_to article_path(@article), notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
        @article = Article.find(params[:id])
        @author = User.find(@article.user_id)
    end
    
    def ordered_articles
        @articles = Article.all
    end
    
    def only_admins
        head(403) unless @user.id == 1
    end
    
    def strip_div
        article_params[:body] = article_params[:body][5..-1] if article_params[:body][0..4] == "<div>"
        article_params[:body] = article_params[:body][0..-7] if article_params[:body][-6..-1] == "</div>"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:body,:mainImage,:title,:user_id,:published,:id)
    end
end
