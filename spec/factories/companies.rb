FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    url { Faker::Internet.url(host: 'example.com') }
    brand { 
      Faker::Avatar.image(
        slug: "my-own-slug", 
        size: "50x50", 
        format: "jpg"
      ) 
    }
  end
end
