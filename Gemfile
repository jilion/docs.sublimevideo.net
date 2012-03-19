source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'thin'

gem 'sublimevideo_layout', git: 'git@github.com:jilion/sublimevideo_layout.git'

# Views
gem 'haml',                  '~> 3.1.3'
gem 'RedCloth',              '~> 4.2.9'

# Internals
gem 'responders',            '~> 0.7.0'
gem 'settingslogic',         '2.0.6' # 2.0.7 has ruby-debug19 & jeweler as dependencies => UNACCEPTABLE

gem 'airbrake',              '~> 3.0.5'
gem 'prowl',                 '~> 0.1.3'

# Perf
# gem 'dalli',                 '~> 1.1.3'

# Docs
gem 'coderay',               '~> 1.0.4'
gem 'haml-coderay',          '~> 0.1.2'

gem 'asset_sync'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.0'
  gem 'coffee-rails', '~> 3.2.0'
  gem 'uglifier'
end

group :production do
  # gem 'rack-cache'
end

group :staging, :production do
  gem 'rpm_contrib', git: 'git://github.com/titanous/rpm_contrib.git', branch: 'mongoid-instrumentation'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'rspec-rails'

  gem 'rack-livereload'
  gem 'rails-dev-tweaks', '~> 0.6.0'
end

group :development do
  gem 'heroku'
  gem 'foreman'
  gem 'powder'

  gem 'rb-fsevent'

  gem 'ruby_gntp'
  platforms :ruby do
    gem 'rb-readline'
  end
  gem 'guard'

  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-jasmine'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
end
