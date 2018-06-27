# frozen_string_literal: true

require 'faraday'

module OneSignal
  class Client
    def initialize app_id, api_key, api_url
      @app_id = app_id
      @api_key = api_key
      @api_url = api_url
      @conn = ::Faraday.new(url: api_url) do |faraday|
        # faraday.response :logger do |logger|
        #   logger.filter(/(api_key=)(\w+)/, '\1[REMOVED]')
        #   logger.filter(/(Basic )(\w+)/, '\1[REMOVED]')
        # end
        faraday.adapter Faraday.default_adapter
      end
    end

    def create_notification notification
      post 'notifications', notification
    end

    private

    def create_body payload
      body = payload.as_json
      body['app_id'] = @app_id
      body
    end

    def post url, body
      @conn.post do |req|
        req.url url
        create_body =
        req.body = create_body(body).to_json
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@api_key}"
      end
    end
  end
end
