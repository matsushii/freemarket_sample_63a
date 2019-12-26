class CategoriesController < ApplicationController
  before_action :set_parent_categories, only: [:index, :show]

  def index
  end

  def show
    @category = Category.find(params[:id])
  end

  private
  def set_parent_categories
    @parent_categories = Category.roots
  end
end
