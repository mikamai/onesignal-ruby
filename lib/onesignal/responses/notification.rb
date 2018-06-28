# frozen_string_literal: true

module OneSignal
  module Responses
    # Example JSON
    # {
    #   "id":           '481a2734-6b7d-11e4-a6ea-4b53294fa671',
    #   "successful":   15,
    #   "failed":       1,
    #   "converted":    3,
    #   "remaining":    0,
    #   "queued_at":    1_415_914_655,
    #   "send_after":   1_415_914_655,
    #   "completed_at": 1_415_914_656,
    #   "url":          'https://yourWebsiteToOpen.com',
    #   "data":         {
    #     "foo":  'bar',
    #     "your": 'custom metadata'
    #   },
    #   "canceled":     false,
    #   "headings":     {
    #     "en": 'English and default language heading',
    #     "es": 'Spanish language heading'
    #   },
    #   "contents":     {
    #     "en": 'English language content',
    #     "es": 'Hola'
    #   }
    # }
    class Notification
      ATTRIBUTES_WHITELIST = %i[id successful failed converted remaining
                                queued_at send_after completed_at url data
                                canceled headings contents].freeze

      auto_attr_reader(*ATTRIBUTES_WHITELIST)

      def initialize attributes = {}
        @attributes = attributes.deep_symbolize_keys
                                .keep_if { |k, _v| ATTRIBUTES_WHITELIST.include?(k.to_sym) }
      end

      def self.from_json json
        body = json.is_a?(String) ? JSON.parse(json) : json
        new(body)
      end
    end
  end
end
