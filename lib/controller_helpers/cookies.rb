module ControllerHelpers
  module Cookies

    private

    def set_stage_cookie
      cookies[:stage] ||= 'stable'
      cookies[:stage] = params[:stage] if params[:stage]
    end

  end
end
