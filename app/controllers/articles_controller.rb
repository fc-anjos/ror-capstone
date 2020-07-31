class ArticlesController < ApplicationController
  def index; end

  private

  def todo_params
    params.require(:article).permit(:picture)
  end
end
