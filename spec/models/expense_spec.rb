require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validates expense category'do
    it 'should create expense with an expense category' do
      expense = FactoryGirl.build :expense
      expect(expense.save).to eq(false)
      expect(expense.errors.messages).to eq({:expense_category_id=>["can't be blank"], :user_id=>["can't be blank"]})
    end
  end
end
