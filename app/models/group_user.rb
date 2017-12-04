class GroupUser < ApplicationRecord
	belongs_to :group
    belongs_to :user
end


# ## group_usersテーブル
# |Column|Type|Options|
# |------|----|-------|
# |references|user|index: true, foreign_key: true|
# |references|group|index: true, foreign_key: true|

# ### Association
# - belongs_to :group
# - belongs_to :user