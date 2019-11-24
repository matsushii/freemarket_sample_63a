class ItemsController < ApplicationController
  def index
    @mens_items = Item.where(id: 1..5)
    @ladies_items = Item.where(id: 6..11)
    @e_appliances_items = Item.where(id: 12..15)
    @hobbies_items = Item.where(id: 16..20)
  end
end
