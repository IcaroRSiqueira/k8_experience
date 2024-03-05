FROM ruby:3.2 as dev
WORKDIR /app

FROM dev as prod
COPY Gemfile .
COPY Gemfile.lock .
RUN bundler install
COPY . .