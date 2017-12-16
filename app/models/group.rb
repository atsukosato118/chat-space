 class Group < ApplicationRecord
 # name属性に値が存在しない場合バリデーションエラーになります
    validates :name, uniqueness: true, presence: true
    has_many :messages
    has_many :users, through: :group_users
    has_many :group_users

      class << self
      def last_message_show(group)
        if group.messages.last.try(:body).present? then
         return group.messages.last.body
        elsif group.messages.last.try(:image).present? then
          return "画像が投稿されています"
        else
          return "メッセージがありません"
        end
      end
    end
end

  # ## groupsテーブル

  # |Column|Type|Options|
  # |------|----|-------|
  # |name|string|null: false, unigue: true|

  # ### Association
  # - has_many :messages
  # - has_many :users, through: :group_users
  # - has_many :group_users
