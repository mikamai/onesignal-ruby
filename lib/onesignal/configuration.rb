# frozen_string_literal: true

module OneSignal
  class Configuration
    attr_accessor :app_id, :api_key, :api_url, :active

    def initialize
      @app_id = ENV['ONESIGNAL_APP_ID']
      @api_key = ENV['ONESIGNAL_API_KEY']
      @api_url = "https://onesignal.com/api/#{OneSignal::API_VERSION}"
      @active = true
    end
  end
end
