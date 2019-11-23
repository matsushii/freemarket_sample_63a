class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  has_one :purchase
end