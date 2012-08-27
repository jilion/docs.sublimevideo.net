class DocsPages
  def self.matches?(request)
    pages = Dir.glob('app/views/pages/**/*.html.haml').map { |p|
      p.match(%r(app/views/pages/(.*)\.html\.haml))[1]
    }
    pages.include?(request.params["page"])
  end
end

DocsSublimeVideo::Application.routes.draw do
  get '/autoplay-video-upon-page-load' => redirect('/autoplay')
  get '/customizing-the-initial-play-button' => redirect('/custom-play-button')
  get '/loop-a-video' => redirect('/loop')
  get '/put-video-in-a-floating-lightbox' => redirect('/lightbox')
  get '/returning-to-the-initial-state-once-video-playback-ends' => redirect('/back-to-initial-state-on-end')
  %w[javascript-api js-api].each { |path| get "/#{path}" => redirect('/javascript-api/usage') }

  get '/search' => 'search#index', as: 'search'
  resources :releases, only: :index
  get '/*page' => 'pages#show', as: 'page', constraints: DocsPages, format: false

  root to: redirect('/quickstart-guide')
end
