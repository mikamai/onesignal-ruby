# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'active_support/json'
require 'onesignal/version'
require 'onesignal/extra'
require 'onesignal/commands'

module OneSignal
  include Commands

  def self.define
    yield config
  end

  def self.send_notification notification
    created = CreateNotification.call notification
    fetch_notification(JSON.parse(created.body)['id'])
  end

  def self.fetch_notification notification_id
    fetched = FetchNotification.call notification_id
    Responses::Notification.from_json(fetched.body)
  end

  def self.config
    @config ||= Configuration.new
  end
end

require 'onesignal/autoloader'
require 'onesignal/responses/notification'
