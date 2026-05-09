source "https://rubygems.org"

ruby "3.4.7"


gem "rails", "~> 8.1.3"
#asset pipeline
gem "sprockets-rails"

#web server
gem "puma", ">= 5.0"
#js import maps
gem "importmap-rails"
#turbo
gem "turbo-rails"
#stimulus
gem "stimulus-rails"
#json apis
gem "jbuilder"
#redis adapter
# gem "redis", ">= 4.0.1"

#kredis
# gem "kredis"

#password hashing
gem "bcrypt", "~> 3.1.7"

#windows tzinfo
gem "tzinfo-data", platforms: %i[ windows jruby ]

#bootstrap
gem 'bootstrap', '~> 5.3.8'
gem 'sassc-rails'
gem 'jquery-rails'
gem 'bootstrap-icons-helper'

gem "image_processing", "~> 1.2"

#faster boot
gem "bootsnap", require: false

#active storage variants
# gem "image_processing", "~> 1.2"

group :development, :test do
  #sqlite for dev
  gem "sqlite3", ">= 1.4"

  #debugger
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  #security scanner
  gem "brakeman", require: false

  #linter
  gem "rubocop-rails-omakase", require: false
end

group :production do
  #postgres in prod
  gem "pg", "~> 1.1"
end

group :development do
  #error console
  gem "web-console"
end

group :test do
  #system tests
  gem "capybara"
  gem "selenium-webdriver"
end
