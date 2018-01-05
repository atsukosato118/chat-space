json.user @message.user.name
json.body  @message.body
json.image @message.image
json.time @message.create_time(@message.created_at)

# アソシエーションを組んでいるので
# @message.user.name
# 多        1    欲しい情報(今回はname)

# @message.create_time(message.created_at)
# Messageテーブルのcreated_atを取ってくる
#
#  @message.create_time(@message.created_at)
# modelにメソッド書いてあげる
