# frozen_string_literal: true

require 'active_support/core_ext/string'
require 'active_support/json'
require 'onesignal/version'
require 'onesignal/commands'

ActiveSupport.escape_html_entities_in_json = false

module OneSignal
  class << self
    def configure
      yield config
    end

    def send_notification notification
      return unless OneSignal.config.active

      created = Commands::CreateNotification.call notification
      fetch_notification(JSON.parse(created.body)['id'])
    end

    def fetch_notification notification_id
      return unless OneSignal.config.active

      fetched = Commands::FetchNotification.call notification_id
      Responses::Notification.from_json fetched.body
    end

    def fetch_notifications(page_limit: 50, page_offset: 0, kind: nil)
      return unless OneSignal.config.active

      Enumerator.new() do |yielder|
        limit = page_limit
        offset = page_offset

        fetched = Commands::FetchNotifications.call limit, offset, kind
        parsed = JSON.parse(fetched.body)

        total_count = parsed["total_count"]
        max_pages = (total_count / limit.to_f).ceil

        loop do
          parsed['notifications'].each do |notification|
            yielder << Responses::Notification.from_json(notification)
          end
          offset += 1
          break if offset >= max_pages
          fetched = Commands::FetchNotifications.call limit, offset*limit, kind
          parsed = JSON.parse(fetched.body)
        end
      end
    end

    def fetch_player player_id
      return unless OneSignal.config.active

      fetched = Commands::FetchPlayer.call player_id
      Responses::Player.from_json fetched.body
    end

    def delete_player player_id
      return unless OneSignal.config.active

      fetched = Commands::DeletePlayer.call player_id
      Responses::Player.from_json fetched.body
    end

    def fetch_players
      return unless OneSignal.config.active

      fetched = Commands::FetchPlayers.call
      JSON.parse(fetched.body)['players'].map { |player| Responses::Player.from_json player }
    end

    def csv_export params = {}
      return unless OneSignal.config.active

      fetched = Commands::CsvExport.call params
      Responses::CsvExport.from_json fetched.body
    end

    def config
      @config ||= Configuration.new
    end

    alias define configure
  end
end

require 'onesignal/autoloader'
require 'onesignal/responses'
