# frozen_string_literal: true

require 'spec_helper'
require 'onesignal'
include OneSignal

describe Client do
  let(:app_id) { 'app_id' }
  let(:api_key) { 'api_key' }
  let(:api_url) { 'http://api_url' }

  subject { Client.new(app_id, api_key, api_url) }

  it 'creates a new client' do
    expect(subject).to be_instance_of Client
  end
end
