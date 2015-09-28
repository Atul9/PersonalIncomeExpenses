require 'rails_helper'

RSpec.describe ExpenseCategoriesController, type: :controller do
  login_user
  before :each do
  end
  describe '#create' do
    it 'should create new expense category' do
      post :create, expense_category: {expense_source: "Travelling", description: "Travelling for work"}
      expect(ExpenseCategory.last.reload.expense_source).to eq("Travelling")
    end
  end

  describe '#update' do
    it 'should update existing expense category' do
      expense_category = FactoryGirl.create(:expense_category, user: User.first)
      put :update, expense_category: {expense_source: "Travelling", description: "Travelling for fun"}, id: expense_category.id
    end
  end
end
