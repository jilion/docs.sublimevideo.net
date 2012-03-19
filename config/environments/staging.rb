DocsSublimeVideo::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb
  config.middleware.insert_after Rack::Lock, "::Rack::Auth::Basic", "Staging" do |u, p|
    [u, p] == ['jilion', ENV['PRIVATE_CODE']]
  end

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Heroku logs config
  config.action_controller.logger = Logger.new(STDOUT)

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  config.cache_store = :dalli_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # http://stackoverflow.com/questions/7324292/rails-3-1-cant-compile-assets-on-prod-due-to-asset-host-config
  config.action_controller.asset_host = ->(source, request = nil, *_) {
    if request && !request.ssl?
      "http://d1p69vb2iuddhr.cloudfront.net"
    else
      "https://d1p69vb2iuddhr.cloudfront.net"
    end
  }

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
