FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { 'Tokyo' }
    house_number { '1-2-3' }
    building_name { '' }
    phone_number { '090-1234-5678' }
    price { 1000 }
    user_id { 1 }
    item_id { 1 }
    token { 'abc123' }
  end
end
