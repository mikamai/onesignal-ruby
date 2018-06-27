# frozen_string_literal: true

require 'spec_helper'
require 'onesignal'
include OneSignal

describe Notification do
  let(:contents) { build :contents }
  let(:headings) { build :headings }

  it 'requires at least some contents' do
    expect { described_class.new }.to raise_error ArgumentError, 'missing contents or template_id'
  end

  it 'creates a new notification' do
    expect(described_class.new(contents: contents, headings: headings)).to be_instance_of Notification
  end

  context 'json' do
    subject { build :notification }

    it 'serializes as json' do
      expect(subject.as_json).to include(
        'contents' => {
          'en' => subject.contents.en
        },
        'headings' => {
          'en' => subject.headings.en
        }
      )
    end

    it 'serializes to json' do
      result = "{\"contents\":{\"en\":\"#{subject.contents.en}\"},"\
                "\"headings\":{\"en\":\"#{subject.headings.en}\"}}"
      expect(subject.to_json).to eq result
    end
  end
end
