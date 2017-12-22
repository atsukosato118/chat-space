Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'groups#index'
  resources :users, only:[:index, :edit, :update]
  resources :groups, only:[:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
end

# ルートパスの設定
# usersコントローラはedit,updateアクションしか使っていないので、onlyオプションでアクションの指定
#パスはhttp://localhost:3000/rails/info/routesまたは$ rake routesで確認

# Railsでは、7つの基本アクションへのリクエストが下記の通りデフォルトで設定されています。これらのリクエストは、
# routes.rbにresources :ルーティングを設定したいコントローラ名と書くだけで反映させることができます

# Railsのリソースの7つのアクション	役割
# index	リソースの一覧を表示する。
# show	リソースの内容を表示する。１つ１つの詳細（マイページとか）
# new	リソースを追加する。新規作成
# create	リソースを追加し、作成する。実際に作る
# edit	リソースを更新するためのフォームを表示する。
# update	リソースを更新する。
# destroy	リソースを削除する。

#ネストしているため、 group_messages POST   /groups/:group_id/messages(.:format)となる
# ネストについて（例）
#resources :clients
# 生成されるルーティングは /clients/:idである（複数形だから）※単数系だと：idが含まれない
# resources :clients do
#   #ネストすると/clients/:id/password になり、クライアントのパスワード設定ページへのルーティングを行える
#   resource :password
# end
# クライアントidが1番のアカウントのパスワードを設定するページを新規に作る時などに利用出来る
