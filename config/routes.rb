class DocsPages
  def self.matches?(request)
    Dir.glob("app/views/pages/#{request.params["page"]}.html.{haml,textile}").any?
  end
end

DocsSublimeVideo::Application.routes.draw do
  get '/beta/*path' => redirect { |env, req|
    url = "#{req.env['rack.url_scheme']}://#{req.host}/#{env[:path]}"
    begin
      URI.parse(url).to_s
    rescue URI::InvalidURIError => encoding
      URI.encode(url)
    end
  }

  get '/search' => 'search#index', as: 'search'
  get '/releases' => 'releases#index', as: 'releases'

  # Legacy redirect
  get '/put-video-in-a-floating-lightbox' => redirect('/lightbox')
  %w[autoplay-video-upon-page-load autoplay].each do |path|
    get "/#{path}" => redirect('/settings/player-settings#autoplay')
  end
  %w[returning-to-the-initial-state-once-video-playback-ends back-to-initial-state-on-end loop-a-video loop].each do |path|
    get "/#{path}" => redirect('/settings/player-settings#on-end')
  end
  get '/ssl' => redirect('/player-faq#use-sublimevideo-in-ssl-site')
  get '/video-code-generator' => redirect('/video-publishing-assistant')
  get '/supported-browsers-and-platforms' => redirect('/supported-platforms')
  get '/optimize-for-stats' => redirect('/addons/stats#setup-for-stats')
  get '/embeds' => redirect('/addons/embed')
  get '/cuezones' => redirect('/addons/cue-zones')
  get '/faq' => redirect('/player-faq')
  get '/real-time-stats' => redirect('/addons/stats')

  # Shortcut redirect
  %w[javascript-api js-api].each do |path|
    get "/#{path}" => redirect('/javascript-api/usage')
  end
  %w[settings].each do |path|
    get "/#{path}" => redirect('/settings/usage')
  end
  %w[customizing-the-initial-play-button custom-play-button].each do |path|
    get "/#{path}" => redirect('/custom-start-view')
  end

  get '/*page' => 'pages#show', as: 'page', constraints: DocsPages, format: false

  root to: 'pages#redirect_from_root'
end
