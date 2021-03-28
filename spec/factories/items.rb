FactoryBot.define do
  factory :item do
    name                   { '照明' }
    text                   { 'ほんのり明るいです' }
    category_id            { 2 }
    item_condition_id      { 2 }
    delivery_fee_id        { 2 }
    delivery_day_id        { 2 }
    street_address_id      { 2 }
    price                  { 4500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
