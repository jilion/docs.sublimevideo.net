Airbrake.configure do |config|
  config.api_key = '66d9c59629ba4f51757560b2a36d808e'
  config.ignore  << ActionController::UnknownHttpMethod
end
