class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end
  
  def create
    Purchase.create(user_id: current_user.id, item_id: purchase_params[:item_id])
  end
  
  private
    def purchase_params
      params.permit(:user_id,:item_id)
    end
end

