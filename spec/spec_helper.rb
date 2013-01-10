ENV["RAILS_ENV"] ||= 'test'

require File.dirname(__FILE__) + "/../config/environment"
require 'rspec/rails'

Dir[Rails.root.join('spec/config/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
