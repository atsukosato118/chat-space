require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message) }
  # factorygirlによって作られたデータ name Faker::Name.nameなどが{ create(:user) }
  # let(:user) { create(:user) }はインスタンス変数を使って表すと
  # @user = User.create(name: 'Taro', email: 'taro@example.com', ....)
  # let(:user)とすることで{ create(:user) }を変数として使うことができるようになる

# index(メッセージ一覧ページを表示するアクション)のテスト
   describe 'GET #index' do
    context "when user sign_in" do
      before do
        sign_in user
# 該当するビューが描画されているか
        get :index, params: {group_id: group}
        # rake routesより group_messages GET    /groups/:group_id/messages
        # paramsで遷移先のgroup_id獲得
      end
      #アクション内で定義しているインスタンス変数(@currentgroup)があるか？
      it "assigns the requested messsage to @currentgroup" do
       expect(assigns(:currentgroup)).to eq group
       # currentgroup(遷移先のgroup_id)が、let(:group)(factorygirlによってできたgroup)と一緒であるかについてテスト
      end
    end
    context "when user not sign_in" do
      it "cannot access and redirects to login page for user" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
  # createアクション(メッセージを作成するアクション)のテスト
  describe 'POST #create' do
    # sign_inしている場合
    context "when user sign_in" do
      before do
        sign_in user
      end
    # データベースにメッセージが保存された時
      it  " saves the new contact in the database" do
        # 下に解説1
        expect{ post :create, params: { group_id: group, message: attributes_for(:message) } }.to change(Message, :count).by(1)
      end
       # データベースにメッセージが保存された時にgroup_messages_pathへ(解説２)
      it  " redirect to index when saves the new contact in the database" do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
      # データベースにメッセージが保存されなかった時
      it  " unsaves the new contact in the database" do
        # 保存されないのでbody,imageの情報がnil
        expect{ post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil) } }.to change(Message, :count).by(0)
      end
      # データベースにメッセージが保存されなかった時にindexへ(解説２)
      it  " render to index when unsaves the new contact in the database" do
        post :create, params: { group_id: group.id, message: attributes_for(:message, body: nil, image: nil) }
        expect(response).to render_template(:index)
      end
    end
    context "when user not sign_out" do
      # ログインしていない場合にsign-up画面に
      it "cannot access and redirects to login page for user" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
# 解説１group_messages
# POST   /groups/:group_id/messages(.:format) messages#createの時
# group_idが必要
# messageを保存する
# (factorygirlが作ったmessageにはbod,message,image,group入っている)
# これらをparamsでまとめるためにattributes_forでキーを文字列にする
# 保存された場合Messageテーブルの値が1

# 解説２
# messageがないとMessagesController POST #create when user sign_in  redirect to index when saves the new contact in the database
#      Failure/Error: params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])のエラーが出る
