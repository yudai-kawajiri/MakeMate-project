class ApplicationController < ActionController::Base
  # Deviseのコントローラーが呼ばれたときに、このメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ（新規登録）時に、nameカラムの入力を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # 必要であれば、アカウント編集時にもnameの更新を許可する
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # ★以前設定したログイン・登録後のリダイレクト先もこのファイルに記述されています。
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end