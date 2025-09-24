class User < ApplicationRecord
  # Deviseが提供する認証モジュールを有効化します。
  # 以下のリストにない機能（例: メール認証、アカウントロックなど）はコメントアウトされています。
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, # メールとパスワードによる認証を可能にします。ログイン機能の基本
         :registerable,         # ユーザーの新規登録を可能にします
         :recoverable,          # パスワードリセット機能を有効にします
         :rememberable,         # 「ログインを保持する」機能を可能にします
         :validatable           # メールアドレスとパスワードの形式を検証（バリデーション）します
end
