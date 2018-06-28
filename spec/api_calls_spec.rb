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
                     included_segments: ['Active Users'])
  end

  it 'sends a notification' do
    VCR.use_cassette('os-send-noti') do
      response = OneSignal.send_notification notification
      expect(response).to be_instance_of OneSignal::Responses::Notification
      @notification_id = response.id
      expect(response.id).to eq @notification_id
    end
  end

  it 'fetches a notification by id' do
    VCR.use_cassette('os-fetch-noti') do
      response = OneSignal.fetch_notification @notification_id
      expect(response).to be_instance_of OneSignal::Responses::Notification
      expect(response.id).to eq @notification_id
    end
  end

  it 'fectches all players' do
    VCR.use_cassette('os-fetch-players') do
      player = OneSignal.fetch_players.first
      expect(player).to be_instance_of OneSignal::Responses::Player
      @player_id = player.id
    end
  end

  it 'fectches one players by id' do
    VCR.use_cassette('os-fetch-player') do
      player = OneSignal.fetch_player @player_id
      expect(player).to be_instance_of OneSignal::Responses::Player
      expect(player.id).to eq @player_id
    end
  end

end
