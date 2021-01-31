FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    url { Faker::Internet.url(host: 'example.com') }
    brand { 
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'fixtures', 'files', 'rails-logo.png')
      )
    }
  end
end
