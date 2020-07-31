class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index; end

  private

  def todo_params
    params.require(:article).permit(:picture)
  end
end
