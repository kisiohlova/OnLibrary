source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "simple_form"
gem "tzinfo-data"
gem "bootsnap", require: false
gem "devise", "~> 4.9", ">= 4.9.2"

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  gem "faker", "~> 3.2", ">= 3.2.1"
  gem "factory_bot_rails"
end

group :test do
  gem "rspec-rails"
  gem "shoulda-matchers", "~> 5.0"
  gem "database_cleaner"
end

group :development do
  gem "web-console"
end
