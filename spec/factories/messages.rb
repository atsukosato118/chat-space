FactoryGirl.define do

  factory :message do
    body "hello"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/cat.jpeg'))
    group
    user
  end

end

# factory :モデル名 do
#   今回はメッセージ(body),画像(image),group_id,user_idのため・・
#   image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/cat.jpeg'))
# Factoryで画像を用意する場合(CarrierWaveを使った)
# 'specフォルダ/fixturesフォルダにある/ダウンロードしたcat.jpegの画像'
#   group
# user
