FROM ruby:3.2.0

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    npm \
    postgresql-client \
    vim

# 作業ディレクトリを設定
WORKDIR /app

# GemfileとGemfile.lockをコピー（後で作成）
COPY Gemfile* ./

# Bundlerをインストール
RUN gem install bundler

# 依存関係をインストール
RUN bundle install

# アプリケーションコードをコピー
COPY . .

# ポート3000を公開
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
