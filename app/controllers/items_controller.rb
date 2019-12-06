class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: "desc").limit(10)
  end

  def new
    @item = Item.new
    @item.images.build
    @image = Image.new
    unless user_signed_in?
      redirect_to signup_index_path
    end
  end
  
  def create
    @item = Item.new(item_params)
    @item.status = 1
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

  def edit
    @images = @item.images
  end

  def update
    if current_user.id == @item.user_id && @item.update(item_params)
      render :show
    else
      render :edit
    end
  end
  
  def pause
    if @item = Item.find(params[:id])
    @item.status = (3)
    @item.save
    redirect_to root_path
    else
      render :show
    end
  end
  
  def resume
    if @item = Item.find(params[:id])
    @item.status = (1)
    @item.save
      redirect_to root_path
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

  def search
    @items = Item.search(params[:search])
    render :index
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
      :condition,
      :shipping_from,
      :shipping_date,
      :shipping_fee,
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end
end

