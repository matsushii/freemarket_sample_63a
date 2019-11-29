class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :asc).limit(10)
    @mens_items = Item.where(id: 1..5).order(created_at: :desc).limit(10)
    @ladies_items = Item.where(id: 6..11).order(created_at: :desc).limit(10)
    @e_appliances_items = Item.where(id: 12..15).order(created_at: :desc).limit(10)
    @hobbies_items = Item.where(id: 16..20).order(created_at: :desc).limit(10)
  end

  def show
    @item = Item.find(params[:id])
  end
end

