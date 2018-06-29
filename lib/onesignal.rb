# frozen_string_literal: true

require 'active_support/core_ext/string'
require 'active_support/json'
require 'onesignal/version'
require 'onesignal/extra'
require 'onesignal/commands'

ActiveSupport.escape_html_entities_in_json = false

module OneSignal
  include Commands

  def self.define
    yield config
  end

  def self.send_notification notification
    return unless OneSignal.config.active
    created = CreateNotification.call notification
    fetch_notification(JSON.parse(created.body)['id'])
  end

  def self.fetch_notification notification_id
    return unless OneSignal.config.active
    fetched = FetchNotification.call notification_id
    Responses::Notification.from_json fetched.body
  end

  def self.fetch_player player_id
    return unless OneSignal.config.active
    fetched = FetchPlayer.call player_id
    Responses::Player.from_json fetched.body
  end

  def self.fetch_players
    return unless OneSignal.config.active
    fetched = FetchPlayers.call
    JSON.parse(fetched.body)['players'].map { |player| Responses::Player.from_json player }
  end

  def self.config
    @config ||= Configuration.new
  end
end

require 'onesignal/autoloader'
require 'onesignal/responses'
