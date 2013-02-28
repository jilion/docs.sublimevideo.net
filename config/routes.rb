class DocsPages
  def self.matches?(request)
    Dir.glob("app/views/pages/{stable,beta}/#{request.params["page"]}.html.{haml,textile}").any?
  end
end

DocsSublimeVideo::Application.routes.draw do
  get '(/:stage)/search' => 'search#index', as: 'search', stage: /stable|beta/, defaults: { stage: 'stable' }
  get '(/:stage)/releases' => 'releases#index', stage: /stable|beta/, defaults: { stage: 'stable' }, as: 'releases'

  get '/beta/*path' => redirect { |env, req| "/#{env[:path]}" }

  # Legacy redirect
  get '/put-video-in-a-floating-lightbox' => redirect('/lightbox')
  %w[autoplay-video-upon-page-load autoplay].each do |path|
    get "/#{path}" => redirect { |env, req|"/settings/player-settings#autoplay" }
  end
  %w[returning-to-the-initial-state-once-video-playback-ends back-to-initial-state-on-end loop-a-video loop].each do |path|
    get "/#{path}" => redirect { |env, req|"/settings/player-settings#on-end" }
  end
  get '/ssl' => redirect('/player-faq#use-sublimevideo-in-ssl-site')
  get '/video-code-generator' => redirect('/video-publishing-assistant')
  get '/supported-browsers-and-platforms' => redirect('/supported-platforms')
  get '(/:stage)/optimize-for-stats' => redirect { |env, req| "#{"/#{env[:stage]}" if env[:stage]}/addons/stats#setup-for-stats" }, stage: /stable|beta/
  get '(/:stage)/embeds' => redirect('/addons/embed')
  get '(/:stage)/faq' => redirect { |env, req| "#{"/#{env[:stage]}" if env[:stage]}/player-faq" }, stage: /stable|beta/
  get '(/:stage)/real-time-stats' => redirect { |env, req| "#{"/#{env[:stage]}" if env[:stage]}/addons/stats" }, stage: /stable|beta/

  # Shortcut redirect
  %w[javascript-api js-api].each do |path|
    get "/#{path}" => redirect { |env, req| "/javascript-api/usage" }
  end
  %w[settings].each do |path|
    get "/#{path}" => redirect { |env, req| "/settings/usage" }
  end
  %w[customizing-the-initial-play-button custom-play-button].each do |path|
    get "/#{path}" => redirect { |env, req| "/custom-start-view" }
  end

  get '(/:stage)/*page' => 'pages#show', as: 'page', constraints: DocsPages, stage: /stable|beta/, defaults: { stage: 'stable' }, format: false

  root to: 'pages#redirect_from_root'
end
