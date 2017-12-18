# ファイル名→specファイルは対応するクラス名_spec.rb
require 'rails_helper'
describe Message do
  describe '#create' do
    # メッセージがあれば保存できる
    it "is valid with a message " do
      message = build(:message, body: "")
      expect(message).to be_valid
    end
    # # 画像があれば保存できる
    # it "is valid with a image " do
    #   message = build(:message, body: nil)
    #   expect(message).to be_valid
    # end
    # # メッセージと画像があれば保存できる
    # it "is valid with a image " do
    #   message = build(:message)
    #   expect(message).to be_valid
    # end
    # # メッセージも画像もないと保存できない
    # it "is invalid without a message and image " do
    #   message = build(:message, image: "")
    #   message = build(:message, body: nil)
    #   message.valid?
    #   # expect(user.errors[:image]).to include("can't be blank")
    # end
  end

end


  # message = build(:message, body: nil)
  # # build:インスタンスを生成（ただし未保存）
  # 必要なモデルはfactoryで全部作る！
  # 今回はgroup.rb/messages.rb/users.rb
