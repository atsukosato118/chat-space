class UsersController < ApplicationController
# ユーザーの検索
  def index
    # binding.pryでparamsの中身を確認
    @users = User.where('name LIKE(?)', "#{params[:keyword]}%")
    # binding.pryで@userの確認
     # paramsとして送られてきたkeyword（入力された語句）で、Userモデルのnameカラムを検索し、その結果を@usersに代入する
    # params[:keyword]}はjs(ajax)のとこからの値
    # jsonで返す
    # where ある条件にあてはまるものの最初の1つを取得する
     # whereは範囲を絞っただけなので、その範囲の中のどれを使うかを指定する必要があります
     # LIKE句は、曖昧(あいまい)な文字列の検索をすることができるもので、whereメソッドと一緒に使います
     # %	任意の文字列(空白文字列含む)
    respond_to do |format|
     format.json
   end
  end
# edit画面に行くときのアクション/編集するデータの取得
  def edit
  end

# updateボタンを押した時/特定のデータを更新
  def update
# binding.pryをここでしたらupdateアクションが押された時に処理が止まる
# current_user（デバイスで設定）のupadateしているため
    if current_user.update(user_params)
      redirect_to :root, notice: '登録内容を変更しました'
    else
      flash[:alert]='登録内容を変更してください'
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

# このコードは「params が :user というキーを持ち、
# params[:user] は :name 及び :email というキーを持つハッシュであること」を検証します。
# 参考
# http://www.techscore.com/blog/2013/01/29/rails4-%E3%81%AE-strong-parameters-%E3%81%A7%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%83%91%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF%E3%82%92%E6%A4%9C%E8%A8%BC%E3%81%99%E3%82%8B/

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

# データベースから取得したオブジェクトを更新(レコードの更新)
# 使い方
# モデル.update(カラム名 = 値)
#@user.update(user_params)は@use(@user = User.find(params[:id]))の内容を変更
