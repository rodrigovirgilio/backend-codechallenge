FactoryBot.define do
  factory :authentication do
    name { Faker::Name.unique.name }
    token { SecureRandom.hex }
  end
end
