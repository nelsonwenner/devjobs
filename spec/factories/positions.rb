FactoryBot.define do
  factory :position do
    name { Faker::Name.name }
    career { 'developer' }
    contract { 'clt' }
    remote { true }
    country { "BRAZIL" }
    state { "PIAUI" }
    city { "TERESINA" }
    summary { Faker::Lorem.characters }
    description { Faker::Lorem.characters }
    publish { false }
    company_id { nil }
  end
end
