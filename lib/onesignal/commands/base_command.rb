# frozen_string_literal: true

require 'simple_command'

module OneSignal
  module Commands
    class BaseCommand
      prepend ::SimpleCommand

      def call
        raise NotImplementedError, 'this is an abstract class'
      end

      def client
        @client ||= OneSignal::Client.new(config.app_id, config.api_key, config.api_url)
      end

      def config
        OneSignal.config
      end
    end
  end
end
