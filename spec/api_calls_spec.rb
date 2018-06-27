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
                     headings: Notification::Headings.new(en: 'This is a live test for OneSignal::Ruby'),
                     included_segments: ['Test Users'])
  end

  it 'sends a notification' do
    response = OneSignal.send_notification notification
    expect(response.status).to eq 200
  end
end
