class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 未ログイン時はログインページに遷移
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # nameカラムを追加
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

  # :devise_controller?
  # deviseを生成した際にできるヘルパーメソッドの一つで、deviseにまつわる画面に行った時に、という意味がある。
  # こうすることで全ての画面でconfigure_permitted_parametersをするのを防いでいる

  # Deviseでのstrong parameters指定はGithubのREADMEより・・
  # Devise 4 では、Devise::ParameterSanitizer#permit を使って
  # Strong Parameters の設定を行います。username を許可するフィールドとして追加したい場合は
  # class ApplicationController < ActionController::Base
  #   before_action :configure_permitted_parameters, if: :devise_controller?
  #   protected
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  #   end
  # end


  # before_action :authenticate_user!
  # まずログインしているかをチェックし、ログインしていない場合はログイン画面に移動することになる。
  # ログインしていない場合＝falseの場合は、ログイン画面に自動的にリダイレクトしてくれる。
  # (サインインしてない場合はサインイン画面に飛ばす)
