require "active_support/core_ext/integer/time"

#test env config

Rails.application.configure do
  #no reloading during tests
  config.enable_reloading = false

  #eager load on ci
  config.eager_load = ENV["CI"].present?

  #cache static files in tests
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.hour.to_i}" }

  #full errrors no cache
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  #render exception templates
  config.action_dispatch.show_exceptions = :rescuable

  #no csrf in tests
  config.action_controller.allow_forgery_protection = false

  #store uploads in temp dir
  config.active_storage.service = :test

  #no mailer caching
  config.action_mailer.perform_caching = false

  #fake mail delivery
  config.action_mailer.delivery_method = :test

  #default mailer host
  config.action_mailer.default_url_options = { host: "www.example.com" }

  #deprecations to stderr
  config.active_support.deprecation = :stderr

  #raise on disallowed deprecations
  config.active_support.disallowed_deprecation = :raise

  #disallowed list
  config.active_support.disallowed_deprecation_warnings = []

  #missing translation errrors
  # config.i18n.raise_on_missing_translations = true

  #annotate view files
  # config.action_view.annotate_rendered_view_with_filenames = true

  #raise on missing callback actions
  config.action_controller.raise_on_missing_callback_actions = true
end
