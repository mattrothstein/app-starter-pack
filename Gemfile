source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
end
group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'faker', '~> 1.6.1'
end
group :development do
  gem 'sqlite3'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem 'devise-bootstrap-views'
gem 'ajax_modal'
gem 'twitter-bootstrap-rails'
gem "simple_calendar", "~> 2.0"
gem 'pg', group: :production
gem 'rails_12factor', group: :production
gem "cancancan"
gem 'rails_admin', '~> 1.1.1'
gem 'barby', '~> 0.6.4'
gem 'chunky_png'
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk'
gem "rails_admin_import", "~> 2.0"
gem 'will_paginate', '~> 3.1.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'smarter_csv'
gem 'tinymce-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
