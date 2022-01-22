FROM ruby:2.7.1

# 作業ディレクトリを/rails6_api_mysql8に指定
WORKDIR /rails-api

# ローカルのGemfileをDokcerにコピー
COPY Gemfile* /rails-api/

# /rails6_api_mysql8ディレクトリ上でbundle install
RUN bundle install
