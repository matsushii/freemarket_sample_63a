class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: "desc").limit(10)
  end

  def new
    @item = Item.new
    @item.images.build
    @image = Image.new
   
  end
  
  def create
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
    @item_images = @item.images.limit(10)
    # render  layout: false
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end

# /Users/saeki/projects/freemarket_sample_63a/public/uploads/image/image/8/sample_item.jpeg
"/uploads/image/image/1/sample_item.jpg"