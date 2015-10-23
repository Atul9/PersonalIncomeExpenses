require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'validates income category'do
    it 'should not create income without an income category' do
      income = FactoryGirl.build :income
      expect(income.save).to eq(false)
      expect(income.errors.messages).to eq({:income_category_id=>["can't be blank"], :user_id=>["can't be blank"]})
    end
  end

  describe 'validated income amount' do
    it 'validates amount' do
      user = FactoryGirl.create :user
      income = FactoryGirl.build(:income, income_category_id: IncomeCategory.first.id, user: user)
      income.amount = "A"
      expect(income.save).to eq(false)
      p income.errors.messages
    end
  end
end
