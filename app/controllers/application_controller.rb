require_dependency 'controller_helpers/cookies'
require_dependency 'controller_helpers/stages'

class ApplicationController < ActionController::Base
  include ControllerHelpers::Cookies
  include ControllerHelpers::Stages
  protect_from_forgery

  before_filter :set_stage_cookie
end
