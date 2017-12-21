json.user @message.user.name
json.body  @message.body
json.image @message.image
json.time @message.created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M:%S")

# アソシエーションを組んでいるので
# @message.user.name
# 多        1    欲しい情報(今回はname)
