# base image
FROM ruby:3.0.1-alpine

ENV APP_PATH /app

COPY ./docker-entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN apk --update add --no-cache \
build-base \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata

RUN gem install bundler

COPY Gemfile $APP_PATH/
COPY Gemfile.lock $APP_PATH/

WORKDIR $APP_PATH

RUN bundle install

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
