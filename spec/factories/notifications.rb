# frozen_string_literal: true

FactoryBot.define do
  factory :contents, class: OneSignal::Notification::Contents do
    initialize_with { new(en: Faker::Fallout.quote) }
  end

  factory :headings, class: OneSignal::Notification::Headings do
    initialize_with { new(en: Faker::Fallout.quote) }
  end

  factory :notification, class: OneSignal::Notification do
    initialize_with do
      new(
        contents: build(:contents),
        headings: build(:headings),
        included_segments: [build(:segment), build(:segment)],
        excluded_segments: [build(:segment), build(:segment)]
      )
    end
  end
end
