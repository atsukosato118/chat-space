require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message) }
  # factorygirlによって作られたデータ name Faker::Name.nameなどが{ create(:user) }
  # let(:user) { create(:user) }はインスタンス変数を使って表すと
  # @user = User.create(name: 'Taro', email: 'taro@example.com', ....)
  # let(:user)とすることで{ create(:user) }を変数として使うことができるようになる


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
    context "when user sign_in" do
      it "cannot access and redirects to login page for user" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
