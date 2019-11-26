class PurchasesController < ApplicationController
  def new
    @item = Item.find_by(id: params[:id])
  end
end
