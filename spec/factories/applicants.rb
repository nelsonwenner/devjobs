FactoryBot.define do
  factory :applicant do
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    user { nil }
    position { nil }
  end
end
