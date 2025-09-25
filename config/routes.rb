Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users

  # 認証状態によるルートの振り分け
  devise_scope :user do
    authenticated :user do
      # ログイン済み：ダッシュボードへ
      root to: 'dashboards#index', as: :authenticated_root
    end

    unauthenticated do
      # 未ログイン：ログイン画面へ
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # ダッシュボードへのアクセスルート
  get 'dashboard', to: 'dashboards#index'
  # ... その他のリソース定義
end
