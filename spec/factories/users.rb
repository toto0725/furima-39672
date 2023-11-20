FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    last_name { '田中' }
    first_name { '太郎' }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
