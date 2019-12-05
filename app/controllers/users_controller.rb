class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :identification]

  def show
    @nickname = @user.nickname
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def purchased_trading_items
    @purchased_trading_items = Purchase.all.order(created_at: "desc").limit(10)
  end

  def logout
  end

  def identification
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end
end
