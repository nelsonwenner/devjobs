FactoryBot.define do
  factory :applicant do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { '123456' }
    position_id { nil }
    curriculum { 
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'fixtures', 'files', 'test_file_pdf.pdf')
      )
    }
  end
end
