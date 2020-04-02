FROM ruby:2.4.4-alpine3.7 as base

ENV APP /app
WORKDIR $APP

COPY Gemfile $APP
COPY Gemfile.lock $APP

COPY . $APP

RUN apk --update add --virtual build_deps build-base mariadb-dev g++ linux-headers \
  && bundle install -j 10 --quiet \
  && apk del build_deps
