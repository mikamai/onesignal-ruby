# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'active_support/json'
require 'onesignal/version'
require 'onesignal/extra'

module OneSignal
  def send_notification notification
    app_id = ENV['ONESIGNAL_APP_ID']
    api_key = ENV['ONESIGNAL_API_KEY']
    Client.new(app_id, api_key).create_notification notification
  end
end

require 'onesignal/autoloader'
