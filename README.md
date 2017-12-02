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

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|string|null: false|
|group_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unigue: true|

### Association
- has_many :messages
- has_many :groups, through: :group_users
- has_many :group_users


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unigue: true|

### Association
- has_many :messages
- has_many :users, through: :group_users
- has_many :group_users


## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|references|user|index: true, foreign_key: true|
|references|group|index: true, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user