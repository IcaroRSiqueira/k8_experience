FROM ruby:3.2 as prod

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundler install
COPY . .
EXPOSE 3000

FROM ruby:3.2 as dev

EXPOSE 3001
