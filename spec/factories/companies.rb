FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    url { Faker::Internet.url(host: 'example.com') }
    brand { 
      Rack::Test::UploadedFile.new(
        Rails.root.join('app', 'assets', 'images', 'test', 'rails-logo.png')
      )
    }
  end
end
