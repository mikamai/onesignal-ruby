require 'spec_helper'
require 'onesignal'
include OneSignal

describe Notification::Headings do
  it 'requires at least an english content' do
    expect { described_class.new }.to raise_error ArgumentError, 'missing keyword: en'
  end

  it 'creates a new Content with only english' do
    expect(described_class.new(en: 'Test').en).to eq 'Test'
  end

  it 'can have content in multiple languages' do
    content = described_class.new(en: 'Test', it: 'Prova', fr: 'Essai')
    expect(content.en).to eq 'Test'
    expect(content.it).to eq 'Prova'
    expect(content.fr).to eq 'Essai'
    expect { content.de }.to raise_error NoMethodError
  end

  context 'json' do
    subject { build :headings }

    it 'serializes as json' do
      expect(subject.as_json).to eq('en' => subject.en)
    end

    it 'serializes to json' do
      expect(subject.to_json).to eq "{\"en\":\"#{subject.en}\"}"
    end
  end
end
