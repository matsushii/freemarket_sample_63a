class ItemsController < ApplicationController
  before_action :redirect_to_login_page, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_login_page, except: [:index]

  def index
    @items = Item.where(status: 1).order(created_at: "desc").limit(10)
  end

  def new
    @item = Item.new
    @parent_categories = Category.roots
  end

  def create
    @item = Item.new(item_params)
    @item.status = 1
    if @item.save
      redirect_to root_path, notice: "商品の出品が完了しました"
    else
      flash.now[:alert] = "出品に失敗しました"
      render :new
    end
  end

  def show
    @item_images = @item.images.limit(10)
    @category = Category.find(@item.category_id)
  end

  def edit
    @images = @item.images
  end

  def update
    if @item.user_id == current_user.id && @item.update(item_params)
      if params[:item][:images_blob_ids].present? 
        params[:item][:images_blob_ids].each do |image_id|
          @item.images.find(image_id).purge
        end
      end
      redirect_to @item, notice: "商品の編集が完了しました"
    else
      render :edit, alert: "編集に失敗しました"
    end
  end

  def pause
    if @item = Item.find(params[:id])
    @item.status = 3
    @item.save
    redirect_to @item, notice: "商品の出品を停止しました"
    else
      render :show, alert: "停止に失敗しました"
    end
  end

  def resume
    if @item = Item.find(params[:id])
    @item.status = 1
    @item.save
      redirect_to @item, notice: "商品の出品を再開しました"
    else
      render :show, alert: "出品再開に失敗しました"
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id && item.destroy
      redirect_to root_path, notice: "商品を削除しました"
    else
      render :show, alert: "削除に失敗しました"
    end
  end

  def search
    @items = Item.search(params[:search])
    render :index
  end

  def get_children
    @children = Category.find(params[:parent_id]).children
  end

  def get_grandchildren
    @grandchildren = Category.find(params[:child_id]).children
  end

  private
  def redirect_to_login_page
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_to_login_page
    unless user_signed_in?
      redirect_to new_user_session_path
    end
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
      :images_blob_ids,
      :category_id,
      images: []
    ).merge(user_id: current_user.id)
  end
end