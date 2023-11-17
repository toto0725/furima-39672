FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    info {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    fee_id {2}
    prefecture_id {2}
    delivery_id {2}
    price {5000}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
