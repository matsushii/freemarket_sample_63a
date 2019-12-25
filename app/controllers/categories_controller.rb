class CategoriesController < ApplicationController
  def index
    @parent_categories = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @parent_categories = Category.roots
  end
end
