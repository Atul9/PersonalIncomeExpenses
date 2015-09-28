require 'rails_helper'

RSpec.describe IncomeCategory, type: :model do
  before :each do
    @user = FactoryGirl.create :user
    @income_category = FactoryGirl.create(:income_category, user: @user)
  end
  describe 'should return user income categories'do
    it 'should create income with an income category' do
      expect(IncomeCategory.user_income_categories(@user)).to eq([['Salary', 1], [@income_category.income_source, 2]])
    end
  end
end
