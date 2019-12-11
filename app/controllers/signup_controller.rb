class SignupController < ApplicationController
  before_action :build_user, only: [:step1, :step2, :step3, :step4]
  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3

  def index
  end
  
  def step1
  end

  def step2
  end
  
  def step3
    @user.build_address #userモデルとaddressモデルを関連付けたインスタンスを生成
  end

  def step4
    @user.cards.build #userモデルとcardモデルを関連付けたインスタンスを生成
  end

  def create_card
    @user = User.new
    Payjp.api_key = 'sk_test_7e45cce1c3bf4742a63222c4'
      if params['payjp-token'].blank?
        redirect_to action: "step4"
      else
        customer = Payjp::Customer.create(card: params['payjp-token'])
        @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        if @card.save
          redirect_to complete_signup_index_path
        else
          redirect_to action: "step4"
        end
      end
  end

  def create
    @user = User.new(session[:user_params_afeter_step2]) #引数としてUserのsessionを渡す
    @user.build_address(user_params[:address_attributes]) #step3で入力された情報を代入
    if @user.save
      session[:id] = @user.id #idをsessionに入れてログイン状態にできる
      redirect_to step4_signup_index_path
      sign_in @user
    else
      render '/signup/step1'
    end
  end
  
  private
  def build_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :myoji_kanji,
      :namae_kanji,
      :myoji_kana,
      :namae_kana,
      :birthday,
      :phone_number,
      address_attributes: [
        :id,
        :postal_code,
        :prefecture,
        :city,
        :address,
        :building
      ]
    )
  end

  def save_step1_to_session
    if params[:user].blank?
      @user = User.new
      render '/signup/step1'
    else
      session[:user_params_afeter_step1] = user_params #step1で入力された情報を入れる
      @user = User.new(session[:user_params_afeter_step1])
      render '/signup/step1' unless @user.valid?
    end
  end

  def save_step2_to_session
    if params[:user].blank?
      @user = User.new
      render '/signup/step1' # unless user_params[:phone_number].present?
    else
      session[:user_params_afeter_step2] = user_params #step2で入力された情報をいれる
      session[:user_params_afeter_step2].merge!(session[:user_params_afeter_step1])
      @user = User.new
      render '/signup/step1' unless user_params[:phone_number].present?
    end
  end
  
end