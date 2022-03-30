source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 4.3' # app server
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0' # compressor for JavaScript assets
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5' # JSON APIs
# gem 'redis', '~> 4.0' # to run Action Cable in production
gem 'bcrypt', '~> 3.1.7'
# gem 'mini_magick', '~> 4.8'
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false # Reduces boot times through caching; required in config/boot.rb
gem "bootstrap-sass",          '3.4.1'
gem 'jquery-rails',            '4.3.1'
gem 'kaminari','~> 1.2.1' # run rails g kaminari:config[views default] for setting
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick" # (Runtime error) config/ini./app._ctrl._renderer.rb
gem 'cocoon' # for nested form
gem 'ransack' # for search function
gem 'rails-i18n' # for jp msg
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'pg' # postgresql
  gem 'therubyracer' # for assets
  gem 'rails_12factor' # for error log msg
  gem 'refile-s3' # for uploading to S3
end

group :development do
  gem 'web-console', '>= 3.3.0'  # call 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' # application running in the background
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
end

group :development, :test do
  gem 'pry-byebug' # for debugging
  gem 'pry-rails' # for pry console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  # call 'byebug' anywhere in the code
  gem 'rspec-rails' # for using rspec
  gem 'factory_bot_rails' # for generating test data
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.14.1'
  gem 'guard-minitest',           '2.4.6'
  gem 'capybara', '>= 2.15' # for feature spec
  # gem 'chromedriver-helper'
  # gem 'selenium-webdriver'
  gem 'poltergeist' # for ajax test
  gem 'database_cleaner'
end
