# Freemarket_sample DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|varchar|null: false|
|email|varchar|null: false|
|password|varchar|null: false|
|first_name|varchar|null: false|
|last_name|varchar|null: false|
|birthday|string|null: false|
|zip-code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string||
### Association
- has_many :items
- has_many :purchase-histories
- has_many :likes
- has_many :messages
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
|delivery-fee|integer|null: false|
|price|integer|null: false|
|text|string|null: false|
### Association
- belongs_to :user
- belongs_to :purchase-history
- has_many :likes
- has_one :review
- has_many :photos
- has_many :comments
- has_many :messages
- belongs_to :brand
- belongs_to :category

## purchase_historiesテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
|item_id|integer|null: false|
### Association
- belongs_to :user
- belongs_to :item
- has_one :review

## messageテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

## reviewテーブル

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|evaluation|integer|null: false|
|text|string|null: false|

## photosテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|

## items_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|items_id|reference|null: false, foreign_key: true|
|brand_id|reference|null: false, foreign_key: true|

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

## items_catsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|top_cats_id|reference|null: false, foreign_key: true|
|middle_cats_id|reference|null: false, foreign_key: true|
|bottom_cats_id|reference|null: false, foreign_key: true|


## top_catsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

## middle_catsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

## bottom_catsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

