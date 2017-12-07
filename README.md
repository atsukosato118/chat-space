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

##deviseの導入法
1.素材のダウンロード
2.deviseのインストール
3.usersモデルを作成する
4.deviseのビューファイルの追加
5.deviseのビューをダウンロードした素材と置き換える
6.サインアップ機能の追加
7.ユーザー情報編集機能の追加
8.サインアウト/サインイン機能の追加
9.フラッシュメッセージの表示機能の実装

1.素材のダウンロード
ユーザー管理で使用するビューは予めこちら(TECH Exp)で用意
atusko/projects/chat-spaceにDLを配置

2.deviseのインストール
・Gemfileの最後に以下を記載
  gem 'devise'
・bundle install
・サーバーを再起動

3.usersモデルを作成する
・deviseの設定
$ bundle exec rails g devise:install
・usersモデルの作成
$ bundle exec rails g devise User
 (マイグレーションファイルが作成できる)
$ rake db:migrate
 (作成されたマイグレーションファイルを実行/SequelProを開き、usersテーブルが作成されているか確認)

4.deviseのビューファイルの追加
$ bundle exec rails g devise:views

5.deviseのビューをダウンロードした素材と置き換える
 (2画面使うと便利)

6.サインアップ機能の追加
 usernameカラムを追加
 $ rails generate migration add_username_to_users username:string:uniq
 $ rake db:migrate




