class DocsPages
  def self.matches?(request)
    pages = Dir.glob('app/views/pages/**/*.html.haml').map { |p|
      p.match(%r{app/views/pages/(stable|beta)/(.*)\.html\.haml})[2]
    }
    pages.include?(request.params["page"])
  end
end

DocsSublimeVideo::Application.routes.draw do
  # Legacy redirect
  get '/autoplay-video-upon-page-load' => redirect('/autoplay')
  get '/loop-a-video' => redirect('/loop')
  get '/put-video-in-a-floating-lightbox' => redirect('/lightbox')
  get '/returning-to-the-initial-state-once-video-playback-ends' => redirect('/back-to-initial-state-on-end')

  # Shortcut redirect
  %w[javascript-api js-api].each { |path| get "(/:version)/#{path}" => redirect { |params, req| "#{"/#{params[:version]}" if params[:version]}/javascript-api/usage" } }
  %w[customizing-the-initial-play-button custom-play-button].each { |path| get "(/:version)/#{path}" => redirect { |params, req| "#{"/#{params[:version]}" if params[:version]}/custom-start-view" } }

  get '/search' => 'search#index', as: 'search'
  resources :releases, only: :index
  get '(/:version)/*page' => 'pages#show', as: 'page', constraints: DocsPages, version: /beta/, defaults: { version: 'stable' }, format: false

  root to: redirect('/quickstart-guide')
end
