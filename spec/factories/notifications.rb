# frozen_string_literal: true

FactoryBot.define do
  factory :contents, class: OneSignal::Notification::Contents do
    en { Faker::Games::Fallout.quote }

    initialize_with { new(attributes) }
  end

  factory :headings, class: OneSignal::Notification::Headings do
    en { Faker::Games::Fallout.quote }

    initialize_with { new(attributes) }
  end

  factory :notification, class: OneSignal::Notification do
    contents
    headings
    attachments { build :attachments }
    included_segments { [build(:segment), build(:segment)] }
    excluded_segments { [build(:segment), build(:segment)] }
    send_after { Time.now }

    initialize_with do
      new(attributes)
    end
  end
end
