# ベースとなるimage
FROM ruby:2.3.1

# ワークディレクトリの作成
RUN mkdir /myapp

# ワークディレクトリの設定
ENV APP_ROOT /myapp
WORKDIR $APP_ROOT

# 必要なパッケージのインストール。build-essential,posgre(もとから入っているらしい),node
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential nodejs && \
    rm -rf /var/lib/apt/lists/*

# gemfileの作成
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

# そのまんま
RUN bundle install

# ベースとなるimage
FROM ruby:2.3.1

# ワークディレクトリの作成
RUN mkdir /myapp

# ワークディレクトリの設定
ENV APP_ROOT /myapp
WORKDIR $APP_ROOT

# 必要なパッケージのインストール。build-essential,posgre(もとから入っているらしい),node
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential nodejs && \
    rm -rf /var/lib/apt/lists/*

# gemfileの作成
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

# そのまんま
RUN bundle install
