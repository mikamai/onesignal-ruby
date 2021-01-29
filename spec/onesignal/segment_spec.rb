# frozen_string_literal: true

require 'spec_helper'
include OneSignal

describe Segment do
  it 'requires a name' do
    expect { described_class.new }.to raise_error ArgumentError, /name/
  end

  context 'json' do
    subject { build :segment }

    it 'serializes as json' do
      expect(subject.as_json).to eq subject.to_s
    end

    it 'serializes to json' do
      expect(subject.to_json).to eq "\"#{subject}\""
    end
  end
end
