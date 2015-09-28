require 'rails_helper'

RSpec.describe IncomeCategoriesController, type: :controller do
  login_user
  before :each do
    @income_category = FactoryGirl.create(:income_category, user: User.first)
  end
  describe '#index' do
    it 'displays index page'do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'should create new income category' do
      post :create, income_category: {income_source: "Business", description: "My Business"}
      expect(IncomeCategory.last.reload.income_source).to eq("Business")
    end
  end

  describe '#update' do
    it 'should update income category' do
      put :update, income_category: {income_source: "Business", description: "My Business"}, id: @income_category.id
      expect(@income_category.reload.income_source).to eq("Business")
    end
  end
end
