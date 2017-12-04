class User < ApplicationRecord
	has_many :messages
	has_many :groups, through: :group_users
	has_many :group_users
end

## usersテーブル

# |Column|Type|Options|
# |------|----|-------|
# |name|string|null: false|
# |email|string|null: false, unigue: true|


### Association
# - has_many :messages
# - has_many :groups, through: :group_users
# - has_many :group_users