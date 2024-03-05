source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.3"

gem "rails", "7.1.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails"
  gem "pry"
  gem "pry-byebug"
  gem "rspec-rails"
end
