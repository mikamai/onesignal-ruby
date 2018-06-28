# frozen_string_literal: true

require 'spec_helper'
require 'onesignal'
include OneSignal

describe Client do
  subject { build :client }

  it 'creates a new client' do
    expect(subject).to be_instance_of Client
  end
end
