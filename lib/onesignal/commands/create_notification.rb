module OneSignal
  module Commands
    class CreateNotification < BaseCommand
      def initialize notification
        @notification = notification
      end

      def call
        client.create_notification @notification
      end
    end
  end
end
