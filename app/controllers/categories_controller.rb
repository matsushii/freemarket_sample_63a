class CategoriesController < ApplicationController
  def index
    @parent_categories = Category.roots
  end

  def show
  end
end
