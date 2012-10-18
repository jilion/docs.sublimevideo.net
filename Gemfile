source 'https://rubygems.org'
source 'https://gems.gemfury.com/8dezqz7z7HWea9vtaFwg' # thibaud@jilion.com account

ruby '1.9.3'

gem 'bundler', '~> 1.2.0'

gem 'rails',               '3.2.8'
gem 'sublimevideo_layout', '1.4.1' # hosted on gemfury

# Views
gem 'haml'
gem 'RedCloth', '~> 4.2.9'

# Internals
gem 'mongoid',   '~> 3.0.5'
gem 'dalli',     '~> 2.1.0'
gem 'indextank', '~> 1.0.12'
gem 'airbrake',  '~> 3.1.2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'asset_sync'
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier'
end

group :production do
  gem 'rack-google-analytics', '~> 0.11'
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
  gem 'heroku'
  gem 'foreman'
  gem 'powder'
  gem 'pry'

  # Guard
  gem 'terminal-notifier-guard'
  platforms :ruby do
    gem 'coolline'
  end

  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rspec'
end
