source 'https://rubygems.org'
source 'https://8dezqz7z7HWea9vtaFwg:@gem.fury.io/me/' # thibaud@jilion.com account

ruby '2.0.0'

gem 'rails', '~> 4.0.2'
gem 'sublime_video_layout', '3.0.0', path: '~/Code/Jilion/Products/SublimeVideo/sublime_video_layout'

# Views
gem 'haml'
gem 'haml-contrib'
gem 'bourbon', github: "octave/bourbon"
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
  gem 'rack-google-analytics', '0.11.0'
end

group :staging, :production do
  gem 'unicorn'
  gem 'rails_12factor' # Heroku integration: https://devcenter.heroku.com/articles/rails-integration-gems
  gem 'rack-ssl-enforcer'
  gem 'memcachier'
  gem 'dalli'
  gem 'memcachier'
  gem 'rack-cache'
  gem 'lograge'
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

group :development do
  gem 'ruby_gntp', require: false
  gem 'guard-pow', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'rack-livereload'
  gem 'rack-nocache'
end

group :test do
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
