class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
  end

  def edit
  end

  def update
  end
  
  def logout
  end
end
