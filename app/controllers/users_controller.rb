class UsersController < ApplicationController

# 編集するデータの取得
	  def edit
	  @user = User.find(params[:id])
	  end

# 特定のデータを更新
	  def update
	  # findメソッドで更新するデータを取得
	  @user = User.find(params[:id])

	  if @user.update(user_params)
	    redirect_to user_url(@user)
	  else
	    render 'edit'
	  end
	end
end
