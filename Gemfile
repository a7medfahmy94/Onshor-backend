source 'https://rubygems.org'


gem 'rails', '4.2.2'

gem 'rails-api'

gem 'spring', :group => :development


gem 'mysql2', '~> 0.3.20'

gem 'apipie-rails', github: 'Apipie/apipie-rails', ref: '928bd858fd14ec67eeb9483ba0d43b3be8339608'
gem 'active_model_serializers', github: "rails-api/active_model_serializers"

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "spork-rails"
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-spork'
end

group :development do
  gem 'pry-rails'
  gem "awesome_print", require:"ap"
end
