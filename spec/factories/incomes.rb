FactoryGirl.define do
  factory :income do
    record_date Faker::Date.backward(1)
    amount      Faker::Commerce.price
  end
end
