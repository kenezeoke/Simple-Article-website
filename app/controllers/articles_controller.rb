class ArticlesController < ApplicationController
  # runs the function set_article first for the show, edit, update,destroy function
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # this requires the article key and permits only the use of title and description
    if @article.save # save the created article
      #This gives a notice
      flash[:notice] = "Article was created succesfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated succesfully"
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #any code below private is only available to this controller

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
