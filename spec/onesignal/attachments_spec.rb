# frozen_string_literal: true

require 'spec_helper'

describe OneSignal::Attachments do
  let(:params) do
    { data:            { 'test' => 'test' },
      url:             Faker::Internet.url,
      ios_attachments: { 'robot' => Faker::Avatar.image },
      android_picture: Faker::Avatar.image,
      amazon_picture:  Faker::Avatar.image,
      chrome_picture:  Faker::Avatar.image }
  end

  subject { build :attachments }

  it 'creates an attachment' do
    expect(described_class.new(params)).to be_instance_of OneSignal::Attachments
  end

  it 'serializes as json' do
    expect(subject.as_json.deep_symbolize_keys).to include(
      data: subject.data,
      url: subject.url,
      ios_attachments: subject.ios_attachments,
      big_picture: subject.android_picture,
      adm_big_picture: subject.amazon_picture,
      chrome_big_picture: subject.chrome_picture
    )
  end
end
