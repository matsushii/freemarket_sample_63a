  class CardsController < ApplicationController
    before_action :set_card, only:[:index, :new, :create]
    before_action :redirect_to_login_page, except: [:index, :new, :create]
    require "payjp"

    def index
    end

    def new 
      card = Card.where(user_id: current_user.id)
      if card.present?
        redirect_to root_path, notice: "登録済みです"
      end 
    end
  
    def create 
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
  
    private
    def set_card
      if Card.where(user_id: current_user.id).present?
        @card = Card.where(user_id: current_user.id)
      end
    end

    def redirect_to_login_page
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
