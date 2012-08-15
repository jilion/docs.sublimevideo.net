class DocsPages
  def self.matches?(request)
    pages = Dir.glob('app/views/pages/**/*.html.haml').map { |p|
      p.match(%r(app/views/pages/(.*)\.html\.haml))[1]
    }
    pages.include?(request.params["page"])
  end
end

DocsSublimeVideo::Application.routes.draw do
  # Please also check Rack::Redirect middleware in lib/rack

  match '/search' => 'search#index', via: [:get, :post]
  resources :releases, only: :index
  get '/*page' => 'pages#show', as: :page, constraints: DocsPages, format: false
end
