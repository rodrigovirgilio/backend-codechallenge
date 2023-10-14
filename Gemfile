source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '5.4.0'
# Execute jobs in the background. Read more: https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.2.1'
# Testing API calls
gem 'rspec-rails'
gem 'shoulda-matchers'
gem 'database_cleaner'
gem 'factory_bot_rails'
gem 'faker'
# API Doc generator
gem 'apipie-rails', '~> 1.2', '>= 1.2.2'

group :test do
  gem 'rspec-sidekiq', '~> 4.0', '>= 4.0.2'
end
