Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'messages#index'
  resources :users, only:[:edit, :update]
  resources :groups, onl:[:new, :create, :edit, :update]
end

# ルートパスの設定
# usersコントローラはedit,updateアクションしか使っていないので、onlyオプションでアクションの指定
#パスはhttp://localhost:3000/rails/info/routesまたは$ rake routesで確認

# Railsでは、7つの基本アクションへのリクエストが下記の通りデフォルトで設定されています。これらのリクエストは、
# routes.rbにresources :ルーティングを設定したいコントローラ名と書くだけで反映させることができます

# Railsのリソースの7つのアクション	役割
# index	リソースの一覧を表示する。
# show	リソースの内容を表示する。
# new	リソースを追加する。
# create	リソースを追加し、作成する。
# edit	リソースを更新するためのフォームを表示する。
# update	リソースを更新する。
# destroy	リソースを削除する。
