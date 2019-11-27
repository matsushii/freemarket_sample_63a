class PurchasesController < ApplicationController
  def new
    unless user_signed_in?
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
    end
  end
  
  def create
    Purchase.create(user_id: current_user.id, item_id: [:item_id])
  end
  
  private
    def purchase_params
      params.permit(:user_id,:item_id)
    end
end

