FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.name }
    last_name { Faker::Name.unique.name }
    admin { false }
  end
end
