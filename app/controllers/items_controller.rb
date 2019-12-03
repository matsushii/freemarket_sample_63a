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
    # binding.pry
    @item = Item.new(item_params)
    # @item.images.build(item_params[:images_attributes])
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def update
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.update(item_params)
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end

