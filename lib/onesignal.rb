# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'active_support/json'
require 'onesignal/version'
require 'onesignal/extra'

module OneSignal
  class << self
    def define
      yield config
    end

    def send_notification notification
      Client.new(config.app_id, config.api_key, config.api_url).create_notification notification
    end

    def config
      @config ||= Configuration.new
    end
  end
end

require 'onesignal/autoloader'
