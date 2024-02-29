FROM ruby:3.2 as builder

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundler install
COPY . .
EXPOSE 3000

FROM ruby:3.2 as final
WORKDIR /app
COPY --from=builder /app .
CMD ["./k8_experience", "bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]
