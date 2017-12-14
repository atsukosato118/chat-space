class MessagesController < ApplicationController
  before_action :current_group, only: [:index, :update]
   # インデックスアクションの追加
   # コントローラークラスのインスタンスメソッドはアクションと呼ばれる
   def index
     @group = current_user.groups
     @currentgroup = Group.find(params[:group_id])

     @messages = @currentgroup.messages

   end

   def create
     @message = current_user.messages.new(message_params)
     if @message.save
       render group_messages_path, notice:"メッセージの送信に成功しました"
     else
       render group_messages_path, alart:"メッセージの送信に失敗しました"
  end

  private

  # def current_group
  # @currentgroup = Group.find(params[:group_id])
  # end

  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end
end

# サイドバーに表示する
# @groups = current_user.groups
# current_userの所属しているグループを全て取り出す

# チャットスペースのメインに表示する
#  @currentgroup = Group.find(params[:group_id]
# params[:パラメータ名]で欲しいパラメーター取得
# find(params[:group_id]
# findメソッドに、idカラムの値を指定すると、その値を持つレコードを取り出す
# Group.find(params[:group_id])→指定したgroup_idレコードを取り出す
# （例えばgroup_idが1ならばGroupモデルのgroupsテーブルのid=1のレコードを全て取り出す）

# @messages = @currentgroup.messages
# group_idで指定されたグループのgroupテーブルの中から全てのmessagesを取り出す

# private
# def message_params
#   params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
# ユーザーが投稿フォームで送信した値以外のキーもストロングパラメーターを介して取得したい場合に利用（基本的にパラメーターは入力された値のキーしか持たない。つまりgroup_idとuser_idの2つはパラメーターのキーとして存在しないため）
# ①投稿フォームで入力した値について
# 1.requireでPOSTで受け取る値のキーを設定
# 2.permitで許可するカラムを設定
# →params が :message というキーを持ち、params[:message] は :content 及び :image というキーを持つハッシュである
# ①投稿フォームで入力した値以外については.merge(group_id: params[:group_id])として追加

# def create
#   @message = current_user.messages.new(message_params)
# 1.current_user.messagesでcurrent_userのmessagesを取得
# 2.取得したcurrent_userのmessagesに対してcreateメソッドを適用
# 3.message_paramsの返り値はハッシュ{contant: "コメント", image: "〜.jpg", group_id:, params[:group_id]"}
