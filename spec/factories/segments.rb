FactoryBot.define do
  factory :segment do
    initialize_with { new(name: Faker::StarWars.character) }
  end
end
