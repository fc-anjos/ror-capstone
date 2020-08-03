class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def index; end

  def new; end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user
    @article.save

    if @article.save
      redirect_to root_path, notice: 'Article was successfully created.'
    else
      render :index, alert: 'Article was not created.'
    end
  end

  private

  def article_params
    params.require(:article).permit(:picture)
  end
end
