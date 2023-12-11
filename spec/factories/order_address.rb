FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { 'Tokyo' }
    house_number { '1-2-3' }
    building_name { 'やなぎビル' }
    phone_number { '09012345678' }
    price { 1000 }
    token { 'abc123' }
  end
end
