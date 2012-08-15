class ApplicationController < ActionController::Base
  before_filter { @page_caching = true }
end
