FactoryBot.define do
  factory :item do
    name           { Faker::Name.initials(number: 2) }
    price          { 500 }
    explanation    { Faker::Lorem.sentence }
    category_id    { 2 }
    status_id      { 2 }
    postage_id     { 2 }
    prefecture_id  { 2 }
    post_day_id    { 2 }
    association    :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
