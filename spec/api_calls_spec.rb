# frozen_string_literal: true

require 'spec_helper'
include OneSignal

describe 'Live API Testing', remote: true do
  before(:all) do
    VCR.configure do |c|
      c.allow_http_connections_when_no_cassette = true
    end
  end

  let(:app_id) { ENV['ONESIGNAL_APP_ID'] }
  let(:api_key) { ENV['ONESIGNAL_API_KEY'] }

  let(:notification) do
    Notification.new(contents: Notification::Contents.new(en: 'Live Test'),
                     headings: Notification::Headings.new(en: 'This is a live test for OneSignal'),
                     included_segments: ['Test Users'])
  end

  let(:notification_id) { 'fe82c1ae-54c2-458b-8aad-7edc3e8a96c4' }

  it 'sends a notification' do
    VCR.use_cassette('onesignal') do
      response = OneSignal.send_notification notification
      expect(response).to be_instance_of OneSignal::Responses::Notification
      expect(response.id).to eq notification_id
    end
  end

  it 'fetches a notification' do
    VCR.use_cassette('onesignal') do
      response = OneSignal.fetch_notification notification_id
      expect(response).to be_instance_of OneSignal::Responses::Notification
      expect(response.id).to eq notification_id
    end
  end
end
