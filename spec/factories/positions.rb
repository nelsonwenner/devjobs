FactoryBot.define do
  factory :position do
    name { Faker::Name.name }
    contract { "CLT" }
    remote { true }
    country { "BRAZIL" }
    state { "PIAUI" }
    city { "TERESINA" }
    summary { Faker::Lorem.characters }
    description { Faker::Lorem.characters }
    publish { false }
    company_id { nil }
    career_id { nil }
  end
end
