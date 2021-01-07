FactoryBot.define do
  factory :item do
    name                    { '商品' }
    description             { 'これは商品です' }
    category_id             { 2 }
    condition_id            { 2 }
    payment_for_shipping_id { 2 }
    prefecture_id           { 2 }
    number_of_day_id        { 2 }
    price                   { 777 }
    association :user
  end
end
