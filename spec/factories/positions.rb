FactoryBot.define do
  factory :position do
    name { "MyString" }
    career { 1 }
    contract { 1 }
    remote { false }
    country { "MyString" }
    state { "MyString" }
    city { "MyString" }
    summary { "MyText" }
    description { "MyText" }
    publish { false }
    company { nil }
  end
end
