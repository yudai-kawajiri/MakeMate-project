# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable (データベース認証)
      # ユーザーのメールアドレス（ログインID）
      t.string :email,              null: false, default: ""
      # 暗号化されたパスワード
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable (パスワードリセット)
      # パスワードリセット用のトークン
      t.string   :reset_password_token
      # パスワードリセットメール送信日時
      t.datetime :reset_password_sent_at

      ## Rememberable (ログイン状態の保持)
      # ログイン情報を記憶した日時
      t.datetime :remember_created_at

      ## Trackable (ログイン情報の追跡)
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable (メールアドレス確認)
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable (アカウントロック)
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    # メールアドレスをインデックス化し、重複を禁止
    add_index :users, :email,                unique: true
    # パスワードリセットトークンをインデックス化し、重複を禁止
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
