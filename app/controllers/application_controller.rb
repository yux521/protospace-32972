class ApplicationController < ActionController::Base
  # ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!
  # deviseのコントローラーから呼び出された場合動く
  before_action:configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters  # メソッド名は慣習
    # deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end

# deviseをインストールすることでdevise_parameter_sanitizerメソッドが使えるようになります。deviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッドです。
# 今回は「:name, :profile, :occupation, :positionカラム」を追加したので、このメソッドを使用し、キーの内容の保存をpermitメソッドで許可しています。
