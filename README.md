# Freemarket_sample DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|varchar|null: false|
|email|varchar|null: false|
|password|varchar|null: false|
|first_name|varchar|null: false|
|last_name|varchar|null: false|
|birthday|string|null: false|
### Association
- has_many :items
- has_many :purchase-histories
- has_many :likes
- has_many :messages
- has_many :comments
- has_many :profiles

## profilesテーブル
|Column|Type|Otions|
|------|----|------|
|user_id|references|null: false, foreign_key :true|
|zip-code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string||
### Association
- belongs_to :user, optional: true

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
|delivery-fee|integer|null: false|
|price|integer|null: false|
|text|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :purchase-history
- has_many :likes
- has_one :review
- has_many :images
- has_many :comments
- has_many :messages
- belongs_to :brand
- belongs_to :category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null :false|
### Association
belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :item

## purchase_historiesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
- has_one :review

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## reviewsテーブル
#### 未確定なので、実装はおまちください
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|evaluation|integer|null: false|
|text|string|null: false|
### Association
- belongs_to :item
- belongs_to :purchase_history

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
### Association
- has_many :items
- has_many :categories, through :brands_categories
- has_many :brands_categories

## brands_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :brand
- belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|top_cat_id|reference|null: false, foreign_key: true|
|middle_cat_id|reference|null: false, foreign_key: true|
|bottom_cat_id|reference|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :top_cat
- belongs_to :middle_cat
- belongs_to :bottom_cat

## top_catsテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
### Association
- has_many :categories

## middle_catsテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
### Association
- has_many :categories

## bottom_catsテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
### Association
- has_many :categories
