FactoryBot.define do
  factory :applicant do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { '123456' }
    position_id { nil }
    curriculum { 
      Rack::Test::UploadedFile.new(
        Rails.root.join('app', 'assets', 'images', 'test', 'test_file_pdf.pdf')
      )
    }
  end
end
