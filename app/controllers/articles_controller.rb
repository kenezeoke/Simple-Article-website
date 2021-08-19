class ArticlesController < ApplicationController
  def show

    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all


  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated succesfully"
      redirect_to @article
    else
      render 'edit'
    end
  end


end
