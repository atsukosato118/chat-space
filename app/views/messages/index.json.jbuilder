json.array! @new_messages do |new_message|
  json.user new_message.user.name
  json.body  new_message.body
  json.image new_message.image
  json.id new_message.id
  json.time new_message.create_time(new_message.created_at)
end
# json.user @new_messages.id
# json.user @new_messages.user.name
# json.body  @new_messages.body
# json.image @new_messages.image
# json.time @new_messages.create_time(@new_messages.created_at)

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
