# frozen_string_literal: true

require 'spec_helper'

describe OneSignal::Sounds do
  let(:params) do
    {
      ios:     'test.wav',
      windows: 'test.wav',
      android: 'test',
      amazon:  'test'
    }
  end

  subject { build :sounds }

  it 'creates an attachment' do
    expect(described_class.new(params)).to be_instance_of OneSignal::Sounds
  end

  it 'refuses an invalid filename' do
    expect { described_class.new(ios: 'test') }.to raise_error OneSignal::Sounds::InvalidError
    expect { described_class.new(windows: 'test') }.to raise_error OneSignal::Sounds::InvalidError
  end

  it 'serializes as json' do
    expect(subject.as_json.deep_symbolize_keys).to include(
      ios_sound: subject.ios,
      android_sound: subject.android,
      adm_sound: subject.amazon,
      wp_wns_sound: subject.windows
    )
  end
end
