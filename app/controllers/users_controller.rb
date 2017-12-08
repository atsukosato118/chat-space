class UsersController < ApplicationController

# 編集するデータの取得/edit画面に行く
	  def edit
	  @user = User.find(params[:id])
	  end

# 特定のデータを更新/updateボタンを押した時
	  def update
	  # findメソッドで更新するデータを取得
	  # binding.pry
	  @user = User.find(params[:id])
	  if @user.update(user_params)
	  	redirect_to :root, notice: "ok"
	  else
	  	render :edit
	  end
  end

  private
  def user_params
  		params.require(:user).permit(:name, :email)
  end
end
