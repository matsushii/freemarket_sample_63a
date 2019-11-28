class Item < ApplicationRecord
  validates :name, presence: true
  has_many :images
  belongs_to :user
  has_one :purchase
end