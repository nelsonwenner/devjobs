FactoryBot.define do
  factory :user, class: 'User' do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
