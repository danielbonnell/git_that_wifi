# User.create()

100.times do
  Site.create(
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    description: Faker::Lorem.sentence,
    phone: Faker::PhoneNumber.phone_number,
    url: Faker::Internet.url,
    cost_rating: 4,
    user_id: 1
  )
end
