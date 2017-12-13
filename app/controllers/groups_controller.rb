class GroupsController < ApplicationController

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
    @group = group.find(params[:id])
  end

  def update
    @group = group.find(params[:id])
    if @group.save
      redirect_to :root, notice: 'グループを作成しました'
    else
      render :edit, alart: 'グループの作成に失敗しました'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
    # params.require(:とってきたい).permit(:name, {uers_ids: []})
    # ユーザーのidが複数user_ids
  end
end

# コントローラではエラー文にはredirect_toではなくrenderを使います↓
# redirect_toでは再読み込みになり、errors.full_messagesのエラー文は表示されません
