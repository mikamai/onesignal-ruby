FactoryBot.define do
  factory :attachments, class: OneSignal::Attachments do
    data { { test: 'test' } }
    url { Faker::Internet.url }
    ios_attachments { { robot: Faker::Avatar.image } }
    android_picture { Faker::Avatar.image }
    amazon_picture { Faker::Avatar.image }
    chrome_picture { Faker::Avatar.image }

    initialize_with { new(attributes) }
  end
end
