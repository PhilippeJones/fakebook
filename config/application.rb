require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'yaml'

Bundler.require(*Rails.groups)

module Fakebook
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'

    # Enable the asset pipeline
    config.assets.enabled = true

    # Whitelist local IPs
    config.web_console.whitelisted_ips = '192.168.2.0'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
