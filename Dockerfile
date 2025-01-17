# syntax = docker/dockerfile:1

# Rubyのバージョンを指定
ARG RUBY_VERSION=3.2.3
FROM ruby:$RUBY_VERSION-slim AS base

# 作業ディレクトリ
WORKDIR /app

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libpq-dev \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# GemfileとGemfile.lockをコピーしてバンドルインストール
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# アプリケーションコードをコピー
COPY . .

# サーバー起動用のデフォルトコマンド
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]

# ポート3000を公開
EXPOSE 3000
