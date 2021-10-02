# frozen_string_literal: true

require 'spec_helper'

describe OneSignal::Icons do
  let(:params) do
    {
      small_icon: Faker::Avatar.image,
      huawei_small_icon: Faker::Avatar.image,
      large_icon: Faker::Avatar.image,
      huawei_large_icon: Faker::Avatar.image,
      adm_small_icon: Faker::Avatar.image,
      adm_large_icon: Faker::Avatar.image,
      chrome_web_icon: Faker::Avatar.image,
      firefox_icon: Faker::Avatar.image,
      chrome_icon: Faker::Avatar.image
    }
  end

  subject { build :icons }

  it 'creates an attachment' do
    expect(described_class.new(params)).to be_instance_of OneSignal::Icons
  end

  it 'serializes as json' do
    expect(subject.as_json.deep_symbolize_keys).to include(
      small_icon: subject.small_icon,
      huawei_small_icon: subject.huawei_small_icon,
      large_icon: subject.large_icon,
      huawei_large_icon: subject.huawei_large_icon,
      adm_small_icon: subject.adm_small_icon,
      adm_large_icon: subject.adm_large_icon,
      chrome_web_icon: subject.chrome_web_icon,
      firefox_icon: subject.firefox_icon,
      chrome_icon: subject.chrome_icon
    )
  end
end
