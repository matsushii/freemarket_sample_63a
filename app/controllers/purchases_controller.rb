class PurchasesController < ApplicationController
  def new
    @item = Item.find_by(id: params[:item_id])
    # @purchase = Purchase.new
  end
  
  def create
    binding.pry
    # @item = Item.find_by(id: params[:item_id])
    # @item = Item.find_by(id: params[:item_id])
    purchase = params.merge(user_id: current_user.id)
    Purchase.create
    redirect_to item_path(params[:item_id])
  end

  private 
  def purchase_params
    params.merge(user_id: current_user.id, item_id: params[:item_id])
  end
end