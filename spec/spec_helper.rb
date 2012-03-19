require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require File.dirname(__FILE__) + "/../config/environment"
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  # config.filter_run_including :focus => true # don't seem to work with RSpec 2.8 bug? use .rspec instead

  config.mock_with :rspec
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
