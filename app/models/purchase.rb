class Purchase < ApplicationRecord
  belongs_to :user 
  belongs_to :item

  def card_regist
    Payjp.api_key = 'sk_test_7e45cce1c3bf4742a63222c4'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path, notice: 'カードの登録が完了しました'
      else
        redirect_to action: "create"
      end
    end
  end

  def record_create
    @purchase = Purchase.new(user_id: current_user.id, item_id: purchase_params[:item_id])
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = 'sk_test_7e45cce1c3bf4742a63222c4'
    Payjp::Charge.create(
    amount: @purchase.item.price,
    customer: @card.customer_id, 
    currency: 'jpy', 
    )
    if @purchase.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      flash.now[:alert] = 'エラーが発生しました'
      render :new
    end
  end

end
