# frozen_string_literal: true

require 'spec_helper'
require 'onesignal'
include OneSignal

describe IncludedTargets do
  let(:params) do
    {
      include_email_tokens:       ['test'],
      include_external_user_ids:  ['test'],
      include_ios_tokens:         ['test'],
      include_wp_wns_uris:        ['test'],
      include_amazon_reg_ids:     'test',
      include_chrome_reg_ids:     ['test'],
      include_chrome_web_reg_ids: 'test',
      include_android_reg_ids:    ['test']
    }
  end

  subject { described_class.new(params) }

  it 'serializes as json' do
    expect(subject.as_json.deep_symbolize_keys).to include(
      include_email_tokens:       subject.include_email_tokens,
      include_external_user_ids:  subject.include_external_user_ids,
      include_ios_tokens:         subject.include_ios_tokens,
      include_wp_wns_uris:        subject.include_wp_wns_uris,
      include_amazon_reg_ids:     subject.include_amazon_reg_ids,
      include_chrome_reg_ids:     subject.include_chrome_reg_ids,
      include_chrome_web_reg_ids: subject.include_chrome_web_reg_ids,
      include_android_reg_ids:    subject.include_android_reg_ids
    )
  end

  it 'raises an ArgumentError if include_player_ids is used with other targets' do
    expect {
      described_class.new(params.merge(include_player_ids: 'test'))
    }.to raise_error ArgumentError
  end

  it 'logs a warning if an unrecommended param is passed' do
    expect(OneSignal.config.logger).to receive(:warn).exactly(6).times
    subject
  end

  it 'does not log a warning if no unrecommended param is passed' do
    expect(OneSignal.config.logger).not_to receive(:warn)
    described_class.new include_player_ids: 'test'
  end
end
