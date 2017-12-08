class UsersController < ApplicationController

# edit画面に行くときのアクション/編集するデータの取得
	  def edit
	  @user = User.find(params[:id])
	  end

# updateボタンを押した時/特定のデータを更新
	  def update
binding.pry
	  # binding.pryをここでしたらupdateアクションが押された時に処理が止まる
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


# 特定のIDのデータを取得したい
# @user = User.find(params[:id])
# Userテーブルの[:id]のデータ取得

# if @user.update(user_params)
# 	ここでprivateメソッドのdef user_paramsが呼び出される

# ストロングパラメーター
# 指定したキーを持つパラメーターのみを受け取るようにするもの
# params.require(:user).permit(:name, :email)
# ①requireでPOSTで受け取る値のキーを設定
# ②permitで許可するカラムを設定(DBに入れるカラムを設定)

# ビューから送られてきた情報のハッシュであるparamsの中から:name, :email,
# というキーとそのバリューのセットだけを残した新たなハッシュを生成しています。
# この新たなハッシュが、tweet_paramsメソッドの返り値となる

# redirect_to :root controller経由でrootパスへ
# notice: "ok" okの通知

# render :edit controllerを経由しないでeditへ
# (edit-update) (new-create)のようにワンセットの時はrenderを使用することが多い

# binding.pryを記載の場所でした時rails c --sandboxで確認すると
#  ※rails c --sandboxだとDBに値が保存されない

# $ rails c --sandbox
# b(main):001:0> user = User.new(name: "sato", email: "sasa@sas")
# b(main):002:0> user.saveで保存
# b(main):003:0> paramsで確認
# utf8"=>"✓", "_method"=>"patch", "authenticity_token"=>"JdFV8lC+/q6kR2avBSUR8bsknhdkcFjeaDhATMAa3NOxltoY3xQw+Jgata2lPT1Sy/wtFo6hxiPqQfNGzMjO+A=="
#  "user"=>{"name"=>"atsuko", "email"=>"atsuko@atsuko", "password"=>"", "password_confirmation"=>""}, "commit"=>"Update", "controller"=>"users", "action"=>"update", "id"=>"1"} permitted: false>
# paramsの中身表示される
 # b(main):003:0> params[:id]
 # idの値を表示


