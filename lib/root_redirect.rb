class RootRedirect

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    if request.path == '/'
      [301, { "Location" => request.url + 'quickstart-guide' }, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end

end
