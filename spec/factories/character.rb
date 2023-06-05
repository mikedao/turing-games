FactoryBot.define do
  factory :character do
    name { Faker::Games::ElderScrolls.name }
    image_url { Faker::Avatar.image }
    background { Faker::Lorem.paragraph }
    campaign
    user  
  end
end