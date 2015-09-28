FactoryGirl.define do
  factory :expense_category do
    expense_source Faker::Commerce.department(1)
    description Faker::Commerce.department
  end
end
