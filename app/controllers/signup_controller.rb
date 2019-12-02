class SignupController < ApplicationController
  def step1
    @user = User.new
    @user.addresses.build
  end

  def step2
    session[:user_params] = user_params
    @user = User.new
    @user.addresses.build
  end

  def step3
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
      :phone_number,
      addresses_attributes: [:addresses]
    )
  end
end