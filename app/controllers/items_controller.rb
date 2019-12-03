class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @item_images = @item.images.limit(10)
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      render :destroy
    else
      render :show
    end
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      render :index
    else
      render :edit
    end
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

