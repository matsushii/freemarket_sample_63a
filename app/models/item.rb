class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, presence: true
end