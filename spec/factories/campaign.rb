FactoryBot.define do
  factory :campaign do
    title { "#{Faker::Cosmere.surge}-#{Faker::Cosmere.surge}-#{Faker::Number.hexadecimal(digits: 4)}" }
    description { Faker::Quotes::Shakespeare.hamlet_quote + Faker::Number.hexadecimal(digits: 4) }
    image { Rack::Test::UploadedFile.new('spec/fixtures/files/kingdom.webp', 'image/webp') }
  end
end