class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    @header_class  = 'l-mini'
    @page_category = 'Documentation'
    @global_layout = 'two_col'
  end
end
