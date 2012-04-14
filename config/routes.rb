class DocsPages
  def self.matches?(request)
    pages = Dir.glob('app/views/pages/**/*.html.haml').map { |p|
      p.match(%r(app/views/pages/(.*)\.html\.haml))[1]
    }
    pages.include?(request.params["page"])
  end
end

DocsSublimeVideo::Application.routes.draw do
  # Deprecated routes
  %w[javascript-api js-api].each { |r| get r => redirect('/javascript-api/usage') }
  get 'put-video-in-a-floating-lightbox' => redirect('/lightbox')
  resources :releases, only: :index

  get '/*page' => 'pages#show', as: :page, constraints: DocsPages, format: false

  root to: redirect('/quickstart-guide')
end
