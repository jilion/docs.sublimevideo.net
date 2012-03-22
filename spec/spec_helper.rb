require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require File.dirname(__FILE__) + "/../config/environment"
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'

Capybara.app_host = 'http://docs.sublimevideo.dev'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run_including focus: true

  config.mock_with :rspec
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
