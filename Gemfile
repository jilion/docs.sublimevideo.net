source 'https://rubygems.org'
source 'https://gems.gemfury.com/8dezqz7z7HWea9vtaFwg' # thibaud@jilion.com account

ruby '2.0.0'

gem 'bundler'

gem 'rails', '~> 4.0.0'
gem 'rails_12factor' # Heroku integration: https://devcenter.heroku.com/articles/rails-integration-gems
gem 'sublime_video_layout', '~> 2.0' # hosted on gemfury

# Views
gem 'haml'
gem 'haml-contrib'
gem 'RedCloth'
gem 'turbolinks', github: 'jilion/turbolinks', branch: 'ios_video_issue'
gem 'google-analytics-turbolinks'

# Internals
# gem 'bson_ext'
gem 'mongoid', github: 'mongoid/mongoid' # until 4.0.0
gem 'indextank'
gem 'oj' # fastest json
gem 'lograge'
gem 'rack-status'
gem 'librato-rails', github: 'librato/librato-rails', branch: 'feature/rack_first'
gem 'honeybadger'

# Gems used only for assets and not required
# in production environments by default.
gem 'asset_sync'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

group :production do
  gem 'rack-google-analytics'
end

group :staging, :production do
  gem 'unicorn'
  gem 'dalli'
  gem 'rack-cache'
  gem 'rack-ssl-enforcer'
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
  gem 'powder'

  # Guard
  gem 'terminal-notifier-guard'
  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rspec'
end
