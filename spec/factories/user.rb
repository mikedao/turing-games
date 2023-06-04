FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name.parameterize }
    first_name { Faker::GreekPhilosophers.name }
    last_name { Faker::Hipster.word }
    email { Faker::Barcode.ean }
    password { "password_test"}
  end
end