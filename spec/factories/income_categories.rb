FactoryGirl.define do
  factory :income_category do
    income_source Faker::Commerce.department(1)
    description Faker::Commerce.department
  end

  factory :income_category1 do
    income_source Faker::Commerce.department(1)
    description Faker::Commerce.department
  end
end
