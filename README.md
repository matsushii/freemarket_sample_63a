# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|prefectures|
|nickname|varchar|null: false|
|email|varchar|null: false|
|password|varchar|null: false|
|first_name|varchar|null: false|
|last_name|varchar|null: false|
|birthday|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|string|null: false|
|address|integer|null: false|

### Association
<!-- - has_many :
- has_many :users_groups
- has_many :users, through: :users_groups -->

# itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|
|delivery_fee|integer|null: false|
|price|integer|null: false|
|text|string|null: false|

# purchase_historyテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
|item_id|integer|null: false|

# messageテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

# reviewテーブル

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|evaluation|integer|null: false|
|text|string|null: false|

# photosテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|

# items_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|items_id|reference|null: false, foreign_key: true|
|brand_id|reference|null: false, foreign_key: true|

# brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

# items_catsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|top_cats_id|reference|null: false, foreign_key: true|
|middle_cats_id|reference|null: false, foreign_key: true|
|bottom_cats_id|reference|null: false, foreign_key: true|


# top_catsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

# middle_catsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

# bottom_catsテーブル

|Column|Type|Options|
|------|----|-------|
|name|varchar|null: false|

