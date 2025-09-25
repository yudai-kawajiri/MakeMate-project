Rails.application.routes.draw do
  # Chrome DevToolsのエラー抑制ルーティング (必要であれば)
  get '/.well-known/appspecific/com.chrome.devtools.json', to: proc { [404, {}, ['']] }, constraints: { format: /json/ }

  devise_for :users

  # ダッシュボードへのアクセスルート
  get 'dashboard', to: 'dashboards#index'

  # 認証状態によるルートの振り分け
  devise_scope :user do
    authenticated :user do
      root to: 'dashboards#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
