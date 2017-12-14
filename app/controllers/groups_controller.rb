class GroupsController < ApplicationController
  before_action :group_id, only: [:edit, :update]

  def index
    @groups = current_user.groups.order("id DESC")
  end

  def new
     @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループを作成しました'
    else
      render :new, alert: "グループの作成に失敗しました"
    end
  end

    def edit
    end

  def update
    if @group.save
      redirect_to :root, notice: 'グループを作成しました'
    else
      render :edit, alart: 'グループの作成に失敗しました'
    end
  end

  private

  def group_id
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, {user_ids: []})
    # params.require(:とってきたい).permit(:name, {uers_ids: []})
    # ユーザーのidが複数user_ids
  end
end

# コントローラではエラー文にはredirect_toではなくrenderを使います↓
# redirect_toでは再読み込みになり、errors.full_messagesのエラー文は表示されません

# サイドバーに表示する
# current_userの所属しているグループを全て取り出す
# @groups = current_user.groupsと定義
# controller/group/index
# →view/group/index
# →/shared/_sidebar.html.hamlに@groupsが存在するか確認
