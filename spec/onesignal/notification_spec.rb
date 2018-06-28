# frozen_string_literal: true

require 'spec_helper'
include OneSignal

describe Notification do
  let(:contents) { build :contents }
  let(:headings) { build :headings }

  it 'requires at least some contents' do
    expect { described_class.new }.to raise_error ArgumentError, 'missing contents or template_id'
  end

  it 'creates a new notification' do
    expect(described_class.new(contents: contents, headings: headings, send_after: Time.now)).to be_instance_of Notification
  end

  context 'json' do
    let(:segments) { [build(:segment), build(:segment)] }
    let(:time) { Time.now }
    subject do
      build :notification,
            contents: contents,
            headings: headings,
            included_segments: segments,
            excluded_segments: segments,
            send_after: time
    end

    it 'serializes as json' do
      expect(subject.as_json).to include(
        'contents' => {
          'en' => contents.en
        },
        'headings' => {
          'en' => headings.en
        },
        'send_after' => time.to_s,
        'included_segments' => segments.map(&:to_s),
        'excluded_segments' => segments.map(&:to_s)
      )
    end
  end
end
