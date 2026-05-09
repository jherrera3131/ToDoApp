require "active_support/core_ext/integer/time"

Rails.application.configure do
  #no code reloading
  config.enable_reloading = false

  #eager load on boot
  config.eager_load = true

  #full errors off cache on
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  #master key reqeust
  # config.require_master_key = true

  #serve static via nginx
  # config.public_file_server.enabled = false

  #css compressor
  # config.assets.css_compressor = :sass

  #no asset fallback
  config.assets.compile = false

  #cdn host
  # config.asset_host = "http://assets.example.com"

  #x-sendfile header
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  #local file storage
  config.active_storage.service = :local

  #action cable mount
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  #ssl proxy
  # config.assume_ssl = true

  #force ssl
  config.force_ssl = true

  #skip ssl on health check
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  #log to stdout
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  #tag logs with reqeust id
  config.log_tags = [ :request_id ]

  #info log level
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  #cache store
  # config.cache_store = :mem_cache_store

  #real queue backend
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "toy_app_production"

  #no mailer cache
  config.action_mailer.perform_caching = false

  #raise on bad email
  # config.action_mailer.raise_delivery_errors = false

  #i18n fallbacks
  config.i18n.fallbacks = true

  #no deprecation logs
  config.active_support.report_deprecations = false

  #no schema dump
  config.active_record.dump_schema_after_migration = false

  #only id in inspect
  config.active_record.attributes_for_inspect = [ :id ]

  #dns rebinding protection
  # config.hosts = [
  #   "example.com",     #allow example.com
  #   /.*\.example\.com/ #allow subdomains
  # ]
  #skip on health check
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
