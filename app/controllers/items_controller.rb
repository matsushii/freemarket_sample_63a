class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(10)
  end

  def new
    @item = Item.new
    @item.images.build
    @image = Image.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end
end

