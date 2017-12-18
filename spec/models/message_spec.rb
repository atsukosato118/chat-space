# ファイル名→specファイルは対応するクラス名_spec.rb
require 'rails_helper'
describe Message do
  describe '#create' do
    # メッセージがあれば保存できる
    it "is valid with a message " do
      message = build(:message, body: nil)
      expect(message).to be_valid
    end
    # 画像があれば保存できる
    it "is valid with a image " do
      message = build(:message, body: nil)
      expect(message).to be_valid
    end
     # メッセージと画像があれば保存できる
    it "is valid with a image " do
      message = build(:message)
      expect(message).to be_valid
    end
    # メッセージも画像もないと保存できない→メッセージと画像があれあば保存できる
    it "is valid with a message and image " do
      message = build(:message)
      expect(message).to be_valid
    end
    # group_idが無いと保存できない
    it "is valid without group_id " do
      message = build(:message, group: nil)
      message.valid?
      expect(message.errors[:group]).not_to include("group can't be blank")
    end
    # user_idが無いと保存できない
    it "is valid without user_id " do
      message = build(:message, user: nil)
      message.valid?
      expect(message.errors[:user]).not_to include("user can't be blank")
    end
  end

end


  # message = build(:message, body: nil)
  # # build:インスタンスを生成（ただし未保存）
  # 必要なモデルはfactoryで全部作る！
  # 今回はgroup.rb/messages.rb/users.rb
