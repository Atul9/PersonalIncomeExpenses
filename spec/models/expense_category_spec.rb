require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  before :each do
    @user = FactoryGirl.create :user
    @expense_category = FactoryGirl.create(:expense_category, user: @user)
  end
  describe 'validates income category'do
    it 'should create income with an income category' do
      expect(ExpenseCategory.user_expense_categories(@user)).to eq([['Shopping', 1], [@expense_category.expense_source, 2]])
    end
  end
end
