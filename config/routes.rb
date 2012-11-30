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
  get '/ssl' => redirect('/player-faq#use-sublimevideo-in-ssl-site')
  get '/video-code-generator' => redirect('/video-publishing-assistant')
  get '(/:stage)/faq' => redirect { |params, req| "#{"/#{params[:stage]}" if params[:stage]}/player-faq" }

  # Shortcut redirect
  %w[javascript-api js-api].each { |path| get "(/:stage)/#{path}" => redirect { |params, req| "#{"/#{params[:stage]}" if params[:stage]}/javascript-api/usage" } }
  %w[customizing-the-initial-play-button custom-play-button].each { |path| get "(/:stage)/#{path}" => redirect { |params, req| "#{"/#{params[:stage]}" if params[:stage]}/custom-start-view" } }

  get '(/:stage)/search' => 'search#index', as: 'search', stage: /beta/, defaults: { stage: 'stable' }
  # resources :releases, only: :index
  get '(/:stage)/releases' => 'releases#index', stage: /stable|beta/, defaults: { stage: 'stable' }
  get '(/:stage)/*page' => 'pages#show', as: 'page', constraints: DocsPages, stage: /stable|beta/, defaults: { stage: 'stable' }, format: false

  get '/beta', to: redirect('/beta/whats-new')
  root to: 'pages#redirect_from_root'
end
