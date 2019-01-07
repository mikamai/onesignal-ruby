# frozen_string_literal: true

require 'spec_helper'

describe 'Config DSL' do
  let(:test_string) { 'test' }
  let(:env_string) { 'env' }

  it 'has sensible defaults' do
    config = OneSignal.config

    expect(config.app_id).to eq ENV['ONESIGNAL_APP_ID']
    expect(config.api_key).to eq ENV['ONESIGNAL_API_KEY']
    expect(config.api_url).to eq "https://onesignal.com/api/#{OneSignal::API_VERSION}"
    expect(config.active).to be_truthy
  end

  it 'configure the library via a DSL' do
    OneSignal.configure do |config|
      config.api_url = test_string
      config.app_id = test_string
      config.api_key = test_string
      config.active = false
    end

    config = OneSignal.config

    expect(config.app_id).to eq test_string
    expect(config.api_key).to eq test_string
    expect(config.api_url).to eq test_string
    expect(config.active).to be_falsey
  end
end
