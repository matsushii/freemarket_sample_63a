class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses
  has_many :items
  has_many :purchases
  has_many :cards
  validates :nickname, :myoji_kanji, :namae_kanji, :myoji_kana, :namae_kana, :birthday, presence: true
