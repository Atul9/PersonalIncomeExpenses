require 'rails_helper'

RSpec.describe IncomesController, type: :controller do
  login_user
  before :each do
    @income_category = IncomeCategory.first
  end
  describe '#create' do
    it 'should create income' do
      post :create, income: {record_date: Faker::Date.backward(1), income_category_id: @income_category.id, amount: 50000}
      transaction = Transaction.last.reload
      income = Income.last.reload
      expect(income.amount).to eq(50000)
      expect(transaction.recordable_type).to eq("Income")
      expect(transaction.recordable_id).to eq(income.id)
    end
  end

  describe '#update' do
    it 'should update income' do
      income = FactoryGirl.create(:income, income_category_id: @income_category.id, amount: 10000, user: User.first)
      put :update, income: {record_date: Date.today, income_category_id: income.income_category_id, amount: 20000}, id: income.id
      transaction = Transaction.last.reload
      income = income.reload
      expect(income.amount).to eq(20000)
      expect(transaction.transaction_date).to eq(income.record_date)
    end
  end
end
