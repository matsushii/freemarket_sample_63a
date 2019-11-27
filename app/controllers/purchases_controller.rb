class PurchasesController < ApplicationController
  before_action :move_to_login, only:[:new, :create]
  def new
      @item = Item.find(params[:item_id])
  end
  
  def create
    Purchase.create(user_id: current_user.id, item_id: [:item_id])
  end
  
  private
    def purchase_params
      params.permit(:user_id,:item_id)
    end

    def move_to_login
      redirect_to root_path unless user_signed_in?
    end
end

