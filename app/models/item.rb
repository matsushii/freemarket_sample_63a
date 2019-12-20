class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many_attached :images
  belongs_to :category

  validates :name, presence: true, length: { in: 1..40}
  validates :text, presence: true, length: { in: 1..1000}
  validates :condition, :shipping_fee, :shipping_from, :shipping_date, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300}, numericality: {less_than_or_equal_to: 9999999}
  validate  :image_presence

  def image_presence
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%('image/jpg image/jpeg image/png'))
          errors.add(:image, 'jpg/jpeg/pngファイルを添付してください')
        elsif image.blob.byte_size > 10.megabytes
          errors.add(:image, '容量が大きすぎます')
        end
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  def self.search(search) 
    if search 
      Item.where('name LIKE ?', "%#{search}%")
    else
      Item.all 
    end
  end

  enum condition: {
    新品、未使用:1,
    未使用に近い:2,
    目立った傷や汚れなし:3,
    やや傷や汚れあり:4,
    傷や汚れあり:5,
    全体的に状態が悪い:6,
  }

  enum shipping_fee: {
    送料込み（出品者負担）:1,
    着払い（購入者負担）:2,
  }

  enum shipping_from: {
    北海道:1,
    青森県:2,
    岩手県:3,
    宮城県:4,
    秋田県:5,
    山形県:6,
    福島県:7,
    茨城県:8,
    栃木県:9,
    群馬県:10,
    埼玉県:11,
    千葉県:12,
    東京都:13,
    神奈川県:14,
    新潟県:15,
    富山県:16,
    石川県:17,
    福井県:18,
    山梨県:19,
    長野県:20,
    岐阜県:21,
    静岡県:22,
    愛知県:23,
    三重県:24,
    滋賀県:25,
    京都府:26,
    大阪府:27,
    兵庫県:28,
    奈良県:29,
    和歌山県:30,
    鳥取県:31,
    島根県:32,
    岡山県:33,
    広島県:34,
    山口県:35,
    徳島県:36,
    香川県:37,
    愛媛県:38,
    高知県:39,
    福岡県:40,
    佐賀県:41,
    長崎県:42,
    熊本県:43,
    大分県:44,
    宮崎県:45,
    鹿児島県:46,
    沖縄県:47
  }
  enum shipping_date: {
    １〜２日で発送:1,
    ２〜３日で発送:2,
    ４〜７日で発送:3,
  }
  enum status: {
    出品中:1,
    取引中:2,
    停止中:3,
    取引完了:4,
  }
end