class DocsPages
  def self.matches?(request)
    pages = Dir.glob('app/views/pages/**/*.html.haml').map { |p| p[%r(app/views/pages/(.*)\.html\.haml)][1] }
    pages.include?(request.params["page"])
  end
end

DocsSublimeVideo::Application.routes.draw do
  # Deprecated routes
  %w[javascript-api js-api].each { |r| match r => redirect('/javascript-api/usage') }

  resources :releases, only: :index

  # get '/*page' => 'pages#show', as: :page, constraints: DocsPages, format: false
  get '/*page' => 'pages#show', as: :page, format: false

  root to: redirect('/quickstart-guide')
end
