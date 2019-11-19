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
|nickname|
|email|
|password|
|first_name|
|last_name|
|birthday|
|postal_code|
|prefectures|
|city|string|
|address|

### Association
<!-- - has_many :
- has_many :users_groups
- has_many :users, through: :users_groups -->

# itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|
|delivery_fee|
|price|
|text|

# purchase_historyテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|
|buyer_id|
|item_id|

# messageテーブル

|Column|Type|Options|
|------|----|-------|
|text|

# reviewテーブル

|Column|Type|Options|
|------|----|-------|
|rate|
|evaluation|
|text|

11/19
catgory brand 支払い情報