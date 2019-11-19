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
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|birthday|string|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|

### Association
<!-- - has_many :
- has_many :users_groups
- has_many :users, through: :users_groups -->