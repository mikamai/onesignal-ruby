FactoryBot.define do
  factory :sounds, class: OneSignal::Sounds do
    ios { 'test.wav' }
    windows { 'test.wav' }
    android { 'test' }
    amazon { 'test' }

    initialize_with { new(attributes) }
  end
end
