class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :emptymessage, presence: true

  def emptymessage
    body.presence || image.presence
  end

  mount_uploader :image, ImageUploader

end

  # ## messagesテーブル

  # |Column|Type|Options|
  # |------|----|-------|
  # |body|text|null: false|
  # |image|string|null: false|
  # |group_id|integer|foreign_key: true|
  # |user_id|integer|foreign_key: true|

  # ### Association
  # - belongs_to :group
  # - belongs_to :user
