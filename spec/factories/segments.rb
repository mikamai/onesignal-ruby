# frozen_string_literal: true

FactoryBot.define do
  factory :segment, class: OneSignal::Segment do
    name { Faker::Movies::StarWars.character }

    initialize_with { new(attributes) }
  end
end
