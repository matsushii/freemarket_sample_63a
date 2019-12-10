class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  has_many :items
  has_many :purchases
  has_many :cards
  
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :nickname, :myoji_kanji, :namae_kanji, :myoji_kana, :namae_kana, :birthday, presence: true
  validates :introduction, length: {maximum: 1000}
  validates :nickname, length: {in: 1..20}
end