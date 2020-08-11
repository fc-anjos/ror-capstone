class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:id])
    @articles = @category.articles.order(created_at: :desc).limit(4)
  end
end
