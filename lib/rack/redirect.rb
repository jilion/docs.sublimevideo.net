module Rack
  class Redirect

    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)

      if redirect_url = redirect_url(request)
        [301, { "Location" => redirect_url }, self]
      else
        @app.call(env)
      end
    end

    def each(&block)
    end

  private

    def redirect_url(request)
      case request.path
      when '/'
        url(request, 'quickstart-guide')
      when '/javascript-api', '/js-api'
        url(request, 'javascript-api/usage')
      when '/put-video-in-a-floating-lightbox'
        url(request, 'lightbox')
      end
    end

    def url(request, path)
      "#{request.scheme}://#{request.host}/#{path}"
    end

  end
end
