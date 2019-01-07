# frozen_string_literal: true

module OneSignal
  module Commands
    class FetchNotification < BaseCommand
      def initialize notification_id
        @notification_id = notification_id
      end

      def call
        client.fetch_notification @notification_id
      end
    end
  end
end
