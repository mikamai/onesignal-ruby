# frozen_string_literal: true

require 'spec_helper'
include OneSignal

describe 'Live API Testing', remote: true do
  before(:all) do
    VCR.configure do |c|
      c.allow_http_connections_when_no_cassette = true
    end
  end

  let(:app_id) { ENV.fetch('ONESIGNAL_APP_ID', 'test') }
  let(:api_key) { ENV.fetch('ONESIGNAL_API_KEY', 'test') }

  let(:notification) do
    Notification.new(contents: Notification::Contents.new(en: 'Live Test'),
                     headings: Notification::Headings.new(en: 'This is a live test for OneSignal'),
                     included_segments: ['Test Users'])
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

  it 'fetches notifications' do
    VCR.use_cassette('os-fetch-notifications', allow_playback_repeats: true) do
      response = OneSignal.fetch_notifications
      notification = response.first
      expect(notification).to be_instance_of OneSignal::Responses::Notification
      expect(response.count).to eq 51
      # Ensure the Enumerator doesn't cache data improperly
      expect(response.count).to eq 51
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

  it 'deletes one player by id' do
    VCR.use_cassette('os-delete-player', :record => :new_episodes) do
      player = OneSignal.delete_player @player_id
      expect(player).to be_instance_of OneSignal::Responses::Player
      expect(player.id).to eq @player_id
    end
  end


  context 'with keys' do
    around do |example|
      OneSignal.config.app_id = app_id
      OneSignal.config.api_key = api_key
      example.run
      OneSignal.config.app_id = nil
      OneSignal.config.api_key = nil
    end

    it 'fetches CSV export data' do
      VCR.use_cassette('os-csv-export') do
        response = OneSignal.csv_export
        expect(response).to be_instance_of OneSignal::Responses::CsvExport
        expect(response.csv_file_url).to eq 'https://onesignal.s3.amazonaws.com/csv_exports/test/users_abc123.csv.gz'
      end
    end

    it 'fetches CSV export data with params' do
      VCR.use_cassette('os-csv-export', match_requests_on: [:body_as_json]) do
        response = OneSignal.csv_export last_active_since: Time.at(1568419200)
        expect(response).to be_instance_of OneSignal::Responses::CsvExport
        expect(response.csv_file_url).to eq 'https://onesignal.s3.amazonaws.com/csv_exports/test/users_def456.csv.gz'
      end
    end
  end
end
