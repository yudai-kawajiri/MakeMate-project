source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# --- すべての環境で必要なGem ---
# 認証機能を簡単に実装する
gem "devise"
# JSON形式のAPIを簡単に構築する
gem "jbuilder"
# JavaScriptのESM importを管理する
gem "importmap-rails"
# PostgreSQLデータベースを使用する
gem "pg", "~> 1.1"
# Pumaウェブサーバーを使用する
gem "puma", "~> 5.0"
# Railsフレームワーク本体
gem "rails", "~> 7.0.4"
# HotwireのStimulusフレームワークを使用する
gem "stimulus-rails"
# RailsのSprocketsアセットパイプラインを使用する
gem "sprockets-rails"
# CSSフレームワークのTailwind CSSを使用する
gem "tailwindcss-rails"
# Windows環境のタイムゾーン情報
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
# HotwireのTurboフレームワークを使用する
gem "turbo-rails"
# アプリケーションの起動時間を短縮する
gem "bootsnap", require: false

# --- 開発環境とテスト環境で必要なGem ---
group :development, :test do
  # デバッグツール
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

# --- 開発環境で必要なGem ---
group :development do
  # 例外発生時にコンソールでデバッグを行う
  gem "web-console"
end

# --- テスト環境で必要なGem ---
group :test do
  # システムテストを行う
  gem "capybara"
  # ブラウザ操作を自動化する
  gem "selenium-webdriver"
end
