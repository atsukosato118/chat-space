class MessagesController < ApplicationController

  # before_actionで全てのアクションで@groupsを使えるように
  before_action :message_group, only: [:index, :create]
   # インデックスアクションの追加
   # コントローラークラスのインスタンスメソッドはアクションと呼ばれる
   def index
     @message = Message.new
     # @new_messages = @currentgroup.messages.where("id > ?", params[:id])
     @new_message = @currentgroup.messages.last
     respond_to do |format|
      format.html
      format.json
    end
   end

   def create
     @message = Message.new(message_params)
     if @message.save
       # binding.pry@messageが渡されているか確認
       respond_to do |format|
         format.html { redirect_to group_messages_path(params[:group_id]) }
         format.json
         # format.html はデフォルトのurlが実はhttp://localhost:3000/groups/53/messages.htmlなのでHTMLがないとエラーが起こる
         # 今回ajaxでjsonに指定
         # jsonで送信されたらwebの更新リロードのとこは変化しない
         # jsonの内容はcreate.json.jbuilder
      end
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def message_group
    @currentgroup = Group.find(params[:group_id])
    @messages = @currentgroup.messages.includes(:user)
    @groups = current_user.groups.order("id DESC")
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
#   params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
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


# 自動更新
# @messages.where

# includes(:user)でN+１問題を解決
