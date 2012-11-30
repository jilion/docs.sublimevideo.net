module ControllerHelpers
  module Stages

    def current_stage
      cookies[:stage] || 'beta'
    end

    def stage?(stage_name)
      cookies[:stage] == stage_name
    end

    def self.included(base)
      if base.respond_to?(:helper_method)
        base.send :helper_method, :current_stage
        base.send :helper_method, :stage?
      end
    end

  end
end
