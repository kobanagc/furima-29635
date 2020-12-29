FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Gimei.last.hiragana}
    first_name            {Gimei.first.hiragana}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birth_day             {Faker::Date.birthday}
  end
end