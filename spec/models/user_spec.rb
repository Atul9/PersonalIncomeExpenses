require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'should create an income and expense category' do
      FactoryGirl.create :user
      expect(IncomeCategory.first.income_source).to eq('Salary')
      expect(ExpenseCategory.first.expense_source).to eq('Shopping')
    end
  end
end
