# frozen_string_literal: true

module OneSignal
  module Responses
    class Player < BaseResponse
      ATTRIBUTES_WHITELIST = %i[id identifier session_count language timezone
                    game_version device_os device_type device_model tags
                    ad_id last_active playtime amount_spent created_at
                    invalid_identifier badge_count sdk test_type ip].freeze

      def invalid_identifier?
        invalid_identifier
      end

      def self.from_json json
        body = json.is_a?(String) ? JSON.parse(json) : json
        new(body)
      end
    end
  end
end
