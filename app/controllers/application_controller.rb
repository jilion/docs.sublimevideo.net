require_dependency 'controller_helpers/cookies'
require_dependency 'controller_helpers/stages'

class ApplicationController < ActionController::Base
  include ControllerHelpers::Cookies
  include ControllerHelpers::Stages
  protect_from_forgery

  before_filter :set_stage_cookie
  before_filter :set_cache_buster, if: -> { Rails.env.development? || Rails.env.test? }

  private

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
