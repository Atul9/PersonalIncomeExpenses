require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  login_user
  before :each do
    @expense_category = ExpenseCategory.first
  end
  describe '#create' do
    it 'should create expense' do
      post :create, expense: {record_date: Faker::Date.backward(1), expense_category_id: @expense_category.id, amount: 50000}
      transaction = Transaction.last.reload
      expense = Expense.last.reload
      expect(expense.amount).to eq(50000)
      expect(transaction.recordable_type).to eq("Expense")
      expect(transaction.recordable_id).to eq(expense.id)
    end
  end

  describe '#update' do
    it 'should update expense' do
      expense = FactoryGirl.create(:expense, expense_category_id: @expense_category.id, amount: 10000, user: User.first)
      put :update, expense: {record_date: Date.today, expense_category_id: expense.expense_category_id, amount: 20000}, id: expense.id
      transaction = Transaction.last.reload
      expense = expense.reload
      expect(expense.amount).to eq(20000)
      expect(transaction.transaction_date).to eq(expense.record_date)
    end
  end
end
