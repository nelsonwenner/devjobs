source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'active_model_serializers', '~> 0.10.0'
gem 'redis', '~> 4.2.5'
gem 'sidekiq', '~>6.1.3'
gem 'figaro', '~> 1.2'

group :development do
  gem 'brakeman', '~> 5.0', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'rspec-rails', '~> 4.0'
  gem 'faker', '~> 2.15'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'awesome_print', '~> 1.8'
  gem 'pry-rails', '~> 0.3.9'
  gem 'pry', '~> 0.13.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
