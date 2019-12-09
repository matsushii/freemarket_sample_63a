class PurchasesController < ApplicationController
  require "payjp"
  before_action :move_to_login, only:[:new, :create]
  before_action :set_card, only:[:new, :create]
  
  def new
    @item = Item.find(params[:item_id])
    @item_images = @item.images.limit(10)
  end
  
  def create
    @purchase = Purchase.new(user_id: current_user.id, item_id: purchase_params[:item_id])
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = 'sk_test_7e45cce1c3bf4742a63222c4'
    Payjp::Charge.create(
    amount: @purchase.item.price,
    customer: card.customer_id, 
    currency: 'jpy', 
  )
    @purchase.item.status = 2
    @purchase.item.save
    if @purchase.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :new
    end

  end
  
  private
    def purchase_params
      params.permit(:user_id,:item_id)
    end

    def move_to_login
      redirect_to signup_index_path unless user_signed_in?
    end

    def set_card
      @card = Card.where(user_id: current_user.id)
    end
end

