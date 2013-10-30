source 'https://rubygems.org'
source 'https://8dezqz7z7HWea9vtaFwg:@gem.fury.io/me/' # thibaud@jilion.com account

ruby '2.0.0'

gem 'rails', '~> 4.0.0.rc.3'
gem 'sublime_video_layout', '~> 2.0' # hosted on gemfury

# Views
gem 'haml'
gem 'haml-contrib'
gem 'RedCloth'
gem 'turbolinks'
gem 'google-analytics-turbolinks'

# Internals
gem 'mongoid', github: 'mongoid/mongoid', ref: 'f91fe' # Rails 4 support
gem 'indextank'
gem 'oj' # Faster JSON
gem 'kgio' # Faster IO

# Monitoring
gem 'rack-status'
gem 'honeybadger'
gem 'librato-rails'

gem 'coffee-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier'
  gem 'sass-rails'
end

group :production do
  gem 'rack-google-analytics'
end

group :staging, :production do
  gem 'unicorn'
  gem 'rails_12factor' # Heroku integration: https://devcenter.heroku.com/articles/rails-integration-gems
  gem 'rack-ssl-enforcer'
  gem 'memcachier'
  gem 'dalli'
  gem 'rack-cache'
  gem 'lograge'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rack-livereload'
  gem 'rack-nocache'
  gem 'quiet_assets'
  gem 'silent-postgres'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner'
end

group :tools do
  # Guard
  gem 'ruby_gntp', require: false
  gem 'guard-pow', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
end
