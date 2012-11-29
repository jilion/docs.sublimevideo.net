source 'https://rubygems.org'
source 'https://gems.gemfury.com/8dezqz7z7HWea9vtaFwg' # thibaud@jilion.com account

ruby '1.9.3'

gem 'bundler'

gem 'rails', '3.2.9'
gem 'sublime_video_layout', '~> 1.1' # hosted on gemfury

# Views
gem 'haml'
gem 'RedCloth'
gem 'turbolinks', '0.5.1'

# Internals
gem 'mongoid'
gem 'dalli'
gem 'indextank'
gem 'airbrake'
gem 'librato-rails'
gem 'lograge'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'asset_sync'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'rack-google-analytics'
end

group :staging, :production do
  gem 'thin'
  gem 'rack-cache'
  gem 'rack-ssl-enforcer'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rack-livereload'
  gem 'quiet_assets'
  gem 'silent-postgres'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
end

group :tools do
  gem 'powder'
  gem 'pry'

  # Guard
  gem 'terminal-notifier-guard'
  gem 'rb-fsevent'

  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rspec'
end
