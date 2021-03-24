FactoryBot.define do
factory :user do
  nickname              {Faker::Name.initials}
  email                 {Faker::Internet.free_email}
  password              {'abc123'}
  password_confirmation {password}
  first_name            {'山田'}
  second_name           {'陸太郎'}
  first_name_kana       {'ヤマダ'}
  second_name_kana      {'リクタロウ'}
  birthday              {'1994-10-31'}
end
end