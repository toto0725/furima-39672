FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_kana {"タロウ"}
    first_name_kana{"タナカ"}
    birth_date{Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
    

  end
end