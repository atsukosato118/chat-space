class GroupsController < ApplicationController

  def new
     @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループを作成しました'
    else
      flash[:alert]='グループの作成に失敗しました'
      render :create
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
    params.require(:group).permit(:name, {groups_ids: []})
    # params.require(:撮ってきたい).permit(:name, {groups_ids: []})
  end
end
