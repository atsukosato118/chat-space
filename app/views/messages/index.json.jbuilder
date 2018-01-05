json.array! @new_messages do |message|
  json.user message.user.name
  json.body  message.body
  json.image message.image
  json.time message.create_time(message.created_at)
  json.id message.id
end


# @messagesはmessage_controllerの以下に定義
# def message_group
#   @currentgroup = Group.find(params[:group_id])
#   @messages = @currentgroup.messages
#   @groups = current_user.groups.order("id DESC")
# end
# json.array! @messages do |message|で
# @messagesをmessagにする（中身は配列）
#
# createで必要なもの+messageのid
