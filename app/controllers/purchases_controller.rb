class PurchasesController < ApplicationController
  def new
    @item = Item.find_by(id: params[:item_id])
  end
  
  def create
    Purchase.create(user_id: current_user.id,
                            item_id: params[:item_id])
  end
end