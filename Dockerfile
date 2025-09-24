FROM ruby:3.2.0

# 作業ディレクトリを設定
WORKDIR /makemate

# Node.js、Yarn、PostgreSQL clientを一括インストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y \
        nodejs \
        postgresql-client \
    && npm install --global yarn \
    && rm -rf /var/lib/apt/lists/*

# Bundlerをインストール
RUN gem install bundler

# 重要：先にGemfileだけコピー
COPY Gemfile Gemfile.lock ./

# その後にbundle install
RUN bundle install

# 最後にアプリケーションコード全体をコピー
COPY . .

# ポートを公開
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
