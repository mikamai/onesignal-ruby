# frozen_string_literal: true

require 'faraday'

module OneSignal
  class Client
    class ApiError < RuntimeError; end

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

    def fetch_notifications page_limit: 50, page_offset: 0, kind: nil
      url = "notifications?limit=#{page_limit}&offset=#{page_offset}"
      url = kind ? "#{url}&kind=#{kind}" : url
      get url
    end

    def fetch_players
      get 'players'
    end

    def fetch_player player_id
      get "players/#{player_id}"
    end

    def csv_export extra_fields: nil, last_active_since: nil, segment_name: nil
      post "players/csv_export?app_id=#{@app_id}", 
        extra_fields: extra_fields, 
        last_active_since: last_active_since&.to_i&.to_s, 
        segment_name: segment_name
    end

    private

    def create_body payload
      body = payload.as_json.delete_if { |_, v| v.nil? }
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

      handle_errors res
    end

    def get url
      res = @conn.get do |req|
        req.url url, app_id: @app_id
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@api_key}"
      end

      handle_errors res
    end

    def handle_errors res
      errors = JSON.parse(res.body).fetch 'errors', []
      raise ApiError, (errors.first || "Error code #{res.status}") if res.status > 399 || errors.any?

      res
    end
  end
end
