class SignupController < ApplicationController
  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3

  def index
  end
  
  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end
  
  def step3
    @user = User.new
    @user.build_address #userモデルとaddressモデルを関連付け
  end

  def create
    @user = User.new(session[:user_params_afeter_step2]) #引数としてUserのsessionを渡す
    @user.build_address(user_params[:address_attributes]) #step3で入力された情報を代入
    if @user.save
      session[:id] = @user.id #idをsessionに入れてログイン状態にできる
      redirect_to complete_signup_index_path
    else
      render '/signup/step1'
    end
  end

  private
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
    session[:user_params_afeter_step1] = user_params #step1で入力された情報を入れる
    @user = User.new(session[:user_params_afeter_step1])
    render '/signup/step1' unless @user.valid?
  end
  
  def save_step2_to_session
    session[:user_params_afeter_step2] = user_params #step2で入力された情報をいれる
    session[:user_params_afeter_step2].merge!(session[:user_params_afeter_step1])
    @user = User.new
    render '/signup/step2' unless user_params[:phone_number].present?
  end
  
end