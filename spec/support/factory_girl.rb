require "factory_girl"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :site do
    sequence(:name) { |n| "Caffé Nero ##{n}" }
    address "50 Tremont St."
    city "Boston"
    state "MA"
    zip "02111"
    description "Authentic Italian espresso"
    phone "(123) 456-7890"
    url "http://www.caffenero.com/"
    sequence(:cost_rating) { |n| n }

    user
  end
end
