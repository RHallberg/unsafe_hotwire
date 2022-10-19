
FactoryBot.define do
  factory :customer do

    first_name{Faker::Name.first_name}
    last_name{Faker::Name.last_name}
    username{Faker::Internet.username}
    password{Faker::Crypto.md5}
  end
end
