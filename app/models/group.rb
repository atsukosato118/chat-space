 class Group < ApplicationRecord
 # name属性に値が存在しない場合バリデーションエラーになります
    validates :name, uniqueness: true, presence: true
  	has_many :messages
  	has_many :users, through: :group_users
  	has_many :group_users
  end

  # ## groupsテーブル

  # |Column|Type|Options|
  # |------|----|-------|
  # |name|string|null: false, unigue: true|

  # ### Association
  # - has_many :messages
  # - has_many :users, through: :group_users
  # - has_many :group_users
