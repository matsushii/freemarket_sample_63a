class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses
  has_many :items
  has_many :purchases
  validates :nickname, presence: true
  validates :myoji_kanji, presence: true
  validates :namae_kanji, presence: true
  validates :myoji_kana, presence: true
  validates :namae_kana, presence: true
  validates :birthday, presence: true

end
