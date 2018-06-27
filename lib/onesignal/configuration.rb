module OneSignal
  class Configuration
    attr_accessor :app_id, :api_key, :api_url

    def initialize
      @app_id = ENV['ONESIGNAL_APP_ID']
      @api_key = ENV['ONESIGNAL_API_KEY']
      @api_url = "https://onesignal.com/api/#{OneSignal::API_VERSION}"
    end
  end
end
