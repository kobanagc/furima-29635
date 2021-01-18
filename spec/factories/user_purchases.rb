FactoryBot.define do
  factory :user_purchase do
    postal_cord       { '123-4567' }
    prefecture_id     { 2 }
    city              { '岡山市' }
    block             { '岡山1-1' }
    building          { '中島ビル203' }
    tell              { '09012345678' }
    token             { 'abc' }
    item_id           { 1 }
    user_id           { 1 }
  end
end
