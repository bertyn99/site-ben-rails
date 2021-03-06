class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    if current_user
    
    else
      
      redirect_to root_path
      flash[:notice]= "Please stop try to do the admin job"
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
   
  end

  # GET /articles/new
  def new
    @article = Article.new
    if current_user
     
    else
      redirect_to articles_path
      flash[:notice]= "Please stop try to do the admin job"
    end

  end

  # GET /articles/1/edit
  def edit
    if current_user
     
      
    else
      redirect_to root_path
      flash[:notice]= "Please stop try to do the admin job"
    end

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if current_user
      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
      
    else
      redirect_to root_path
      flash[:notice]= "Please stop try to do the admin job"
    end
   
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :author)
    end
end
