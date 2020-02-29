# frozen_string_literal: true

FactoryBot.define do
  factory :buttons, class: OneSignal::Buttons do
    buttons [{id: 'option_a', text: 'Option A' }, {id: 'option_b', text: 'Option B' }]

    initialize_with { new(attributes) }
  end
end
