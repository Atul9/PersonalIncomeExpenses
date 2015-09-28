FactoryGirl.define do
  factory :expense do
    record_date   Faker::Date.backward(1)
    amount        Faker::Commerce.price
  end

end
