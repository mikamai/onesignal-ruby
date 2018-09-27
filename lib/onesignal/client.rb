# frozen_string_literal: true

require 'faraday'

module OneSignal
  class Client
    ApiError = Class.new(StandardError)

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

    def fetch_notification notification_id
      get "notifications/#{notification_id}"
    end

    def fetch_players
      get 'players'
    end

    def fetch_player player_id
      get "players/#{player_id}"
    end

    private

    def create_body payload
      body = payload.as_json
      body['app_id'] = @app_id
      body
    end

    def post url, body
      res = @conn.post do |req|
        req.url url
        req.body = create_body(body).to_json
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@api_key}"
      end

      handle_errors(res)
    end

    def get url
      res = @conn.get do |req|
        req.url url, app_id: @app_id
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@api_key}"
      end

      handle_errors(res)
    end

    def handle_errors(res)
      if res.status != 200 || res.status != 204
        body = JSON.parse(res.body)
        raise ApiErrore.new(body["errors"].first)
      end
      res
    end
  end 
end
