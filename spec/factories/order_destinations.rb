FactoryBot.define do
  factory :order_destination do
    post_number { '123-4567' }
    prefecture_id { 2 }
    municipality { '札幌市' }
    street_address { '札幌1-1' }
    building_name { '札幌ビル' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
