source 'https://rubygems.org'
source 'https://gems.gemfury.com/8dezqz7z7HWea9vtaFwg' # thibaud@jilion.com account

ruby '2.0.0'

gem 'bundler'

gem 'rails', '~> 4.0.0'
 # Heroku integration: https://devcenter.heroku.com/articles/rails-integration-gems
# gem 'sublime_video_layout', '3.0.0.alpha' # hosted on gemfury
# Pro-tip: bundle config local.sublime_video_layout ~/Code/Jilion/Products/SublimeVideo/sublime_video_layout
gem 'sublime_video_layout', '3.0.0.rc.4'

# Views
gem 'haml'
gem 'haml-contrib'
gem 'bourbon', github: "octave/bourbon"
gem 'RedCloth'
gem 'turbolinks', github: 'jilion/turbolinks', branch: 'ios_video_issue'
gem 'google-analytics-turbolinks'

# Internals
# gem 'bson_ext'
gem 'mongoid', github: 'mongoid/mongoid' # until 4.0.0
gem 'indextank'
gem 'oj'
gem 'lograge'
gem 'rack-status'
gem 'librato-rails'
gem 'honeybadger'

# Gems used only for assets and not required
# in production environments by default.
gem 'asset_sync'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

group :production do
  gem 'rack-google-analytics', '0.11.0'
end

group :staging, :production do
  gem 'unicorn', require: false
  gem 'dalli'
  gem 'memcachier'
  gem 'rack-cache'
  gem 'rack-ssl-enforcer'
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
  gem 'dotenv-rails'
  gem 'rack-livereload'
  gem 'rack-nocache'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner'
end
