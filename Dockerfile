FROM ruby:3.2

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundler install
COPY . .
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]
