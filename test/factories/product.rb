FactoryBot.define do
  factory :product do
    name{Faker::Commerce.product_name}
    cost{Faker::Number.between(from: 10, to: 3000)}
    description{Faker::Hipster.paragraph}
  end
end

