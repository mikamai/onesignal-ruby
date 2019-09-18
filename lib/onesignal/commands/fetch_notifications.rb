# frozen_string_literal: true

module OneSignal
  module Commands
    class FetchNotifications < BaseCommand
      def initialize page_limit, page_offset, kind
        @page_limit = page_limit
        @page_offset = page_offset
        @kind = kind
      end

      def call
        client.fetch_notifications page_limit: @page_limit, page_offset: @page_offset, kind: @kind
      end
    end
  end
end
