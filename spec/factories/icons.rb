# frozen_string_literal: true

FactoryBot.define do
  factory :icons, class: OneSignal::Icons do
    small_icon { Faker::Avatar.image }
    huawei_small_icon { Faker::Avatar.image }
    large_icon { Faker::Avatar.image }
    huawei_large_icon { Faker::Avatar.image }
    adm_small_icon { Faker::Avatar.image }
    adm_large_icon { Faker::Avatar.image }
    chrome_web_icon { Faker::Avatar.image }
    firefox_icon { Faker::Avatar.image }
    chrome_icon { Faker::Avatar.image }

    initialize_with { new(attributes) }
  end
end
